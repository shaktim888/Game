local ball = class("ball")

--创建一个足球
function ball:createBall()
    local ballSprite = ccui.ImageView:create()
    ballSprite:loadTexture("game/Basketball/image/ball.png", 0)
    local ballNode = cc.PhysicsBody:createCircle(ballSprite:getContentSize().width / 2, cc.PhysicsMaterial(1, 0.5, 1000), cc.p(0,0))
    -- 设置碰撞
    ballNode:setContactTestBitmask(0xFFFFFFFF)
    -- 是不是受重力影响
    ballNode:setGravityEnable(true)
    ballNode:setDynamic(true)
    ballSprite:setPhysicsBody(ballNode)
    ballSprite:setPosition(cc.p(display.width / 2 , ballSprite:getContentSize().height / 2))
    ballSprite:setName("ball")
    ballSprite:setTag(999)
    return ballSprite
end

return ball