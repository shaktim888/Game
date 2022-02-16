local PeachA = class("PeachA", cc.load("mvc").ModuleBase)

local size     = cc.Director:getInstance():getVisibleSize()

local WAIT_MAX_TIME     = 5                          --下落的最大等待时间
local WIDTH_MOVE_SPEED  = size.width/WAIT_MAX_TIME   --横向移动的速度
local HEIGHT_MOVE_SPEED = 50
local UPDATE_TIME       = 0.2
math.randomseed(os.time())
local PIC_PATH = string.format("game/PKGS/images/color_%d.png",math.random(0,3))
local SPEED_SCALE ={}
SPEED_SCALE.X_SCALE = 0.2
SPEED_SCALE.Y_SCALE = 0.2
SPEED_SCALE.ROTATE_SCALE = 5

function PeachA:new(o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    return o
end

function PeachA:createPeachA()
    self.sprite = cc.Sprite:create(PIC_PATH)
    :setName("PeachA")
    :addTo(self.layer)
    self.layer:setAccelerometerEnabled(true)

    local function accelerometerListener(event,x,y,z,timestamp)
        -- 获取当前目标
        local target  = event:getCurrentTarget()
        -- 获取目标的位置
        local ptNowX,ptNowY = target:getPosition()
        
        --旋转
        self.sprite:setRotation(self.sprite:getRotation()+SPEED_SCALE.ROTATE_SCALE)

        -- X坐标合理化
        local targetX = y * WIDTH_MOVE_SPEED * SPEED_SCALE.X_SCALE + ptNowX
        targetX = (targetX < size.width - self.widthBound) and targetX or size.width - self.widthBound
        targetX = (targetX > self.widthBound) and targetX or self.widthBound
        -- Y坐标合理化
        local targetY = -SPEED_SCALE.X_SCALE * HEIGHT_MOVE_SPEED + ptNowY
        targetY = (targetY > 0) and targetY or 0
        if(self:isGetScore())then
            self:addScore(5)
            AudioEngine.playEffect(_Sound.pass,false)
            return
        end
        if (targetY == 0) then
            self:onMiss()
            AudioEngine.playEffect(_Sound.fail,false)
            return
        end
        self:setPosition(targetX,targetY)
        -- target:runAction(cc.MoveTo:create(timestamp,cc.p(targetX,targetY)))

    end
    -- 创建一个重力加速计事件监听器
    local listerner  = cc.EventListenerAcceleration:create(accelerometerListener)
    -- 获取事件派发器然后设置触摸绑定到精灵，优先级为默认的0  
    self.layer:getEventDispatcher():addEventListenerWithSceneGraphPriority(listerner,self.sprite)
    self:setControlable(true)
end

function PeachA:setPosition(posX,posY)
    self.sprite:setPosition(posX,posY)
end

function PeachA:setAnim(anim)
    self.sprite:runAction(anim)
end

function PeachA:getPos()
    return self.layer:convertToNodeSpace(cc.p(self.sprite:getPosition()))
end

function PeachA:spawn()
    self.sprite:setRotation(0)
    self:setVisible(true)
    self.sprite:stopAllActions()
    self:setPosition(size.width/2 ,self.heightBound)
    -- self:setPosition(size.width/2 ,50)
    local randomPoint = cc.p(math.random(self.widthBound,size.width-self.widthBound),self.heightBound)
    -- local randomPoint = cc.p(math.random(self.widthBound,size.width-self.widthBound),50)
    local time        = math.abs( randomPoint.x - size.width/2 )/WIDTH_MOVE_SPEED
    
    local getControl = CCCallFuncN:create(function ()
        self:setControlable(true)
        -- self.sprite:runAction(cc.RepeatForever:create(cc.RotateBy:create(3,180)))
        --self.sprite:runAction(cc.RotateBy:create(3,180))
    end)

    self.sprite:runAction(cc.Sequence:create(cc.MoveTo:create(time,randomPoint),getControl) )
    -- self:TestRun(self.sprite,function()
    --     self:addScore(5)
    -- end,1)
end

function PeachA:onMiss()
    self:addScore(0)
    self.gameScene:setHp(self.gameScene:getHp()-1)
end

function PeachA:isGetScore()
    local point = self:getPos()      --获取鼠标坐标
    local rect = self.checkCard:getBoundingBox()    --  获取精灵的范围   
    if (cc.rectContainsPoint(rect,point)) then   --判断鼠标是否在精灵范围内，是触发
        return true;
    end
    return false
end

function PeachA:addScore(val)
    self.sprite:stopAllActions()
    self:setControlable(false)
    self.gameScene:gotoScoreField(val)
end

function PeachA:TestRun(obj,action,time)
    local timeDecline = CCCallFuncN:create(action)
    local delay = cc.DelayTime:create(time)
    obj:runAction(cc.Sequence:create(delay, timeDecline))
end

function PeachA:setVisible(active)
    self.sprite:setVisible(active)
end

function PeachA:setControlable(able)
    self.layer:setAccelerometerEnabled(able)
end

return PeachA
