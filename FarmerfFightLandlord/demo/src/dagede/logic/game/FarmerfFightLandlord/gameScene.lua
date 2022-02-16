local gameScene = class("gameScene", cc.load("mvc").ModuleBase)
gameScene.RESOURCE_FILENAME = "game/FarmerfFightLandlord/GameScene.lua"
local viewJump = require("logic.common.views.viewJump")
local winLayer = require("logic.game.FarmerfFightLandlord.winLayer")
local Shuffle = cc.load("tools").Shuffle

gameScene.behavior ={
    "logic.common.behavior.BtnBinder",
    "logic.common.behavior.TouchInterrupt",
    "logic.common.behavior.Listener",
}

--创建界面
function gameScene:onCreate()
    --播放背景音乐
    audio.playMusic("game/FarmerfFightLandlord/sound/bgm.mp3",true)
    --地主存表
    self.landlordTable = {}
    --地主池子
    self.landlordPool = self.mView["landlordPool"]
    --生成地主时间
    self.landlordTime = 0
    --最大生成地主的最小血量
    self.minProduceLandlordHp = 1
    --最大生成地主的最大血量
    self.maxProduceLandlordHp = 10
    --最大生成地主的最小时间
    self.minProduceLandlordTime = 2
    if global.isGrabScreenMode == 1 then
        self.minProduceLandlordTime = 1
    end
    --最大生成地主的最大时间
    self.maxProduceLandlordTime = 4
    --农民
    self.farmer = self.mView["farmer"]
    --农民宽高
    self.farmerSize = self.farmer:getContentSize()
    --农民扔武器的时间
    self.throwArmsTime = 0.5
    --农民扔武器的时间间隔
    self.farmerThrowArmsTime = 0.5
    --农民扔武器的池子
    self.armsPool = self.mView["armsPool"]
    --农民武器存表
    self.throwArmsTable = {}
    --武器移动时间
    self.armsMoveTime = 4
    --农民的武器购买情况
    local farmerArmsPurchaseSituation = global.saveTools.getData("buyStatus")
    --农民武器攻击力
    self.farmerArmsAttackPower = 1
    if farmerArmsPurchaseSituation ~= nil then
        if farmerArmsPurchaseSituation.bomb then
            self.farmerArmsAttackPower = 10
        elseif farmerArmsPurchaseSituation.darts then
            self.farmerArmsAttackPower = 5
        elseif farmerArmsPurchaseSituation.hammer then
            self.farmerArmsAttackPower = 2
        else
            self.farmerArmsAttackPower = 1
        end
    end
    --开启update
    self:onUpdate(handler(self,self.update))
    --移动状态，0 不移动， -1 左移， 1右移
    self.moveStatus = 0
    --本局游戏获得的金币
    self.goldNumber = 0
    --本局游戏时间
    self.gameTime = 0
    --游戏是否结束
    self.gameOverStatus = false
    --是不是截图运行
    if global.isGrabScreenMode == 1 then
        
    else
        -- 触摸开始
        local function onTouchBegan(touch, event)
            -- 获取点击位置
            local location = touch:getLocation()
            print(location.x .. "  "..location.y)
            if location.x > display.cx then
                self.moveStatus = 1
            elseif location.x < display.cx then
                self.moveStatus = -1
            elseif location.x == display.cx then
                self.moveStatus = 0
            end
            --self:addThrowArms()
            print("self.moveStatus："..self.moveStatus)
            return true
        end

        -- 触摸移动
        local function onTouchMoved(touch, event)
            print("触摸移动："..self.moveStatus)
            return true
        end

        -- 触摸结束
        local function onTouchEnded(touch, event)
            print("触摸结束："..self.moveStatus)
            self.moveStatus = 0
            return true
        end

        local listener = cc.EventListenerTouchOneByOne:create()
        -- 注册两个回调监听方法
        listener:registerScriptHandler(onTouchBegan,cc.Handler.EVENT_TOUCH_BEGAN )
        listener:registerScriptHandler(onTouchMoved,cc.Handler.EVENT_TOUCH_MOVED )
        listener:registerScriptHandler(onTouchEnded,cc.Handler.EVENT_TOUCH_ENDED )
        -- 事件派发器
        local eventDispatcher = self:getEventDispatcher()
        -- 绑定触摸事件到层当中
        eventDispatcher:addEventListenerWithSceneGraphPriority(listener, self)
    end
end

function gameScene:update(dt)
    if self.gameOverStatus then
        return
    end
    self.gameTime = self.gameTime + dt
    self.maxProduceLandlordHp = (math.floor(self.gameTime / 10) + 1) * 10
    self.landlordTime = self.landlordTime + dt
    local produceLandlordRandomNumber =  math.random(self.minProduceLandlordTime, self.maxProduceLandlordTime)
    if self.landlordTime >= produceLandlordRandomNumber then
        --添加地主
        self:addLandlord()
        self.landlordTime = self.landlordTime - produceLandlordRandomNumber
    end
    if self.moveStatus == -1 then
        --农民左移
        if self.farmer:getPositionX() > self.farmerSize.width / 2 then
            self.farmer:setPosition(self.farmer:getPositionX() - 10, self.farmer:getPositionY())
        end
    elseif self.moveStatus == 1 then
        --农民右移
        if self.farmer:getPositionX() < display.width - (self.farmerSize.width / 2) then
            self.farmer:setPosition(self.farmer:getPositionX() + 10, self.farmer:getPositionY())
        end
    end
    self.throwArmsTime = self.throwArmsTime + dt
    if self.throwArmsTime >= self.farmerThrowArmsTime then
        --农民扔武器
        self:addThrowArms()
        self.throwArmsTime = self.throwArmsTime - self.farmerThrowArmsTime
    end
    self:detectionCollision()
end

--生成地主
function gameScene:addLandlord()
    math.randomseed(string.reverse(os.time()))
    --随机创建地主
    local landlordSprite = ccui.ImageView:create()
    landlordSprite:loadTexture("game/FarmerfFightLandlord/image/landlord.png", 0)
    local landlordSpriteSize = landlordSprite:getContentSize()
    
    local landlord = math.random(self.minProduceLandlordHp, self.maxProduceLandlordHp)
    -- landlordSprite:ignoreContentAdaptWithSize(false);
    -- landlordSprite:setContentSize(landlordSpriteSize.width * (0.7 + 0.1 * landlord), landlordSpriteSize.height * (0.7 + 0.1 * landlord));
    -- landlordSpriteSize = landlordSprite:getContentSize()

    
    local spriteX = math.random(landlordSpriteSize.width / 2, display.width - (landlordSpriteSize.width / 2))
    local spriteY = math.random(display.height + (landlordSpriteSize.height / 2), display.height + (landlordSpriteSize.height / 2) + 100)
    landlordSprite:setPosition(spriteX, spriteY)
    landlordSprite.hpNumber = landlord
    --添加血量
    local hpNumber = ccui.Text:create()
    hpNumber:setFontName("game/FarmerfFightLandlord/image/nvpk.ttf")
    hpNumber:setName("hpNumber")
    hpNumber:setFontSize(40)
    hpNumber:setTextColor({r = 255, g = 0, b = 0})
    hpNumber:setString(landlord)
    hpNumber:setPosition(landlordSpriteSize.width / 2, landlordSpriteSize.height + 30)
    landlordSprite:addChild(hpNumber)
    --添加地主运动轨迹
    local fixedPointX = math.random(-1 * spriteX + (landlordSpriteSize.width / 2), display.width - (landlordSpriteSize.width / 2) - spriteX)
    local bezier = {
        cc.p(fixedPointX, -1 * math.random(0, spriteY / 2)), --第一个固定点
        cc.p(fixedPointX, spriteY / 2 + (-1 * math.random(spriteY / 2, spriteY))), --第二个固定点
        cc.p(0, -1 * spriteY), --终点
    }
    local bezierForward = cc.BezierBy:create(10, bezier)
    landlordSprite:runAction(bezierForward)
    table.insert(self.landlordTable, landlordSprite)
    --把地主添加到屏幕上
    self.landlordPool:addChild(landlordSprite)
end

--农民扔武器
function gameScene:addThrowArms()
    --随机创建扔出去的武器
    local armsSprite = ccui.ImageView:create()
    local armsName = "brick"
    if self.farmerArmsAttackPower == 10 then
        armsName = "bomb"
    elseif self.farmerArmsAttackPower == 5 then
        armsName = "darts"
    elseif self.farmerArmsAttackPower == 2 then
        armsName = "hammer"
    end
    armsSprite:loadTexture("game/FarmerfFightLandlord/image/"..armsName..".png", 0)
    armsSprite:setPosition(self.farmer:getPositionX(), self.farmer:getPositionY() + 50)
    local action = cc.Sequence:create(
        cc.MoveBy:create(self.armsMoveTime, cc.p(0, display.height - (self.farmer:getPositionY() + 50) + (armsSprite:getContentSize().width / 2))),
        CCCallFuncN:create(function()
            --armsSprite:removeFromParent()
        end)
    )
    armsSprite:runAction(action)
    table.insert(self.throwArmsTable, armsSprite)
    self.armsPool:addChild(armsSprite)
end

--创建矩形
function gameScene:toConvertToWorldSpace(aim) 
    if not aim then
        return 
    end
    local x = aim:getPositionX()
    local y = aim:getPositionY()
    local size = aim:getContentSize()
    local pos = aim:getParent():convertToWorldSpace(cc.p(x,y))
    local rect = cc.rect(pos.x - size.width / 2,pos.y - size.height / 2, size.width , size.height)
    return rect
end

--检测碰撞
function gameScene:detectionCollision()
    for i = 1, #self.throwArmsTable do
        if self.throwArmsTable[i] then
            if self.throwArmsTable[i]:getPositionY() >= (display.height + (self.throwArmsTable[i]:getContentSize().width / 2)) then
                self.throwArmsTable[i]:removeFromParent()
                table.remove(self.throwArmsTable, i)
                i = i - 1
            else
                local throwArmsRect = self:toConvertToWorldSpace(self.throwArmsTable[i])
                for j = 1, #self.landlordTable do
                    local landlordRect = self:toConvertToWorldSpace(self.landlordTable[j])
                    if self.landlordTable[j]:getPositionY() - self.farmer:getPositionY() <= 
                    self.landlordTable[j]:getContentSize().width / 2 + self.farmer:getContentSize().width / 2 then
                        -- self.landlordTable[j]:stopAllActions()
                        -- for k = 1, #self.throwArmsTable do
                        --     self.throwArmsTable[k]:stopAllActions()
                        -- end
                        CCDirector.sharedDirector():pause()
                        self:gameOver()
                        print("游戏结束")
                        return
                    end
                    if cc.rectIntersectsRect(throwArmsRect, landlordRect) then
                        self.throwArmsTable[i]:removeFromParent()
                        table.remove(self.throwArmsTable, i)
                        i = i - 1
                        self.landlordTable[j].hpNumber = self.landlordTable[j].hpNumber - self.farmerArmsAttackPower
                        print("碰到了武器消失")
                        if self.landlordTable[j].hpNumber <= 0 then
                            self.landlordTable[j]:removeFromParent()
                            table.remove(self.landlordTable, j)
                            j = j - 1
                            self.goldNumber = self.goldNumber + 1
                            print("碰到了地主死亡")
                        else
                            self.landlordTable[j]:getChildByName("hpNumber"):setString(self.landlordTable[j].hpNumber)
                            print("碰到了地主扣血")
                        end
                    else
                        print("没碰撞了")
                    end
                end
            end
        end
    end
end

--游戏结束
function gameScene:gameOver()
    print("进入结算")
    --显示弹窗
    AudioEngine.playEffect("game/FarmerfFightLandlord/sound/win.mp3", false)
    local goldNumber = global.saveTools.getData("goldNumber")
    if goldNumber == nil then
        goldNumber = 0
    end
    print("本局获得金币数："..self.goldNumber)
    self.goldNumber = self.goldNumber + goldNumber
    global.saveTools.saveData("goldNumber", self.goldNumber)
    self.gameOverStatus = true
    local winUI = winLayer.create()
    self:addChild(winUI,999)
    local size = winUI:getContentSize()
    winUI:setPosition(display.cx-size.width/2, display.cy-size.height/2)
    -- global.saveTools.saveData("goldNumber", self.goldNumber)
end

--游戏场景截图结束后截结算场景
function gameScene:grabscreen()
    self:gameOver()
end

return gameScene
