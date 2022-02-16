local ruleLayer = class("ruleLayer", cc.load("mvc").ModuleBase)
ruleLayer.RESOURCE_FILENAME = "game/knight/hall_rule.lua"


function ruleLayer:onshadeClick()
    AudioEngine.playEffect("game/knight/sound/Button.mp3",false)
    self:removeFromParent(true)
end

function ruleLayer:oncloseBtnClick()
    self:removeFromParent(true)
    AudioEngine.playEffect("game/knight/sound/Button.mp3", false)
end

return  ruleLayer

