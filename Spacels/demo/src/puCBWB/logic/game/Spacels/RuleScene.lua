local RuleScene = class("RuleScene", cc.load("mvc").ModuleBase)

RuleScene.RESOURCE_FILENAME = "game/Spacels/RuleScene.lua"

RuleScene.behavior ={
    "logic.common.behavior.BtnBinder",
    "logic.common.behavior.TouchInterrupt",
    "logic.common.behavior.Listener",
}
--按钮触发事件
RuleScene.btnBind = {
    back = "onBack",
}

function RuleScene:onCreate()
    --捕获规则容器中的星星
    self.star1 = self.mView['star1']
    self.star2 = self.mView['star2']
    self.star3 = self.mView['star3']
    self.star1:runAction(cc.RotateBy:create(1700,360000))
    self.star2:runAction(cc.RotateBy:create(1700,360000))
    self.star3:runAction(cc.RotateBy:create(1700,360000))
end

function RuleScene:onBack()
    print("返回主界面")
    local mainScene = require ("logic.game.Spacels.MainScene").new();
    mainScene:showWithScene()
end

return RuleScene