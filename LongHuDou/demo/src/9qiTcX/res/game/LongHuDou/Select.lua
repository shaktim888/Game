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

--Create bg
local bg = ccui.ImageView:create()
bg:ignoreContentAdaptWithSize(false)
bg:loadTexture("game/LongHuDou/images/hall/bg_game.png",0)
bg:setLayoutComponentEnabled(true)
bg:setName("bg")
bg:setTag(31)
bg:setCascadeColorEnabled(true)
bg:setCascadeOpacityEnabled(true)
bg:setPosition(640.0000, 360.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(bg)
layout:setPositionPercentXEnabled(true)
layout:setPositionPercentX(0.5000)
layout:setPositionPercentY(0.5000)
layout:setPercentWidth(1.0000)
layout:setPercentHeight(1.0000)
layout:setSize({width = 1280.0000, height = 720.0000})
layout:setVerticalEdge(3)
layout:setStretchWidthEnabled(true)
layout:setStretchHeightEnabled(true)
Scene:addChild(bg)

--Create effect
local effect = ccui.ImageView:create()
effect:ignoreContentAdaptWithSize(false)
effect:loadTexture("game/LongHuDou/images/hall/pkEffect.png",0)
effect:setLayoutComponentEnabled(true)
effect:setName("effect")
effect:setTag(200)
effect:setCascadeColorEnabled(true)
effect:setCascadeOpacityEnabled(true)
effect:setPosition(610.0480, 359.0858)
layout = ccui.LayoutComponent:bindLayoutComponent(effect)
layout:setPositionPercentXEnabled(true)
layout:setPositionPercentX(0.4766)
layout:setPositionPercentY(0.4987)
layout:setPercentWidth(0.4156)
layout:setPercentHeight(0.9819)
layout:setSize({width = 532.0000, height = 707.0000})
layout:setLeftMargin(344.0480)
layout:setRightMargin(403.9520)
layout:setTopMargin(7.4142)
layout:setBottomMargin(5.5858)
Scene:addChild(effect)

--Create longLogo
local longLogo = ccui.ImageView:create()
longLogo:ignoreContentAdaptWithSize(false)
longLogo:loadTexture("game/LongHuDou/images/game/VSDragon_long.png",0)
longLogo:setLayoutComponentEnabled(true)
longLogo:setName("longLogo")
longLogo:setTag(125)
longLogo:setCascadeColorEnabled(true)
longLogo:setCascadeOpacityEnabled(true)
longLogo:setAnchorPoint(0.0000, 0.5000)
longLogo:setPosition(-3.5330, 401.1909)
longLogo:setScaleX(1.5000)
longLogo:setScaleY(1.5000)
layout = ccui.LayoutComponent:bindLayoutComponent(longLogo)
layout:setPositionPercentX(-0.0028)
layout:setPositionPercentY(0.5572)
layout:setPercentWidth(0.2766)
layout:setPercentHeight(0.5083)
layout:setSize({width = 354.0000, height = 366.0000})
layout:setLeftMargin(-3.5330)
layout:setRightMargin(929.5330)
layout:setTopMargin(135.8091)
layout:setBottomMargin(218.1909)
Scene:addChild(longLogo)

--Create huLogo
local huLogo = ccui.ImageView:create()
huLogo:ignoreContentAdaptWithSize(false)
huLogo:loadTexture("game/LongHuDou/images/game/VSDragon_lh.png",0)
huLogo:setLayoutComponentEnabled(true)
huLogo:setName("huLogo")
huLogo:setTag(197)
huLogo:setCascadeColorEnabled(true)
huLogo:setCascadeOpacityEnabled(true)
huLogo:setAnchorPoint(1.0000, 0.5000)
huLogo:setPosition(1278.7010, 398.7509)
huLogo:setScaleX(1.5000)
huLogo:setScaleY(1.5000)
layout = ccui.LayoutComponent:bindLayoutComponent(huLogo)
layout:setPositionPercentX(0.9990)
layout:setPositionPercentY(0.5538)
layout:setPercentWidth(0.3133)
layout:setPercentHeight(0.4722)
layout:setSize({width = 401.0000, height = 340.0000})
layout:setLeftMargin(877.7012)
layout:setRightMargin(1.2988)
layout:setTopMargin(151.2491)
layout:setBottomMargin(228.7509)
Scene:addChild(huLogo)

--Create startBtn
local startBtn = ccui.Button:create()
startBtn:ignoreContentAdaptWithSize(false)
startBtn:loadTextureNormal("game/LongHuDou/images/game/but_continue.png",0)
startBtn:setTitleFontName("")
startBtn:setTitleFontSize(36)
startBtn:setTitleColor({r = 229, g = 229, b = 229})
startBtn:setLayoutComponentEnabled(true)
startBtn:setName("startBtn")
startBtn:setTag(5)
startBtn:setCascadeColorEnabled(true)
startBtn:setCascadeOpacityEnabled(true)
startBtn:setPosition(1198.7200, 78.1200)
layout = ccui.LayoutComponent:bindLayoutComponent(startBtn)
layout:setPositionPercentXEnabled(true)
layout:setPositionPercentX(0.9365)
layout:setPositionPercentY(0.1085)
layout:setPercentWidth(0.1070)
layout:setPercentHeight(0.2097)
layout:setSize({width = 137.0000, height = 151.0000})
layout:setVerticalEdge(3)
layout:setLeftMargin(1130.2200)
layout:setRightMargin(12.7800)
layout:setTopMargin(566.3800)
layout:setBottomMargin(2.6200)
Scene:addChild(startBtn)

--Create title
local title = ccui.Text:create()
title:ignoreContentAdaptWithSize(true)
title:setTextAreaSize({width = 0, height = 0})
title:setFontName("game/LongHuDou/images/font/fish.ttf")
title:setFontSize(40)
title:setString([[PLAYER SELECT]])
title:setLayoutComponentEnabled(true)
title:setName("title")
title:setTag(128)
title:setCascadeColorEnabled(true)
title:setCascadeOpacityEnabled(true)
title:setPosition(574.5000, 605.5000)
layout = ccui.LayoutComponent:bindLayoutComponent(title)
layout:setPositionPercentX(0.4488)
layout:setPositionPercentY(0.8410)
layout:setPercentWidth(0.1609)
layout:setPercentHeight(0.0653)
layout:setSize({width = 206.0000, height = 47.0000})
layout:setLeftMargin(471.5000)
layout:setRightMargin(602.5000)
layout:setTopMargin(91.0000)
layout:setBottomMargin(582.0000)
Scene:addChild(title)

--Create huBtn
local huBtn = ccui.Button:create()
huBtn:ignoreContentAdaptWithSize(false)
huBtn:loadTextureNormal("game/LongHuDou/images/hall/select.png",0)
huBtn:setTitleFontName("")
huBtn:setTitleFontSize(36)
huBtn:setTitleColor({r = 229, g = 229, b = 229})
huBtn:setLayoutComponentEnabled(true)
huBtn:setName("huBtn")
huBtn:setTag(198)
huBtn:setCascadeColorEnabled(true)
huBtn:setCascadeOpacityEnabled(true)
huBtn:setPosition(994.8160, 74.1600)
layout = ccui.LayoutComponent:bindLayoutComponent(huBtn)
layout:setPositionPercentXEnabled(true)
layout:setPositionPercentX(0.7772)
layout:setPositionPercentY(0.1030)
layout:setPercentWidth(0.0492)
layout:setPercentHeight(0.0875)
layout:setSize({width = 63.0000, height = 63.0000})
layout:setVerticalEdge(3)
layout:setLeftMargin(963.3160)
layout:setRightMargin(253.6841)
layout:setTopMargin(614.3400)
layout:setBottomMargin(42.6600)
Scene:addChild(huBtn)

--Create click
local click = ccui.ImageView:create()
click:ignoreContentAdaptWithSize(false)
click:loadTexture("game/LongHuDou/images/hall/selectClick.png",0)
click:setLayoutComponentEnabled(true)
click:setName("click")
click:setTag(123)
click:setCascadeColorEnabled(true)
click:setCascadeOpacityEnabled(true)
click:setVisible(false)
click:setPosition(32.0000, 31.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(click)
layout:setPositionPercentX(0.5079)
layout:setPositionPercentY(0.4921)
layout:setPercentWidth(0.5873)
layout:setPercentHeight(0.6349)
layout:setSize({width = 37.0000, height = 40.0000})
layout:setLeftMargin(13.5000)
layout:setRightMargin(12.5000)
layout:setTopMargin(12.0000)
layout:setBottomMargin(11.0000)
huBtn:addChild(click)

--Create longBtn
local longBtn = ccui.Button:create()
longBtn:ignoreContentAdaptWithSize(false)
longBtn:loadTextureNormal("game/LongHuDou/images/hall/select.png",0)
longBtn:setTitleFontName("")
longBtn:setTitleFontSize(36)
longBtn:setTitleColor({r = 229, g = 229, b = 229})
longBtn:setLayoutComponentEnabled(true)
longBtn:setName("longBtn")
longBtn:setTag(127)
longBtn:setCascadeColorEnabled(true)
longBtn:setCascadeOpacityEnabled(true)
longBtn:setPosition(396.8000, 74.1600)
layout = ccui.LayoutComponent:bindLayoutComponent(longBtn)
layout:setPositionPercentXEnabled(true)
layout:setPositionPercentX(0.3100)
layout:setPositionPercentY(0.1030)
layout:setPercentWidth(0.0492)
layout:setPercentHeight(0.0875)
layout:setSize({width = 63.0000, height = 63.0000})
layout:setVerticalEdge(3)
layout:setLeftMargin(365.3000)
layout:setRightMargin(851.7000)
layout:setTopMargin(614.3400)
layout:setBottomMargin(42.6600)
Scene:addChild(longBtn)

--Create click
local click = ccui.ImageView:create()
click:ignoreContentAdaptWithSize(false)
click:loadTexture("game/LongHuDou/images/hall/selectClick.png",0)
click:setLayoutComponentEnabled(true)
click:setName("click")
click:setTag(129)
click:setCascadeColorEnabled(true)
click:setCascadeOpacityEnabled(true)
click:setPosition(32.0000, 31.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(click)
layout:setPositionPercentX(0.5079)
layout:setPositionPercentY(0.4921)
layout:setPercentWidth(0.5873)
layout:setPercentHeight(0.6349)
layout:setSize({width = 37.0000, height = 40.0000})
layout:setLeftMargin(13.5000)
layout:setRightMargin(12.5000)
layout:setTopMargin(12.0000)
layout:setBottomMargin(11.0000)
longBtn:addChild(click)

--Create exitBtn
local exitBtn = ccui.Button:create()
exitBtn:ignoreContentAdaptWithSize(false)
exitBtn:loadTextureNormal("game/LongHuDou/images/game/but_exit.png",0)
exitBtn:setTitleFontName("")
exitBtn:setTitleFontSize(36)
exitBtn:setTitleColor({r = 229, g = 229, b = 229})
exitBtn:setLayoutComponentEnabled(true)
exitBtn:setName("exitBtn")
exitBtn:setTag(149)
exitBtn:setCascadeColorEnabled(true)
exitBtn:setCascadeOpacityEnabled(true)
exitBtn:setPosition(77.6960, 654.1200)
layout = ccui.LayoutComponent:bindLayoutComponent(exitBtn)
layout:setPositionPercentXEnabled(true)
layout:setPositionPercentX(0.0607)
layout:setPositionPercentY(0.9085)
layout:setPercentWidth(0.0695)
layout:setPercentHeight(0.1361)
layout:setSize({width = 89.0000, height = 98.0000})
layout:setVerticalEdge(3)
layout:setLeftMargin(33.1960)
layout:setRightMargin(1157.8040)
layout:setTopMargin(16.8800)
layout:setBottomMargin(605.1200)
Scene:addChild(exitBtn)

--Create Animation
result['animation'] = ccs.ActionTimeline:create()
  
result['animation']:setDuration(0)
result['animation']:setTimeSpeed(1.0000)
--Create Animation List

result['root'] = Scene
return result;
end

return Result

