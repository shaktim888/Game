local Obstacle = class("Obstacle")

function Obstacle:ctor(parent)
    self.isActive = false
    self.index = math.random(1,2)
    self.sprite = cc.Sprite:create("game/jump/image/obstacle"..self.index..".png")
    self.sprite:setPositionY(-300)
    if self.index == 1 then
        self.sprite:setPositionX(-300)
    else
        self.sprite:setPositionX(1020)
    end
    parent.mView['ob_panel']:addChild(self.sprite)
end

function Obstacle:createAction()
    local posY = math.random(350,950) 
    local time = math.random(4,8)  
    self.sprite:setPositionY(posY)
    self.isActive = true
    local action1 = cc.Sequence:create(cc.MoveBy:create(time,cc.p(1020,0)), cc.CallFunc:create(function ()
        self:stopAction()
    end))

    local action2 = cc.Sequence:create(cc.MoveBy:create(time,cc.p(-1020,0)), cc.CallFunc:create(function ()
        self:stopAction()
    end))
    if self.index == 1 then
        self.sprite:runAction(action1)
    else
        self.sprite:runAction(action2)
    end
end

function Obstacle:stopAction()
    self.isActive = false
    self.sprite:setVisible(false)
    if self.index == 1 then
        self.sprite:setPositionX(-300)
    else
        self.sprite:setPositionX(1020)
    end
    self.sprite:setPositionY(-300)
    self.sprite:stopAllActions()
end

function Obstacle:setVisibleTrue()
    self.sprite:setVisible(true)
end

function Obstacle:getIsActive()
    return self.isActive
end

function Obstacle:getSprite()
    return self.sprite
end

function Obstacle:getBoundingBox()
    local x= self.sprite:getPositionX()
    local y= self.sprite:getPositionY()
    local size = self.sprite:getContentSize()
    local rect = cc.rect(x-size.width*0.8/2,y-size.height*0.8/2,size.width*0.8,size.height*0.8)
    return rect
end

return Obstacle
