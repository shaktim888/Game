local GameLevelLayer = class("GameLevelLayer", cc.load("mvc").ModuleBase)
GameLevelLayer.RESOURCE_FILENAME = "level/Level_Layer.lua"

function GameLevelLayer:onCreate(_data)
    if _data.isReplay then
        self:gotoGame(1)
    else
        self:gotoGame(tonumber(global.viewData.getLevel()))
    end
end


function GameLevelLayer:gotoGame(num)
    local data = {
        level = num
    }
    if global.isGrabScreenMode == 1 then
        return
    end
    local action = cc.Sequence:create(
        cc.DelayTime:create(1),
        cc.CallFunc:create(function ()
            global.viewController.gotoView("game",data)
        end)
    )
    self:runAction(action)

end

function GameLevelLayer:gotoGameByRandom()
    local data = {
        level = math.random(3,15)
    }
	global.viewController.gotoView("game",data)
end

return GameLevelLayer