local Help = class("Help", cc.load("mvc").ModuleBase)
Help.RESOURCE_FILENAME = "game/LongHuDou/Help.lua"
Help.behavior ={
    "logic.common.behavior.FontColorChange",
}

Help.changecolorfont = {
    text = {}
}
local cfg = require("logic.game.LongHuDou.cfg.cfg")

function Help:onCreate(text,mode)
    
end



function Help:onbtnNoClick()
    AudioEngine.playEffect(cfg.Sound.click,false)
    self:removeFromParent(true)
end


return  Help

