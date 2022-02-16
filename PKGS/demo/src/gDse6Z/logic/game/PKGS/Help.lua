local RuleLayer = class("RuleLayer", cc.load("mvc").ModuleBase)
RuleLayer.RESOURCE_FILENAME = "game/PKGS/Help.csb"

RuleLayer.behavior ={
    "logic.common.behavior.ClickToClose",
}

return RuleLayer
