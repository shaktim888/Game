--影子效果
--运动轨迹
local uiControl = class("uiControl", cc.load("mvc").BehaviorBase)
local winLayer = import("..winLayer")
local Shuffle = cc.load("tools").Shuffle
local enemy = nil
local tag = 10000
local menuBody = nil
local emenyBody = nil
local shield = nil

local CardValue = {
    --苹果
    [1] = {index = 1, img = "1.png", num = 3, v = 1, damage = 1},
    --香蕉
    [2] = {index = 2, img = "2.png", num = 2, v = 3, damage = 2},
    --炸弹
    [3] = {index = 3, img = "3.png", num = 1, v = 5, damage = 3},
    --榴莲
    [4] = {index = 4, img = "4.png", num = 1, v = 4, damage = 3},
    --大石块
    [5] = {index = 5, img = "5.png", num = 3, v = 2, damage = 3},
    --弓箭
    [6] = {index = 6, img = "6.png", num = 1, v = 1, damage = 1},
    --史莱姆
    [7] = {index = 7, img = "7.png", num = 1, v = 1, damage = 1},
    --手里标
    [8] = {index = 8, img = "8.png", num = 2, v = 1, damage = 2}
}

local ImagePath = "game/knight/images/enemy/"
local Path = "game/knight/"
local score = 0
local playerHP = 5
local shieldHP = 3
--只结算一次
local oneCount = true
--盾只删除一次
local oneDun = true
--定时一次
local firstTime = true
local info = nil
local time = 0
local frequency = 0
local isStop = true
local map = {}
--透明度
local op = 0
local function initCardItem(self, item, info)
    item.DataInfo = info
    ---遍历牌类型、牌值 ,2参数loadTexture 为读plist
    item:getChildByName("icon"):ignoreContentAdaptWithSize(true) 
    item:getChildByName("icon"):loadTexture(ImagePath .. info.img,0)
    item:getChildByName("icon"):setVisible(true)
end

--遍历
local function getFullEnemy()
    local arr = {}
    for num, v2 in pairs(CardValue) do
        table.insert(arr, v2)
    end
    return arr
end

function uiControl:onCreate()
    --数据开关
    isStop = true
    enemy = nil
    score = 0
    playerHP = global.isGrabScreenMode == 1 and 1 or 5
    if global.isGrabScreenMode == 1 then
        for i = 5, 2, -1 do
            local playBoold = self.mView[string.format("blood%d", i)]
            if playBoold then
                playBoold:setVisible(false)
            end
        end
    end
    shieldHP = 3
    --只结算一次
    oneCount = true
    --盾只删除一次
    oneDun = true
    time = 0
    frequency = 0
    self.backPanel = self.mView["backPanel"]
    self.action = self.mView["action1"]
    self:sheildMove()
    self:timeSchedule()

    global.async.runInNextFrame(handler(self, self.initPhysics))
    self:scheduleUpdateWithPriorityLua(handler(self, self.onEnterFrame_), 0)
    --local contactListener = cc.EventListenerPhysicsContactWithBodies:create(emenyBody,menuBody)
    local contactListener = cc.EventListenerPhysicsContact:create()
    contactListener:registerScriptHandler(handler(self, self.onContactBegin), cc.Handler.EVENT_PHYSICS_CONTACT_BEGIN)
    local eventDispatcher = self.backPanel:getEventDispatcher()
    eventDispatcher:addEventListenerWithSceneGraphPriority(contactListener, self.backPanel)
end


local frameindex = 0
function uiControl:onEnterFrame_(dt)
    if self.backPanel:getChildByTag(tag) then
        for i = 10000, tag do
            local obj = self.backPanel:getChildByTag(i)
            if obj then
                if obj:getPositionY() < 0 then
                    obj:removeFromParent(true)
                    enemy = nil
                    playerHP = playerHP - 1
                    local playBoold = self.mView[string.format("blood%d", playerHP + 1)]
                    if playBoold then
                        playBoold:setVisible(false)
                    end
                end
            end
        end
    end

    if shieldHP == 0 and oneDun then
        self.mView["sheild"]:removeFromParent(true)
        oneDun = false
    end

    if playerHP == 0 and oneCount then
        isStop = false
        self:showJiesuanView()
        oneCount = false
    end
    
    frameindex = frameindex + 1
    if frameindex == 3 then
        frameindex = 0
        for i = 10001, 10200 do
            local obj = self.backPanel:getChildByTag(i)
            if obj then
                    local clone = obj:clone()
                    self.backPanel:addChild(clone,1,tag+20000)
                    local x, y = obj:getPosition()
                    clone:setPosition(x,y)
                        local delete = cc.CallFunc:create(function()
                            clone:removeFromParent(true)
                        end)
                    
                        local hide = cc.Sequence:create(cc.FadeOut:create(0.3),delete)
                        clone:getChildByName("icon"):runAction(hide)      
                    -- end)
                -- end)
            
            end
        end
    end

    ---频率控制
    if isStop then
        if time >= 0 and time <=  10 then
        frequency = frequency + dt
        if frequency >= 3 then
            frequency = 0
            self:createEnemy()
        end
    elseif time > 10 and time <= 20 then
        frequency = frequency + dt
        if frequency >= 2 then
            frequency = 0
            self:createEnemy()
        end
    elseif time > 20 and time <= 30 then
        frequency = frequency + dt
        if frequency >= 1 then
            frequency = 0
            self:createEnemy()
        end
    elseif time > 30 then
        frequency = frequency + dt
        if frequency >= 0.5 then
            frequency = 0
            self:createEnemy()
        end
    end
    end
end

function uiControl:showJiesuanView()
    local view = winLayer.new()
    global.viewMgr.showView(view, true)
    view:setData(score)
    local scheduler = cc.Director:getInstance():getScheduler()
    scheduler:unscheduleScriptEntry(self.time)
    self.time = nil
end

function uiControl:gameAction(index, pos)
    -- local animate = require("res.game.knight."..index..".lua").create()
    -- animate.root:runAction(animate.animation)
    -- animate.root:setPosition(pos)
    -- animate.root:setScale(0.5)
    -- self:addChild(animate.root)

    -- local function playDealSound()
    --     -- AudioEngine.playEffect("game/Fqzs/sound/start.mp3",false)
    -- end
    -- local actionSound = cc.CallFunc:create(playDealSound);  --发牌声音
    -- local delaytime = 0.5
    -- animate.root:runAction(cc.Sequence:create(cc.DelayTime:create(0.2),actionSound,cc.DelayTime:create(delaytime-0.2),cc.RemoveSelf:create()))
end

function uiControl:onContactBegin(contact)
    for i = 10000, tag do
        if self.backPanel:getChildByTag(i) then
            if self.backPanel:getChildByTag(i + 10000) then
                self.backPanel:getChildByTag(i + 10000):removeFromParent(true)
            end
           
            self.scoreText = self.mView["scoreText"]
            if self.backPanel:getChildByTag(i).DataInfo.index == 7 then
                shieldHP = shieldHP - 1
                local shieldBoold = self.mView[string.format("b%d", shieldHP + 1)]
                if shieldBoold ~= nil then
                    shieldBoold:setVisible(false)
                end
            end

            score = score + self.backPanel:getChildByTag(i).DataInfo.damage
            self.scoreText:setString(tostring(score))

            --播放动画
            local pos = contact:getContactData().points
            local idx
            if self.backPanel:getChildByTag(i).DataInfo then
                idx = self.backPanel:getChildByTag(i).DataInfo.index
            end
            AudioEngine.playEffect("game/knight/sound/beat.mp3", false)
            self:gameAction(idx,pos[1])
            self.backPanel:getChildByTag(i):removeFromParent(true)
            enemy = nil
            if shield then
                local action = cc.Sequence:create(cc.MoveBy:create(0.1, cc.p(0,-10)),cc.DelayTime:create(0.1),cc.MoveBy:create(0.1, cc.p(0,10)))
                shield:runAction(action)
                self.mView["flash"]:setVisible(true)
                local fadein = cc.FadeIn:create(0.2)
                local fadeout = cc.FadeOut:create(0.1)
                local delay = cc.DelayTime:create(0.1)
                self.mView["flash"]:runAction(cc.Sequence:create(fadein, delay, fadeout, delay, fadein, delay, fadeout))
            end
            break
        end
    end
    return true
end

function uiControl:createEnemy()
    math.randomseed(tostring(os.time()):reverse():sub(1, 6))
    local fast = 1
    local isFirst = true
    local num = 0
    local s_streak = nil
    cc.SpriteFrameCache:getInstance():addSpriteFrames("game/knight/resource.plist")
    local function autoCreate()
        enemy = self.mView["template"]:clone()
        local shuffle = Shuffle.new()
        if isFirst then
            shuffle:initByArr(getFullEnemy())
            local itr = shuffle:start()
            info = itr.next()
            isFirst = false
        end

        if num == info.num then
            num = 0
            shuffle:initByArr(getFullEnemy())
            local itr = shuffle:start()
            info = itr.next()
        end

        local size = enemy:getContentSize()
        tag = tag + 1
        self.backPanel:addChild(enemy, 1, tag)
        initCardItem(self, enemy, info)

        emenyBody = cc.PhysicsBody:createBox(enemy:getContentSize(), cc.PhysicsMaterial(1, 1, 0))
        emenyBody:setCategoryBitmask(1)
        emenyBody:setCollisionBitmask(1)
        emenyBody:setContactTestBitmask(1)
        emenyBody:setGravityEnable(false)
        enemy:setPhysicsBody(emenyBody)
        enemy:setPosition(cc.p(display.cx, display.top-size.height))
        local randpos = {cc.p(0, math.random(0, 650)), cc.p(720, math.random(0, 650))}
        


        if info.index == 6 then
            emenyBody:setVelocity(cc.pMul(cc.pNormalize(cc.pSub(cc.p(360,0), cc.p(display.cx, display.top+size.height))),2000))
        elseif info.index == 3 then
            local size = cc.Director:getInstance():getWinSize()
            local bezier = {
                cc.p(math.random(0, 600), size.height / 2),
                cc.p(math.random(300, 600), -size.height / 2),
                cc.p(300, 100)
            }
            local bezierForward = cc.BezierTo:create(2, bezier)
            enemy:runAction(bezierForward)
        else
          
            if info.index == 8 then
                enemy:runAction(cc.RepeatForever:create(cc.RotateBy:create(1, 360)))
            end
            emenyBody:setVelocity(cc.pMul(cc.pNormalize(cc.pSub(randpos[math.random(1, 2)], cc.p(display.cx, display.top+size.height))),1500))
        end 
        num = num + 1
    end
    autoCreate()
end

--时间定时器
function uiControl:timeSchedule()
    local scheduler = cc.Director:getInstance():getScheduler()
    local function Autotime()
        time = time + 1
    end
    self.time = scheduler:scheduleScriptFunc(Autotime, 1, false)
end

function uiControl:initPhysics()
    local size = {width = 720, height = 1280 + 500}
    local edgeBody = cc.PhysicsBody:createEdgeBox(size, cc.PhysicsMaterial(1, 1.5, 0), 3, cc.p(0, -500))
    local edgeNode = cc.Node:create()
    self:addChild(edgeNode)
    edgeNode:setPosition(cc.p(size.width / 2, size.height / 2))
    edgeNode:setPhysicsBody(edgeBody)

    local gravity = cc.vertex2F(0, -200)
    local world = cc.Director:getInstance():getRunningScene():getPhysicsWorld()
    if world then
        world:setGravity(gravity)
    end
    local a = cc.Director:getInstance():getRunningScene():getPhysicsWorld()
end

function uiControl:sheildMove()
    shield = self.mView["sheild"]
    shield:setLocalZOrder(2)
    local size = shield:getContentSize()
    menuBody = cc.PhysicsBody:createBox(shield:getContentSize(), cc.PhysicsMaterial(1, 0, 0))
    menuBody:setGravityEnable(false)
    menuBody:setDynamic(false)
    menuBody:setCategoryBitmask(1)
    menuBody:setCollisionBitmask(0)
    menuBody:setContactTestBitmask(1)
    shield:setPhysicsBody(menuBody)

    local function onTouchBegan(pTouch, pEvent)
        local point = pTouch:getLocation()
        local rect = shield:getBoundingBox()
        if (cc.rectContainsPoint(rect, point)) then
            return true
        end
        return false
    end

    local function onTouchMoved(touch, event)
        local posX, posY = shield:getPosition() --获取当前的位置
        local delta = touch:getDelta() --获取滑动的距离
        if
            posY + delta.y < 272.00 - size.height / 2 and 0 < posY + delta.y and posX + delta.x < 720 - size.width / 2 and
                posX + delta.x > 0
         then
            shield:setPosition(cc.p(posX + delta.x, posY + delta.y)) --给精灵重新设置位置
        end
    end

    local listener1 = cc.EventListenerTouchOneByOne:create() --创建一个单点事件监听
    listener1:setSwallowTouches(true) --是否向下传递
    --注册三个回调监听方法
    listener1:registerScriptHandler(onTouchBegan, cc.Handler.EVENT_TOUCH_BEGAN)
    listener1:registerScriptHandler(onTouchMoved, cc.Handler.EVENT_TOUCH_MOVED)
    local eventDispatcher = shield:getEventDispatcher() --事件派发器
    eventDispatcher:addEventListenerWithSceneGraphPriority(listener1, shield) --分发监听事
end

return uiControl
