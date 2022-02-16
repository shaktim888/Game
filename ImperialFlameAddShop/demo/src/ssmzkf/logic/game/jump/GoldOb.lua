local GoldOb = class("GoldOb")

function GoldOb:ctor(parent)
    self.isActive = false
    self.sprite = cc.Sprite:create("game/jump/image/gold_icon.png")
    self.sprite:setPositionY(-360)
    self.sprite:setPositionX(360)
    parent.mView['ob_panel']:addChild(self.sprite)
end

function GoldOb:setPositionY()
    self.isActive = true
    local posY = math.random(300,1000) 
    self.sprite:setPositionY(posY)
end

function GoldOb:reset()
    self.sprite:setPositionY(-360)
    self.isActive = false
end

function GoldOb:getIsActive()
    return self.isActive
end

function GoldOb:getSprite()
    return self.sprite
end

return GoldOb
