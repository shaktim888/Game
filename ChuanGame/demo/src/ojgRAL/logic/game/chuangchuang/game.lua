local Game = class("Game", cc.load("mvc").ModuleBase)
Game.RESOURCE_FILENAME = "game/chuangchuang/game.lua"
local SHOT_OFFSET = 0
local GUNZI_SPEED = 2000
local TRY_TIMES = 10
local setting = import(".setting")
local JieSuan = import(".jiesuan")
local Shuffle = cc.load("tools").Shuffle

local SOUND_PATH = "game/chuangchuang/sound/"
Game.behavior = {
    "logic.common.behavior.FontColorChange",
}

Game.changecolorfont = {
    txtScore= {},
    Text_1_0 = {},
    txtLife = {},
}

function Game:onCreate()
    self:initAllFood()
    self:initDrag()
    self:onUpdate(handler(self, self.update))
end

function Game:onbtnBackClick()
    local enter = require("logic.game.chuangchuang.enter")
    enter.new():showWithScene("random")
end

-- 创建所有的食品
function Game:initAllFood()
    self.foods = {}
    self.times = global.isGrabScreenMode == 1 and 1 or TRY_TIMES
    self:addScore(0)
    self.gunziSpeed = GUNZI_SPEED
    self.shootOffsetY = self.mView["startPoint"]:getPositionY() - self.mView["shootParent"]:getPositionY()
    self.shotArr = {}
    local size = self.mView["container"]:getContentSize()
    self.wrapSize = size
    self.level = 0
    self:generateFood()
    self:resetGunzi()
end

function Game:getCfg()
    self.level = self.level + 1
    math.newrandomseed()
    local cnt = math.ceil(self.level / 7)
    local shuffle = Shuffle.new()
    shuffle:initNumByRange(1,7,1)
    local itr = shuffle:start()
    local baseSpeed = 200 + (cnt - 1) * 100
    local ret = {}
    for i = 1, cnt do
        if cnt == 1 then
           table.insert(ret, {
                speed = 200,
                index = 8 - self.level
           }) 
        else
            table.insert(ret, {
                speed = math.random(200, baseSpeed + 20 * i),
                index = itr.next()
           }) 
        end
    end
    return ret
end

function Game:generateFood(level)
    local cfg = self:getCfg(level)
    self.totalLevel = #cfg
    for index , v in ipairs(cfg) do
        local i = v.index or index
        local item = self:createItem(v)
        item:setPosition(math.random(self.wrapSize.width), self.wrapSize.height - i * 120)
        self.mView["container"]:addChild(item)
        table.insert(self.foods, item)
    end
end

function Game:createItem(info)
    local index = math.random( 1,10 )
    local item = ccui.ImageView:create("game/chuangchuang/images/food/".. index .. ".png" , 0)
    item:ignoreContentAdaptWithSize(true)
    item:setAnchorPoint(cc.p(0.5,0))
    item:setScale(1.5)
    item.info = info
    info.curDir = (math.random(1,2) == 1 and 1 or -1)
    return item
end

-- 更新他们的移动
function Game:updateAllFood(dt)
    for _ , v in ipairs(self.foods) do
        local px = v:getPositionX()
        px = px + v.info.speed * dt * v.info.curDir
        if v.info.curDir > 0 and px >= self.wrapSize.width then
            px = self.wrapSize.width - ( px - self.wrapSize.width)
            v.info.curDir = -1
            v:setPositionX(px)
        elseif v.info.curDir < 0 and px <= 0 then
            px = - px
            v.info.curDir = 1
            v:setPositionX(px)
        else 
            v:setPositionX(px)
        end
    end
end

function Game:updateShotFood(dt)
    local preRect
    local function moveFood(item)
        local py = item:getPositionY()
        py = py - self.gunziSpeed * dt
        item:setPositionY(py)
    end
    for i = #self.shotArr, 1 , -1 do
        local rect = self.shotArr[i]:getBoundingBox()
        if i == #self.shotArr then
            if rect.y + rect.height / 2 > self.shootOffsetY then
                if self.moveShotInNextfame then 
                    self.moveShotInNextfame = nil
                else
                    moveFood(self.shotArr[i])
                end
            end
        else
            if preRect then
                if preRect.y <= rect.y + rect.height * 0.7 + SHOT_OFFSET then
                    moveFood(self.shotArr[i])
                end
            end
        end
        preRect = self.shotArr[i]:getBoundingBox()
    end
end

function Game:updateGunzi(dt)
    if not self.isInShoot then return end
    local node = self.gunzi
    local half_gunziSize = node:getContentSize().width / 2
    node:setPositionY(node:getPositionY() + self.gunziSpeed * dt)
    local wpos = self.gunzi:getChildByName("checkPoint"):convertToWorldSpace(cc.p(0,0))
    if wpos.y >= display.height then
        self:resetGunzi()
    end
    local pnode = self.gunzi:getChildByName("shootParent")
    for index , v in ipairs(self.foods) do
        local rect = v:getBoundingBox()
        -- if (cc.rectContainsPoint(rect,wpos)) then
    
        if wpos.x >= rect.x + half_gunziSize and wpos.x <= rect.x + rect.width - half_gunziSize and wpos.y >= rect.y and wpos.y - rect.y < self.gunziSpeed * dt + rect.height * 0.5 then
            table.remove( self.foods, index )
            v:retain()
            v:removeFromParent(false)
            v:setPosition(pnode:convertToNodeSpace(v:convertToWorldSpaceAR(cc.p(0,0))))
            pnode:addChild(v)
            table.insert(self.shotArr, v)
            self.oneShotCnt = self.oneShotCnt + 1
            self:addScore(self.oneShotCnt * 1)
            global.utils.sound.playSound(SOUND_PATH .. "hit_" .. math.random(1, 4) .. ".mp3")
            v:runAction(cc.ScaleTo:create(0.3, 1 * v:getScaleX(), 0.8 * v:getScaleY()) )
            self.moveShotInNextfame = true
            v:release()
            break
        end
    end
end

function Game:resetGunzi()
    self.isInShoot = false
    -- self.wait = true
    self.shotArr = {}
    if(self.gunzi) then
        self:playDrop(self.gunzi)
    end
    self.gunzi = self.mView["gunzi"]:clone()
    self.gunzi:setVisible(true)
    self.mView["gunzi"]:getParent():addChild(self.gunzi)
    self.mView["gunzi"]:setVisible(false)
    self:checkGameOver()
    self.mView["txtLife"]:setString("x" .. self.times)
end

function Game:playDrop(item)
    global.utils.sound.playSound(SOUND_PATH .. "wallCollision.mp3")
    local rspeed = math.random(20 , 40) * (math.random(1,2) == 1 and 1 or -1)
    item:runAction(cc.RepeatForever:create(cc.RotateBy:create(0.1, rspeed)))
    item:runAction(cc.Sequence:create(cc.EaseIn:create(cc.MoveBy:create(0.8, cc.p(math.random(display.width), -2000)), 2.5), cc.RemoveSelf:create()))
end

function Game:grabscreen()
    self.times = 0
    self.mView["txtLife"]:setString("x" .. self.times)
    self.score = math.random(0, 20)
    self.mView["txtScore"]:setString("score: "..self.score)
    local view = JieSuan.new(nil, nil, self.score)
    global.viewMgr.showView(view, true)
end

function Game:checkGameOver()
    if #self.foods == 0 then
        self.times = self.times + 1
        self.wait = true
        global.async.delay(0.5):Then(function()
            self.wait = false
            self:generateFood()
        end)
        return false
    elseif self.times <= 0 then
        local view = JieSuan.new(nil, nil, self.score)
        global.viewMgr.showView(view, true)
        return true
    end
    return false
end

function Game:update(dt)
    self:updateAllFood(dt)
    self:updateGunzi(dt)
    self:updateShotFood(dt)
end

function Game:onShoot()
    self.isInShoot = true
    self.times = self.times - 1
    self.oneShotCnt = 0;
    -- global.utils.sound.playSound(SOUND_PATH .. "launch.mp3")
end

function Game:dragMove(p)
    self.gunzi:setPositionX(p.x)
end

function Game:initDrag()
    local clickNode = self.mView["click"]
    clickNode:setTouchEnabled(false)
    local function canTouch(point)
        if self.isInShoot or self.wait then return false end
        local rect = clickNode:getBoundingBox()
        return cc.rectContainsPoint(rect,point)
    end

    local function onTouchBegan(pTouch,pEvent)
        local p = pTouch:getLocation()
        if not canTouch(p) then
            return false
        end
        self:dragMove(p)
        return true
    end

    local function onTouchMove(touch, event)
        local p = touch:getLocation()

        if not canTouch(p) then
            return 
        end
        self:dragMove(p)
        
	end
    local function onTouchEnd(touch, event)
        local p = touch:getLocation()
        if not canTouch(p) then
            return
        end
        self:dragMove(p)
        self:onShoot()
	end
    local listener = cc.EventListenerTouchOneByOne:create() 
    listener:setSwallowTouches(true) 
    listener:registerScriptHandler(onTouchBegan, cc.Handler.EVENT_TOUCH_BEGAN )
	listener:registerScriptHandler(onTouchMove, cc.Handler.EVENT_TOUCH_MOVED )
	listener:registerScriptHandler(onTouchEnd, cc.Handler.EVENT_TOUCH_ENDED )
    local eventDispatcher = clickNode:getEventDispatcher()
	eventDispatcher:addEventListenerWithSceneGraphPriority(listener, clickNode)
end

function Game:addScore(score)
    self.score = self.score or 0
    self.score = self.score + score
    self.mView["txtScore"]:setString("score: "..self.score)
end

function Game:onbtnSettingClick()
    local view = setting.new()
    global.viewMgr.showView(view, true)
end

return Game
