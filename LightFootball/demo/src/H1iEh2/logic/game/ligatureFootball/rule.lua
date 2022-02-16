local Rule = class("Rule",cc.load('mvc').ModuleBase)

Rule.RESOURCE_FILENAME = "game/ligatureFootball/RuleLayer.lua"


function Rule:onCreate()
    self.mView["panel"]:addTouchEventListener(handler(self,self.onTouchShape))
end

function Rule:onTouchShape(pSender,event)
    self:removeFromParent();
end



return Rule