local Pause = class("Pause", cc.load("mvc").ModuleBase)
Pause.RESOURCE_FILENAME = "game/GuardCastle/Pause.csb"
Pause.behavior ={
    "logic.common.behavior.FontColorChange",
}
-- Pause.changecolorfont = {
--     text = {},
--     btnRestart ={},
--     btnHome = {},
--     btnRestart = {},
--     btnContinue = {}
-- }

local cfg = require("logic.game.GuardCastle.cfg.cfg")
function Pause:onCreate(callback)
   self.callback___ = callback
   print("self.callback",self.callback)
end

function Pause:onbtnHomeClick()
    AudioEngine.playEffect(cfg.Sound.click,false)
    global.viewJump.gotofishJump()
end

function Pause:onbtnContinueClick()
    AudioEngine.playEffect(cfg.Sound.click,false)
    self.callback___()
    self:removeFromParent(true)
    
end

function Pause:onbtnRestartClick()
    -- local _aSaveInfo = global.saveTools.getData(cfg.GuardCastle_SAVE)
    -- AudioEngine.playEffect(cfg.Sound.click,false)
    local Game = require("logic.game.GuardCastle.Game")
    Game.new():showWithScene()
end

return  Pause

