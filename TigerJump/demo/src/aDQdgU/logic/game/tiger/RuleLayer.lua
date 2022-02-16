local RuleLayer = class("RuleLayer", cc.load("mvc").ModuleBase)
RuleLayer.RESOURCE_FILENAME = "game/tiger/RuleLayer.lua"
RuleLayer.behavior ={
    "logic.common.behavior.BtnBinder",
    "logic.common.behavior.TouchInterrupt",
    "logic.common.behavior.Listener",
}

function RuleLayer:onCreate()
    self.rule = self.mView['Panel_1']
    self.rule:addTouchEventListener(function(sender,eventType)
        if eventType == ccui.TouchEventType.ended then
            self:RuleClose()
        end
    end)

    local fontChangeArr = {
        self.mView['Text_1']
    }
    local function getRgb()
        local r = math.random(1,255)
        local g = math.random(1,255)
        local b = math.random(1,255)
        return cc.c3b(r,g,b)
    end
    local fontcolor = getRgb()
    for key, v in pairs(fontChangeArr or {}) do
        local widget = v
        if widget and widget.setTextColor and type(widget.setTextColor) == "function" then
            widget:setTextColor(fontcolor)
        elseif widget and widget.setTitleColor and type(widget.setTitleColor) == "function"  then
            widget:setTitleColor(fontcolor)
        end
    end
end

function RuleLayer:RuleClose()
    self:setVisible(false)
end

return RuleLayer