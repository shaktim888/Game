local GameScene = class("GameScene", cc.load("mvc").ModuleBase)
GameScene.RESOURCE_FILENAME = "game/Pitcher/GameScene.csb"
GameScene.behavior ={
    "logic.common.behavior.BtnBinder",
    "logic.common.behavior.TouchInterrupt",
    "logic.common.behavior.Listener",
}
--球半径
local radius = 20  
local panduan = true 
local time = 90 -- 倒计时
local SoundPath = "game/Pitcher/sound/"  --音乐路径
-- 音乐
local sound = {
    kaishi = "01.mp3",
    pengzhuang = "02.mp3",
    jinqiu = "05.mp3",
    jieshu = "11.mp3",
    bgm = "bgm.mp3"
}

local cishu = 1 
local g = 7.1
local gravity = cc.vertex2F(0, -294)
local volume = 50


local function setDefault()
    cishu = 1 
    g = 7.1
    gravity = cc.vertex2F(0, -294)
    volume = 50    -- 进度条
end

function GameScene:showWithScene1(transition, time, more,param)
    self:setVisible(true)
    local scene = display.newScene(self:getName(),param)
    scene:addChild(self)
    display.runScene(scene, transition, time, more)
    if self.animEnter then
        self:animEnter()
    end 
    return self
end


function GameScene:onCreate()
    if global.isGrabScreenMode == 1 then
        global.async.delay(1.5):Then(function()
            local jiesuan = require("logic.game.Pitcher.JiesuanLayer").new()
            self:addChild(jiesuan)
        end)
    end
    setDefault()
    panduan = true
    cc.SimpleAudioEngine:getInstance():playEffect(SoundPath  ..  sound.kaishi,false)
    audio.playMusic(SoundPath  ..  sound.bgm,true)
    self:onTime()

    self._ondraw = true

    cishu = 1 
    self.a = 0 -- 投篮次数
    self.b = 0 -- 进球defen

    self.hhscore = cc.UserDefault:getInstance():getIntegerForKey("self.hhscore")
    self.mView['hscore']:setString(self.hhscore)
    math.randomseed(os.time())
    self.x = math.random(200 , 800)
    self.y = math.random(200 , 500)

    self.qiukuang = self.mView['qiukuang']
    self.qiuban = self.mView['qiuban']
    self.qiuceng = self.mView['qiuceng']
    self.Panel7 = self.mView['Panel_7']
    self.Panel8 = self.mView['Panel_8']
    self.score = self.mView['score']
    self.beisaier = self.mView['Panel_2']
    self.root = cc.CSLoader:createNode('game/Pitcher/Node1.csb')
    self.qiuceng:addChild(self.root)
    self.root:move(1082,388)
    self.root1 = cc.CSLoader:createNode('game/Pitcher/Node2.csb')
    self:addChild(self.root1)
    self.root1:move(1082,383)
    self.hscore = self.mView['hscore']
    --球和滑动条
    self.basketball = self.mView['ball']
    self.lidu = self.mView['lidu']
    self.liduclone = self.lidu:clone()
    self.liduclone:move(self.x,self.y)
    self.liduclone:addTo(self.qiuceng)
    self.lidu:setVisible(false)
    self.basketballclone = self.basketball:clone()
    self.basketballclone:move(self.x,self.y)
    self.basketballclone:addTo(self.qiuceng)
    self.basketball:setVisible(false)

    --重力
    -- global.async.delay(0.2):Then(function()
    local size = {width = 1280,height = 900}
    local body = cc.PhysicsBody:createEdgeBox(size,cc.PhysicsMaterial(1,1,2),2)
    -- local body = cc.PhysicsBody:createEdgeBox(size,cc.PHYSICSBODY_MATERIAL_DEFAULT,2)
    local edgeNode = display.newNode()
    edgeNode:setPosition(size.width/2,size.height/2)
    edgeNode:setPhysicsBody(body)
    self:addChild(edgeNode)
    print("物理引擎")
    --球刚体
    self.basketballBody = cc.PhysicsBody:createCircle(radius,cc.PHYSICSBODY_MATERIAL_DEFAULT,cc.p(0,0)) 
    self.basketballBody:setContactTestBitmask(0xFFFFFFFF)
    self.basketballclone:setPhysicsBody(self.basketballBody)
    self.basketballBody:setGravityEnable(false)    --没有重力作用
    -- self.basketballclone:removeComponent("PhysicsBody")
    --球框刚体
    self.qiukuangBody = cc.PhysicsBody:createBox(self.qiukuang:getContentSize(),cc.PHYSICSBODY_MATERIAL_DEFAULT,cc.p(0,0)) 
    self.qiukuangBody:setContactTestBitmask(0xFFFFFFFF)
    self.qiukuang:setPhysicsBody(self.qiukuangBody)
    self.qiukuangBody:setGravityEnable(false)    --没有重力作用
    self.qiukuangBody:setDynamic(false)

    self.Panel7Body = cc.PhysicsBody:createBox(self.Panel7:getContentSize(),cc.PHYSICSBODY_MATERIAL_DEFAULT,cc.p(0,0)) 
    self.Panel7Body:setContactTestBitmask(0xFFFFFFFF)
    self.Panel7:setPhysicsBody(self.Panel7Body)
    self.Panel7Body:setGravityEnable(false)    --没有重力作用
    self.Panel7Body:setDynamic(false)

    self.Panel8Body = cc.PhysicsBody:createBox(self.Panel8:getContentSize(),cc.PHYSICSBODY_MATERIAL_DEFAULT,cc.p(0,0)) 
    self.Panel8Body:setContactTestBitmask(0xFFFFFFFF)
    self.Panel8:setPhysicsBody(self.Panel8Body)
    self.Panel8Body:setGravityEnable(false)    --没有重力作用
    self.Panel8Body:setDynamic(false)
    --球板刚体
    self.qiubanBody = cc.PhysicsBody:createBox(self.qiuban:getContentSize(),cc.PHYSICSBODY_MATERIAL_DEFAULT,cc.p(0,0)) 
    self.qiubanBody:setContactTestBitmask(0xFFFFFFFF)
    self.qiuban:setPhysicsBody(self.qiubanBody)
    self.qiubanBody:setGravityEnable(false)    --没有重力作用
    self.qiubanBody:setDynamic(false)
-- end)
    cishu = 1 

    local function onTouchBegan( touch, event )
        self._ondraw = true
        if cishu == 1 then
            cishu = cishu + 1 
            print("cishu = " .. cishu)
            self.event_x, self.event_y = self.basketballclone:getPosition()      --获取鼠标坐标
            -- self.event_x = point['x'] or 0
            -- self.event_y = point['y'] or 0
            return true
        elseif cishu == 2 then
            print("进来")
            local point = touch:getLocation()      --获取鼠标坐标
            local rect = self.basketballclone:getBoundingBox()    --  获取精灵的范围   
            if (cc.rectContainsPoint(rect,point)) then   --判断鼠标是否在精灵范围内，是触发
                -- print("刚体消失")
                self.event_x = point['x'] or 0
                self.event_y = point['y'] or 0

                self.xp0 = self.event_x
                self.yp0 = self.event_y
                
                self.basketballBody:removeFromWorld()
                self.basketballclone:removeFromParent()
                self.liduclone:setVisible(true)
                self.liduclone:move(self.event_x,self.event_y)
                self.basketballclone = self.basketball:clone()
                self.basketballclone:move(self.event_x,self.event_y)
                self.basketballclone:addTo(self.qiuceng)
                self.basketballclone:setVisible(true)
                cishu = cishu + 1
                print("cishu = " .. cishu)
            end
        elseif cishu >= 3 then
            return true 
        end
    end
    local function onTouchEnded( touch, event )
        if cishu == 2 then
            if self and not tolua.isnull(self) then
                self:ballClick(1)
            end
            print("self:ballClick(1)")
        end 
        if cishu > 2 then
            if self and not tolua.isnull(self) then
                self:ballClick(2)
            end
            print("self:ballClick(2)")
        end
        self._ondraw = false
    end
    local function onTouchMoved(touch, event)
        local ballx , bally  = self.basketballclone:getPosition()
        local point = touch:getLocation()     --获取鼠标坐标
        local event_x = point['x'] or 0
        local event_y = point['y'] or 0
        local p1 = {x = ballx , y = bally }
        local p2 = {x = event_x , y = event_y }
        local r = self:getAngleByPos(p1,p2)
        self:setLiduState(r)
    end
    local listener1 = cc.EventListenerTouchOneByOne:create()  --创建一个单点事件监听
    listener1:setSwallowTouches(false)  --是否向下传递
    listener1:registerScriptHandler(onTouchBegan,cc.Handler.EVENT_TOUCH_BEGAN )
    listener1:registerScriptHandler(onTouchMoved,cc.Handler.EVENT_TOUCH_MOVED )
    listener1:registerScriptHandler(onTouchEnded,cc.Handler.EVENT_TOUCH_ENDED )
    local eventDispatcher = self:getEventDispatcher() 
    eventDispatcher:addEventListenerWithFixedPriority(listener1,-1) --分发监听事件

    self._listener = listener1

end

function GameScene:onExit(  )
    -- body
    local eventDispatcher = self:getEventDispatcher() 
    eventDispatcher:removeEventListener(self._listener)
end
function GameScene:ballClick(x)
    self.up = true
    self:onUpdate(handler(self, self.update))
    if x == 2 then
        -- --球刚体
        self.basketballBody = cc.PhysicsBody:createCircle(radius,cc.PHYSICSBODY_MATERIAL_DEFAULT,cc.p(0,0)) 
        self.basketballBody:setContactTestBitmask(0xFFFFFFFF)
        self.basketballclone:setPhysicsBody(self.basketballBody)
        self.drawNode:clear()
        self._ondraw = true
        cishu = 2
    end
    self.liduclone:setVisible(false)
    if panduan then
        self.world = cc.Director:getInstance():getRunningScene():getPhysicsWorld()
        self.world:setGravity(gravity)
        -- self.world:setDebugDrawMask(cc.PhysicsWorld.DEBUGDRAW_ALL)  --显示刚体
        panduan = false 
    end
    self.action = self.basketballclone:runAction(cc.RepeatForever:create(cc.RotateBy:create(1,360)))
    self.basketballBody:setGravityEnable(true)
    -- self.basketballBody:applyImpulse(cc.p(self.xsudu , self.ysudu))
    self.basketballBody:setVelocity(cc.p(self.xsudu,self.ysudu))
end

function GameScene:setLiduState( r )   -- 设置进度条力度
    self.liduclone:setRotation(-r)
    self.basketballclone:setRotation(-r)
    self.liduclone:addEventListener(function (sender ,eventType)
        volume = self.liduclone:getPercent()
        local rate = 6
        self.xsudu = volume * math.cos(math.rad(r)) * rate
        self.ysudu = volume * math.sin(math.rad(r)) * rate
        --贝塞尔曲线
        --起点 = 球点位置
        -- self.xp0 = self.event_x
        -- self.yp0 = self.event_y
        self.xp0 = 0
        self.yp0 = 0
        
        --中点
        local t =  self.ysudu / (9.8 * 30)
        -- self.xp1 = self.xsudu * t + self.event_x 
        -- self.yp1 = self.ysudu * t + 0.5 * 9.8 * t * t + self.event_y
        -- self.xp2 = self.xsudu * 2 * t + self.event_x
        -- self.yp2 = self.yp0
        self.xp1 = self.xsudu * t
        self.yp1 = self.ysudu * t + 0.5 * 9.8 * t * t 
        self.xp2 = self.xsudu * 2 * t 
        self.yp2 = self.yp0
        self.beisaier:setPosition(self.event_x,self.event_y)
        self.beisaier:setSize({width = self.xp1-self.xp0, height = self.yp1 - self.yp0})
    end)
end
--求夹角
function GameScene:getAngleByPos(p1,p2)
    local p = {}
    p.x = p2.x - p1.x
    p.y = p2.y - p1.y
    self.r = math.atan2(p.y , p.x) * 180/math.pi
    return self.r
end
--进球
function GameScene:update(dt)
    local point = self.basketballclone:getBoundingBox()      --
    local rect = self.mView['lankuang']:getBoundingBox()    --  获取精灵的范围   
    if (cc.rectContainsPoint(rect,point)) then
        if self.up then
            cc.SimpleAudioEngine:getInstance():playEffect(SoundPath  ..  sound.jinqiu,false)
            self.b = self.b + 3
            self.score:setString(self.b)
            local action = cc.CSLoader:createTimeline('game/Pitcher/Node1.csb')
            self.root:runAction(action)
            action:pause()
            action:clearFrameEventCallFunc()
            action:gotoFrameAndPlay(0,10,false)
            local action1 = cc.CSLoader:createTimeline('game/Pitcher/Node2.csb')
            self.root1:runAction(action1)
            action1:pause()
            action1:clearFrameEventCallFunc()
            action1:gotoFrameAndPlay(0,10,false)
            self.up = false
            if self.hhscore < self.b then
                self.hhscore = self.b 
            end
            self.mView['hscore']:setString(self.hhscore)
            cc.UserDefault:getInstance():setIntegerForKey("self.hhscore", self.hhscore)
        end
    end
end
function GameScene:onTime()
    global.countDown.createTimer("time", time )
    local node = cc.Node:create()
    node:addTo(self)
    global.countDown.bindTimer(node, "time", function(v)  
        self.shijian = v
        self.mView['time']:setString(self.shijian)
        if self.shijian < 90 then
            self:testBezier(self.r)
        end
        if self.shijian == 0 then   --游戏结束  
            -- local function callback ()
            --     -- self:onCreate()
            -- end
            cc.SimpleAudioEngine:getInstance():playEffect(SoundPath  ..  sound.jieshu,false)
            -- local jiesuan = require("logic.game.Pitcher.JiesuanLayer").new(nil, nil , callback)
            self.basketballclone:stopAction(self.action)
            -- self:addChild(jiesuan)
            self:jiesuan()
            self.drawNode:clear()
            self:onExit()
        end
    end)
end
function GameScene:jiesuan()
    local function callback ()
        -- self:onCreate()
    end
    local jiesuan = require("logic.game.Pitcher.JiesuanLayer").new(nil, nil , callback)
    self:addChild(jiesuan)
end
function GameScene:testBezier(r)
    if not self.drawNode then
        self.drawNode = cc.DrawNode:create()
        self.beisaier:addChild(self.drawNode)
    end
    self.drawNode:clear()
    if not self._ondraw then
        return
    end

    if (not self.xp0 or not self.yp0 or not self.xp1 or not self.yp1 or not self.xp2 or not self.yp2) then
        return 
    end
    if r >= 0 then
        self.drawNode:drawQuadBezier(cc.p(self.xp0,self.yp0),cc.p(self.xp1,self.yp1),cc.p(self.xp2,self.yp2),1000,cc.c4f(1,1,0,1))
    end
end 
return GameScene