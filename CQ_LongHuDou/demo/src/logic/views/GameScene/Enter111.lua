local GameScene = class("GameScene", cc.load("mvc").ModuleBase)
GameScene.RESOURCE_FILENAME = "game/tiger/GameScene.lua"
GameScene.behavior ={
    "logic.common.behavior.BtnBinder",
    "logic.common.behavior.TouchInterrupt",
    "logic.common.behavior.Listener",
}
-- local Jiesuan = require ("logic.game.tiger.JieSuanLayer")
GameScene.btnBind = {
    back = "onBack",
    -- clear = "onClear",
}


function GameScene:onCreate()
    self.defen        = 0                            --游戏得分
    self.i            = 1                            --老虎机产生的基数
    self.k            = 1                            --道具产生的基数
    self.time         = 0.5                          --老虎跳跃所需时间
    self.dianji       = 0                            --点击时长
    self.sudo         = 400                          --老虎机移动的速度    
    self.pan_tiger    = true                         --判断是否产生老虎
    self.pan_daoju    = false                        --判断是否产生道具
    self.jieshu       = false                        --是否结束游戏
    self.isStop       = false                        --停
    self.peng         = false                        --是否得分
    self.p1           = false                        --碰到道具，不碰到老虎机
    self.jump         = false                        --是跳跃
    self.chushi       = 1480
    self.Slot_machine = {}
    self.Slot_height  = {}
    self.idx          = 0
    self.Daoju        = {}
    self.Daoju_height  = {}
    self.idy          = 1
    self.tiger        = self.mView['tiger']          --老虎
    self.fenshu       = self.mView['fenshu']         --分数
    self.Tiger_Panel  = self.mView['Tiger_Panel']    --老虎机容器
    self.Daoju_Panel  = self.mView['Daoju_Panel']    --道具容器
    self.tiger_Size   = self.tiger:getBoundingBox()  --获取老虎的尺寸
    self.tiger:ignoreContentAdaptWithSize(true)
    math.randomseed(os.time())                       --随机数因子
    self:onUpdate(handler(self,self.update))      
    self:onJump()
    cc.UserDefault:getInstance():setIntegerForKey("self.defen",self.defen)

    local addComponentConfig = {
        self,
        self.mView["headPanel"],
        self.fenshu
    }
    local panel_top_btn = require("logic/viewController/componentController").new(addComponentConfig)
end
function GameScene:update(dt)
    self:onJieshu(dt)
    self.dianji = self.dianji + dt
    self:onTiaojian(dt)
    if self.pan_daoju then
        -- if not self.p1 then
        self:onPeng(dt)
        -- end
        self:onPeng1(dt)
    end
end

--老虎机
-- local Slot_machine = {}
-- local Slot_height = {}
-- local idx = 0  
-- --道具
-- local Daoju = {}
-- local Daoju_height = {}
-- local idy = 1
function GameScene:onTiger(dt)   --老虎机、道具的产生
    self.idx = self.idx + 1
    local Zoom = math.random(1,5)
    
    self.Slot_machine[self.idx] = cc.Sprite:create("game/tiger/image/tiger_ji_" .. Zoom ..".png")
    self.Slot_machine[self.idx].chuShiPosX = self.chushi
    local Slot_machine_Size = self.Slot_machine[self.idx]:getBoundingBox()
    self.Slot_height[self.idx] = self.Slot_machine[self.idx]:getBoundingBox().height
    local chushi_x = display.width + Slot_machine_Size.width
    -- chushi_x = chushi_x - 1000 * dt
    local chushiSlot_y = Slot_machine_Size.height/2
    self.Slot_machine[self.idx].posY = chushiSlot_y
    self.Slot_machine[self.idx]:setPosition(chushi_x,chushiSlot_y)
    self.Slot_machine[self.idx]:addTo(self.Tiger_Panel)

    --产生道具
    -- if self.i - 1 == 1 then
    if not self.pan_tiger then
        self.idy = self.idy + 1
        local daoju = math.random(1,10)
        self.Daoju[self.idy] = cc.Sprite:create("game/tiger/daoju/daoju_" .. daoju .. ".png")
        -- local Daoju_Size = self.Daoju[self.idy]:getBoundingBox()
            self.Daoju[self.idy].chuShiPosX = self.chushi
            self.Daoju_height[self.idy] = self.Daoju[self.idy]:getBoundingBox().height
        -- local Daojuchushi_y = Slot_height[self.idy] + Daoju_Size.height/2
        local Daojuchushi_y = self.Slot_machine[self.idy].posY * 2 + self.Daoju_height[self.idy] /2 
            self.Daoju[self.idy].posY = Daojuchushi_y
        self.Daoju[self.idy]:setPosition(chushi_x,Daojuchushi_y)
        self.Daoju[self.idy]:addTo(self.Daoju_Panel)
    end
    
    -- local action = cc.MoveTo:create(self.sudo,cc.p(-self.Slot_machine_Size.width,display.bottom + self.Slot_machine_Size.height/2))
    -- action:setTag(10000)
    -- self.runAction1 = self.Slot_machine:runAction(action)

    if self.pan_tiger then
        self.pan_tiger = false
        self.chushitiger_y = Slot_machine_Size.height + self.tiger_Size.height/2 + 5
        self.tiger:setPosition(chushi_x,self.chushitiger_y)
        -- self.tiger_runAction = self.tiger:runAction(cc.MoveTo:create(self.sudo,cc.p(-self.Slot_machine_Size.width,self.tiger_Size.height/2 + self.Slot_machine_Size.height)))
    end
    -- if not self.pan_tiger then
    --     self:onPeng(dt)
    -- end
end


function GameScene:onTiaojian(dt) 
    
     --产生老虎机的速度
    if not self.jieshu then
        if self.i == 1 then
            self.j = math.random(80,120 )
            self:onTiger(dt)
        end
        if self.i == 2 then
            self.j = math.random(80,120 )
        end
        self.i = self.i + 1
        if  self.i > self.j  then
            self.i = 2
            self:onTiger(dt)
            -- self:onDaoju(dt)
            self.pan_daoju = true
                -- self:onDaojuP(dt)
        end
        if not self.isStop then
            --老虎机移动
            for i = 1, self.idx do 
                if(self.Slot_machine[i]) and self.Slot_machine[i].chuShiPosX then
                    self.Slot_machine[i].chuShiPosX = self.Slot_machine[i].chuShiPosX - self.sudo * dt
                    self.Slot_machine[i]:setPosition(self.Slot_machine[i].chuShiPosX ,self.Slot_machine[i].posY)
                end
            end
            --道具移动
            for j = 1 ,self.idy do
                if(self.Daoju[j]) and self.Daoju[j].chuShiPosX then
                    self.Daoju[j].chuShiPosX = self.Daoju[j].chuShiPosX - self.sudo * dt
                    self.Daoju[j]:setPosition(self.Daoju[j].chuShiPosX , self.Daoju[j].posY )
                end
            end
            --老虎移动
            if  not self.jump then
                self.tiger:setPosition(self.Slot_machine[1].chuShiPosX,self.chushitiger_y)
            end
        end
    end
end

function GameScene:onJump() --老虎机的跳跃
    self.Tiger_Panel:addTouchEventListener(function(sender,eventType)
    if eventType == ccui.TouchEventType.began then
        self.beginTime = self.dianji 
    end
    if eventType == ccui.TouchEventType.ended then
        self.jump = true 
        self.peng = false
        self.overTime = self.dianji 
        local shicha = self.overTime - self.beginTime
        local x , y = self.tiger:getPosition()
        local action = cc.JumpBy:create(self.time ,cc.p(shicha * 400 + 400,-y + self.tiger_Size.height/2),shicha * 200 + 200,1)
        action:setTag(10000)
        self.JumpAction = self.tiger:runAction(action)
        end
    end)
end

function GameScene:onPeng(dt)   --老虎和老虎机发生碰撞， 
    local tiger_x,tiger_y = self.tiger:getPosition()     --获取老虎的坐标
    local tiger = self.tiger:getBoundingBox()            --获取老虎的范围
    local tiger_point = {x = tiger_x + self.tiger_Size.width/2, y = tiger_y - self.tiger_Size.height/2}
    local Slot_machine = self.Tiger_Panel:getChildren()
    for i, v in ipairs(Slot_machine) do
        local Slot_machine_Size = v:getBoundingBox()
        local v_x , v_y = v:getPosition()
        if (cc.rectContainsPoint(Slot_machine_Size,tiger_point)) then
            local laohuji_x = v:getPositionX()
            local laohuji_width = v:getBoundingBox().width
            local laohu_width = self.tiger:getBoundingBox().width
            self.isStop = true            
            self.pan_daoju = false
            self.tiger:stopActionByTag(10000)
            local tiger_x1 , tiger_y1 = self.tiger:getPosition()
            -- self.tiger:setPosition(laohuji_x - laohuji_width / 2 - laohu_width / 2,tiger_y1)
            -- self.tingzhi = self.tiger:runAction(cc.MoveTo:create(self.time * 2,cc.p(laohuji_x - laohuji_width / 2 - laohu_width / 2,self.tiger_Size.height/2)))
            self.tiger:setPosition(tiger_x1,tiger_y1)
            self.tingzhi = self.tiger:runAction(cc.MoveTo:create(self.time * 2,cc.p(tiger_x1,self.tiger_Size.height/2)))
        end
    end
end

local x = 0
local y = 0
function GameScene:onPeng1(dt)
    local tiger_x,tiger_y = self.tiger:getPosition()     --获取老虎的坐标
    local tiger = self.tiger:getBoundingBox()            --获取老虎的范围
    local tiger_point = {x = tiger_x + self.tiger_Size.width/2, y = tiger_y - self.tiger_Size.height/2}
    local tiger_point1 = {x = tiger_x , y = tiger_y - self.tiger_Size.height/2 }
    local tiger_point2 = {x = tiger_x - self.tiger_Size.width/2, y = tiger_y - self.tiger_Size.height/2}
    local daoju = self.Daoju_Panel:getChildren()       --没有碰到道具，道具消失
    for i, v in ipairs(daoju) do
        local v_x , v_y = v:getPosition()
        local Daoju_Size = v:getBoundingBox()
        if (cc.rectContainsPoint(Daoju_Size,tiger_point)) or (cc.rectContainsPoint(Daoju_Size,tiger_point1)) or (cc.rectContainsPoint(Daoju_Size,tiger_point2))then
            self.defen = self.defen + 1
            self.fenshu:setString(self.defen)
            cc.UserDefault:getInstance():setIntegerForKey("self.defen",self.defen)
            -- cc.SimpleAudioEngine:getInstance():playMusic("game/tiger/image/tx.mp3", false)
            self.tiger:stopActionByTag(10000)
            x = v_x
            y = v_y - Daoju_Size.height / 2 + self.tiger_Size.height / 2
            self.daoju_size = v:getBoundingBox()
            v:setVisible(false)
            v:removeFromParent()
            v = nil
            if v == nil then
                self.peng = true
            end
        end
    end

    if self.peng then
        x = x - self.time * dt * 800
        y = y 
        self.tiger:setPosition(x,y + 5)
    end
end

function GameScene:onBack()
    CCDirector.sharedDirector():resume()
    local mainScene = require ("logic.game.tiger.MainScene").new();
    mainScene:showWithScene()
end

function GameScene:onJieshu(dt) --判断老虎是否跳跃出界
    local a , b = self.tiger:getPosition()
    local size  = self.tiger:getBoundingBox()
    if (a < -size.width / 2 ) or (b <= size.height / 2 + 10) or (b > display.height)then
        if not self.jieshu then
            self:onJieSuan()
        end
    end
end

function GameScene:onJieSuan()
    self.jieshu = true
    self.isStop = true            
    self.pan_daoju = false
    local node = display.newNode()
    node:addTo(self)
    performWithDelay(node,function()
        self.tiger:stopAction(self.tingzhi)
        -- local jiesuan = Jiesuan.new()
        -- self:addChild(jiesuan)
        -- jiesuan:setVisible(true)
        print("结算=====================")
        local over = require("logic.views.GameOver.Enter").new()
        self:addChild(over)
        node:removeFromParent()
        node = nil
    end,0.5)
end
return GameScene
