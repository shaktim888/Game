
--
-- Author: 	刘智勇
-- Date: 	2019-06-29
-- Desc:	战斗场景


cc.FileUtils:getInstance():addSearchPath("res/csbzuqiu")


local UIManager = import("app.framework.UIManager")

local ZuQiuScene = class("ZuQiuScene",function()
	return display.newScene("ZuQiuScene")
end)


function ZuQiuScene:ctor()
	self:enableNodeEvents()
	self:loadAppFile()
    --------------------------------------------------------------------------------
    local director = cc.Director:getInstance()
    local glView = director:getOpenGLView()
    local designSize = glView:getDesignResolutionSize()
    print(">>>>>>>>ZuQiuScene$$$$:" , designSize.width , designSize.height)
    local frameSize = glView:getFrameSize()
    local iphonetype = device.model
    if iphonetype=="iphone" then -- iphone
    print(">>>>>> iphone series <<<<<<<")
    glView:setDesignResolutionSize(1280, 720, cc.ResolutionPolicy.SHOW_ALL);
    elseif iphonetype=="iphonex" then      --iphonex
    print(">>>>>> iphonex series <<<<<<<")
    glView:setDesignResolutionSize(1280, 720, cc.ResolutionPolicy.FIXED_HEIGHT);
    elseif  iphonetype=="ipad" then      --ipad
    print(">>>>>> ipad series <<<<<<<")
    glView:setDesignResolutionSize(1280, 720, cc.ResolutionPolicy.FIXED_WIDTH);
    else
    print(">>>>>> Unknown <<<<<<<")
    glView:setDesignResolutionSize(1280, 720, cc.ResolutionPolicy.SHOW_ALL);
    end
    print(">>>>>>>>ZuQiuScene$$$$:" , device.model , device.platform)
    --------------------------------------------------------------------------------

	self._uiManager = UIManager.new( self )
end



function ZuQiuScene:loadAppFile()
	import("app.viewszuqiu.config.zuqiu_config")
	import("app.viewszuqiu.config.country_config")
end



function ZuQiuScene:onEnter()
	-- 创建LoadingUI
	addUIToScene( UIDefine.ZUQIU_KEY.Loading_UI )
end

function ZuQiuScene:getSceneName()
	return "ZuQiuScene"
end

function ZuQiuScene:getUIManager()
	return self._uiManager
end



return ZuQiuScene