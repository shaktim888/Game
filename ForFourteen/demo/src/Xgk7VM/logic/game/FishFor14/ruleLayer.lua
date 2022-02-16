local ruleLayer = class("ruleLayer", cc.load("mvc").ModuleBase)
ruleLayer.RESOURCE_FILENAME = "game/FishFor14/RuleLayer.lua"
ruleLayer.behavior ={
    "logic.common.behavior.BtnBinder",
    "logic.common.behavior.TouchInterrupt",
    "logic.common.behavior.Listener",
    "logic.common.behavior.FontColorChange",
}

ruleLayer.changecolorfont = {
    ruleText = {},
    titleText = {}
}
function ruleLayer:onCreate()
    self.closeBtn = self.mView["closeBtn"]
end

--按钮事件绑定
ruleLayer.btnBind = {
    closeBtn = "closeBtnClick"
   
}
function ruleLayer:closeBtnClick()
AudioEngine.playEffect("game/FishFor14/sound/Button.wav",false)
   self:setVisible(false)
end





return  ruleLayer

