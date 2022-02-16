local TopButton = class("TopButton")

--动态按钮
TopButton.TopBtn = {
    btn_return =   {callBack = "onBtnReturnClick", normal_picpath = "common/btn_icon/btn_return.png"},
    btn_setting =   {callBack = "onBtnSettingClick", normal_picpath = "common/btn_icon/btn_setting.png"},
    btn_music =     {callBack = "onBtnMusicClick",   normal_picpath = "common/btn_icon/btn_music_on.png",   disable_picpath = "common/btn_icon/btn_sound_off.png"},
    btn_rule =      {callBack = "onBtnRuleClick",    normal_picpath = "common/btn_icon/btn_rule.png"},
    btn_active =    {callBack = "onBtnActiveClick",  normal_picpath = "common/btn_icon/btn_active.png"},
    btn_message =   {callBack = "onBtnMessageClick", normal_picpath = "common/btn_icon/btn_message.png"},
    btn_bag =       {callBack = "onBtnBagClick",     normal_picpath = "common/btn_icon/btn_bag.png"},
}

function TopButton:onBtnReturnClick()
    global.viewController.gotoView("start")
end

function TopButton:onBtnSettingClick()
    print("onBtnSettingClick")
end

function TopButton:onBtnMusicClick()
    print("onBtnMusicClick")
    local is_open = global.viewData.isMusicOpen()
    local btn_music =  self.panel_top_btn:getChildByName("btn_music")
    if is_open == global.viewData.State.Open then
        -- 关闭音乐
        btn_music:loadTexture("common/btn_icon/btn_music_off.png")
        global.viewData.setMusicState(global.viewData.State.Closed)
        global.viewData.setVoiceState(global.viewData.State.Closed)
        global.viewData:stopPlayBgMusic()
    else
        -- 打开音乐
        btn_music:loadTexture("common/btn_icon/btn_music_on.png")
        global.viewData.setMusicState(global.viewData.State.Open)
        global.viewData.setVoiceState(global.viewData.State.Open)
        global.viewData:playBgMusic()
    end
end

function TopButton:onBtnRuleClick()
    print("onBtnRuleClick")
    global.viewController.gotoView("help")
    
end

function TopButton:onBtnActiveClick()
    print("onBtnActiveClick")
    self:tipRunaction()
end

function TopButton:onBtnMessageClick()
    print("onBtnMessageClick")
    self:tipRunaction()
end

function TopButton:onBtnBagClick()
    print("onBtnBagClick")
    self:tipRunaction()
end

function TopButton:tipRunaction()
    local tip_node = ccui.ImageView:create("common/img_popui.png")
    local tip_node_text  = ccui.Text:create()
    tip_node_text:setFontName("common/font/font.ttf")
    tip_node_text:setString("人物达到一转后开放此功能")
    tip_node_text:setFontSize(32)
    tip_node_text:enableShadow({r = 110, g = 110, b = 110, a = 255}, {width = 2, height = -2}, 0)
    tip_node_text:setTextColor({r = 255, g = 255, b = 0})
    tip_node:addChild(tip_node_text)
    self.parent:addChild(tip_node)
    local visibleSize = cc.Director:getInstance():getVisibleSize()
    tip_node:setPosition(visibleSize.width/2,visibleSize.height/2)
    local tip_size = tip_node:getContentSize()
    tip_node_text:setPosition(tip_size.width/2,tip_size.height/2)

    tip_node:runAction(cc.Sequence:create({
		cc.Spawn:create({
			cc.Sequence:create({cc.ScaleTo:create(0.1,1.05),cc.ScaleTo:create(0.2,1)}),
			cc.FadeIn:create(0.3)
		}),
		cc.DelayTime:create(1),
		cc.Spawn:create({
			cc.Sequence:create({cc.ScaleTo:create(0.2,1.05),cc.ScaleTo:create(0.1,0.75)}),
            cc.FadeOut:create(0.3),
            cc.CallFunc:create(function ()
                tip_node:removeFromParent()
            end)
		})
	}))
end

function TopButton:ctor(parent,data)
    local visibleSize = cc.Director:getInstance():getVisibleSize()
    local panel_top_btn = ccui.Layout:create()
    panel_top_btn:setSize(visibleSize.width,100)
    panel_top_btn:ignoreAnchorPointForPosition(false)
    panel_top_btn:setAnchorPoint(cc.p(0,1))
    panel_top_btn:setPositionY(visibleSize.height)
    panel_top_btn:setPositionX(0)
    self.panel_top_btn = panel_top_btn
    parent:addChild(panel_top_btn)
    self.btn_info = data
    self:addDynamicTopBtn()
    self.parent = parent
 
end

function TopButton:getLayout()
    return self.panel_top_btn
end

function TopButton:addDynamicTopBtn()
    local list = {}
    for key, v in ipairs(self.btn_info) do
         local name  = v.name
         if v.isExist then
             table.insert(list,name)
         end
    end
    --图标按钮图标添加
    local visibleSize = cc.Director:getInstance():getVisibleSize()
    for key, v in pairs(list) do
        if TopButton.TopBtn[v].normal_picpath ~= nil then
            local image = ccui.ImageView:create()
            image:setName(v)
            image:ignoreContentAdaptWithSize(true)
            image:loadTexture(TopButton.TopBtn[v].normal_picpath)
            self.panel_top_btn:addChild(image)
            local contenct = image:getContentSize()
            image:setPositionY(50)
            local distance = 20
            local start = visibleSize.width - distance - contenct.width/2
            local childrenNum = self.panel_top_btn:getChildrenCount()
            local posX = start - (distance + contenct.width)*(childrenNum-1)
            image:setPositionX(posX)

            if v == "btn_music" then
                local is_open = global.viewData.isMusicOpen()
                if is_open == global.viewData.State.Open then
                    image:loadTexture("common/btn_icon/btn_music_on.png")
                    global.viewData:playBgMusic()
                else
                    image:loadTexture("common/btn_icon/btn_music_off.png")
                    global.viewData:stopPlayBgMusic()
                end
            end

            local call = TopButton.TopBtn[v].callBack
            image:setTouchEnabled(true)
            image:addTouchEventListener(function(sender, state)
                if state == 2 then
                    self[call](self)
                end
            end)
        end
    end 
 end
return  TopButton