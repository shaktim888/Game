local GameScene = class("GameScene", cc.load("mvc").ModuleBase)
GameScene.RESOURCE_FILENAME = "game/huangcheng/GameScene.lua"

-- local RuleLayer = require("logic.game.huangcheng.RuleLayer")
GameScene.behavior ={
    "logic.common.behavior.BtnBinder",
    "logic.common.behavior.TouchInterrupt",
    "logic.common.behavior.Listener",
}

GameScene.btnBind = {
    Back = "onBack",
}
local Path = {
    Ball  = "game/huangcheng/image/qiu/",
    Cube  = "game/huangcheng/image/fangkuai/",
    Bricks = "game/huangcheng/image/zhuan/",
    Shang  = "game/huangcheng/image/shang.png",
    Xia    = "game/huangcheng/image/xia.png",
}

local Coor_X = {40,120,200,280,360,440,520,600,680,760,840,920,1000,1080,1160,1240}
local Coor_Y = {580,500,420}
local SPEED_OF_THE_BLOCK = 1000              --方块移动的速度
local BALL_SPEED         = 500               --球的速度


function GameScene:onCreate()
    self.U     = true
    self.D     = true
    self.L     = true
    self.R     = true
    self.Frist = true
    self.Peng  = false
    self.GameOver = #Coor_X * #Coor_Y
    self.Level = self.mView['Level']        --关卡
    self.Score = self.mView['Score']        --得分
    self.Xue   = {self.mView['Xue1'],self.mView['Xue2'],self.mView['Xue3']}
    self.Blood = 0
    self.level = cc.UserDefault:getInstance():getIntegerForKey("self.level")
    self.score = cc.UserDefault:getInstance():getIntegerForKey("self.score")
    self.Level:setString("LEVEL: " ..self.level)
    self.Score:setString("SCORE: " ..self.score)
    math.randomseed(os.time())
    self:onUpdate(handler(self,self.update))
    self:onElves()
    self:onClick()
end

function GameScene:update(dt)
    self.Ball_Px , self.Ball_Py = self.Ball:getPosition()    --实时获取小球的位置
    self.Bricks_Px ,self.Bricks_Py = self.Bricks:getPosition() --实时获取下面方块的位置
    if self.touch then
        self:onYidong(dt)
    end
    if not self.Frist then      --点击屏幕后开始游戏
        self:BallYi(dt)         --小球运动
        self:onCollision(dt)    --碰撞检测
    end
end

function GameScene:onClick()
    local function onTouchBegan( touch, event )
        self.Location = touch:getLocation()   --获取鼠标的位置
        self.touch = true
        return true  
    end
    local function onTouchEnded( touch, event )
        self.touch = false
        self.Peng  = true
    end
    local function onTouchMoved(touch, event)
    end
    local listener1 = cc.EventListenerTouchOneByOne:create()
    listener1:setSwallowTouches(false)
    listener1:registerScriptHandler(onTouchBegan,cc.Handler.EVENT_TOUCH_BEGAN )
    listener1:registerScriptHandler(onTouchMoved,cc.Handler.EVENT_TOUCH_MOVED )
    listener1:registerScriptHandler(onTouchEnded,cc.Handler.EVENT_TOUCH_ENDED )
    local eventDispatcher = self:getEventDispatcher() 
    eventDispatcher:addEventListenerWithSceneGraphPriority(listener1, self)
end

function GameScene:onYidong(dt)
    local event_x = self.Location["x"] or 0
    local event_y = self.Location["y"] or 0
    if self.Frist then
        self:onFrist(event_x,event_y)
    end
    if event_x < display.cx then
            self.Bricks_Px = self.Bricks_Px - SPEED_OF_THE_BLOCK * dt
            self.Bricks:setPosition(self.Bricks_Px , self.Bricks_Py)
        end
    if event_x > display.cx then
        self.Bricks_Px = self.Bricks_Px + SPEED_OF_THE_BLOCK * dt
        self.Bricks:setPosition(self.Bricks_Px , self.Bricks_Py)
    end
    --移动出界
    if self.Bricks_Px + self.Bricks_Box.width/2 > display.right or 
        self.Bricks_Px - self.Bricks_Box.width/2 < display.left then
            self.touch = false
    end
end


function GameScene:onFrist(x,y)
    self.Frist = false
    local p1 = {x = self.Ball_Px, y = self.Ball_Py}
    local p2 = {x = x, y = y}
    local x = p2.x - p1.x
    local y = p2.y - p1.y
    local r = math.atan2(y,x) * 180/math.pi
    self.Sudo_x = math.cos(math.rad(r)) * BALL_SPEED
    self.Sudo_y = math.sin(math.rad(r)) * BALL_SPEED
    self.Ball:runAction(cc.RepeatForever:create(cc.RotateBy:create(0.5,360)))
    self.Sudo_x1 = self.Sudo_x
    self.Sudo_y1 = self.Sudo_y
end

function GameScene:onCollision(dt)
    local bx = self.Ball_Px
    local by = self.Ball_Py
    local bw = self.Ball_Box.width/2
    local bh = self.Ball_Box.height/2
    self.P_up    = {x = bx , y = by + bh}  --上面的点
    self.P_down  = {x = bx , y = by - bh}  --下面的点
    self.P_left  = {x = bx - bw , y = by}  --左边的点
    self.P_right = {x = bx + bw , y = by}  --右边的点
    local Bricks_Box = self.Bricks:getBoundingBox()
    local panel  = self.Panel:getChildren()
    for i , v in ipairs(panel) do
        local Fang_Box = v:getBoundingBox()
        if cc.rectContainsPoint(Fang_Box, self.P_up) then
            self:P_Fang()
            self.Sudo_x1 = self.Sudo_x1
            self.Sudo_y1 = -self.Sudo_y1
            v:removeFromParent()
            v = nil
        elseif cc.rectContainsPoint(Fang_Box, self.P_down) then
            self:P_Fang()
            self.Sudo_x1 = self.Sudo_x1
            self.Sudo_y1 = -self.Sudo_y1
            v:removeFromParent()
            v = nil
        elseif cc.rectContainsPoint(Fang_Box, self.P_left) then
            self:P_Fang()
            self.Sudo_x1 = -self.Sudo_x1
            self.Sudo_y1 = self.Sudo_y1
            v:removeFromParent()
            v = nil
        elseif cc.rectContainsPoint(Fang_Box, self.P_right) then
            self:P_Fang()
            self.Sudo_x1 = -self.Sudo_x1
            self.Sudo_y1 = self.Sudo_y1
            v:removeFromParent()
            v = nil
        end
    end
    if  self.P_up.y > display.top and self.U then
        self.U = false
        self.D = true
        self.L = true
        self.R = true
        self.Sudo_x1 = self.Sudo_x1
        self.Sudo_y1 = -self.Sudo_y1
    elseif  (self.P_down.y < display.bottom and self.D) or self.P_left.x > display.right or self.P_right.x < display.left then
        self.Blood = self.Blood + 1
        self.Xue[self.Blood]:setVisible(false)
        self.U = true
        self.D = false
        self.L = true
        self.R = true
        -- print("self.Blood = " .. self.Blood)
        self.Frist = true
        self.Peng  = false
        self.Ball_x1 = display.cx
        self.Ball_y1 = self.Bricks_Box.height + self.Ball_Box.height/2
        global.countDown.createTimer("time",0.05 )
        local node = cc.Node:create()
        node:addTo(self)
        performWithDelay(node,function()
        CCDirector.sharedDirector():resume()
        self.Bricks:setPosition(display.cx,self.Bricks_Box.height/2)
        self.Ball:setPosition(self.Ball_x1,self.Ball_y1)
            end, 0.05)
        if self.Blood == 3 then
            self.Blood = 0
           self:onJiesuan()
        end
        -- self.Sudo_x1 = self.Sudo_x1
        -- self.Sudo_y1 = -self.Sudo_y1
    elseif self.P_left.x < display.left and self.L then
        self.U = true
        self.D = true
        self.L = false
        self.R = true
        self.Sudo_x1 = -self.Sudo_x1
        self.Sudo_y1 = self.Sudo_y1
    elseif self.P_right.x > display.right and self.R then
        self.U = true
        self.D = true
        self.L = true
        self.R = false
        self.Sudo_x1 = -self.Sudo_x1
        self.Sudo_y1 = self.Sudo_y1
    end
    -- dump(Bricks_Box)
    if cc.rectContainsPoint(Bricks_Box, self.P_down) and self.Peng and self.D then
        self.U = true
        self.D = false
        self.L = true
        self.R = true
        self.Sudo_x1 = self.Sudo_x1
        self.Sudo_y1 = -self.Sudo_y1
    end
    --[[球的上下左右四个检测点
    1、球的上检测点发生碰撞，碰到方块下边，y轴运动方向改变
    2、球的下检测点发生碰撞，碰到方块上边，y轴运动方向改变
    3、球的左检测点发生碰撞，碰到方块右边，x轴运动方向改变
    4、球的右检测点发生碰撞，碰到方块左边，x轴运动方向改变    
    --]]
end
function GameScene:BallYi(dt)
    self.Ball_x1 = self.Ball_x1 + self.Sudo_x1 * dt
    self.Ball_y1 = self.Ball_y1 + self.Sudo_y1 * dt
    self.Ball:setPosition(self.Ball_x1,self.Ball_y1)
end

function GameScene:P_Fang()
    self.U = true
    self.D = true
    self.L = true
    self.R = true
    self.score = self.score + 1
    cc.UserDefault:getInstance():setIntegerForKey("self.score",self.score)
    self.GameOver = self.GameOver - 1
    self.Score:setString("SCORE: " .. self.score)
    -- print(self.GameOver)
    if self.GameOver == 0 then
        self:onNext()
    end
end

function GameScene:onNext()
    self:onTiao()
    global.countDown.createTimer("time",1)
        local node = cc.Node:create()
        node:addTo(self)
        performWithDelay(node,function()
        -- CCDirector.sharedDirector():resume()
        self.level = self.level + 1
        cc.UserDefault:getInstance():setIntegerForKey("self.level",self.level)
        CCDirector.sharedDirector():resume()
        require ("logic.game.huangcheng.GameScene").new():showWithScene()
            end, 1)
end

function GameScene:onTiao()
    self.Shang = cc.Sprite:create(Path.Shang)
    self.Shang:setPosition(640,900)
    self.Shang:addTo(self)
    self.Xia = cc.Sprite:create(Path.Xia)
    self.Xia:setPosition(640,-180)
    self.Xia:addTo(self)
    self.Shang:runAction(cc.MoveTo:create(0.5,cc.p(640,540)))
    self.Xia:runAction(cc.MoveTo:create(0.5,cc.p(640,180)))
end

function GameScene:onJiesuan()
    self:onTiao()
    global.countDown.createTimer("time",0.7)
    local node = cc.Node:create()
    node:addTo(self)
    performWithDelay(node,function()
        -- CCDirector.sharedDirector():resume()
        -- local jiesuanlayer = require ("logic.game.huangcheng.JiesuanLayer").new();
        -- jiesuanlayer:showWithScene()
        local jiesuan = require ("logic.game.huangcheng.JiesuanLayer").new()
        self:addChild(jiesuan)
        jiesuan:setVisible(true)
        end, 0.7)
end
--创建精灵
function GameScene:onElves()
    --创建背景
    -- self.bg = cc.Sprite:create(Path.Bg)
    -- self.bg:setPosition(display.center)
    -- self.bg:addTo(self)
    --创建容器
    self.Panel  = ccui.Layout:create() 
    self.Panel:setPosition(0.0000, 0.0000)
    self.Panel:setSize({width = 1280.0000, height = 720.0000})
    self.Panel:addTo(self)
    --创建方块
    for i = 1 , #Coor_X do
        for j = 1 , #Coor_Y do 
        local fangkuai = math.random(1,10)
        self.fang = cc.Sprite:create(Path.Cube .. fangkuai ..".png")
        self.fang:setPosition(Coor_X[i],Coor_Y[j])
        self.fang:addTo(self.Panel)
        end
    end

    --创建下面的方块
    local zhuan = math.random(1,6)
    self.Bricks  = cc.Sprite:create(Path.Bricks .. zhuan .. ".png")
    self.Bricks_Box = self.Bricks:getBoundingBox()
    self.Bricks:setPosition(display.cx,self.Bricks_Box.height/2)
    self.Bricks:addTo(self)

    --创建球
    local qiu = math.random(1,6)
    self.Ball = cc.Sprite:create(Path.Ball .. qiu .. ".png")
    self.Ball_Box = self.Ball:getBoundingBox()
    self.Ball_x1 = display.cx
    self.Ball_y1 = self.Bricks_Box.height + self.Ball_Box.height/2
    self.Ball:setPosition(self.Ball_x1,self.Ball_y1)
    self.Ball:addTo(self)
end

function GameScene:onBack()
    -- print("返回主页")
    CCDirector.sharedDirector():resume()
    local mainScene = require ("logic.game.huangcheng.MainScene").new();
    mainScene:showWithScene()
end
return GameScene