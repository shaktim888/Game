local upmodelGuide = class("upmodelGuide", cc.load("mvc").ModuleBase)
local niuniutiaozhan = import(".niuniutiaozhan")

upmodelGuide.RESOURCE_FILENAME = "game/niuniutiaozhan/upmodel.lua"

-- upmodelGuide.behavior = {
--     "logic.common.behavior.BlackHover",
--     -- "logic.common.behavior.TouchInterrupt",
-- }

function upmodelGuide:onCreate(data_)
   
end

function upmodelGuide:onStartGame(sender_)
    -- niuniutiaozhan.new():showWithScene()
    local view = niuniutiaozhan.new()

    local tag = sender_:getTag()
    dump(tag)
    view:setGameType(tag)
    global.viewMgr.showView(view, true)
end

function upmodelGuide:onBackHome()
    -- global.viewJump.gotoniuniutiaozhan()
end

return upmodelGuide  