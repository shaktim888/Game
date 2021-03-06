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

--Create Layer
local Layer=cc.Node:create()
Layer:setName("Layer")
layout = ccui.LayoutComponent:bindLayoutComponent(Layer)
layout:setSize({width = 1280.0000, height = 720.0000})

--Create root
local root = ccui.Layout:create()
root:ignoreContentAdaptWithSize(false)
root:setClippingEnabled(false)
root:setBackGroundColorOpacity(102)
root:setTouchEnabled(true);
root:setLayoutComponentEnabled(true)
root:setName("root")
root:setTag(133)
root:setCascadeColorEnabled(true)
root:setCascadeOpacityEnabled(true)
root:setAnchorPoint(0.5000, 0.5000)
root:setPosition(640.0000, 360.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(root)
layout:setPositionPercentXEnabled(true)
layout:setPositionPercentYEnabled(true)
layout:setPositionPercentX(0.5000)
layout:setPositionPercentY(0.5000)
layout:setPercentWidth(0.4477)
layout:setPercentHeight(0.4958)
layout:setSize({width = 573.0000, height = 357.0000})
layout:setLeftMargin(353.5000)
layout:setRightMargin(353.5000)
layout:setTopMargin(181.5000)
layout:setBottomMargin(181.5000)
Layer:addChild(root)

--Create bg
local bg = ccui.ImageView:create()
bg:ignoreContentAdaptWithSize(false)
bg:loadTexture("game/LongHuDou/images/popBg/msg_box.png",0)
bg:setLayoutComponentEnabled(true)
bg:setName("bg")
bg:setTag(223)
bg:setCascadeColorEnabled(true)
bg:setCascadeOpacityEnabled(true)
bg:setPosition(284.7772, 174.8017)
layout = ccui.LayoutComponent:bindLayoutComponent(bg)
layout:setPositionPercentX(0.4970)
layout:setPositionPercentY(0.4896)
layout:setPercentWidth(1.2408)
layout:setPercentHeight(1.3221)
layout:setSize({width = 711.0000, height = 472.0000})
layout:setLeftMargin(-70.7228)
layout:setRightMargin(-67.2772)
layout:setTopMargin(-53.8017)
layout:setBottomMargin(-61.1983)
root:addChild(bg)

--Create context
local context = ccui.Layout:create()
context:ignoreContentAdaptWithSize(false)
context:setClippingEnabled(false)
context:setBackGroundColorOpacity(102)
context:setLayoutComponentEnabled(true)
context:setName("context")
context:setTag(241)
context:setCascadeColorEnabled(true)
context:setCascadeOpacityEnabled(true)
context:setPosition(49.1230, 23.9124)
layout = ccui.LayoutComponent:bindLayoutComponent(context)
layout:setPositionPercentX(0.0857)
layout:setPositionPercentY(0.0670)
layout:setPercentWidth(0.8726)
layout:setPercentHeight(0.7283)
layout:setSize({width = 500.0000, height = 260.0000})
layout:setLeftMargin(49.1230)
layout:setRightMargin(23.8770)
layout:setTopMargin(73.0876)
layout:setBottomMargin(23.9124)
root:addChild(context)

--Create text
local text = ccui.Text:create()
text:ignoreContentAdaptWithSize(true)
text:setTextAreaSize({width = 0, height = 0})
text:setFontName("game/LongHuDou/images/font/fish.ttf")
text:setFontSize(50)
text:setString([[Are You Sure ?]])
text:setLayoutComponentEnabled(true)
text:setName("text")
text:setTag(242)
text:setCascadeColorEnabled(true)
text:setCascadeOpacityEnabled(true)
text:setPosition(241.1998, 216.3861)
text:setTextColor({r = 59, g = 97, b = 134})
layout = ccui.LayoutComponent:bindLayoutComponent(text)
layout:setPositionPercentX(0.4824)
layout:setPositionPercentY(0.8323)
layout:setPercentWidth(0.5940)
layout:setPercentHeight(0.2269)
layout:setSize({width = 297.0000, height = 59.0000})
layout:setLeftMargin(92.6998)
layout:setRightMargin(110.3002)
layout:setTopMargin(14.1139)
layout:setBottomMargin(186.8861)
context:addChild(text)

--Create btnYes
local btnYes = ccui.Button:create()
btnYes:ignoreContentAdaptWithSize(false)
btnYes:loadTextureNormal("game/LongHuDou/images/popBg/but_yes.png",0)
btnYes:setTitleFontName("game/LongHuDou/images/font/fish.ttf")
btnYes:setTitleFontSize(50)
btnYes:setTitleText("Yes")
btnYes:setTitleColor({r = 229, g = 229, b = 229})
btnYes:setLayoutComponentEnabled(true)
btnYes:setName("btnYes")
btnYes:setTag(243)
btnYes:setCascadeColorEnabled(true)
btnYes:setCascadeOpacityEnabled(true)
btnYes:setPosition(98.7436, 37.2897)
layout = ccui.LayoutComponent:bindLayoutComponent(btnYes)
layout:setPositionPercentX(0.1975)
layout:setPositionPercentY(0.1434)
layout:setPercentWidth(0.4340)
layout:setPercentHeight(0.3231)
layout:setSize({width = 217.0000, height = 84.0000})
layout:setLeftMargin(-9.7564)
layout:setRightMargin(292.7564)
layout:setTopMargin(180.7103)
layout:setBottomMargin(-4.7103)
context:addChild(btnYes)

--Create btnNo
local btnNo = ccui.Button:create()
btnNo:ignoreContentAdaptWithSize(false)
btnNo:loadTextureNormal("game/LongHuDou/images/popBg/but_no.png",0)
btnNo:setTitleFontName("game/LongHuDou/images/font/fish.ttf")
btnNo:setTitleFontSize(50)
btnNo:setTitleText("No")
btnNo:setTitleColor({r = 229, g = 229, b = 229})
btnNo:setLayoutComponentEnabled(true)
btnNo:setName("btnNo")
btnNo:setTag(244)
btnNo:setCascadeColorEnabled(true)
btnNo:setCascadeOpacityEnabled(true)
btnNo:setPosition(374.8672, 37.2903)
layout = ccui.LayoutComponent:bindLayoutComponent(btnNo)
layout:setPositionPercentX(0.7497)
layout:setPositionPercentY(0.1434)
layout:setPercentWidth(0.4340)
layout:setPercentHeight(0.3231)
layout:setSize({width = 217.0000, height = 84.0000})
layout:setLeftMargin(266.3672)
layout:setRightMargin(16.6328)
layout:setTopMargin(180.7097)
layout:setBottomMargin(-4.7097)
context:addChild(btnNo)

--Create btnRestart
local btnRestart = ccui.Button:create()
btnRestart:ignoreContentAdaptWithSize(false)
btnRestart:loadTextureNormal("game/LongHuDou/images/popBg/but_restart.png",0)
btnRestart:setTitleFontSize(14)
btnRestart:setTitleColor({r = 65, g = 65, b = 70})
btnRestart:setLayoutComponentEnabled(true)
btnRestart:setName("btnRestart")
btnRestart:setTag(127)
btnRestart:setCascadeColorEnabled(true)
btnRestart:setCascadeOpacityEnabled(true)
btnRestart:setPosition(420.1483, 50.6269)
layout = ccui.LayoutComponent:bindLayoutComponent(btnRestart)
layout:setPositionPercentX(0.8403)
layout:setPositionPercentY(0.1947)
layout:setPercentWidth(0.2720)
layout:setPercentHeight(0.5808)
layout:setSize({width = 136.0000, height = 151.0000})
layout:setLeftMargin(352.1483)
layout:setRightMargin(11.8517)
layout:setTopMargin(133.8731)
layout:setBottomMargin(-24.8731)
context:addChild(btnRestart)

--Create btnHome
local btnHome = ccui.Button:create()
btnHome:ignoreContentAdaptWithSize(false)
btnHome:loadTextureNormal("game/LongHuDou/images/popBg/but_home.png",0)
btnHome:setTitleFontSize(14)
btnHome:setTitleColor({r = 65, g = 65, b = 70})
btnHome:setLayoutComponentEnabled(true)
btnHome:setName("btnHome")
btnHome:setTag(126)
btnHome:setCascadeColorEnabled(true)
btnHome:setCascadeOpacityEnabled(true)
btnHome:setPosition(44.0264, 43.6270)
layout = ccui.LayoutComponent:bindLayoutComponent(btnHome)
layout:setPositionPercentX(0.0881)
layout:setPositionPercentY(0.1678)
layout:setPercentWidth(0.2740)
layout:setPercentHeight(0.5808)
layout:setSize({width = 137.0000, height = 151.0000})
layout:setLeftMargin(-24.4736)
layout:setRightMargin(387.4736)
layout:setTopMargin(140.8730)
layout:setBottomMargin(-31.8730)
context:addChild(btnHome)

--Create btnNext
local btnNext = ccui.Button:create()
btnNext:ignoreContentAdaptWithSize(false)
btnNext:loadTextureNormal("game/LongHuDou/images/game/but_continue.png",0)
btnNext:setTitleFontSize(14)
btnNext:setTitleColor({r = 65, g = 65, b = 70})
btnNext:setLayoutComponentEnabled(true)
btnNext:setName("btnNext")
btnNext:setTag(131)
btnNext:setCascadeColorEnabled(true)
btnNext:setCascadeOpacityEnabled(true)
btnNext:setPosition(426.1412, 50.3443)
layout = ccui.LayoutComponent:bindLayoutComponent(btnNext)
layout:setPositionPercentX(0.8523)
layout:setPositionPercentY(0.1936)
layout:setPercentWidth(0.2740)
layout:setPercentHeight(0.5808)
layout:setSize({width = 137.0000, height = 151.0000})
layout:setLeftMargin(357.6412)
layout:setRightMargin(5.3588)
layout:setTopMargin(134.1557)
layout:setBottomMargin(-25.1557)
context:addChild(btnNext)

--Create Animation
result['animation'] = ccs.ActionTimeline:create()
  
result['animation']:setDuration(0)
result['animation']:setTimeSpeed(1.0000)
--Create Animation List

result['root'] = Layer
return result;
end

return Result

