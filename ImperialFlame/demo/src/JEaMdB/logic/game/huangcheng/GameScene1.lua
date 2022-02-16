local GameScene = class ("GameScene",function()
    return display.newScene("GameScene",{physics = 2})
end)

GameScene.RESOURCE_FILENAME = "game/huangcheng/GameScene.lua"


GameScene.behavior ={
    "logic.common.behavior.BtnBinder",
    "logic.common.behavior.TouchInterrupt",
    "logic.common.behavior.Listener",
}
local Path = {
    qiu = "game/huangcheng/image/qiu/",
    fangkuai = "game/huangcheng/image/fangkuai/",
    zhuan = "game/huangcheng/image/zhuan/",
}

local coor_x = {40,120,200,280,360,440,520,600,680,760,840,920,1000,1080,1160,1240}
local coor_y = {580,500,420}
local sudo   = 1000              --方块移动的速度

function GameScene:ctor()
    self:getPhysicsWorld():setGravity(cc.p(0,-100))    --重力
    self:getPhysicsWorld():setDebugDrawMask(cc.PhysicsWorld.DEBUGDRAW_ALL)
    math.randomseed(os.time())
    
    self:onUpdate(handler(self,self.update)) 
    self:onSprite()
   
    --监听碰撞
    -- local kuai = self.panel:getChildren()
    -- for i ,v in kuai do
    --     local function onContactBegin(contact)
    --         local tag = contact:getShapeA():getBody():getNode():getTag()
    --         v:removeFromParent()
    --         v = nil
    --         return true
    --     end
    --     local contactListener = cc.EventListenerPhysicsContact:create()
    --     contactListener:registerScriptHandler(onContactBegin,cc.Handler.EVENT_PHYSICS_CONTACT_BEGIN)
    --     local eventDispatcher = cc.Director:getInstance():getEventDispatcher()
    --     eventDispatcher:addEventListenerWithFixedPriority(contactListener,1)
    -- end




    local function onTouchBegan( touch, event )
        self.location = touch:getLocation()   --获取鼠标的位置
        self.touch = true
        return true  
    end
    local function onTouchEnded( touch, event )
        self.touch = false
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

function GameScene:update(dt)
    if self.touch then
        self:onYidong(dt)
    end
    self:onYuejie(dt)
end

function GameScene:onYidong(dt)
    self.zhuan_x ,self.zhuan_y = self.zhuan:getPosition()
    local event_x = self.location["x"] or 0
    if event_x < display.cx then
            self.zhuan_x = self.zhuan_x - sudo * dt
            self.zhuan:setPosition(self.zhuan_x , self.zhuan_y)
        end
    if event_x > display.cx then
        self.zhuan_x = self.zhuan_x + sudo * dt
        self.zhuan:setPosition(self.zhuan_x , self.zhuan_y)
    end
    
end
function GameScene:onSprite()
    --创建容器
    self.panel  = ccui.Layout:create() 
    self.panel:setPosition(0.0000, 0.0000)
    self.panel:setSize({width = 1280.0000, height = 720.0000})
    self.panel:addTo(self)
    --创建方块
    for i = 1 , #coor_x do
        for j = 1 , #coor_y do 
        local fangkuai = math.random(1,5)
        self.fang = cc.Sprite:create(Path.fangkuai .. fangkuai ..".png")
        self.fang:setPosition(coor_x[i],coor_y[j])
        self.fang:addTo(self.panel)
        local fangBody = cc.PhysicsBody:createBox(self.fang:getContentSize(),cc.PHYSICSBODY_MATERIAL_KUAI,cc.p(0,0))
        self.fang:setPhysicsBody(fangBody)
        fangBody:setGravityEnable(false)
        fangBody:setCategoryBitmask(0x00000001)
        fangBody:setContactTestBitmask(0x00000001)
        fangBody:setCollisionBitmask(0x00000010)
        fangBody:setTag(-1)
        end
    end
    --创建下面的方块
    local zhuan = math.random(1,6)
    self.zhuan  = cc.Sprite:create(Path.zhuan .. zhuan .. ".png")
    local zhuanB = self.zhuan:getBoundingBox()
    self.zhuan:setPosition(display.cx,zhuanB.height/2)
    self.zhuan:addTo(self)
    local zhuanBody = cc.PhysicsBody:createBox(self.zhuan:getContentSize(),cc.PHYSICSBODY_MATERIAL_FANG,cc.p(0,0))
    self.zhuan:setPhysicsBody(zhuanBody)

    --创建球
    local qiu = math.random(1,6)
    self.qiu = cc.Sprite:create(Path.qiu .. qiu .. ".png")
    local qiuB = self.qiu:getBoundingBox()
    self.qiu:setPosition(display.cx,zhuanB.height + qiuB.height/2)
    self.qiu:addTo(self)
    local qiuBody = cc.PhysicsBody:createCircle(25,cc.PHYSICSBODY_MATERIAL_QIU,cc.p(0,0))      --圆形刚体   
    self.qiu:setPhysicsBody(qiuBody)
    qiuBody:applyImpulse(cc.p(0,10000))
    qiuBody:setContactTestBitmask(0x00000010)
    qiuBody:setCollisionBitmask(0x00000011)
    qiuBody:setTag(1)
   
    --创建物理边界
    local size = display.size
    local body = cc.PhysicsBody:createEdgeBox(size,cc.PHYSICSBODY_MATERIAL_DEFAULT,5)
    local edgeNode = display.newNode()
    edgeNode:setPosition(size.width/2,size.height/2)
    edgeNode:setPhysicsBody(body)
    edgeNode:addTo(self)
end

function GameScene:onYuejie(dt)
    local zhuan_x = self.zhuan:getPositionX()
    local zhuanB  = self.zhuan:getBoundingBox()
    if zhuan_x > display.right - zhuanB.width/2 or zhuan_x < zhuanB.width/2 then
        self.touch = false
    end
end
function GameScene:showWithScene(transition, time, more)
    self:setVisible(true)
    local scene = self
    display.runScene(scene, transition, time, more)
    return self
end

return GameScene
