local SurvivalScene = class("SurvivalScene", cc.load("mvc").ModuleBase)

SurvivalScene.RESOURCE_FILENAME = "game/shilong/SurvivalScene.lua"

SurvivalScene.behavior ={
    "logic.common.behavior.BtnBinder",
    "logic.common.behavior.TouchInterrupt",
    "logic.common.behavior.Listener",
}

local LongPath = "game/shilong/image/"
local BossPath = "game/shilong/boss/"
local SoundPath = "game/shilong/sound/"
local music = {
    "boss.mp3",
    "fei.mp3",
    "long.mp3"
}
local long = {
    "long1.png",
    "long2.png",
    "long3.png",
}
local boss = {
    "boss1.png",
    "boss2.png",
    "boss3.png",
    "boss4.png",
    "boss5.png",
}

function SurvivalScene:onCreate()
    math.randomseed(os.time()) --随机数因子
    local game = 2
    cc.UserDefault:getInstance():setIntegerForKey("game",game)
    -- 血   
    self.xue = {}   
    for i = 1 , 3 do
        self.xue[i] = self.mView['xue' .. i]
    end
    -- 龙币
    self.longbi =  self.mView['longbi']
    
    --战士
    self.zhanshi = self.mView['zhanshi']
    --boss
    self.boss = self.mView['boss']
    --分数
    self.fenshu = self.mView['fenshu']
    --获取战士的初始坐标
    self.zs_X , self.zs_Y = self.zhanshi:getPosition()
    --获取战士的size
    self.zsSize = self.zhanshi:getBoundingBox()
    -- self.zsSize = self.zhanshi:getContentSize()
    --定义参数
    self.tiao = true -- 触摸是否触发
    --创建龙层
    self._long = ccui.Layout:create()
    self._long:setPosition(0,0)
    self._long:setSize({width = 720, height = 1280})
    self._long:addTo(self)
    --碰撞判断
    self.shang = true
    self.xia = true
    self.zuo = true
    self.you = true
    --得分
    self.fen = cc.UserDefault:getInstance():getIntegerForKey("shilong.fen")
    self.fenshu:setString(self.fen)
    --Boss的生命值
    self.a = 0  -- 等于5时出现Boss
    self.B_xue = 5
    self.b_pan = false
    self.kill = cc.UserDefault:getInstance():getIntegerForKey("shilong.kill")
    -- 龙币
    self.LB = cc.UserDefault:getInstance():getIntegerForKey("shilong.LB")
    self.longbi:setString( "x " .. self.LB)
    --战士跳高
    self:onChumo()
    self.time = 120 -- 倒计时
    self.Time = self.mView['time']
    self.jiesuan = true
    self:onUpdate(handler(self,self.update))
    self:onTime()
end

function SurvivalScene:update(dt)
    self:onLong(dt)       -- 龙的产生
    self:Coordinate(dt)   -- 实时获取战士的坐标
    self:LongBian(dt)     -- 判断龙和战士是否相撞
    self:onBoss(dt)    -- 打Boss
end

function SurvivalScene:onChumo()
    local function onTouchBegan(touch,event)
        if self.tiao then
            self.tiao = false      --触摸屏幕，战士跳了一次后禁止
            self.shang = true  
            self.xia = true     
            self.zuo = true
            self.you = true  
            self.zhanshi:stopAllActions()
            self:onTiao()
            return true
        end
    end
    local function onTouchMoved(touch,event)
    end
    local function onTouchEnded(touch,event)
    end
    local listener = cc.EventListenerTouchOneByOne:create()  --创建一个单点事件监听
    listener:setSwallowTouches(false)  --是否向下传递
    listener:registerScriptHandler(onTouchBegan,cc.Handler.EVENT_TOUCH_BEGAN )
    listener:registerScriptHandler(onTouchMoved,cc.Handler.EVENT_TOUCH_MOVED )
    listener:registerScriptHandler(onTouchEnded,cc.Handler.EVENT_TOUCH_ENDED )
    local eventDispatcher = self:getEventDispatcher() 
    eventDispatcher:addEventListenerWithSceneGraphPriority(listener,self) --分发监听事件
end

function SurvivalScene:onTiao()
    local action = cc.Sequence:create( { cc.JumpTo:create(1,cc.p(self.zs_X,self.zs_Y),self.zsSize.height * 2 , 1),
    cc.CallFunc:create(function()
        self.tiao = true
    end)})
    action:setTag(999)
    self.zhanshi:stopActionByTag(999)
    self.zhanshi:runAction(action)
end

--龙的产生
function SurvivalScene:onLong(dt) 
    local cs = math.random(1,1000)    --生成一个随机数
    self.spriteY = math.random(500,1000)   --龙产生的Y轴坐标
    -- self.spriteY = math.random(500,600)
    local miao = math.random(2,5)          --龙移动的时间
    if cs % 80 == 0 then  --产生龙的条件
        local i = math.random(1,3)
        self.sprite1 = cc.Sprite:create(BossPath .. long[i])
        self.sprite1:setScale(0.6)
        self.sprite1Size = self.sprite1:getContentSize() 
        -- self.long = long[i] 
        if miao % 2 == 0 then
            self.sprite1:move( display.width + self.sprite1Size.width/2,self.spriteY)
            self.sprite1:addTo(self._long )
            self.sprite1:runAction(cc.MoveTo:create(miao,cc.p( 0 - self.sprite1Size.width/2 ,self.spriteY)))
        end
        if miao % 2 ~= 0 then
            self.sprite1:move( 0 - self.sprite1Size.width/2,self.spriteY)
            self.sprite1:addTo(self._long )
            self.sprite1:setFlippedX(true)
            self.sprite1:runAction(cc.MoveTo:create(miao,cc.p( display.width + self.sprite1Size.width/2 ,self.spriteY)))
        end
    end
end

function SurvivalScene:Coordinate(dt)
    self.zs_sx , self.zs_sy = self.zhanshi:getPosition()
end

function SurvivalScene:LongBian(dt)
    if  self.jiesuan then
        local point_Ztop = {x = self.zs_sx , y = self.zs_sy + self.zsSize.height} -- 战士上顶点
        local point_Zdown = {x = self.zs_sx , y = self.zs_sy} --战士下顶点
        local long_tbl = self._long:getChildren()     -- 
        for i , v in ipairs(long_tbl)do
            local rect_L = v:getBoundingBox()           --获取龙的范围
            local rect_Zs = self.zhanshi:getBoundingBox()
            local long_x , long_y = v:getPosition()
            local point_Lzuo = { x = long_x - rect_L.width / 2 , y = long_y} 
            local point_Lyou = { x = long_x + rect_L.width / 2 , y = long_y}
            if (cc.rectContainsPoint(rect_L,point_Ztop)) then --判断战士的上顶点是否在龙的范围内
                if self.shang then
                    -- self.bian = false
                    self.shang = false
                    self:onShang(v)
                end
            elseif (cc.rectContainsPoint(rect_L,point_Zdown)) then   -- 判断战士的下定点是否在龙的范围内
                if self.xia then
                    -- self.bian = false
                    self.xia = false
                    self.tiao = true  -- 触摸屏幕有效
                    self.shang = true
                    self:onXia(v)
                end
            elseif (cc.rectContainsPoint(rect_Zs, point_Lzuo)) then
                if self.zuo then
                    -- self.bian = false
                    self.zuo = false
                    self.you = false
                    self.shang = false
                    self.xia = false
                    self.tiao = false
                    self:onZuo(v)
                end
            elseif (cc.rectContainsPoint(rect_Zs, point_Lyou)) then
                if self.you then
                    -- self.bian = false
                    self.zuo = false
                    self.you = false
                    self.shang = false
                    self.xia = false
                    self.tiao = false
                    self:onYou(v)
                end
            end
        end
    end
end

function SurvivalScene:onShang(v)
    print("shangshang")
    local fangxiang = math.random(1,2)
    local run1 = cc.CallFunc:create(function()
        v:stopAllActions()
    end)
    local run2 = cc.CallFunc:create(function()
        global.utils.sound.playSound(SoundPath .. music[3], false)
        self.zhanshi:stopActionByTag(999)
        local action = cc.Sequence:create({ cc.MoveTo:create(0.2,cc.p(self.zs_X , self.zs_Y )), cc.CallFunc:create(function()
            self.tiao = true
            -- self.bian = true
        end) } )
        action:setTag(999)
        self.zhanshi:runAction(action)
        v:runAction(cc.RotateBy:create(0.5,360))
        v:runAction(cc.ScaleTo:create(0.5,0.1))
        if fangxiang == 1 then
            v:runAction(cc.JumpBy:create(1,cc.p(display.width,display.height/2),display.height/4 , 1))
        end
        if fangxiang == 2 then
            v:runAction(cc.JumpBy:create(1,cc.p(-display.width,display.height/2),display.height/4 , 1))
        end
        self:onFen()
    end)
    local run3 = cc.CallFunc:create(function()
        v:removeFromParent()
        v = nil
    end)
    local delay = cc.DelayTime:create(0.5)
    self.zhanshi:runAction(cc.Sequence:create(run1 , run2 , delay , run3 ))
end

function SurvivalScene:onXia(v)
    print("xiaxia")
    local run1 = cc.CallFunc:create(function()
        v:stopAllActions()
    end)
    local run2 = cc.CallFunc:create(function()
        global.utils.sound.playSound(SoundPath .. music[3], false)
        self.zhanshi:stopActionByTag(999)
        local action = cc.Sequence:create({cc.JumpTo:create(0.6 , cc.p(self.zs_X,self.zs_Y) , self.zsSize.height  , 1), cc.CallFunc:create(function()
            self.tiao = true
        end) } )
        action:setTag(999)
        self.zhanshi:runAction(action)
        v:runAction(cc.ScaleTo:create(0.1,0.5))
        v:runAction(cc.FadeOut:create(0.5))
        v:runAction(cc.RotateBy:create(0.5,360))
        v:runAction(cc.MoveTo:create(0.5 ,cc.p (self.zs_X,0)))
        self:onFen()
    end)
    local run3 = cc.CallFunc:create(function()
        self.xia = true
        -- self.bian = true
    end)
    local run4 = cc.CallFunc:create(function()
        -- v:removeFromParent()
        -- v = nil
    end)
    local delay = cc.DelayTime:create(0.5)
    self.zhanshi:runAction(cc.Sequence:create(run1 , run2 , run3 , delay ,run4))
end

function SurvivalScene:onZuo(v)
    print("zuozuo")
    local run1 = cc.CallFunc:create(function()
        global.utils.sound.playSound(SoundPath .. music[2], false)
        v:stopAllActions()
        self.zhanshi:stopActionByTag(999)
        self.zhanshi:runAction(cc.ScaleTo:create(0.2,0.5))
        self.zhanshi:runAction(cc.RotateBy:create(1,720))
        self.zhanshi:runAction(cc.JumpBy:create(1, cc.p( - display.width , display.cy / 4) , display.cx / 4, 1))
    end)
    local run2 = cc.CallFunc:create(function()
            local jiesuan = require("logic.game.shilong.JiesuanLayer").new()
            jiesuan:addTo(self)
    end)
    local delay = cc.DelayTime:create(1)
    self.zhanshi:runAction(cc.Sequence:create(run1, delay,run2))
end

function SurvivalScene:onYou(v)
    print("youyou")
    local run1 = cc.CallFunc:create(function()
        global.utils.sound.playSound(SoundPath .. music[2], false)
        v:stopAllActions()
        self.zhanshi:stopActionByTag(999)
        self.zhanshi:runAction(cc.ScaleTo:create(0.2,0.5))
        self.zhanshi:runAction(cc.RotateBy:create(1,720))
        self.zhanshi:runAction(cc.JumpBy:create(1, cc.p(  display.width , display.cy / 4) , display.cx / 4, 1))
    end)
    local run2 = cc.CallFunc:create(function()
            local jiesuan = require("logic.game.shilong.JiesuanLayer").new()
            jiesuan:addTo(self)
    end)
    local delay = cc.DelayTime:create(1)
    self.zhanshi:runAction(cc.Sequence:create(run1, delay,run2))
end

function SurvivalScene:onBoss(dt)   
    if self.b_pan then
        local point_Ztop = {x = self.zs_sx , y = self.zs_sy + self.zsSize.height / 2} -- 战士上顶点
        local Boss_Size = self.boss:getBoundingBox()
        if (cc.rectContainsPoint(Boss_Size,point_Ztop)) then
            global.utils.sound.playSound(SoundPath .. music[1], false)
            self.b_pan = false
            print("打Boss")
            self.B_xue = self.B_xue - 1
            self.zhanshi:stopActionByTag(999)
            local action = cc.Sequence:create({ cc.MoveTo:create(0.2,cc.p(self.zs_X , self.zs_Y )), cc.CallFunc:create(function()
                self.tiao = true
                self.b_pan = true
            end) } )
            action:setTag(999)
            self.zhanshi:runAction(action)
            if self.B_xue == 0 then
                self.a = 0
                self.kill = self.kill + 1
                cc.UserDefault:getInstance():getIntegerForKey("shilong.kill",self.kill)
                self.boss:setVisible(false)
            end
        end
    end
end


function SurvivalScene:onFen()
    self.fen = self.fen + 1
    self.a = self.a + 1
    if self.a == 5 then
        self.b_pan = true
        local i = math.random(1,5)
        self.boss:loadTexture("game/shilong/boss/boss"..i ..".png",0)
        self.boss:setVisible(true)
    end
    if self.a < 5 then
        self.boss:setVisible(false)
    end
    self.fenshu:setString(self.fen)
    cc.UserDefault:getInstance():setIntegerForKey("shilong.fen",self.fen)
end
function SurvivalScene:onTime()
    global.countDown.createTimer("time", self.time )
    local node = cc.Node:create()
    node:addTo(self)
    global.countDown.bindTimer(node, "time", function(v)  
        self.shijian = v
        self.Time:setString(self.shijian)
        if self.time < 120 and self.time % 20 == 0 then
            self.LB = self.LB + 1
            self.longbi:setString( "x " .. self.LB)
            cc.UserDefault:getInstance():setIntegerForKey("shilong.LB", self.LB)
        end
    end)
end

function SurvivalScene:onBtnBackClick()
    require("logic.game.shilong.MainScene").new():showWithScene()
end
return SurvivalScene