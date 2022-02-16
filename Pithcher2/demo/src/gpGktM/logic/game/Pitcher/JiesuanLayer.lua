local JiesuanLayer = class("JiesuanLayer", cc.load("mvc").ModuleBase)
JiesuanLayer.RESOURCE_FILENAME = "game/Pitcher/JiesuanLayer.csb"
JiesuanLayer.behavior ={
    "logic.common.behavior.BtnBinder",
    "logic.common.behavior.TouchInterrupt",
    "logic.common.behavior.Listener",
}
JiesuanLayer.btnBind = {
    home = "onHome",
    replay = "onR",
}
function JiesuanLayer:onCreate(callback_)
    self._callback = callback_
end

function JiesuanLayer:onHome()
    local mainScene = require ("logic.game.Pitcher.MainScene").new();
    mainScene:showWithScene()
end
function JiesuanLayer:onR()
    local gameScene = require ("logic.game.Pitcher.GameScene").new();
    gameScene:showWithScene1(nil,1,nil,{physics = 1})

    -- local sc = cc.Director:getInstance():getRunningScene()
    -- sc:onCreate()
    -- self._callback()
    -- global.async.delay(0.5):Then(function()
    --     self:removeFromParent()
    -- end)
end
return JiesuanLayer