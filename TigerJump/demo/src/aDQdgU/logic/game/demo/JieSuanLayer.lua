local JieSuanLayer = class("JieSuanLayer", cc.load("mvc").ModuleBase)
JieSuanLayer.RESOURCE_FILENAME = "game/sharkfish/JieSuanLayer.lua"
JieSuanLayer.behavior ={
    "logic.common.behavior.BtnBinder",
    "logic.common.behavior.TouchInterrupt",
    "logic.common.behavior.Listener",
}
JieSuanLayer.btnBind = {
    began = "onBegan",
}


function JieSuanLayer:onCreate()
    self.hight1 = self.mView['hight1']
    self.now    = self.mView['now']
    self.grade  = cc.UserDefault:getInstance():getIntegerForKey("self.grade")
    self.hight  = cc.UserDefault:getInstance():getIntegerForKey("self.hight")
    print(self.grade)
    print(self.hight)
    
    if global.isGrabScreenMode == 1 then
        self.hight1:setString(math.random(300,1000))
        self.now:setString(math.random(100,300))
    end
    local fontChangeArr = {
        self.hight1,self.now
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

function JieSuanLayer:onBegan()
    CCDirector.sharedDirector():resume()
    local mainScene = require ("logic.game.sharkfish.MainScene").new();
    mainScene:showWithScene()
end

return JieSuanLayer
