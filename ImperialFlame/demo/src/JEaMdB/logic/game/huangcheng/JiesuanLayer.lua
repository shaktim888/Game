local JiesuanLayer = class("JiesuanLayer", cc.load("mvc").ModuleBase)
JiesuanLayer.RESOURCE_FILENAME = "game/huangcheng/JiesuanLayer.lua"

JiesuanLayer.behavior ={
    "logic.common.behavior.BtnBinder",
    "logic.common.behavior.TouchInterrupt",
    "logic.common.behavior.Listener",
}

JiesuanLayer.btnBind = {
    zhuye = "onZhuye",
}

function JiesuanLayer:onCreate()
    local score = self.mView['Text']
    local fenshu = cc.UserDefault:getInstance():getIntegerForKey("self.score")
    print(fenshu)
    score:setString("本局得分：" .. fenshu)
end

function JiesuanLayer:onZhuye()
    CCDirector.sharedDirector():resume()
    require("logic.game.huangcheng.MainScene").new():showWithScene()
end

return JiesuanLayer