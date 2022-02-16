local levelFinish = class("levelFinish", cc.load("mvc").ModuleBase)
local enable = true

levelFinish.RESOURCE_FILENAME = "game/cattleRun/level.lua"

local FOOD_PATH = "game/cattleRun/image/food/%s"
local IMG_PATH = "game/cattleRun/image/%s"
local LEVEL_PATH = "game/cattleRun/image/level_%s.png"

levelFinish.behavior = {
    "logic.common.behavior.BlackHover",
}

function levelFinish:onCreate(type_, food_conf_, callback_, level_)
    dump(level_)
    self.mView["duigou"]:setVisible(type_ == 1)
    self.mView["wrong"]:setVisible(type_ == 2)

    if level_ and type(level_) == "number" then
        self.mView["levelpnl"]:setBackGroundImage(string.format( LEVEL_PATH, level_))
    end

    local isStart = (food_conf_ ==  nil)
    local content_pnl = self.mView["content"]
    content_pnl:setVisible(not isStart)
    if not isStart then
        content_pnl:removeAllChildren()
        content_pnl.food_y = nil
        for k, v in pairs(food_conf_.material_l) do
            local item = ccui.ImageView:create(string.format(FOOD_PATH, v.img), ccui.TextureResType.localType)
            content_pnl.food_y = content_pnl.food_y or 50
            content_pnl:addChild(item)
            content_pnl.food_y = content_pnl.food_y + v.food_y
            item:setPosition(cc.p(content_pnl:getContentSize().width/2, content_pnl.food_y))
        end
    end

    global.async.delay(2):Then(function() 
        self:setVisible(false)
        if callback_ then
            -- do return end
            callback_()
        end
    end)
end

function levelFinish:nextLevel()
    
end

return levelFinish