local ruleLayer = class("ruleLayer", cc.load("mvc").ModuleBase)
ruleLayer.RESOURCE_FILENAME = "game/FarmerfFightLandlord/RuleLayer.lua"

ruleLayer.behavior ={
    "logic.common.behavior.BtnBinder",
    "logic.common.behavior.TouchInterrupt",
    "logic.common.behavior.Listener",
    "logic.common.behavior.FontColorChange",
}

ruleLayer.changecolorfont = {
    Text_1 = {}
}

--按钮事件绑定
ruleLayer.btnBind = {
    closeBtn = "closeBtnClick"
}

function ruleLayer:onCreate()
    self.closeBtn = self.mView["closeBtn"]
end

function ruleLayer:closeBtnClick()
    AudioEngine.playEffect("game/FarmerfFightLandlord/sound/Button.mp3",false)
    self:setVisible(false)
end

return  ruleLayer

