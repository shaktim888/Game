local gameScene = class("gameScene", cc.load("mvc").ModuleBase)
gameScene.RESOURCE_FILENAME = "game/Basketball/GameScene.lua"
local viewJump = require("logic.common.views.viewJump")
local winLayer = require("logic.game.Basketball.winLayer")
local ballClass = require("logic.game.Basketball.ball")
local newBall = ballClass.new()
local Shuffle = cc.load("tools").Shuffle
local socket = require "socket"

gameScene.behavior = {
    "logic.common.behavior.BtnBinder",
    "logic.common.behavior.TouchInterrupt",
    "logic.common.behavior.Listener",
}

--按钮事件监听
gameScene.btnBind = {
    cloneBtn = "cloneClick"
}
local IS_OVER = false
local SPEED = 0                               -- 刚体运动速度，以毫秒为单位
local TOUCHSTARTLOCATION = {}                   -- 开始点击时的位置
local TOUCHMOVELOCATION = {}                    -- 移动点击时的位置
local TOUCHENDLOCATION = {}                     -- 结束点击时的位置
local YSCORINGSMAXPEED = 1100                   -- 射门时的最大Y速度
local MAXPEED = 1500                            -- 最大Y速度
local LIFT = true                               -- 速度是否上升
local TAUCH = false                             -- 当前Y速度
local LEFTORRIGHT = 0                           -- 往左射门还是右射门
local BOUNCESPEED = 100                         -- 碰到人或者柱子时给一个反弹速度
local COLLISIONPILLAR = false                   -- 是否碰到柱子
local SCORING = false                           -- 是否进球
local SHOOT = false                             -- 是否开始射门动作
local FOOTBALLBOX = {left = 410, right = 870}   -- 门框的左右坐标
local SCALE = 0.1                               -- 足球的Y坐标每上升100的单位球缩小的率
local SCORINGMINAngLe = 60                      -- 可以射进球网的最小角度
local SCORINGMAXAngLe = 125                     -- 可以射进球网的最大角度
local FALL = false                              -- 足球是否进入下坠状态
local SCORE = 0                                 -- 分数
local FREQUENCY = 3                             -- 血量
local SPEEDING = false                          -- 是否超速

--创建物理世界 transition：过渡，time：时间，more：更多，param：参数（physics：要不要开启物理世界）
function gameScene:showWithScene1(transition, time, more, param)
    
    self:setVisible(true)
    -- 创建一个场景
    local scene = display.newScene(self:getName(), param)
    -- 将当前层添加到场景中
    scene:addChild(self)
    -- 加载场景
    display.runScene(scene, transition, time, more)
    -- 判断要不要开启物理世界
    if param.physics then 
        -- 这里加上一个向下的力
        local gravity = cc.vertex2F(0, -500)
        -- 设置重力
        scene:getPhysicsWorld():setGravity(gravity)
        -- 这里是为了测试中绘制全部边框，正式版去掉
        -- scene:getPhysicsWorld():setDebugDrawMask(cc.PhysicsWorld.DEBUGDRAW_ALL)
        scene:getPhysicsWorld():setAutoStep(false)
    end
    return self
end

--创建界面
function gameScene:onCreate(score)
    --播放背景音乐
    audio.playMusic("game/Basketball/sound/bgm.mp3",true)
    self.ball = nil                                                 -- 足球
    self.ballNode = nil
    SHOOT = false
    SCORING = false
    IS_OVER = false                                          -- 足球刚体
    FREQUENCY = 3
    SPEED = 0
    LIFT = true
    -- 物理世界大小
    local size = cc.Director:getInstance():getVisibleSize()
    -- 创建一个物理世界的属性，物理世界大小，第二个参数分别是刚体的属性（密度，碰撞系数，摩擦力）, 物理世界边框的厚度
    local body = cc.PhysicsBody:createEdgeBox(size, cc.PhysicsMaterial(1, 0.5, 2), 0)
    -- 创建一个新节点
    local edgeNode = display.newNode()
    -- 设置节点坐标
    edgeNode:setPosition(size.width/2, size.height/2)
    -- 将物理世界添加到节点上
    edgeNode:setPhysicsBody(body)
    -- 将节点添加到场景中
    -- self:addChild(edgeNode)

    -- 设置门框上的刚体
    self.aboveDoorframe = cc.Sprite:create()
    -- 设置刚体属性，刚体大小，第二个参数分别是刚体的属性（密度，碰撞系数，摩擦力）, 刚体重心
    local doorframeNode = cc.PhysicsBody:createBox({width = 600, height = 10}, cc.PhysicsMaterial(1, 0.1, 30), cc.p(0,0))
    -- 设置碰撞掩码
    doorframeNode:setContactTestBitmask(0xFFFFFFFF)
    -- 设置是否不受重力影响
    doorframeNode:setGravityEnable(false)
    -- 设置是否为静态刚体（不受力的影响）
    doorframeNode:setDynamic(false)
    -- 设置刚体隐藏失效
    -- doorframeNode:setEnabled(false)
    -- 将刚体添加到节点上
    self.aboveDoorframe:setPhysicsBody(doorframeNode)
    self.aboveDoorframe:setPosition(cc.p(display.width / 2 + 3, 485))
    self.aboveDoorframe:setVisible(true)
    -- self.aboveDoorframe:ignoreContentAdaptWithSize(false)
    self.aboveDoorframe:setName("doorframe")
    self.aboveDoorframe:setTag(1000)
    self:addChild(self.aboveDoorframe)

    -- 设置门框左的刚体
    self.leftDoorframe = cc.Sprite:create()
    local doorframeNode1 = cc.PhysicsBody:createBox({width = 10, height = 230}, cc.PhysicsMaterial(1, 0.1, 50), cc.p(0,0))
    doorframeNode1:setContactTestBitmask(0xFFFFFFFF)
    doorframeNode1:setGravityEnable(false)
    doorframeNode1:setDynamic(false)
    self.leftDoorframe:setPhysicsBody(doorframeNode1)
    self.leftDoorframe:setPosition(cc.p(346, 370))
    self.leftDoorframe:setTag(888)
    self:addChild(self.leftDoorframe)

    -- 设置门框右的刚体
    self.rightDoorframe = cc.Sprite:create()
    local doorframeNode2 = cc.PhysicsBody:createBox({width = 10, height = 230}, cc.PhysicsMaterial(1, 0.1, 50), cc.p(0,0))
    doorframeNode2:setContactTestBitmask(0xFFFFFFFF)
    doorframeNode2:setGravityEnable(false)
    doorframeNode2:setDynamic(false)
    self.rightDoorframe:setPhysicsBody(doorframeNode2)
    self.rightDoorframe:setPosition(cc.p(940, 370))
    self.rightDoorframe:setTag(888)
    self:addChild(self.rightDoorframe)
    
    -- 设置门框下的刚体
    self.belowDoorframe = cc.Sprite:create()
    local doorframeNode3 = cc.PhysicsBody:createBox({width = 12800, height = 10}, cc.PhysicsMaterial(1, 0.8, 1000), cc.p(0,0))
    doorframeNode3:setContactTestBitmask(0xFFFFFFFF)
    doorframeNode3:setGravityEnable(false)
    doorframeNode3:setDynamic(false)
    doorframeNode3:setEnabled(false)
    self.belowDoorframe:setPhysicsBody(doorframeNode3)
    self.rightDoorframe:setTag(1111)
    -- self.doorframe3:setAnchorPoint(0.5, 0)
    self.belowDoorframe:setPosition(cc.p(display.cx, 250))
    self:addChild(self.belowDoorframe)
    self.belowDoorframe:setVisible(false)

    -- 设置人物刚体
    -- self.mView["people"] = cc.Sprite:create()
    -- local doorframeNode4 = cc.PhysicsBody:createBox({width = self.mView["people"]:getContentSize().width, height = 10}, cc.PhysicsMaterial(1, 0.1, 30), cc.p(0,0))
    -- doorframeNode4:setContactTestBitmask(0xFFFFFFFF)
    -- doorframeNode4:setGravityEnable(false)
    -- doorframeNode4:setDynamic(false)
    -- -- 设置刚体隐藏失效
    -- -- doorframeNode:setEnabled(false)
    -- -- 将刚体添加到节点上
    -- self.mView["people"]:setPhysicsBody(doorframeNode4)
    -- self.mView["people"]:setTag(777)

    self:peopleMove()
    

    -- 设置刚体碰撞监听
    local function onContactBegin(contact)
        print("slfjsl")
        local tag = contact:getShapeA():getBody():getNode():getTag()
        local tag1 = contact:getShapeB():getBody():getNode():getTag()
        if tag == 999 and tag1 == 888 then
            COLLISIONPILLAR = true
        elseif tag == 999 and tag1 == 777 then
            SCORING = false
        end
        return true
    end

    local contactListener = cc.EventListenerPhysicsContact:create()
    contactListener:registerScriptHandler(onContactBegin, cc.Handler.EVENT_PHYSICS_CONTACT_BEGIN)
    local eventDispatcher = cc.Director:getInstance():getEventDispatcher()
    eventDispatcher:addEventListenerWithFixedPriority(contactListener,1)

    self.mView["strengthLoadingBar"]:setPercent(0)
    self:registeredClickEvent()
     -- --是不是截图运行
    if global.isGrabScreenMode == 1 then
        -- self.mView["scoreLabel"]:setString("分数："..math.random(1,100))
        -- -- TOUCHENDLOCATION = cc.p(math.random(100,500),math.random(300,500))
        -- -- TOUCHSTARTLOCATION = cc.p(math.random(100,500),math.random(100,200))
        -- -- self:addChildBall()
        -- -- SHOOT = true
        -- self.mView["ball1"]:setVisible(false)
        -- self.mView["ball2"]:setVisible(false)
        -- self.mView["ball3"]:setVisible(false)
        -- self:gameOver()
    end
    -- -- 开启update
    self:onUpdate(handler(self,self.update))
end

function gameScene:jietu()
    self.mView["scoreLabel"]:setString("分数："..math.random(1,100))
    -- TOUCHENDLOCATION = cc.p(math.random(100,500),math.random(300,500))
    -- TOUCHSTARTLOCATION = cc.p(math.random(100,500),math.random(100,200))
    -- self:addChildBall()
    -- SHOOT = true
    self.mView["ball1"]:setVisible(false)
    self.mView["ball2"]:setVisible(false)
    self.mView["ball3"]:setVisible(false)
    local winUI = winLayer.create()
    self:addChild(winUI,999)
    local size = winUI:getContentSize()
    winUI:setPosition(display.cx-size.width/2, display.cy-size.height/2)
end

--注册点击事件
function gameScene:registeredClickEvent()
    -- 触摸开始
    local function onTouchBegan(touch, event)
        -- 当前不是射门状态
        if not SHOOT then
            -- 获取点击位置
            local location = touch:getLocation()
            TOUCHSTARTLOCATION = touch:getLocation()
            TAUCH = true
        end
        return true
    end

    -- 触摸移动
    local function onTouchMoved(touch, event)
        if not SHOOT then
            -- 获取点击位置
            local location = touch:getLocation()
            TOUCHMOVELOCATION = touch:getLocation()
            if TOUCHMOVELOCATION.y > TOUCHSTARTLOCATION.y then
                self.mView["shootDirection"]:setRotation(0)
                self.mView["strengthLoadingBar"]:setPercent(0)
                return 
            end
            --[[ local ySpeed = ( TOUCHSTARTLOCATION.y - TOUCHMOVELOCATION.y ) / 50 * SPEED
            print("当前速度："..ySpeed)
            ySpeed = ySpeed / 1000 * 70
            if ySpeed > 100 then
                ySpeed = 100
            end
            print("当前速率："..ySpeed)
            self.mView["strengthLoadingBar"]:setPercent(ySpeed) ]]
            local y = TOUCHSTARTLOCATION.y - TOUCHMOVELOCATION.y
            local x = TOUCHSTARTLOCATION.x - TOUCHMOVELOCATION.x
            local angle = math.atan2( x, y ) * 180 / math.pi
            self.mView["shootDirection"]:setRotation(angle)
        end
        return true
    end

    -- 触摸结束
    local function onTouchEnded(touch, event)
        -- 当前不是射门状态
        if not SHOOT then
            -- 获取结束位置
            local location = touch:getLocation()
            TOUCHENDLOCATION = touch:getLocation()
            TAUCH = false
            self:addChildBall()
        end
        return true
    end

    local listener = cc.EventListenerTouchOneByOne:create()
    -- 注册两个回调监听方法
    listener:registerScriptHandler( onTouchBegan, cc.Handler.EVENT_TOUCH_BEGAN )
    listener:registerScriptHandler( onTouchMoved, cc.Handler.EVENT_TOUCH_MOVED )
    listener:registerScriptHandler( onTouchEnded, cc.Handler.EVENT_TOUCH_ENDED )
    -- 事件派发器
    local eventDispatcher = self:getEventDispatcher()
    -- 绑定触摸事件到层当中
    eventDispatcher:addEventListenerWithSceneGraphPriority(listener, self)
end

function gameScene:update(dt)
    for i = 1, 3 do
        cc.Director:getInstance():getRunningScene():getPhysicsWorld():step(1 / 180.0);
    end
    if TAUCH then
        if SPEED >= MAXPEED then
            LIFT = false
        elseif SPEED < 0 then
            LIFT = true
        end
        print(LIFT)
        if LIFT then
            SPEED = SPEED + 30
        else
            SPEED = SPEED - 30
        end
        local percent = SPEED / MAXPEED * 100
        if percent > 100 then
            percent = 100
        elseif percent < 0 then
            percent = 0
        end
        self.mView["strengthLoadingBar"]:setPercent(percent)
    end
    if SHOOT and not SCORING and not IS_OVER then
        self:judgeShoot()
    end
end

-- 刚体碰撞检测
function gameScene:onContactBegin(contact)
    local tag = contact:getShapeA():getBody():getNode():getTag()
    local tag1 = contact:getShapeB():getBody():getNode():getTag()
    if tag == 999 and tag1 == 888 then
        COLLISIONPILLAR = true
    elseif tag == 999 and tag1 == 777 then
        SCORING = false
    end
end

-- 添加足球
function gameScene:addChildBall()
    -- 判断是往左射门还是右射门
    if TOUCHENDLOCATION.x > TOUCHSTARTLOCATION.x then
        LEFTORRIGHT = -1
    else
        LEFTORRIGHT = 1
    end
    local ySpeed = SPEED
    local xSpeed = ( TOUCHSTARTLOCATION.x - TOUCHENDLOCATION.x ) / 50 * 500
    -- 添加足球刚体
    self.ball = newBall:createBall()
    self.ballNode = self.ball:getPhysicsBody()
    self:addChild(self.ball)
    self.mView["ballImage"]:setVisible(false)
    self.mView["shootDirection"]:setVisible(false)
    self.ballNode:setVelocity(cc.p(xSpeed, ySpeed))
    print("当前速度："..ySpeed)
    if ySpeed < YSCORINGSMAXPEED then
        SPEEDING = false
    else
        SPEEDING = true
    end
    print("是否超速：")
    print(SPEEDING)
    self.aboveDoorframe:getPhysicsBody():setEnabled( not SPEEDING )
    -- 判断当前速度会不会把球踢出球网
    local angle = math.atan2( self.ballNode:getVelocity().y, self.ballNode:getVelocity().x ) * 180 / math.pi
    if angle > SCORINGMAXAngLe or angle < SCORINGMINAngLe then
        SCORING = false
    end
    SHOOT = true
    -- 设置刚体冲量
    -- self.ballNode:applyImpulse(cc.p(2000000,20000000));
end

-- 判断射门
function gameScene:judgeShoot()
    -- 球出游戏屏幕边界
    if not cc.rectEqualToRect( cc.rect( 0, 0, display.width, display.height ), self.ball:getBoundingBox() ) then
        print("球出边界了")
        self:initialization(1)
        if FREQUENCY > 0 then
            self.mView["ball"..FREQUENCY]:setVisible(false)
        end
        FREQUENCY = FREQUENCY - 1
        if FREQUENCY <= 0 then
            self:gameOver()
        end
        return
    end
    -- 球是不是被守门员接住了
    if cc.rectIntersectsRect( self.mView["people"]:getBoundingBox(), self.ball:getBoundingBox() ) then
        print("守门员接住了球")
        self.mView["people"]:loadTexture("game/Basketball/image/people/people1.png", 0)
        self:initialization(2)
        if FREQUENCY > 0 then
            self.mView["ball"..FREQUENCY]:setVisible(false)
        end
        FREQUENCY = FREQUENCY - 1
        if FREQUENCY <= 0 then
            self:gameOver()
            return
        end
        return
    end
    -- 球是不是进球网了
    if self.mView["footballBox"] and self.ball and cc.rectEqualToRect( self.mView["footballBox"]:getBoundingBox(), self.ball:getBoundingBox() ) and not SPEEDING then
        SCORING = true
        print("球进了")
        self.belowDoorframe:setVisible(true)
        self.belowDoorframe:getPhysicsBody():setEnabled(true)
        self.belowDoorframe:setPosition(cc.p(display.cx, 250))
        self:initialization(2)
        SCORE = SCORE + 1
        self.mView["scoreLabel"]:setString("分数："..SCORE)
        return
    end
    -- 球在上升的情况下慢慢变小
    if self.ball:getPhysicsBody():getVelocity().y > 0 and not FALL then
        self.ball:setScale(1 - (self.ball:getPositionY() - self.ball:getContentSize().height / 2) / 100 * SCALE)
    end
    --  球落在了地上
    if self.ball:getPhysicsBody():getVelocity().y == 0 then
        FREQUENCY = FREQUENCY - 1
        if FREQUENCY > 0 then
            self.mView["ball"..FREQUENCY]:setVisible(false)
        end
        if FREQUENCY <= 0 then
            self:gameOver()
        end
        print("球落在草地上")
    end
    if COLLISIONPILLAR then
        self.aboveDoorframe:getPhysicsBody():setEnabled( true )
    end
    -- 在射门状态，判断球是否下落，并且球网下的刚体还没显示
    if self.ball:getPhysicsBody():getVelocity().y <= 0 and not self.belowDoorframe:isVisible() then
        FALL = true
        -- 是碰到柱子下落
        -- if COLLISIONPILLAR then
        --     self.ball:getPhysicsBody():setVelocity(cc.p( self.ball:getPhysicsBody():getVelocity().x + LEFTORRIGHT * BOUNCESPEED, self.ball:getPhysicsBody():getVelocity().y ))
        -- end
        self.belowDoorframe:setVisible(true)
        self.belowDoorframe:getPhysicsBody():setEnabled(true)
        self.belowDoorframe:setPosition(cc.p(display.cx, 250))
        -- 是否进球
        if SCORING then
            print("进球")
        else
            print("没进球")
            self.belowDoorframe:setPosition(cc.p(display.cx, 190))
        end
    end
end

-- 人物移动控制
function gameScene:peopleMove()
    local action = cc.Sequence:create(
                        cc.MoveBy:create( 0.5, cc.p( FOOTBALLBOX.left - self.mView["people"]:getPositionX(), 0 ) ),
                        CCCallFuncN:create(function()
                            local rightMoveBy = cc.MoveBy:create( 1, cc.p( FOOTBALLBOX.right - FOOTBALLBOX.left, 0) )
                            local leftMoveBy = rightMoveBy:reverse()
                            local action1 =  cc.RepeatForever:create(
                                                cc.Sequence:create(
                                                    rightMoveBy,
                                                    leftMoveBy
                                                )
                                            )
                            self.mView["people"]:runAction(action1)
                        end)
                    )
    self.mView["people"]:runAction(action)
end

-- 初始化 延时时间 球进与否
function gameScene:initialization(time)
    self.mView["people"]:stopAllActions()
    if SCORING then
        local callbackEntry = nil
        local function callback(dt)
            self.ball:stopAllActions()
            self.ballNode:removeFromWorld()
            self.ball:removeFromParent()
            cc.Director:getInstance():getScheduler():unscheduleScriptEntry(callbackEntry)
            self.belowDoorframe:setVisible(false)
            self.belowDoorframe:getPhysicsBody():setEnabled(false)
        end
        callbackEntry = cc.Director:getInstance():getScheduler():scheduleScriptFunc(callback, 2, false)
    else
        if self.ball:getParent() then
            self.ball:stopAllActions()
            self.ballNode:removeFromWorld()
            self.ball:removeFromParent()
        end
        self.belowDoorframe:setVisible(false)
        self.belowDoorframe:getPhysicsBody():setEnabled(false)
    end
    SHOOT = false
    SCORING = false
    LEFTORRIGHT = 0
    COLLISIONPILLAR = false
    FALL = false
    local action =  cc.Sequence:create( cc.DelayTime:create(time),
                                        CCCallFuncN:create(function()
                                            self.mView["people"]:setPosition(display.width / 2, self.mView["people"]:getPositionY())
                                            self.mView["people"]:loadTexture("game/Basketball/image/people/people.png", 0)
                                        end),
                                        CCCallFuncN:create(function()
                                            global.async.runInNextFrame(function ()
                                                self:peopleMove()
                                                self.mView["ballImage"]:setVisible(true)
                                                SPEED = 0
                                                LIFT = true
                                                self.mView["shootDirection"]:setRotation(0)
                                                self.mView["shootDirection"]:setVisible(true)
                                                self.mView["strengthLoadingBar"]:setPercent(0)
                                            end)
                                        end)
                                      )
    self.mView["people"]:runAction(action)
end

-- 返回大厅
function gameScene:cloneClick()
    print("你点击了返回按钮");
    AudioEngine.playEffect("game/Basketball/sound/Button.mp3",false)
    require("logic.common.launcher.game"):create():run("game.Basketball.loginScene")
end

-- 游戏结束
function gameScene:gameOver()
    print("进入结算")
    --显示弹窗
    IS_OVER = true
    AudioEngine.playEffect("game/Basketball/sound/win.mp3", false)
    global.saveTools.saveData("scoreNumber", self.allScore)
    local winUI = winLayer.create()
    self:addChild(winUI,999)
    local size = winUI:getContentSize()
    winUI:setPosition(display.cx-size.width/2, display.cy-size.height/2)
    CCDirector.sharedDirector():pause()
end

return gameScene
