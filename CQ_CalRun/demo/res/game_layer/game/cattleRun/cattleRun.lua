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

--Create choice_item
local choice_item = ccui.ImageView:create()
choice_item:ignoreContentAdaptWithSize(false)
choice_item:loadTexture("game/cattleRun/image/choice/baconic.png",0)
choice_item:setLayoutComponentEnabled(true)
choice_item:setName("choice_item")
choice_item:setTag(32)
choice_item:setCascadeColorEnabled(true)
choice_item:setCascadeOpacityEnabled(true)
choice_item:setPosition(-86.0000, 340.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(choice_item)
layout:setPositionPercentX(-0.0672)
layout:setPositionPercentY(0.4722)
layout:setPercentWidth(0.0492)
layout:setPercentHeight(0.1125)
layout:setSize({width = 63.0000, height = 81.0000})
layout:setLeftMargin(-117.5000)
layout:setRightMargin(1334.5000)
layout:setTopMargin(339.5000)
layout:setBottomMargin(299.5000)
Layer:addChild(choice_item)

--Create bg
local bg = ccui.ImageView:create()
bg:ignoreContentAdaptWithSize(false)
bg:loadTexture("game/cattleRun/image/gamebg.png",0)
bg:setLayoutComponentEnabled(true)
bg:setName("bg")
bg:setTag(51)
bg:setCascadeColorEnabled(true)
bg:setCascadeOpacityEnabled(true)
bg:setPosition(640.0000, 360.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(bg)
layout:setPositionPercentXEnabled(true)
layout:setPositionPercentYEnabled(true)
layout:setPositionPercentX(0.5000)
layout:setPositionPercentY(0.5000)
layout:setPercentWidth(1.0000)
layout:setPercentHeight(1.0000)
layout:setSize({width = 1280.0000, height = 720.0000})
layout:setStretchWidthEnabled(true)
layout:setStretchHeightEnabled(true)
Layer:addChild(bg)

--Create headPanel
local headPanel = ccui.Layout:create()
headPanel:ignoreContentAdaptWithSize(false)
headPanel:setClippingEnabled(false)
headPanel:setBackGroundColorOpacity(102)
headPanel:setLayoutComponentEnabled(true)
headPanel:setName("headPanel")
headPanel:setTag(14)
headPanel:setCascadeColorEnabled(true)
headPanel:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(headPanel)
layout:setPositionPercentXEnabled(true)
layout:setPositionPercentYEnabled(true)
layout:setPercentWidth(1.0000)
layout:setPercentHeight(1.0000)
layout:setSize({width = 1280.0000, height = 720.0000})
Layer:addChild(headPanel)

--Create img_xiaoguo1
local img_xiaoguo1 = ccui.ImageView:create()
img_xiaoguo1:ignoreContentAdaptWithSize(false)
img_xiaoguo1:loadTexture("game/cattleRun/image/tx.png",0)
img_xiaoguo1:setLayoutComponentEnabled(true)
img_xiaoguo1:setName("img_xiaoguo1")
img_xiaoguo1:setTag(106)
img_xiaoguo1:setCascadeColorEnabled(true)
img_xiaoguo1:setCascadeOpacityEnabled(true)
img_xiaoguo1:setPosition(638.9999, 360.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(img_xiaoguo1)
layout:setPositionPercentX(0.4992)
layout:setPositionPercentY(0.5000)
layout:setPercentWidth(1.0000)
layout:setPercentHeight(1.0000)
layout:setSize({width = 1280.0000, height = 720.0000})
layout:setLeftMargin(-1.0001)
layout:setRightMargin(1.0001)
Layer:addChild(img_xiaoguo1)

--Create plate
local plate = ccui.ImageView:create()
plate:ignoreContentAdaptWithSize(false)
plate:loadTexture("game/cattleRun/image/plate.png",0)
plate:setLayoutComponentEnabled(true)
plate:setName("plate")
plate:setTag(73)
plate:setCascadeColorEnabled(true)
plate:setCascadeOpacityEnabled(true)
plate:setPosition(642.9285, 94.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(plate)
layout:setPositionPercentX(0.5023)
layout:setPositionPercentY(0.1306)
layout:setPercentWidth(0.1680)
layout:setPercentHeight(0.2597)
layout:setSize({width = 215.0000, height = 187.0000})
layout:setLeftMargin(535.4285)
layout:setRightMargin(529.5715)
layout:setTopMargin(532.5000)
layout:setBottomMargin(0.5000)
Layer:addChild(plate)

--Create img_score
local img_score = ccui.ImageView:create()
img_score:ignoreContentAdaptWithSize(false)
img_score:loadTexture("game/cattleRun/image/zdl_7d207200.png",0)
img_score:setLayoutComponentEnabled(true)
img_score:setName("img_score")
img_score:setTag(38)
img_score:setCascadeColorEnabled(true)
img_score:setCascadeOpacityEnabled(true)
img_score:setVisible(false)
img_score:setAnchorPoint(0.5565, 0.5273)
img_score:setPosition(166.5000, 239.5000)
layout = ccui.LayoutComponent:bindLayoutComponent(img_score)
layout:setPositionPercentX(0.1301)
layout:setPositionPercentY(0.3326)
layout:setPercentWidth(0.2297)
layout:setPercentHeight(0.0944)
layout:setSize({width = 294.0000, height = 68.0000})
layout:setLeftMargin(2.8890)
layout:setRightMargin(983.1110)
layout:setTopMargin(448.3564)
layout:setBottomMargin(203.6436)
Layer:addChild(img_score)

--Create text_score
local text_score = ccui.Text:create()
text_score:ignoreContentAdaptWithSize(true)
text_score:setTextAreaSize({width = 0, height = 0})
text_score:setFontName("")
text_score:setFontSize(35)
text_score:setString([[0]])
text_score:enableOutline({r = 255, g = 0, b = 0, a = 255}, 1)
text_score:setLayoutComponentEnabled(true)
text_score:setName("text_score")
text_score:setTag(73)
text_score:setCascadeColorEnabled(true)
text_score:setCascadeOpacityEnabled(true)
text_score:setAnchorPoint(0.0000, 0.5000)
text_score:setPosition(1112.0590, 222.2376)
text_score:setTextColor({r = 234, g = 181, b = 56})
layout = ccui.LayoutComponent:bindLayoutComponent(text_score)
layout:setPositionPercentX(0.8688)
layout:setPositionPercentY(0.3087)
layout:setPercentWidth(0.0180)
layout:setPercentHeight(0.0611)
layout:setSize({width = 23.0000, height = 44.0000})
layout:setLeftMargin(1112.0590)
layout:setRightMargin(144.9412)
layout:setTopMargin(475.7624)
layout:setBottomMargin(200.2376)
Layer:addChild(text_score)

--Create fallpnl
local fallpnl = ccui.Layout:create()
fallpnl:ignoreContentAdaptWithSize(false)
fallpnl:setClippingEnabled(false)
fallpnl:setBackGroundColorOpacity(102)
fallpnl:setLayoutComponentEnabled(true)
fallpnl:setName("fallpnl")
fallpnl:setTag(75)
fallpnl:setCascadeColorEnabled(true)
fallpnl:setCascadeOpacityEnabled(true)
fallpnl:setPosition(192.0000, 180.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(fallpnl)
layout:setPositionPercentXEnabled(true)
layout:setPositionPercentX(0.1500)
layout:setPositionPercentY(0.2500)
layout:setPercentWidthEnabled(true)
layout:setPercentHeightEnabled(true)
layout:setPercentWidth(0.7000)
layout:setPercentHeight(0.7500)
layout:setSize({width = 896.0000, height = 540.0000})
layout:setVerticalEdge(2)
layout:setLeftMargin(192.0000)
layout:setRightMargin(192.0000)
layout:setBottomMargin(180.0000)
Layer:addChild(fallpnl)

--Create pnl1
local pnl1 = ccui.Layout:create()
pnl1:ignoreContentAdaptWithSize(false)
pnl1:setClippingEnabled(true)
pnl1:setBackGroundColorOpacity(102)
pnl1:setLayoutComponentEnabled(true)
pnl1:setName("pnl1")
pnl1:setTag(188)
pnl1:setCascadeColorEnabled(true)
pnl1:setCascadeOpacityEnabled(true)
pnl1:setPosition(6.9888, 0.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(pnl1)
layout:setPositionPercentX(0.0078)
layout:setPercentWidthEnabled(true)
layout:setPercentHeightEnabled(true)
layout:setPercentWidth(0.3200)
layout:setPercentHeight(1.0000)
layout:setSize({width = 286.7200, height = 540.0000})
layout:setHorizontalEdge(3)
layout:setVerticalEdge(2)
layout:setLeftMargin(6.9888)
layout:setRightMargin(602.2912)
fallpnl:addChild(pnl1)

--Create pnl2
local pnl2 = ccui.Layout:create()
pnl2:ignoreContentAdaptWithSize(false)
pnl2:setClippingEnabled(true)
pnl2:setBackGroundColorOpacity(102)
pnl2:setLayoutComponentEnabled(true)
pnl2:setName("pnl2")
pnl2:setTag(189)
pnl2:setCascadeColorEnabled(true)
pnl2:setCascadeOpacityEnabled(true)
pnl2:setPosition(298.0096, 0.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(pnl2)
layout:setPositionPercentX(0.3326)
layout:setPercentWidthEnabled(true)
layout:setPercentHeightEnabled(true)
layout:setPercentWidth(0.3400)
layout:setPercentHeight(1.0000)
layout:setSize({width = 304.6400, height = 540.0000})
layout:setHorizontalEdge(3)
layout:setVerticalEdge(2)
layout:setLeftMargin(298.0096)
layout:setRightMargin(293.3504)
fallpnl:addChild(pnl2)

--Create pnl3
local pnl3 = ccui.Layout:create()
pnl3:ignoreContentAdaptWithSize(false)
pnl3:setClippingEnabled(true)
pnl3:setBackGroundColorOpacity(102)
pnl3:setLayoutComponentEnabled(true)
pnl3:setName("pnl3")
pnl3:setTag(190)
pnl3:setCascadeColorEnabled(true)
pnl3:setCascadeOpacityEnabled(true)
pnl3:setPosition(604.9792, 0.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(pnl3)
layout:setPositionPercentX(0.6752)
layout:setPercentWidthEnabled(true)
layout:setPercentHeightEnabled(true)
layout:setPercentWidth(0.3200)
layout:setPercentHeight(1.0000)
layout:setSize({width = 286.7200, height = 540.0000})
layout:setHorizontalEdge(3)
layout:setVerticalEdge(2)
layout:setLeftMargin(604.9792)
layout:setRightMargin(4.3008)
fallpnl:addChild(pnl3)

--Create touchpnl
local touchpnl = ccui.Layout:create()
touchpnl:ignoreContentAdaptWithSize(false)
touchpnl:setClippingEnabled(false)
touchpnl:setBackGroundColorOpacity(102)
touchpnl:setTouchEnabled(true);
touchpnl:setLayoutComponentEnabled(true)
touchpnl:setName("touchpnl")
touchpnl:setTag(194)
touchpnl:setCascadeColorEnabled(true)
touchpnl:setCascadeOpacityEnabled(true)
touchpnl:setPosition(0.0000, -1.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(touchpnl)
layout:setPositionPercentY(-0.0014)
layout:setPercentWidth(1.0000)
layout:setPercentHeight(1.0000)
layout:setSize({width = 1280.0000, height = 720.0000})
layout:setTopMargin(1.0000)
layout:setBottomMargin(-1.0000)
Layer:addChild(touchpnl)

--Create btnAttack
local btnAttack = ccui.Button:create()
btnAttack:ignoreContentAdaptWithSize(false)
btnAttack:loadTextureNormal("game/cattleRun/image/jineng.png",0)
btnAttack:setTitleFontSize(14)
btnAttack:setTitleColor({r = 65, g = 65, b = 70})
btnAttack:setLayoutComponentEnabled(true)
btnAttack:setName("btnAttack")
btnAttack:setTag(28)
btnAttack:setCascadeColorEnabled(true)
btnAttack:setCascadeOpacityEnabled(true)
btnAttack:setAnchorPoint(0.5315, 0.4554)
btnAttack:setPosition(1073.0000, 341.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(btnAttack)
layout:setPositionPercentX(0.8383)
layout:setPositionPercentY(0.4736)
layout:setPercentWidth(0.1133)
layout:setPercentHeight(0.2014)
layout:setSize({width = 145.0000, height = 145.0000})
layout:setLeftMargin(995.9325)
layout:setRightMargin(139.0675)
layout:setTopMargin(300.0330)
layout:setBottomMargin(274.9670)
Layer:addChild(btnAttack)

--Create Animation
result['animation'] = ccs.ActionTimeline:create()
  
result['animation']:setDuration(0)
result['animation']:setTimeSpeed(1.0000)
--Create Animation List

result['root'] = Layer
return result;
end

return Result

