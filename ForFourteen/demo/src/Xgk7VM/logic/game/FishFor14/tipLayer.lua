local tipLayer = class("tipLayer", cc.load("mvc").ModuleBase)
tipLayer.RESOURCE_FILENAME = "game/FishFor14/TipLayer.lua"

--local gameScene = require("logic.game.FishFor14.gameScene")
tipLayer.behavior ={
    "logic.common.behavior.BtnBinder",
    "logic.common.behavior.TouchInterrupt",
    "logic.common.behavior.Listener",
    "logic.common.behavior.FontColorChange",
}

tipLayer.changecolorfont = {
    ruleText = {},
    titleText = {}
}

function tipLayer:onCreate()
    
    self.closeBtn = self.mView["closeBtn"]

end

--按钮事件绑定
tipLayer.btnBind = {
    closeBtn = "closeBtnClick"
   
}
function tipLayer:closeBtnClick()
AudioEngine.playEffect("game/FishFor14/sound/Button.wav",false)
   self:setVisible(false)
end

return  tipLayer

