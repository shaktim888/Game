local RuleScene = class("RuleScene", cc.load("mvc").ModuleBase)
RuleScene.RESOURCE_FILENAME = "game/Pitcher/RuleLayer.csb"

RuleScene.behavior ={
    "logic.common.behavior.BtnBinder",
    "logic.common.behavior.TouchInterrupt",
    "logic.common.behavior.Listener",
}
function RuleScene:onCreate()
    self.rule = self.mView['rule']
    self.rule:addTouchEventListener(function(sender,eventType)
        if eventType == ccui.TouchEventType.ended then
            self:RuleClose()
        end
    end)
end

function RuleScene:RuleClose()
    print("关闭规则")
    self:setVisible(false)
end
return RuleScene