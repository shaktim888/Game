local JieSuanLayer = class("JieSuanLayer", cc.load("mvc").ModuleBase)
JieSuanLayer.RESOURCE_FILENAME = "game/tiger/JieSuanLayer.lua"
JieSuanLayer.behavior ={
    "logic.common.behavior.BtnBinder",
    "logic.common.behavior.TouchInterrupt",
    "logic.common.behavior.Listener",
}
JieSuanLayer.btnBind = {
    back = "Onback",
}


function JieSuanLayer:onCreate()
    audio.stopMusic()
    self.fenshu    = self.mView['fenshu']
    self.defen  = cc.UserDefault:getInstance():getIntegerForKey("self.defen")
    self.fenshu:setString(self.defen)
    if self.defen <= 5 then
        self.mView['Image_7']:setVisible(true)
    end
    if self.defen >5 and self.defen < 20 then
        self.mView['Image_7']:setVisible(true)
        self.mView['Image_8']:setVisible(true)
    end
    if self.defen >= 20 then
        self.mView['Image_7']:setVisible(true)
        self.mView['Image_8']:setVisible(true)
        self.mView['Image_9']:setVisible(true)
    end

    if global.isGrabScreenMode == 1 then
        self.fenshu:setString(math.random(10,50))
    end
    
    -- self.hight  = cc.UserDefault:getInstance():getIntegerForKey("self.hight")
    
    -- if global.isGrabScreenMode == 1 then
    --     self.hight1:setString(math.random(300,1000))
    --     self.now:setString(math.random(100,300))
    -- end
    -- local fontChangeArr = {
    --     self.hight1,self.now
    -- }
    -- local function getRgb()
    --     local r = math.random(1,255)
    --     local g = math.random(1,255)
    --     local b = math.random(1,255)
    --     return cc.c3b(r,g,b)
    -- end
    -- local fontcolor = getRgb()
    -- for key, v in pairs(fontChangeArr or {}) do
    --     local widget = v
    --     if widget and widget.setTextColor and type(widget.setTextColor) == "function" then
    --         widget:setTextColor(fontcolor)
    --     elseif widget and widget.setTitleColor and type(widget.setTitleColor) == "function"  then
    --         widget:setTitleColor(fontcolor)
    --     end
    -- end
end

function JieSuanLayer:Onback()
    -- CCDirector.sharedDirector():resume()
    global.viewController.gotoView("start")
 
end

return JieSuanLayer
