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
layout:setSize({width = 720.0000, height = 1280.0000})

--Create PopBG_1
local PopBG_1 = cc.Sprite:create("game/chuangchuang/images/PopBG.png")
PopBG_1:setName("PopBG_1")
PopBG_1:setTag(38)
PopBG_1:setCascadeColorEnabled(true)
PopBG_1:setCascadeOpacityEnabled(true)
PopBG_1:setPosition(376.0000, 851.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(PopBG_1)
layout:setPositionPercentX(0.5222)
layout:setPositionPercentY(0.6648)
layout:setPercentWidth(0.8431)
layout:setPercentHeight(0.2836)
layout:setSize({width = 607.0000, height = 363.0000})
layout:setLeftMargin(72.5000)
layout:setRightMargin(40.5000)
layout:setTopMargin(247.5000)
layout:setBottomMargin(669.5000)
PopBG_1:setBlendFunc({src = 1, dst = 771})
Layer:addChild(PopBG_1)

--Create Panel_3
local Panel_3 = ccui.Layout:create()
Panel_3:ignoreContentAdaptWithSize(false)
Panel_3:setClippingEnabled(false)
Panel_3:setBackGroundColorOpacity(102)
Panel_3:setLayoutComponentEnabled(true)
Panel_3:setName("Panel_3")
Panel_3:setTag(81)
Panel_3:setCascadeColorEnabled(true)
Panel_3:setCascadeOpacityEnabled(true)
Panel_3:setAnchorPoint(0.5000, 0.5000)
Panel_3:setPosition(362.0160, 753.0240)
layout = ccui.LayoutComponent:bindLayoutComponent(Panel_3)
layout:setPositionPercentX(0.5028)
layout:setPositionPercentY(0.5883)
layout:setPercentWidth(0.6250)
layout:setPercentHeight(0.1563)
layout:setSize({width = 450.0000, height = 200.0000})
layout:setHorizontalEdge(3)
layout:setVerticalEdge(3)
layout:setLeftMargin(137.0160)
layout:setRightMargin(132.9840)
layout:setTopMargin(426.9760)
layout:setBottomMargin(653.0240)
Layer:addChild(Panel_3)

--Create Text_1_0_0
local Text_1_0_0 = ccui.Text:create()
Text_1_0_0:ignoreContentAdaptWithSize(true)
Text_1_0_0:setTextAreaSize({width = 0, height = 0})
Text_1_0_0:setFontName("game/chuangchuang/images/hwxk.ttf")
Text_1_0_0:setFontSize(70)
Text_1_0_0:setString([[GAME OVER]])
Text_1_0_0:setLayoutComponentEnabled(true)
Text_1_0_0:setName("Text_1_0_0")
Text_1_0_0:setTag(42)
Text_1_0_0:setCascadeColorEnabled(true)
Text_1_0_0:setCascadeOpacityEnabled(true)
Text_1_0_0:setPosition(225.0000, 286.8022)
Text_1_0_0:setTextColor({r = 255, g = 0, b = 0})
layout = ccui.LayoutComponent:bindLayoutComponent(Text_1_0_0)
layout:setPositionPercentXEnabled(true)
layout:setPositionPercentX(0.5000)
layout:setPositionPercentY(1.4340)
layout:setPercentWidth(0.8222)
layout:setPercentHeight(0.3800)
layout:setSize({width = 370.0000, height = 76.0000})
layout:setLeftMargin(40.0000)
layout:setRightMargin(40.0000)
layout:setTopMargin(-124.8022)
layout:setBottomMargin(248.8022)
Panel_3:addChild(Text_1_0_0)

--Create Text_1_0
local Text_1_0 = ccui.Text:create()
Text_1_0:ignoreContentAdaptWithSize(true)
Text_1_0:setTextAreaSize({width = 0, height = 0})
Text_1_0:setFontName("game/chuangchuang/images/hwxk.ttf")
Text_1_0:setFontSize(40)
Text_1_0:setString([[BEST:]])
Text_1_0:setLayoutComponentEnabled(true)
Text_1_0:setName("Text_1_0")
Text_1_0:setTag(59)
Text_1_0:setCascadeColorEnabled(true)
Text_1_0:setCascadeOpacityEnabled(true)
Text_1_0:setPosition(166.0000, 151.3917)
Text_1_0:setTextColor({r = 255, g = 255, b = 0})
layout = ccui.LayoutComponent:bindLayoutComponent(Text_1_0)
layout:setPositionPercentX(0.3689)
layout:setPositionPercentY(0.7570)
layout:setPercentWidth(0.2444)
layout:setPercentHeight(0.2200)
layout:setSize({width = 110.0000, height = 44.0000})
layout:setLeftMargin(111.0000)
layout:setRightMargin(229.0000)
layout:setTopMargin(26.6083)
layout:setBottomMargin(129.3917)
Panel_3:addChild(Text_1_0)

--Create txtHighest
local txtHighest = ccui.Text:create()
txtHighest:ignoreContentAdaptWithSize(true)
txtHighest:setTextAreaSize({width = 0, height = 0})
txtHighest:setFontName("game/chuangchuang/images/hwxk.ttf")
txtHighest:setFontSize(40)
txtHighest:setString([[199]])
txtHighest:setLayoutComponentEnabled(true)
txtHighest:setName("txtHighest")
txtHighest:setTag(78)
txtHighest:setCascadeColorEnabled(true)
txtHighest:setCascadeOpacityEnabled(true)
txtHighest:setAnchorPoint(0.0000, 0.5000)
txtHighest:setPosition(267.8344, 151.3917)
txtHighest:setTextColor({r = 255, g = 255, b = 0})
layout = ccui.LayoutComponent:bindLayoutComponent(txtHighest)
layout:setPositionPercentX(0.5952)
layout:setPositionPercentY(0.7570)
layout:setPercentWidth(0.1178)
layout:setPercentHeight(0.2200)
layout:setSize({width = 53.0000, height = 44.0000})
layout:setLeftMargin(267.8344)
layout:setRightMargin(129.1656)
layout:setTopMargin(26.6083)
layout:setBottomMargin(129.3917)
Panel_3:addChild(txtHighest)

--Create Text_1_0_1
local Text_1_0_1 = ccui.Text:create()
Text_1_0_1:ignoreContentAdaptWithSize(true)
Text_1_0_1:setTextAreaSize({width = 0, height = 0})
Text_1_0_1:setFontName("game/chuangchuang/images/hwxk.ttf")
Text_1_0_1:setFontSize(40)
Text_1_0_1:setString([[SCORE: ]])
Text_1_0_1:setLayoutComponentEnabled(true)
Text_1_0_1:setName("Text_1_0_1")
Text_1_0_1:setTag(79)
Text_1_0_1:setCascadeColorEnabled(true)
Text_1_0_1:setCascadeOpacityEnabled(true)
Text_1_0_1:setPosition(168.0000, 86.5002)
Text_1_0_1:setTextColor({r = 255, g = 103, b = 0})
layout = ccui.LayoutComponent:bindLayoutComponent(Text_1_0_1)
layout:setPositionPercentX(0.3733)
layout:setPositionPercentY(0.4325)
layout:setPercentWidth(0.3067)
layout:setPercentHeight(0.2200)
layout:setSize({width = 138.0000, height = 44.0000})
layout:setLeftMargin(99.0000)
layout:setRightMargin(213.0000)
layout:setTopMargin(91.4998)
layout:setBottomMargin(64.5002)
Panel_3:addChild(Text_1_0_1)

--Create txtScore
local txtScore = ccui.Text:create()
txtScore:ignoreContentAdaptWithSize(true)
txtScore:setTextAreaSize({width = 0, height = 0})
txtScore:setFontName("game/chuangchuang/images/hwxk.ttf")
txtScore:setFontSize(40)
txtScore:setString([[199]])
txtScore:setLayoutComponentEnabled(true)
txtScore:setName("txtScore")
txtScore:setTag(80)
txtScore:setCascadeColorEnabled(true)
txtScore:setCascadeOpacityEnabled(true)
txtScore:setAnchorPoint(0.0000, 0.5000)
txtScore:setPosition(269.5682, 86.5002)
txtScore:setTextColor({r = 255, g = 103, b = 0})
layout = ccui.LayoutComponent:bindLayoutComponent(txtScore)
layout:setPositionPercentX(0.5990)
layout:setPositionPercentY(0.4325)
layout:setPercentWidth(0.1178)
layout:setPercentHeight(0.2200)
layout:setSize({width = 53.0000, height = 44.0000})
layout:setLeftMargin(269.5682)
layout:setRightMargin(127.4318)
layout:setTopMargin(91.4998)
layout:setBottomMargin(64.5002)
Panel_3:addChild(txtScore)

--Create win
local win = ccui.Text:create()
win:ignoreContentAdaptWithSize(true)
win:setTextAreaSize({width = 0, height = 0})
win:setFontName("game/chuangchuang/images/hwxk.ttf")
win:setFontSize(60)
win:setString([[congratulate]])
win:setLayoutComponentEnabled(true)
win:setName("win")
win:setTag(82)
win:setCascadeColorEnabled(true)
win:setCascadeOpacityEnabled(true)
win:setPosition(225.0000, 219.0000)
win:setTextColor({r = 139, g = 105, b = 20})
layout = ccui.LayoutComponent:bindLayoutComponent(win)
layout:setPositionPercentXEnabled(true)
layout:setPositionPercentX(0.5000)
layout:setPositionPercentY(1.0950)
layout:setPercentWidth(0.5267)
layout:setPercentHeight(0.3250)
layout:setSize({width = 237.0000, height = 65.0000})
layout:setLeftMargin(106.5000)
layout:setRightMargin(106.5000)
layout:setTopMargin(-51.5000)
layout:setBottomMargin(186.5000)
Panel_3:addChild(win)

--Create btnRetry
local btnRetry = ccui.Button:create()
btnRetry:ignoreContentAdaptWithSize(false)
btnRetry:loadTextureNormal("game/chuangchuang/images/btn.png",0)
btnRetry:setTitleFontName("game/chuangchuang/images/hwxk.ttf")
btnRetry:setTitleFontSize(35)
btnRetry:setTitleText("restart")
btnRetry:setTitleColor({r = 26, g = 26, b = 26})
btnRetry:setLayoutComponentEnabled(true)
btnRetry:setName("btnRetry")
btnRetry:setTag(61)
btnRetry:setCascadeColorEnabled(true)
btnRetry:setCascadeOpacityEnabled(true)
btnRetry:setPosition(370.0080, 381.9520)
layout = ccui.LayoutComponent:bindLayoutComponent(btnRetry)
layout:setPositionPercentX(0.5139)
layout:setPositionPercentY(0.2984)
layout:setPercentWidth(0.3222)
layout:setPercentHeight(0.0742)
layout:setSize({width = 232.0000, height = 95.0000})
layout:setHorizontalEdge(3)
layout:setVerticalEdge(3)
layout:setLeftMargin(254.0080)
layout:setRightMargin(233.9920)
layout:setTopMargin(850.5480)
layout:setBottomMargin(334.4520)
Layer:addChild(btnRetry)

--Create btnBack
local btnBack = ccui.Button:create()
btnBack:ignoreContentAdaptWithSize(false)
btnBack:loadTextureNormal("game/chuangchuang/images/fanhui.png",0)
btnBack:setTitleFontSize(14)
btnBack:setTitleColor({r = 65, g = 65, b = 70})
btnBack:setLayoutComponentEnabled(true)
btnBack:setName("btnBack")
btnBack:setTag(63)
btnBack:setCascadeColorEnabled(true)
btnBack:setCascadeOpacityEnabled(true)
btnBack:setPosition(61.4893, 1220.2580)
layout = ccui.LayoutComponent:bindLayoutComponent(btnBack)
layout:setPositionPercentX(0.0854)
layout:setPositionPercentY(0.9533)
layout:setPercentWidth(0.1139)
layout:setPercentHeight(0.0617)
layout:setSize({width = 82.0000, height = 79.0000})
layout:setHorizontalEdge(1)
layout:setVerticalEdge(2)
layout:setLeftMargin(20.4893)
layout:setRightMargin(617.5107)
layout:setTopMargin(20.2418)
layout:setBottomMargin(1180.7580)
Layer:addChild(btnBack)

--Create Animation
result['animation'] = ccs.ActionTimeline:create()
  
result['animation']:setDuration(0)
result['animation']:setTimeSpeed(1.0000)
--Create Animation List

result['root'] = Layer
return result;
end

return Result

