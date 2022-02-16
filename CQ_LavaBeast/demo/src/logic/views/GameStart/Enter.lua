local GameStartLayer = class("GameStartLayer", cc.load("mvc").ModuleBase)
GameStartLayer.RESOURCE_FILENAME = "start/Start_Layer.lua"


--布局界面按钮
GameStartLayer.UIBtn = {
    btn_start =   {callBack = "onBtnStartClick", normal_picpath = nil},
}

function GameStartLayer:onCreate(_data)
    self.data = _data
    self.mView["role"]:ignoreContentAdaptWithSize(true)
    local panel_top_btn = require("logic/views/GameStart/TopButton").new(self,self.data.btnInfo)
    self:addButtonClick()
end

function GameStartLayer:onBtnStartClick()
    global.viewController.gotoView("select")
end

function GameStartLayer:addButtonClick()
   for key, v in pairs(GameStartLayer.UIBtn) do
       if self.mView[key] then
           local call = self[v.callBack]
           self.mView[key]:ignoreContentAdaptWithSize(true)
           self.mView[key]:setTouchEnabled(false)
           self:addNodeClick(self.mView[key],{endCallBack = function() self[v.callBack](self) end})
       end
   end
end


return GameStartLayer