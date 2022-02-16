local ruleLayer = class("ruleLayer", cc.load("mvc").ModuleBase)
ruleLayer.RESOURCE_FILENAME = "game/MountaintopJumps/RuleLayer.lua"

ruleLayer.behavior ={
    "logic.common.behavior.BtnBinder",
    "logic.common.behavior.TouchInterrupt",
    "logic.common.behavior.Listener",
    "logic.common.behavior.FontColorChange",
}

ruleLayer.changecolorfont = {
   
}

--按钮事件绑定
ruleLayer.btnBind = {
    shade = "closeBtnClick"
}

function ruleLayer:onCreate()
    self.closeBtn = self.mView["closeBtn"]
end

function ruleLayer:closeBtnClick()
    AudioEngine.playEffect("game/MountaintopJumps/sound/Button.mp3",false)
    self:setVisible(false)
end

return  ruleLayer

