--------------------------------------------------------------
-- This file was automatically generated by Cocos Studio.
-- Do not make changes to this file.
-- All changes will be lost.
--------------------------------------------------------------

local luaExtend = require "LuaExtend"

-- using for layout to decrease count of local variables
local layout = nil
local localLuaFile = nil
local innerCSD = nil
local innerProject = nil
local localFrame = nil

local Result = {}
------------------------------------------------------------
-- function call description
-- create function caller should provide a function to 
-- get a callback function in creating scene process.
-- the returned callback function will be registered to 
-- the callback event of the control.
-- the function provider is as below :
-- Callback callBackProvider(luaFileName, node, callbackName)
-- parameter description:
-- luaFileName  : a string, lua file name
-- node         : a Node, event source
-- callbackName : a string, callback function name
-- the return value is a callback function
------------------------------------------------------------
function Result.create(callBackProvider)

local result={}
setmetatable(result, luaExtend)

--Create Scene
local Scene=cc.Node:create()
Scene:setName("Scene")

--Create Image_12
local Image_12 = ccui.ImageView:create()
Image_12:ignoreContentAdaptWithSize(false)
Image_12:loadTexture("game/qiehuanggua/image/gameBg.png",0)
Image_12:setLayoutComponentEnabled(true)
Image_12:setName("Image_12")
Image_12:setTag(55)
Image_12:setCascadeColorEnabled(true)
Image_12:setCascadeOpacityEnabled(true)
Image_12:setPosition(640.0000, 360.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(Image_12)
layout:setPositionPercentX(0.5000)
layout:setPositionPercentY(0.5000)
layout:setPercentWidth(1.0000)
layout:setPercentHeight(1.0000)
layout:setSize({width = 1280.0000, height = 720.0000})
Scene:addChild(Image_12)

--Create title
local title = cc.Sprite:create("Default/Sprite.png")
title:setName("title")
title:setTag(51)
title:setCascadeColorEnabled(true)
title:setCascadeOpacityEnabled(true)
title:setVisible(false)
title:setPosition(796.0500, 550.7401)
layout = ccui.LayoutComponent:bindLayoutComponent(title)
layout:setPositionPercentX(0.6219)
layout:setPositionPercentY(0.7649)
layout:setPercentWidth(0.0359)
layout:setPercentHeight(0.0639)
layout:setSize({width = 46.0000, height = 46.0000})
layout:setLeftMargin(773.0500)
layout:setRightMargin(460.9500)
layout:setTopMargin(146.2599)
layout:setBottomMargin(527.7401)
title:setBlendFunc({src = 1, dst = 771})
Scene:addChild(title)

--Create Sprite_2
local Sprite_2 = ccui.ImageView:create()
Sprite_2:ignoreContentAdaptWithSize(false)
Sprite_2:loadTexture("game/qiehuanggua/image/role.png",0)
Sprite_2:setLayoutComponentEnabled(true)
Sprite_2:setName("Sprite_2")
Sprite_2:setTag(252)
Sprite_2:setCascadeColorEnabled(true)
Sprite_2:setCascadeOpacityEnabled(true)
Sprite_2:setAnchorPoint(0.5000, 0.0000)
Sprite_2:setPosition(245.1900, 0.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(Sprite_2)
layout:setPositionPercentX(0.1916)
layout:setPercentWidth(0.3813)
layout:setPercentHeight(0.7542)
layout:setSize({width = 488.0000, height = 543.0000})
layout:setLeftMargin(1.1900)
layout:setRightMargin(790.8100)
layout:setTopMargin(177.0000)
Scene:addChild(Sprite_2)

--Create btnAbout
local btnAbout = ccui.Button:create()
btnAbout:ignoreContentAdaptWithSize(false)
btnAbout:loadTextureNormal("game/qiehuanggua/image/btn.png",0)
btnAbout:setTitleFontName("game/qiehuanggua/image/zh_qhg.ttf")
btnAbout:setTitleFontSize(50)
btnAbout:setTitleText("About")
btnAbout:setTitleColor({r = 65, g = 65, b = 70})
btnAbout:setLayoutComponentEnabled(true)
btnAbout:setName("btnAbout")
btnAbout:setTag(52)
btnAbout:setCascadeColorEnabled(true)
btnAbout:setCascadeOpacityEnabled(true)
btnAbout:setPosition(903.8300, 276.1913)
layout = ccui.LayoutComponent:bindLayoutComponent(btnAbout)
layout:setPositionPercentX(0.7061)
layout:setPositionPercentY(0.3836)
layout:setPercentWidth(0.2039)
layout:setPercentHeight(0.1319)
layout:setSize({width = 261.0000, height = 95.0000})
layout:setLeftMargin(773.3300)
layout:setRightMargin(245.6699)
layout:setTopMargin(396.3087)
layout:setBottomMargin(228.6913)
Scene:addChild(btnAbout)

--Create btnStart
local btnStart = ccui.Button:create()
btnStart:ignoreContentAdaptWithSize(false)
btnStart:loadTextureNormal("game/qiehuanggua/image/btn.png",0)
btnStart:setTitleFontName("game/qiehuanggua/image/zh_qhg.ttf")
btnStart:setTitleFontSize(50)
btnStart:setTitleText("Start")
btnStart:setTitleColor({r = 65, g = 65, b = 70})
btnStart:setLayoutComponentEnabled(true)
btnStart:setName("btnStart")
btnStart:setTag(53)
btnStart:setCascadeColorEnabled(true)
btnStart:setCascadeOpacityEnabled(true)
btnStart:setPosition(559.7906, 276.1913)
layout = ccui.LayoutComponent:bindLayoutComponent(btnStart)
layout:setPositionPercentX(0.4373)
layout:setPositionPercentY(0.3836)
layout:setPercentWidth(0.2039)
layout:setPercentHeight(0.1319)
layout:setSize({width = 261.0000, height = 95.0000})
layout:setLeftMargin(429.2906)
layout:setRightMargin(589.7094)
layout:setTopMargin(396.3087)
layout:setBottomMargin(228.6913)
Scene:addChild(btnStart)

--Create best
local best = ccui.Text:create()
best:ignoreContentAdaptWithSize(true)
best:setTextAreaSize({width = 0, height = 0})
best:setFontName("game/qiehuanggua/image/zh_qhg.ttf")
best:setFontSize(50)
best:setString([[BEST:100]])
best:setLayoutComponentEnabled(true)
best:setName("best")
best:setTag(256)
best:setCascadeColorEnabled(true)
best:setCascadeOpacityEnabled(true)
best:setPosition(871.0000, 537.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(best)
layout:setPositionPercentX(0.6805)
layout:setPositionPercentY(0.7458)
layout:setPercentWidth(0.1867)
layout:setPercentHeight(0.0694)
layout:setSize({width = 239.0000, height = 50.0000})
layout:setLeftMargin(751.5000)
layout:setRightMargin(289.5000)
layout:setTopMargin(158.0000)
layout:setBottomMargin(512.0000)
Scene:addChild(best)

--Create Panel_RightTop
local Panel_RightTop = ccui.Layout:create()
Panel_RightTop:ignoreContentAdaptWithSize(false)
Panel_RightTop:setClippingEnabled(false)
Panel_RightTop:setBackGroundColorOpacity(102)
Panel_RightTop:setLayoutComponentEnabled(true)
Panel_RightTop:setName("Panel_RightTop")
Panel_RightTop:setTag(49)
Panel_RightTop:setCascadeColorEnabled(true)
Panel_RightTop:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(Panel_RightTop)
layout:setPercentWidth(1.0000)
layout:setPercentHeight(1.0000)
layout:setSize({width = 1280.0000, height = 720.0000})
Scene:addChild(Panel_RightTop)

--Create btnSetting
local btnSetting = ccui.Button:create()
btnSetting:ignoreContentAdaptWithSize(false)
btnSetting:loadTextureNormal("game/qiehuanggua/image/set.png",0)
btnSetting:loadTexturePressed("game/qiehuanggua/image/set.png",0)
btnSetting:setTitleFontSize(14)
btnSetting:setTitleColor({r = 65, g = 65, b = 70})
btnSetting:setScale9Enabled(true)
btnSetting:setCapInsets({x = 15, y = 11, width = 55, height = 63})
btnSetting:setLayoutComponentEnabled(true)
btnSetting:setName("btnSetting")
btnSetting:setTag(50)
btnSetting:setCascadeColorEnabled(true)
btnSetting:setCascadeOpacityEnabled(true)
btnSetting:setPosition(1213.2860, 663.8574)
layout = ccui.LayoutComponent:bindLayoutComponent(btnSetting)
layout:setPositionPercentX(0.9479)
layout:setPositionPercentY(0.9220)
layout:setPercentWidth(0.0664)
layout:setPercentHeight(0.1181)
layout:setSize({width = 85.0000, height = 85.0000})
layout:setLeftMargin(1170.7860)
layout:setRightMargin(24.2139)
layout:setTopMargin(13.6426)
layout:setBottomMargin(621.3574)
Panel_RightTop:addChild(btnSetting)

--Create Animation
result['animation'] = ccs.ActionTimeline:create()
  
result['animation']:setDuration(0)
result['animation']:setTimeSpeed(1.0000)
--Create Animation List

result['root'] = Scene
return result;
end

return Result

