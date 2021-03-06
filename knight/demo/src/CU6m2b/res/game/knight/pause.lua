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

--Create shade
local shade = ccui.Layout:create()
shade:ignoreContentAdaptWithSize(false)
shade:setClippingEnabled(false)
shade:setBackGroundColorOpacity(102)
shade:setTouchEnabled(true);
shade:setLayoutComponentEnabled(true)
shade:setName("shade")
shade:setTag(93)
shade:setCascadeColorEnabled(true)
shade:setCascadeOpacityEnabled(true)
shade:setAnchorPoint(0.5000, 0.5000)
shade:setPosition(370.6628, 620.0426)
layout = ccui.LayoutComponent:bindLayoutComponent(shade)
layout:setPositionPercentX(0.5148)
layout:setPositionPercentY(0.4844)
layout:setPercentWidth(2.7778)
layout:setPercentHeight(1.1719)
layout:setSize({width = 2000.0000, height = 1500.0000})
layout:setLeftMargin(-629.3372)
layout:setRightMargin(-650.6628)
layout:setTopMargin(-90.0426)
layout:setBottomMargin(-129.9574)
Layer:addChild(shade)

--Create TopPanel
local TopPanel = ccui.Layout:create()
TopPanel:ignoreContentAdaptWithSize(false)
TopPanel:setClippingEnabled(false)
TopPanel:setBackGroundColorType(1)
TopPanel:setBackGroundColor({r = 150, g = 200, b = 255})
TopPanel:setBackGroundColorOpacity(102)
TopPanel:setTouchEnabled(true);
TopPanel:setLayoutComponentEnabled(true)
TopPanel:setName("TopPanel")
TopPanel:setTag(27)
TopPanel:setCascadeColorEnabled(true)
TopPanel:setCascadeOpacityEnabled(true)
TopPanel:setAnchorPoint(0.5000, 0.5000)
TopPanel:setPosition(360.0000, 640.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(TopPanel)
layout:setPositionPercentX(0.5000)
layout:setPositionPercentY(0.5000)
layout:setPercentWidthEnabled(true)
layout:setPercentHeightEnabled(true)
layout:setPercentWidth(1.0000)
layout:setPercentHeight(1.0000)
layout:setSize({width = 720.0000, height = 1280.0000})
layout:setHorizontalEdge(3)
layout:setVerticalEdge(3)
Layer:addChild(TopPanel)

--Create bg2_1
local bg2_1 = cc.Sprite:create("game/knight/images/bg2.png")
bg2_1:setName("bg2_1")
bg2_1:setTag(61)
bg2_1:setCascadeColorEnabled(true)
bg2_1:setCascadeOpacityEnabled(true)
bg2_1:setVisible(false)
bg2_1:setPosition(362.8839, 609.7494)
layout = ccui.LayoutComponent:bindLayoutComponent(bg2_1)
layout:setPositionPercentX(0.5040)
layout:setPositionPercentY(0.4764)
layout:setPercentWidth(0.5528)
layout:setPercentHeight(0.3336)
layout:setSize({width = 398.0000, height = 427.0000})
layout:setLeftMargin(163.8839)
layout:setRightMargin(158.1161)
layout:setTopMargin(456.7506)
layout:setBottomMargin(396.2494)
bg2_1:setBlendFunc({src = 1, dst = 771})
TopPanel:addChild(bg2_1)

--Create Image_1
local Image_1 = ccui.ImageView:create()
Image_1:ignoreContentAdaptWithSize(false)
Image_1:loadTexture("game/knight/images/bg2.png",0)
Image_1:setLayoutComponentEnabled(true)
Image_1:setName("Image_1")
Image_1:setTag(62)
Image_1:setCascadeColorEnabled(true)
Image_1:setCascadeOpacityEnabled(true)
Image_1:setPosition(355.0135, 611.0914)
layout = ccui.LayoutComponent:bindLayoutComponent(Image_1)
layout:setPositionPercentX(0.4931)
layout:setPositionPercentY(0.4774)
layout:setPercentWidth(0.5528)
layout:setPercentHeight(0.3336)
layout:setSize({width = 398.0000, height = 427.0000})
layout:setLeftMargin(156.0135)
layout:setRightMargin(165.9865)
layout:setTopMargin(455.4086)
layout:setBottomMargin(397.5914)
TopPanel:addChild(Image_1)

--Create Panel_2
local Panel_2 = ccui.Layout:create()
Panel_2:ignoreContentAdaptWithSize(false)
Panel_2:setClippingEnabled(false)
Panel_2:setBackGroundColorOpacity(102)
Panel_2:setLayoutComponentEnabled(true)
Panel_2:setName("Panel_2")
Panel_2:setTag(40)
Panel_2:setCascadeColorEnabled(true)
Panel_2:setCascadeOpacityEnabled(true)
Panel_2:setAnchorPoint(0.5000, 0.5000)
Panel_2:setPosition(362.1600, 640.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(Panel_2)
layout:setPositionPercentX(0.5030)
layout:setPositionPercentY(0.5000)
layout:setPercentWidth(1.0000)
layout:setPercentHeight(0.3906)
layout:setSize({width = 720.0000, height = 500.0000})
layout:setHorizontalEdge(3)
layout:setVerticalEdge(3)
layout:setLeftMargin(2.1600)
layout:setRightMargin(-2.1600)
layout:setTopMargin(390.0000)
layout:setBottomMargin(390.0000)
TopPanel:addChild(Panel_2)

--Create continueBtn
local continueBtn = ccui.Button:create()
continueBtn:ignoreContentAdaptWithSize(false)
continueBtn:loadTextureNormal("game/knight/images/btn.png",0)
continueBtn:setTitleFontName("game/knight/images/font.ttf")
continueBtn:setTitleFontSize(36)
continueBtn:setTitleText("continue")
continueBtn:setTitleColor({r = 26, g = 26, b = 26})
continueBtn:setLayoutComponentEnabled(true)
continueBtn:setName("continueBtn")
continueBtn:setTag(29)
continueBtn:setCascadeColorEnabled(true)
continueBtn:setCascadeOpacityEnabled(true)
continueBtn:setPosition(344.7438, 329.9232)
layout = ccui.LayoutComponent:bindLayoutComponent(continueBtn)
layout:setPositionPercentX(0.4788)
layout:setPositionPercentY(0.6598)
layout:setPercentWidth(0.2778)
layout:setPercentHeight(0.1400)
layout:setSize({width = 200.0000, height = 70.0000})
layout:setLeftMargin(244.7438)
layout:setRightMargin(275.2562)
layout:setTopMargin(135.0768)
layout:setBottomMargin(294.9232)
Panel_2:addChild(continueBtn)

--Create musicBtn
local musicBtn = ccui.Button:create()
musicBtn:ignoreContentAdaptWithSize(false)
musicBtn:loadTextureNormal("game/knight/images/btn.png",0)
musicBtn:setTitleFontName("game/knight/images/font.ttf")
musicBtn:setTitleFontSize(36)
musicBtn:setTitleText("Sound:on")
musicBtn:setTitleColor({r = 26, g = 26, b = 26})
musicBtn:setTouchEnabled(false);
musicBtn:setLayoutComponentEnabled(true)
musicBtn:setName("musicBtn")
musicBtn:setTag(30)
musicBtn:setCascadeColorEnabled(true)
musicBtn:setCascadeOpacityEnabled(true)
musicBtn:setVisible(false)
musicBtn:setPosition(347.2015, 258.7650)
layout = ccui.LayoutComponent:bindLayoutComponent(musicBtn)
layout:setPositionPercentX(0.4822)
layout:setPositionPercentY(0.5175)
layout:setPercentWidth(0.2778)
layout:setPercentHeight(0.1400)
layout:setSize({width = 200.0000, height = 70.0000})
layout:setLeftMargin(247.2015)
layout:setRightMargin(272.7985)
layout:setTopMargin(206.2350)
layout:setBottomMargin(223.7650)
Panel_2:addChild(musicBtn)

--Create restartBtn
local restartBtn = ccui.Button:create()
restartBtn:ignoreContentAdaptWithSize(false)
restartBtn:loadTextureNormal("game/knight/images/btn.png",0)
restartBtn:setTitleFontName("game/knight/images/font.ttf")
restartBtn:setTitleFontSize(36)
restartBtn:setTitleText("again")
restartBtn:setTitleColor({r = 26, g = 26, b = 26})
restartBtn:setLayoutComponentEnabled(true)
restartBtn:setName("restartBtn")
restartBtn:setTag(31)
restartBtn:setCascadeColorEnabled(true)
restartBtn:setCascadeOpacityEnabled(true)
restartBtn:setPosition(344.7438, 93.4576)
layout = ccui.LayoutComponent:bindLayoutComponent(restartBtn)
layout:setPositionPercentX(0.4788)
layout:setPositionPercentY(0.1869)
layout:setPercentWidth(0.2778)
layout:setPercentHeight(0.1400)
layout:setSize({width = 200.0000, height = 70.0000})
layout:setLeftMargin(244.7438)
layout:setRightMargin(275.2562)
layout:setTopMargin(371.5424)
layout:setBottomMargin(58.4576)
Panel_2:addChild(restartBtn)

--Create homeBtn
local homeBtn = ccui.Button:create()
homeBtn:ignoreContentAdaptWithSize(false)
homeBtn:loadTextureNormal("game/knight/images/btn.png",0)
homeBtn:setTitleFontName("game/knight/images/font.ttf")
homeBtn:setTitleFontSize(36)
homeBtn:setTitleText("exit")
homeBtn:setTitleColor({r = 26, g = 26, b = 26})
homeBtn:setLayoutComponentEnabled(true)
homeBtn:setName("homeBtn")
homeBtn:setTag(33)
homeBtn:setCascadeColorEnabled(true)
homeBtn:setCascadeOpacityEnabled(true)
homeBtn:setPosition(344.7438, 205.6274)
layout = ccui.LayoutComponent:bindLayoutComponent(homeBtn)
layout:setPositionPercentX(0.4788)
layout:setPositionPercentY(0.4113)
layout:setPercentWidth(0.2778)
layout:setPercentHeight(0.1400)
layout:setSize({width = 200.0000, height = 70.0000})
layout:setLeftMargin(244.7438)
layout:setRightMargin(275.2562)
layout:setTopMargin(259.3726)
layout:setBottomMargin(170.6274)
Panel_2:addChild(homeBtn)

--Create Animation
result['animation'] = ccs.ActionTimeline:create()
  
result['animation']:setDuration(0)
result['animation']:setTimeSpeed(1.0000)
--Create Animation List

result['root'] = Layer
return result;
end

return Result

