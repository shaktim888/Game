local ruleLayer = class("ruleLayer",cc.load("mvc").ModuleBase)
ruleLayer.RESOURCE_FILENAME = "game/basketball/Rule.lua"

ruleLayer.behavior ={
    "logic.common.behavior.BtnBinder",
    "logic.common.behavior.TouchInterrupt",
    "logic.common.behavior.Listener",
}

function ruleLayer:onCreate()
end

ruleLayer.btnBind = {
}

function ruleLayer:onmaskClick()
    self:setVisible(false)
end

return ruleLayer