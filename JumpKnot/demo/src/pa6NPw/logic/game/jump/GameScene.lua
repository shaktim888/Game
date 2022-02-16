local GameScene = class("GameScene", cc.load("mvc").ModuleBase)
GameScene.RESOURCE_FILENAME = "game/jump/GameScene.lua"

local Obstacle = require("logic/game/jump/Obstacle")
local GoldOb = require("logic/game/jump/GoldOb")

local MONEY_SAVE_KEY = "_MONEY_SAVE_KEY_"
local HERO_INDEX_SAVE_KEY = "_HERO_INDEX_SAVE_KEY_"
local HEIGHT_SCORE_SAVE_KEY = "_HEIGHT_SCORE_SAVE_KEY_"
local currentScore = 0
local heightScore = 0

function GameScene:onCreate()
    self.mView['btn_return']:setTouchEnabled(true)
    self.mView['btn_return']:addTouchEventListener(handler(self,self.onBackClick))
    self.mView['hero']:setPositionY(640)
    currentScore = 0

    local index = global.saveTools.getData(HERO_INDEX_SAVE_KEY)
    self.mView['hero']:loadTexture("game/jump/image/hero/"..index..".png")
    self.mView['gold_text']:setString(global.saveTools.getData(MONEY_SAVE_KEY))

    heightScore = global.saveTools.getData(HERO_INDEX_SAVE_KEY)

    self:onUpdate(handler(self,self.update))
    self:onHeroDownAction()
    self.isActive = true
    self.isDown = true
    self.isEnd = false
    self.ObstacleArray = {}
    self.GoldOb = {}
    self:createAllObstacle()
    self:createAllGold()

    self.mView['result_panel']:setVisible(false)


    self.mView['btn_back']:setTouchEnabled(true)
    self.mView['btn_back']:addTouchEventListener(handler(self,self.onBackClick))

    self.mView['btn_replay']:setTouchEnabled(true)
    self.mView['btn_replay']:addTouchEventListener(handler(self,self.onReplayClick))

    if global.isGrabScreenMode == 1 then
        self.mView['gold_text']:setString(math.random(300,1000))
    end
end

function GameScene:onBackClick()
    local MainScene = require("logic/game/jump/MainScene")
    MainScene.new():showWithScene()
end

function GameScene:onReplayClick()
    GameScene.new():showWithScene()
end

function GameScene:onExit()
    self:unscheduleUpdate()
    self.mView['hero']:stopAllActions()
    for k=1,#self.ObstacleArray do
        if self.ObstacleArray[k]:getIsActive() then
            self.ObstacleArray[k]:stopAction()
        end
    end
end

function GameScene:onResult()
    self.isEnd = true
    self:unscheduleUpdate()
    if currentScore > heightScore then 
        global.saveTools.saveData(HEIGHT_SCORE_SAVE_KEY,currentScore)
        heightScore = currentScore
    end
    self.mView['result_panel']:setVisible(true)
    self.mView['hero']:stopAllActions()
    for k=1,#self.ObstacleArray do
        if self.ObstacleArray[k]:getIsActive() then
            self.ObstacleArray[k]:stopAction()
        end
    end

    self.mView['current_text']:setString("Score: "..currentScore)
    self.mView['best_text']:setString("Best: "..heightScore)
end

function GameScene:update(dt)
    if  self.isActive and cc.rectIntersectsRect(self.mView['hero']:getBoundingBox(), self.mView['crod_down']:getBoundingBox()) then
        self.isActive = false
        self.mView['hero']:stopAllActions()
        self:onHeroUpAction()
        print("向上")
        
    end

    if self.isActive and cc.rectIntersectsRect(self.mView['hero']:getBoundingBox(), self.mView['crod_up']:getBoundingBox()) then
        self.isActive = false
        self.mView['hero']:stopAllActions()
        self:onHeroDownAction()
        print("向下")
    end

    self:createObstacle(dt)
    self:createGold(dt)

    if global.isGrabScreenMode == 1 then
        return
    end

    for i = 1,#self.ObstacleArray do
        if self.ObstacleArray[i]:getIsActive() then
            if  not self.isEnd and cc.rectIntersectsRect(self.mView['hero']:getBoundingBox(), self.ObstacleArray[i]:getBoundingBox()) then
                print("gameover")
                self:onResult()
            end   
        end
    end

    for i = 1,#self.GoldOb do
        if self.GoldOb[i]:getIsActive() and cc.rectIntersectsRect(self.mView['hero']:getBoundingBox(), self.GoldOb[i]:getSprite():getBoundingBox()) then
            self.GoldOb[i]:reset()
            currentScore = currentScore + 1
            self.mView['gold_text']:setString(tonumber(global.saveTools.getData(MONEY_SAVE_KEY)) + 1)
            global.saveTools.saveData(MONEY_SAVE_KEY,tonumber(global.saveTools.getData(MONEY_SAVE_KEY)) + 1)
          
        end
    end
end

function GameScene:createAllGold() 
    for i= 1, 20 do
        local temp = GoldOb.new(self)
        table.insert(self.GoldOb,temp)
    end
end

function GameScene:getGold() 
    for i= 1, #self.GoldOb do
        if not self.GoldOb[i]:getIsActive() then 
            self.GoldOb[i]:setPositionY()
            return
        end
    end
end

function GameScene:createGold(dt) 
    local cs = math.random(1,1000)  
    if cs % 240 == 0 then
        self:getGold()
    end
end

function GameScene:createAllObstacle() 
    for i= 1, 30 do
        local temp = Obstacle.new(self)
        table.insert(self.ObstacleArray,temp)
    end
end


function GameScene:getObstacle() 
    for i= 1, #self.ObstacleArray do
        if not self.ObstacleArray[i]:getIsActive() then 
            self.ObstacleArray[i]:setVisibleTrue()
            self.ObstacleArray[i]:createAction()
            return
        end
    end
    print("找不到了")
end

function GameScene:createObstacle(dt) 
    local cs = math.random(1,1000)  
    if cs % 140 == 0 then
        self:getObstacle()
    end
end

function GameScene:onHeroUpAction()
    self.isDown = false
    local action = cc.Sequence:create(cc.DelayTime:create(1),cc.CallFunc:create(function ()
        self.isActive = true
    end))
    self.mView['hero']:runAction(cc.Spawn:create(cc.MoveBy:create(5,cc.p(0,1280)),action))
end

function GameScene:onHeroDownAction()
    self.isDown = true
    local action = cc.Sequence:create(cc.DelayTime:create(1),cc.CallFunc:create(function ()
        self.isActive = true
    end))
    self.mView['hero']:runAction(cc.Spawn:create(cc.MoveBy:create(5,cc.p(0,-1280)),action))
end

function GameScene:updateAciton()
    self.mView['hero']:stopAllActions()
    if self.isDown then
        self:onHeroUpAction()
    else
        self:onHeroDownAction()
    end 
end

function GameScene:onEnter()
    print("I am here")
    local listener = cc.EventListenerTouchOneByOne:create()
    listener:setSwallowTouches(true)  
    local function onTouchBegan(pTouch, pEvent)
        -- print("onTouchBegan")
        return true
    end
    local function onTouchMoved(pTouch, pEvent)
        --print("onTouchMoved")
    end
    local function onTouchEnded(pTouch, pEvent)
        print("onTouchEnded")
        self.isActive = true
        self:updateAciton()
    end
    listener:registerScriptHandler(onTouchBegan,cc.Handler.EVENT_TOUCH_BEGAN )
    listener:registerScriptHandler(onTouchMoved,cc.Handler.EVENT_TOUCH_MOVED )
    listener:registerScriptHandler(onTouchEnded,cc.Handler.EVENT_TOUCH_ENDED )
    local eventDispatcher = self:getEventDispatcher() 
    eventDispatcher:addEventListenerWithSceneGraphPriority(listener, self)  
end


return GameScene