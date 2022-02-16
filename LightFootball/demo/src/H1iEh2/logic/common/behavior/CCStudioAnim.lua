
local CCStudioAnim = class("CCStudioAnim", cc.load("mvc").BehaviorBase)

function CCStudioAnim:animEnter()
    local action = cc.CSLoader:createTimeline(self.RESOURCE_FILENAME);
    action:play("uiEnter", false)
    -- 调用 runAction 函数
    self.mLayout:runAction( action );
end

function CCStudioAnim:animExit()
    if self.inClose then
        return
    end
    self.inClose = true
    local action = cc.CSLoader:createTimeline(self.RESOURCE_FILENAME);
    action:play("uiExit", false)
    local closeFunc = function()
        self:removeFromParent()
        self.inClose = false
    end
    self.mLayout:runAction( action );
    self.mLayout:runAction(cc.Sequence:create(cc.DelayTime:create(0.6),cc.CallFunc:create(closeFunc)))
end

return CCStudioAnim