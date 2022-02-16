local GameScene = class("GameScene", cc.load("mvc").ModuleBase)

GameScene.RESOURCE_FILENAME = "game/basketball/GameScene.lua"

GameScene.behavior ={
    "logic.common.behavior.BtnBinder",
    "logic.common.behavior.Listener",
    "logic.common.behavior.FontColorChange",
}

GameScene.changecolorfont = {
    Ws = {},
    Wx = {},
}

--按钮触发事件
GameScene.btnBind = {
    shua = "onShua",
    jixu = "onShua",
    home = "onHome",
    home1 = "onHome",
}

--图片、音乐路径
local ImagePath = "game/basketball/image/"
local SoundPath = "game/basketball/sound/"

--图片
local image = {
    "HelloWorld.png",       --背景图片 
    "basketball.png",       --篮球
    "lankuang.png",         --篮筐
}
-- 音乐
local sound = {
    "01.mp3",       --游戏开始播放
    "02.mp3",       --球命中篮板播放
    "03.mp3",       --球命中篮框播放
    "04.mp3",       --普通进球播放
    "05.mp3",       --空心进球播放
    "06.mp3",       --篮球飞出播放
    "07.mp3",       --辅助鸟出现播放
    "08.mp3",       --干扰鸟出现播放
    "09.mp3",       --分数小于30分播放
    "10.mp3",       --分数大于30分播放
    "11.mp3",       --时间到播放
    "bgm.mp3",      --背景音乐
}
-- 倒计时时长
local time = global.isGrabScreenMode == 1 and 3 or 120  --两分钟
local time1 = {60,110,80,50,20} --出现鸟的时间和起风的时间

local G = 9.8 * 120
local xxx = {100,200}   --篮球位置坐标 {x,y}

function GameScene:onCreate()
    self.qiuceng = self.mView['qiuceng']
    self.wang = self.mView['wang']
    self.shiJian = self.mView['time']
    self.Fenshu = self.mView['score']
    self.Wx = self.mView['Wx']
    self.Ws = self.mView['Ws']
    
    local scene = require('game/basketball/Node.lua')
    self.root = scene.create().root
    --self.root = cc.CSLoader:createNode('game/basketball/Node.lua')

    self.wang:addChild(self.root)
    self.root:move(933,470)

    local scene1 = require('game/basketball/Node1.lua')
    self.root1 = scene1.create().root
    --self.root1 = cc.CSLoader:createNode('game/basketball/Node1.lua')
    self.qiuceng:addChild(self.root1)
    self.root1:move(933,480)
    -- local lankuang = display.newSprite(ImagePath .. image[5])
    --     :addTo(self)
    --     :move(931,513)
    self.hight = cc.UserDefault:getInstance():getIntegerForKey("self.hight")
    self.wind = 0
    self.fen = 0 
    audio.playMusic( SoundPath .. sound[01], false)  --播放开始音乐
    local layer = display.newLayer()
    layer:addTo(self)
    -- self.Wx = cc.Label:createWithSystemFont("direction: No Wind", 'game/basketball/image/FZY3JW.ttf', 30)
    --     :move(170 , 690)
    --     :addTo(self)
    -- self.Ws = cc.Label:createWithSystemFont("speed: " .. self.wind .. " level", 'game/basketball/image/FZY3JW.ttf', 30)
    --     :move(170 , 655)
    --     :addTo(self)
    -- self.Fenshu = cc.Label:createWithSystemFont(self.fen, 'game/basketball/image/FZY3JW.ttf', 50)   -- 显示得分
    --     :setColor(ccc3(0,255,0))
    --     :move(700,670)
    --     :addTo(self)
    self.Wx:setString("direction: No Wind")
    self.Ws:setString("speed: " .. self.wind .. " level")
    self.Fenshu:setString(self.fen)
    self:onGame()
    self:onTime()
end
    
function GameScene:onGame()
    -- audio.playMusic( SoundPath .. sound[04], false)
    self.mView['a']:setVisible(true)
    self.startMoveBall = false
    local node = cc.Node:create()
    node:addTo(self)
    self.ballx = xxx[1]
    self.cishu = 0 
    --投篮
    -- self.sprite1 = display.newSprite(ImagePath .. image[2])    --精灵1
    -- self.sprite1:move(xxx[1] , xxx[2])
    -- self.sprite1:addTo(self)
    self:onClone()
    self.mView['lanqiu']:setVisible(false)
    local Shooting = true  --投篮动作只触发一次
    local function onTouchBegan( touch, event )
        return true  
    end
    local function onTouchEnded( touch, event )
    end
    local function onTouchMoved(touch, event)
        local location = touch:getLocation()   --获取鼠标的位置
        local event_x = location["x"] or 0      
        local event_y = location["y"] or 0
        if event_x >= 300 and event_x <= 320 then
            self.mView['a']:setVisible(false)
            if Shooting == true then
                local p1 = {x = 100 , y = 200}
                local p2 = {x = event_x ,y = event_y}
                self:getAngleByPos(p1, p2)
                Shooting = false
                audio.playMusic( SoundPath .. sound[06], false)  --播放开始音乐
                print("投球 ... ")
            end
        end
    end
    local listener1 = cc.EventListenerTouchOneByOne:create()  --创建一个单点事件监听
    listener1:setSwallowTouches(false)  --是否向下传递
    listener1:registerScriptHandler(onTouchBegan,cc.Handler.EVENT_TOUCH_BEGAN )
    listener1:registerScriptHandler(onTouchMoved,cc.Handler.EVENT_TOUCH_MOVED )
    listener1:registerScriptHandler(onTouchEnded,cc.Handler.EVENT_TOUCH_ENDED )
    local eventDispatcher = self:getEventDispatcher() 
    eventDispatcher:addEventListenerWithSceneGraphPriority(listener1, self.sprite1) --分发监听事件
end

--倒计时
function GameScene:onTime()
    global.countDown.createTimer("time", time )
    local node = cc.Node:create()
    node:addTo(self)
    -- self.shiJian = cc.Label:createWithSystemFont(self.shijian, 'game/basketball/image/FZY3JW.ttf', 50)   -- 显示倒计时
    --     :setColor(ccc3(0,255,0))
    --     :move(450,670)
    --     :addTo(node)
    self.shiJian:setString(self.shijian)
    global.countDown.bindTimer(node, "time", function(v)  
        self.shijian = v
        if self.shijian == time1[2] or self.shijian == time1[3] or self.shijian == time1[4] or self.shijian == time1[5] then   --出现风
            self:onWind()
        end
        if self.shijian == time1[1] then  --出现鸟
            self:onBird()
        end
        if self.shijian == 0 then   --游戏结束  
            self:onUpdate(handler(self, self.update))    
            audio.playMusic(SoundPath .. sound[11],false)
            if self.hight <= self.fen then
                self.hight = self.fen
            end
            self.mView['hight']:setString(self.hight)
            self.mView['zhe']:setString(self.fen)
            cc.UserDefault:getInstance():setIntegerForKey("self.hight", self.hight)
            self.mView['Panel_4']:setVisible(true)
            self.sprite1:removeFromParent()
            self.sprite1 = nil
        end
        if self.shijian <= time1[1] then
            self:onUpdate(handler(self, self.update))
        end
        self.shiJian:setString(self.shijian) 
    end)
end

function GameScene:grabscreen()
    self.shijian = -1
    self.shiJian:setString(0)
    local i = 0
    local j = 0
    i,j = math.modf(math.random(0, 158) / 3)
    self.fen = i * 3
    self.Fenshu:setString(self.fen)
    self:onUpdate(handler(self, self.update))    
    audio.playMusic(SoundPath .. sound[11],false)
    self.mView['hight']:setString(self.hight)
    self.mView['zhe']:setString(self.fen)
    if self.hight <= self.fen then
        self.hight = self.fen
    end
    cc.UserDefault:getInstance():setIntegerForKey("self.hight", self.hight)
    self.mView['Panel_4']:setVisible(true)
    self.sprite1:removeFromParent()
    self.sprite1 = nil
end

--球状态的判断
function GameScene:onBall()
    self:onUpdate(handler(self, self.update))
    self.startMoveBall = true
    self.ballV = {x = self.W , y = self.H}
    self.sprite1:runAction(cc.RepeatForever:create(cc.RotateBy:create(1,360)))
end
--风
function GameScene:onWind()
    math.randomseed(os.time())
    self.wind = math.random(-5 , 5)
    if self.wind > 0 then
        self.mView['feng1']:setVisible(true)
        self.mView['feng2']:setVisible(false)
        self.Wx:setString("direction: downwind")
        self.Ws:setString("speed: " .. self.wind .. " level")
    end
    if self.wind < 0 then
        self.mView['feng1']:setVisible(false)
        self.mView['feng2']:setVisible(true)
        local wind = - self.wind
        self.Wx:setString("direction: headwind")
        self.Ws:setString("speed: " .. self.wind .. " level")
    end
    if self.wind == 0 then
        self.mView['feng1']:setVisible(false)
        self.mView['feng2']:setVisible(false)
    end
end
--鸟
function GameScene:onBird()
    local node = display.newNode()
        :addTo(self)
    math.randomseed(os.time())
    self.bird = math.random( 2 )
    local x1 = math.random( 100 , 940)
    local y1 = math.random( 400 , 700)
    if self.bird == 1 then  --生成辅助鸟
        -- audio.playMusic( SoundPath .. sound[07], false)  --播放开始音乐
        self.niao = display.newSprite( ImagePath .. image[3])   
            :move(x1 , y1)
            :addTo(self)
    end
    if self.bird == 2 then  --生成干扰鸟
        -- audio.playMusic( SoundPath .. sound[08], false)  --播放开始音乐
        self.niao = display.newSprite( ImagePath .. image[4])   
            :move(x1 , y1)
            :addTo(self)
    end
    self.niao:setVisible(false)
end
--篮球抛物线
function GameScene:onHW(r)
    local W = {550 , 750 }
    local H = {900 , 1100 }
    self.W = W[1] + r * (W[2] - W [1])/65
    self.H = H[1] + r * (H[2] - H [1])/65
    self:onBall()
end
--位置更新
function GameScene:update(dt)
    self:updateBall(dt)
end
function GameScene:updateBall(dt)
    if not self.sprite1 then return end
    local box = {}
    local ball = self.sprite1:getBoundingBox()
    self.ballw = ball.width/2
    if self.startMoveBall == true then
        self.px , self.py = self.sprite1:getPosition()
        self.px = self.px + self.ballV.x * dt 
        self.py = self.py + self.ballV.y * dt 
        self.ballV.y = self.ballV.y - G * dt
        self.ballV.x = self.ballV.x + self.wind * 10 * dt
        self.sprite1:setPosition(self.px, self.py)
        if self.py <= xxx[2] + 10 then
            self.sprite1:runAction(cc.FadeOut:create(1))
            if self.ballV.y > 0 then
                self.ballV.y =  self.ballV.y * 0.7
            elseif self.ballV.y < 0 then
                self.ballV.y = - self.ballV.y * 0.7
            end
        end
        if self.px - self.ballw > display.width or self.py - self.ballw > display.height or self.px + self.ballw < 0 then
            self.sprite1:removeFromParent()
            self:onGame()
        end
        for i =  1 , 3 do
            box[i] = self.mView['Panel_' .. i]:getBoundingBox()
        end
        if (self.px + self.ballw >= box[1].x and self.px + self.ballw <= box[1].x + box[1].width and self.py + self.ballw >= box[1].y and self.py + self.ballw <= box[1].y + box[1].height) or  
            (self.px + self.ballw >= box[2].x and self.px + self.ballw <= box[2].x + box[2].width and self.py + self.ballw >= box[2].y and self.py + self.ballw <= box[2].y + box[2].height)then
            print("碰撞")
            audio.playMusic( SoundPath .. sound[02], false)
            if self.ballV.x > 0 then
                self.ballV.x = - self.ballV.x * 0.7  
            end
            if self.ballV.y > 0 then
                self.ballV.y = - self.ballV.y * 0.7
            end
            if self.py <= xxx[2] + 10 then
                self.sprite1:runAction(cc.FadeOut:create(1))
                if self.ballV.y > 0 then
                    self.ballV.y = - self.ballV.y * 0.7
                elseif self.ballV.y < 0 then
                    self.ballV.y = - self.ballV.y * 0.7
                end
            end
            if  self.px + self.ballw < 300 then
                self.sprite1:removeFromParent()
                self:onGame()
            end
        end
        if(self.px + self.ballw >= box[1].x and self.px + self.ballw <= box[1].x + box[1].width and self.py + self.ballw >= box[1].y and self.py + self.ballw <= box[1].y + box[1].height) and (self.px + self.ballw >= box[3].x and self.px + self.ballw <= box[3].x + box[3].width and self.py + self.ballw >= box[3].y and self.py + self.ballw <= box[3].y + box[3].height)or  
            (self.px + self.ballw >= box[2].x and self.px + self.ballw <= box[2].x + box[2].width and self.py + self.ballw >= box[2].y and self.py + self.ballw <= box[2].y + box[2].height) and (self.px + self.ballw >= box[3].x and self.px + self.ballw <= box[3].x + box[3].width and self.py + self.ballw >= box[3].y and self.py + self.ballw <= box[3].y + box[3].height) then
            self:onDong()
            self.cishu = self.cishu + 1
            if self.ballV.x > 0 then
                self.ballV.x = self.ballV.x * 0.7 
            end
            if self.ballV.y > 0 then
                self.ballV.y = - self.ballV.y * 0.7
            end
            if self.py <= xxx[2] + 10 then
                self.sprite1:runAction(cc.FadeOut:create(1))
            end
            if self.ballV.y > 0 then
                self.ballV.y = - self.ballV.y * 0.7
            elseif self.ballV.y < 0 then
                self.ballV.y = - self.ballV.y * 0.7
            end
            if self.cishu == 1 then
                self.fen = self.fen + 3
                self.Fenshu:setString(self.fen)
            end
        end
        if (self.px  >= box[3].x and self.px  <= box[3].x + box[3].width and self.px + self.ballw <= box[2].x and self.py + self.ballw >= box[3].y and self.py +  self.ballw <= box[3].y + box[3].height)  then
            print("进球")
            self:onDong()
            audio.playMusic( SoundPath .. sound[05], false)
            self.cishu = self.cishu + 1
            if self.ballV.x > 0 then
                self.ballV.x = self.ballV.x * 0.7 
            end
            if self.ballV.y > 0 then
                self.ballV.y = - self.ballV.y * 0.7
            end
            if self.py <= xxx[2] + 10 then
                self.sprite1:runAction(cc.FadeOut:create(1))
                if self.ballV.y > 0 then
                    self.ballV.y = - self.ballV.y * 0.7
                end
            end
            if self.cishu == 1 then
                self.fen = self.fen + 3
                self.Fenshu:setString(self.fen)
            end
        end
        -- if self.niao then
        --     local niao = self.niao:getBoundingBox()
        --     if self.px >= niao.x - niao.width/2 and self.px <= niao.x + niao.width/2 and self.py >= niao.y - niao.height/2 and self.py <= niao.y + niao.height/2 then
        --         self.niao:setVisible(true)
        --         if self.bird == 1 then  -- 辅助鸟
        --             audio.playMusic( SoundPath .. sound[07], false)
        --             self.niao:runAction(cc.MoveTo:create(0.5,ccp(922,615)))
        --             self.sprite1:runAction(cc.MoveTo:create(0.5,ccp(922,570)))
        --             -- self.niao:runAction(cc.FadeOut:create(1))
        --             local run1 = cc.CallFunc:create(function(sender)
        --                 self.sprite1:runAction(cc.MoveTo:create(0.3,ccp(922,200)))
        --             end)
        --             local run2 = cc.CallFunc:create(function(sender)
        --                 self.sprite1:runAction(cc.MoveTo:create(0.3,ccp(922,400)))
        --                 self.sprite1:runAction(cc.FadeOut:create(0.5))
        --             end)
        --             local run3 = cc.CallFunc:create(function(sender)
        --                 self.sprite1:removeFromParent()
        --                 self.niao:setVisible(false)
        --                 self.niao:runAction(cc.MoveTo:create(0.3,ccp(922,1000)))
        --                 self:onGame()
        --             end)
        --             local delay = cc.DelayTime:create(0.1)
        --             self.niao:runAction(cc.Sequence:create(delay,run1,run2,run3))
        --             self.fen = self.fen + 5
        --             self.Fenshu:setString(self.fen)
        --         end
        --         if self.bird == 2 then  -- 干扰鸟
        --             audio.playMusic( SoundPath .. sound[08], false)
        --             local run1 = cc.CallFunc:create(function(sender)  
        --             end)
        --             local run2 = cc.CallFunc:create(function(sender)
        --                 self.sprite1:runAction(cc.MoveTo:create(0.6,ccp(-100,400)))
        --                 self.niao:runAction(cc.MoveTo:create(0.6,ccp(1320,200)))
        --                 self.sprite1:runAction(cc.FadeOut:create(0.5))
        --             end)
        --             local run3 = cc.CallFunc:create(function(sender)
        --                 self.sprite1:removeFromParent()
        --                 -- self.niao:removeFromParent()
        --                 self:onGame()
        --             end)
        --             local delay = cc.DelayTime:create(0.1)
        --             self.niao:runAction(cc.Sequence:create(delay,run1,run2,run3))
        --         end
        --     end
        -- end
    end
end
function GameScene:updateBird(dt)
    if self.niao then

    end
end
--游戏页面刷新
function GameScene:onShua()
    local gameScene = require("logic.game.lanqiu.Game").new()
    gameScene:showWithScene()
end
function GameScene:onHome()
    local mainScene = require("logic.game.lanqiu.Main").new()
    mainScene:showWithScene()
end
--求夹角
function GameScene:getAngleByPos(p1,p2)
    local p = {}
    p.x = p2.x - p1.x
    p.y = p2.y - p1.y
    local r = math.atan2(p.y , p.x) * 180/math.pi
    print("夹角为: " .. r)
    self:onHW(r)
end

function GameScene:onDong()
    -- local a = cc.CallFunc:create(function(sender)
    --     self.mView['FileNode_4']:setVisible(false)
    -- end)
    -- local b = cc.CallFunc:create(function(sender)
        -- self.root = cc.CSLoader:createNode('game/basketball/Node.lua')

        -- local animation = require('game/basketball/Node.lua').create()
        -- --local action = scene.create().animation
        -- animation.root:runAction(animation.animation)
        -- animation:pause()
        -- animation:clearFrameEventCallFunc()
        -- self:addChild(animation.root)
        --action:gotoFrameAndPlay(0,15,false)
        -- local scene1 = require('game/basketball/Node1.lua')
        -- local action1 = scene1.create().animation
        -- self.root1:runAction(action1)
        -- action1:pause()
        -- action1:clearFrameEventCallFunc()
        -- local animation1 = require('game/basketball/Node1.lua').create()
        -- --local action = scene.create().animation
        -- animation1.root:runAction(animation1.animation)
        -- animation1:pause()
        -- animation1:clearFrameEventCallFunc()
        -- self:addChild(animation1.root)

        local animate = require("game/basketball/Node.lua").create()
        animate.root:runAction(animate.animation)
        self.root:addChild(animate.root)
        animate.root:runAction(cc.Sequence:create(cc.DelayTime:create(0.2),cc.RemoveSelf:create()))
        
        local animate1 = require("game/basketball/Node1.lua").create()
        animate1.root:runAction(animate1.animation)
        self.root1:addChild(animate1.root)
        animate1.root:runAction(cc.Sequence:create(cc.DelayTime:create(0.2),cc.RemoveSelf:create()))
        --action1:gotoFrameAndPlay(0,15,false)

        -- self:addChild(self.root)
        -- self.root:move(935,472)
    -- end)
    -- local c = cc.CallFunc:Create(function(sender)
    --     self.mView['FileNode_4']:setVisible(true)
    -- end)
end
function GameScene:onClone()
    local ball = self.mView['lanqiu']
    ball:setVisible(true)
    self.sprite1 = ball:clone()
    self.sprite1:addTo(self.qiuceng)
end
return GameScene