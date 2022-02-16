
local GameStartLayer = class("GameStartLayer", cc.load("mvc").ModuleBase)
GameStartLayer.RESOURCE_FILENAME = "start/Start_Layer.lua"

--所有的可能出现的按钮
GameStartLayer.allBtn = {
    btn_start_1 =    {callBack = "onBtnNewStartClick"},
    btn_start_2 =    {callBack = "onBtnContineStartClick"},
    btn_setting =  {callBack = "onBtnSettingClick"},
    btn_rule =     {callBack = "onBtnRuleClick"},
    btn_daily =    {callBack = "onBtnDailyClick"},
    btn_skin =     {callBack = "onBtnSkinClick"},
}

function GameStartLayer:onBtnSettingClick()
    global.viewController.gotoView("setting")
    print("onBtnSettingClick")
end

function GameStartLayer:onBtnRuleClick()
    global.viewController.gotoView("help")
    print("onBtnRuleClick")
end

function GameStartLayer:onBtnNewStartClick()
    local data = {
        isReplay = true
    }
    global.viewController.gotoView("level",data)
    print("onBtnStartClick")
end

function GameStartLayer:onBtnContineStartClick()
    local data = {
        isReplay = false
    }
    global.viewController.gotoView("level",data)
    print("onBtnStartClick")
end

function GameStartLayer:onBtnDailyClick()
    local data = {
        node = self.mView["txt_gold"]
    }
    global.viewController.gotoView("daily")
    print("onBtnDailyClick")
end

function GameStartLayer:onBtnSkinClick()
    local data = {
        node = self.mView["txt_gold"]
    }
    global.viewController.gotoView("skin",data)
    print("onBtnSkinClick")
end


function GameStartLayer:onCreate(_data)
   self.data = _data
   self.mView["img_headbg"]:ignoreContentAdaptWithSize(true)
   self.mView["role"]:ignoreContentAdaptWithSize(true)
   self.mView["layout_top_btn"]:setTouchEnabled(false)
   self.mView["txt_gold"]:setString(global.viewData.getCoin())
   global.viewData.playBgMusic()
   self:addButtonClick()
end

function GameStartLayer:addButtonClick()
   for key, v in pairs(GameStartLayer.allBtn) do
       if self.mView[key] then
           self.mView[key]:ignoreContentAdaptWithSize(true)
           self.mView[key]:setTouchEnabled(false)
           self:addNodeClick(self.mView[key],{endCallBack = function() self[v.callBack](self) end})
       end
   end
end

function GameStartLayer:addExternBtn()
   local list = {}
   local SpecialBtn = {}
   for key, v in pairs(self.data.btnInfo) do
       if not v.isSpecialPos then
           local currentBtn = GameStartLayer.allBtn[key] 
           if not currentBtn.isBind then
               if v.isExist then
                   table.insert(list,key)
               end
           end
       else
           local currentBtn = GameStartLayer.allBtn[key]
           --如果已经在UI工程中不可依据需求替换位置和图片
           --所有布局中一般只有右上角可以放此种类型按钮
           if not currentBtn.isBind then
               if v.isExist then
                   table.insert(SpecialBtn,key)
               end
           end
       end
   end

   --顶部按钮父类
   local visibleSize = cc.Director:getInstance():getVisibleSize()
   self.mView["panel_top_btn"]:ignoreAnchorPointForPosition(false)
   self.mView["panel_top_btn"]:setAnchorPoint(cc.p(0,1))
   self.mView["panel_top_btn"]:setPositionY(visibleSize.height)
   self.mView["panel_top_btn"]:setPositionX(0)

   --图标按钮图标添加
   for key, v in pairs(list) do
       if GameStartLayer.allBtn[v].normal_picpath ~= nil then
           local image = ccui.ImageView:create()
           image:setName(v)
           image:ignoreContentAdaptWithSize(true)
           image:loadTexture(GameStartLayer.allBtn[v].normal_picpath)
           self.mView["panel_top_btn"]:addChild(image)
           local contenct = image:getContentSize()
           image:setPositionY(50)
           local distance = 20
           local start = visibleSize.width - distance - contenct.width/2
           local childrenNum = self.mView["panel_top_btn"]:getChildrenCount()
           local posX = start - (distance + contenct.width)*(childrenNum-1)
           image:setPositionX(posX)

           GameStartLayer.allBtn[v].isBind = true
           local call = GameStartLayer.allBtn[v].callBack
           self:addNodeClick(image,{endCallBack =function() self[call](self) end})

       end
   end 

   --特殊按钮图标添加
   for key, v in pairs(SpecialBtn) do
         local image = ccui.ImageView:create()
         image:ignoreContentAdaptWithSize(true)
         image:setName(v)
         if self.data.btnInfo[v].normal_picpath then
            image:loadTexture(self.data.btnInfo[v].normal_picpath)
         end
         if self.data.btnInfo[v].btn_pos then
            image:setPosition(self.data.btnInfo[v].btn_pos)
         end
         self:addChild(image)
         GameStartLayer.allBtn[v].isBind = true
         local call =  GameStartLayer.allBtn[v].callBack
         self:addNodeClick(image,{endCallBack =function() self[call](self) end})
   end
end

return GameStartLayer