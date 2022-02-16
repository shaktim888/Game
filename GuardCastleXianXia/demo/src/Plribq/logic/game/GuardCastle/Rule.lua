local Pause = class("Pause", cc.load("mvc").ModuleBase)
Pause.RESOURCE_FILENAME = "game/GuardCastle/Rule.csb"
Pause.behavior ={
    "logic.common.behavior.FontColorChange",
}
local cfg = require("logic.game.GuardCastle.cfg.cfg")

function Pause:onshadeClick()
    AudioEngine.playEffect(cfg.Sound.click,false)
    self:removeFromParent(true)
end


return  Pause

