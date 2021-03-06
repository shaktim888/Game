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
root:setBackGroundColorType(1)
root:setBackGroundColor({r = 150, g = 200, b = 255})
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
layout:setPercentWidth(1.0000)
layout:setPercentHeight(1.0000)
layout:setSize({width = 573.0000, height = 357.0000})
layout:setLeftMargin(-1.7228)
layout:setRightMargin(1.7228)
layout:setTopMargin(3.6983)
layout:setBottomMargin(-3.6983)
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
context:setPosition(49.1233, 23.9127)
layout = ccui.LayoutComponent:bindLayoutComponent(context)
layout:setPositionPercentX(0.0857)
layout:setPositionPercentY(0.0670)
layout:setPercentWidth(0.8726)
layout:setPercentHeight(0.7283)
layout:setSize({width = 500.0000, height = 260.0000})
layout:setLeftMargin(49.1233)
layout:setRightMargin(23.8767)
layout:setTopMargin(73.0873)
layout:setBottomMargin(23.9127)
root:addChild(context)

--Create text
local text = ccui.Text:create()
text:ignoreContentAdaptWithSize(true)
text:setTextAreaSize({width = 0, height = 0})
text:setFontName("game/LongHuDou/images/font/fish.ttf")
text:setFontSize(50)
text:setString([[Boost your AP OR HP]])
text:setLayoutComponentEnabled(true)
text:setName("text")
text:setTag(242)
text:setCascadeColorEnabled(true)
text:setCascadeOpacityEnabled(true)
text:setPosition(241.2000, 216.3861)
text:setTextColor({r = 59, g = 97, b = 134})
layout = ccui.LayoutComponent:bindLayoutComponent(text)
layout:setPositionPercentX(0.4824)
layout:setPositionPercentY(0.8323)
layout:setPercentWidth(0.8240)
layout:setPercentHeight(0.2269)
layout:setSize({width = 412.0000, height = 59.0000})
layout:setLeftMargin(35.2000)
layout:setRightMargin(52.8000)
layout:setTopMargin(14.1139)
layout:setBottomMargin(186.8861)
context:addChild(text)

--Create btnNo
local btnNo = ccui.Button:create()
btnNo:ignoreContentAdaptWithSize(false)
btnNo:loadTextureNormal("game/LongHuDou/images/popBg/but_no.png",0)
btnNo:setTitleFontSize(14)
btnNo:setTitleColor({r = 65, g = 65, b = 70})
btnNo:setLayoutComponentEnabled(true)
btnNo:setName("btnNo")
btnNo:setTag(244)
btnNo:setCascadeColorEnabled(true)
btnNo:setCascadeOpacityEnabled(true)
btnNo:setPosition(486.2745, 291.7119)
btnNo:setScaleX(0.5000)
btnNo:setScaleY(0.5000)
layout = ccui.LayoutComponent:bindLayoutComponent(btnNo)
layout:setPositionPercentX(0.9725)
layout:setPositionPercentY(1.1220)
layout:setPercentWidth(0.2440)
layout:setPercentHeight(0.4692)
layout:setSize({width = 122.0000, height = 122.0000})
layout:setLeftMargin(425.2745)
layout:setRightMargin(-47.2745)
layout:setTopMargin(-92.7119)
layout:setBottomMargin(230.7119)
context:addChild(btnNo)

--Create btnAddAP
local btnAddAP = ccui.Button:create()
btnAddAP:ignoreContentAdaptWithSize(false)
btnAddAP:loadTextureNormal("Default/Button_Normal.png",0)
btnAddAP:setTitleFontSize(30)
btnAddAP:setTitleText("50")
btnAddAP:setLayoutComponentEnabled(true)
btnAddAP:setName("btnAddAP")
btnAddAP:setTag(269)
btnAddAP:setCascadeColorEnabled(true)
btnAddAP:setCascadeOpacityEnabled(true)
btnAddAP:setPosition(104.0947, 33.5722)
layout = ccui.LayoutComponent:bindLayoutComponent(btnAddAP)
layout:setPositionPercentX(0.2082)
layout:setPositionPercentY(0.1291)
layout:setPercentWidth(0.4500)
layout:setPercentHeight(0.2769)
layout:setSize({width = 225.0000, height = 72.0000})
layout:setLeftMargin(-8.4053)
layout:setRightMargin(283.4053)
layout:setTopMargin(190.4278)
layout:setBottomMargin(-2.4278)
context:addChild(btnAddAP)

--Create textAddAP
local textAddAP = ccui.Text:create()
textAddAP:ignoreContentAdaptWithSize(true)
textAddAP:setTextAreaSize({width = 0, height = 0})
textAddAP:setFontName("game/LongHuDou/images/font/fish.ttf")
textAddAP:setFontSize(30)
textAddAP:setString([[AP:1]])
textAddAP:setLayoutComponentEnabled(true)
textAddAP:setName("textAddAP")
textAddAP:setTag(271)
textAddAP:setCascadeColorEnabled(true)
textAddAP:setCascadeOpacityEnabled(true)
textAddAP:setPosition(81.6335, 150.3693)
layout = ccui.LayoutComponent:bindLayoutComponent(textAddAP)
layout:setPositionPercentX(0.1633)
layout:setPositionPercentY(0.5783)
layout:setPercentWidth(0.0940)
layout:setPercentHeight(0.1346)
layout:setSize({width = 47.0000, height = 35.0000})
layout:setLeftMargin(58.1335)
layout:setRightMargin(394.8665)
layout:setTopMargin(92.1307)
layout:setBottomMargin(132.8693)
context:addChild(textAddAP)

--Create btnAddHP
local btnAddHP = ccui.Button:create()
btnAddHP:ignoreContentAdaptWithSize(false)
btnAddHP:loadTextureNormal("Default/Button_Normal.png",0)
btnAddHP:setTitleFontSize(30)
btnAddHP:setTitleText("50")
btnAddHP:setLayoutComponentEnabled(true)
btnAddHP:setName("btnAddHP")
btnAddHP:setTag(274)
btnAddHP:setCascadeColorEnabled(true)
btnAddHP:setCascadeOpacityEnabled(true)
btnAddHP:setPosition(365.6570, 30.7618)
layout = ccui.LayoutComponent:bindLayoutComponent(btnAddHP)
layout:setPositionPercentX(0.7313)
layout:setPositionPercentY(0.1183)
layout:setPercentWidth(0.4500)
layout:setPercentHeight(0.2769)
layout:setSize({width = 225.0000, height = 72.0000})
layout:setLeftMargin(253.1570)
layout:setRightMargin(21.8430)
layout:setTopMargin(193.2382)
layout:setBottomMargin(-5.2382)
context:addChild(btnAddHP)

--Create textAddHP
local textAddHP = ccui.Text:create()
textAddHP:ignoreContentAdaptWithSize(true)
textAddHP:setTextAreaSize({width = 0, height = 0})
textAddHP:setFontName("game/LongHuDou/images/font/fish.ttf")
textAddHP:setFontSize(30)
textAddHP:setString([[HP:1]])
textAddHP:setLayoutComponentEnabled(true)
textAddHP:setName("textAddHP")
textAddHP:setTag(275)
textAddHP:setCascadeColorEnabled(true)
textAddHP:setCascadeOpacityEnabled(true)
textAddHP:setPosition(366.8730, 158.3555)
layout = ccui.LayoutComponent:bindLayoutComponent(textAddHP)
layout:setPositionPercentX(0.7337)
layout:setPositionPercentY(0.6091)
layout:setPercentWidth(0.0980)
layout:setPercentHeight(0.1346)
layout:setSize({width = 49.0000, height = 35.0000})
layout:setLeftMargin(342.3730)
layout:setRightMargin(108.6270)
layout:setTopMargin(84.1445)
layout:setBottomMargin(140.8555)
context:addChild(textAddHP)

--Create Animation
result['animation'] = ccs.ActionTimeline:create()
  
result['animation']:setDuration(0)
result['animation']:setTimeSpeed(1.0000)
--Create Animation List

result['root'] = Layer
return result;
end

return Result

