local ruleLayer = class("ruleLayer", cc.load("mvc").ModuleBase)
ruleLayer.RESOURCE_FILENAME = "game/DiamondMemory/hall_rule.lua"
ruleLayer.behavior ={
    "logic.common.behavior.FontColorChange"
}
ruleLayer.changecolorfont = {
    Text_1 = {},
    Text_2 = {}
}


function ruleLayer:onshadeClick()
    AudioEngine.playEffect("game/DiamondMemory/sound/Button.mp3",false)
    self:removeFromParent(true)
end

function ruleLayer:oncloseBtnClick()
    self:removeFromParent(true)
    AudioEngine.playEffect("game/DiamondMemory/sound/Button.mp3", false)
end

return  ruleLayer

