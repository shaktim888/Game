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

--Create bg
local bg = ccui.ImageView:create()
bg:ignoreContentAdaptWithSize(false)
bg:loadTexture("game/bg.png",0)
bg:setLayoutComponentEnabled(true)
bg:setName("bg")
bg:setTag(365)
bg:setCascadeColorEnabled(true)
bg:setCascadeOpacityEnabled(true)
bg:setPosition(640.0000, 360.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(bg)
layout:setPositionPercentX(0.5000)
layout:setPositionPercentY(0.5000)
layout:setPercentWidth(1.0000)
layout:setPercentHeight(1.0000)
layout:setSize({width = 1280.0000, height = 720.0000})
Layer:addChild(bg)

--Create img_head
local img_head = ccui.ImageView:create()
img_head:ignoreContentAdaptWithSize(false)
img_head:loadTexture("start/icon.png",0)
img_head:setLayoutComponentEnabled(true)
img_head:setName("img_head")
img_head:setTag(86)
img_head:setCascadeColorEnabled(true)
img_head:setCascadeOpacityEnabled(true)
img_head:setPosition(73.0000, 648.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(img_head)
layout:setPositionPercentX(0.0570)
layout:setPositionPercentY(0.9000)
layout:setPercentWidth(0.0703)
layout:setPercentHeight(0.1250)
layout:setSize({width = 90.0000, height = 90.0000})
layout:setLeftMargin(28.0000)
layout:setRightMargin(1162.0000)
layout:setTopMargin(27.0000)
layout:setBottomMargin(603.0000)
Layer:addChild(img_head)

--Create img_headbg
local img_headbg = ccui.ImageView:create()
img_headbg:ignoreContentAdaptWithSize(false)
img_headbg:loadTexture("start/icon_bg.png",0)
img_headbg:setLayoutComponentEnabled(true)
img_headbg:setName("img_headbg")
img_headbg:setTag(87)
img_headbg:setCascadeColorEnabled(true)
img_headbg:setCascadeOpacityEnabled(true)
img_headbg:setPosition(113.0000, 53.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(img_headbg)
layout:setPositionPercentX(1.2556)
layout:setPositionPercentY(0.5889)
layout:setPercentWidth(3.0333)
layout:setPercentHeight(1.4556)
layout:setSize({width = 273.0000, height = 131.0000})
layout:setLeftMargin(-23.5000)
layout:setRightMargin(-159.5000)
layout:setTopMargin(-28.5000)
layout:setBottomMargin(-12.5000)
img_head:addChild(img_headbg)

--Create txt_gold
local txt_gold = ccui.Text:create()
txt_gold:ignoreContentAdaptWithSize(true)
txt_gold:setTextAreaSize({width = 0, height = 0})
txt_gold:setFontName("common/font/font.ttf")
txt_gold:setFontSize(30)
txt_gold:setString([[12530]])
txt_gold:setLayoutComponentEnabled(true)
txt_gold:setName("txt_gold")
txt_gold:setTag(88)
txt_gold:setCascadeColorEnabled(true)
txt_gold:setCascadeOpacityEnabled(true)
txt_gold:setPosition(179.0000, 38.0000)
txt_gold:setTextColor({r = 255, g = 255, b = 0})
layout = ccui.LayoutComponent:bindLayoutComponent(txt_gold)
layout:setPositionPercentX(1.9889)
layout:setPositionPercentY(0.4222)
layout:setPercentWidth(1.1000)
layout:setPercentHeight(0.3778)
layout:setSize({width = 99.0000, height = 34.0000})
layout:setLeftMargin(129.5000)
layout:setRightMargin(-138.5000)
layout:setTopMargin(35.0000)
layout:setBottomMargin(21.0000)
img_head:addChild(txt_gold)

--Create img_gold
local img_gold = ccui.ImageView:create()
img_gold:ignoreContentAdaptWithSize(false)
img_gold:loadTexture("common/gold.png",0)
img_gold:setLayoutComponentEnabled(true)
img_gold:setName("img_gold")
img_gold:setTag(89)
img_gold:setCascadeColorEnabled(true)
img_gold:setCascadeOpacityEnabled(true)
img_gold:setPosition(119.0000, 39.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(img_gold)
layout:setPositionPercentX(1.3222)
layout:setPositionPercentY(0.4333)
layout:setPercentWidth(0.4000)
layout:setPercentHeight(0.4222)
layout:setSize({width = 36.0000, height = 38.0000})
layout:setLeftMargin(101.0000)
layout:setRightMargin(-47.0000)
layout:setTopMargin(32.0000)
layout:setBottomMargin(20.0000)
img_head:addChild(img_gold)

--Create btn_return
local btn_return = ccui.ImageView:create()
btn_return:ignoreContentAdaptWithSize(false)
btn_return:loadTexture("common/btn_icon/btn_return.png",0)
btn_return:setLayoutComponentEnabled(true)
btn_return:setName("btn_return")
btn_return:setTag(648)
btn_return:setCascadeColorEnabled(true)
btn_return:setCascadeOpacityEnabled(true)
btn_return:setPosition(1228.0000, 670.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(btn_return)
layout:setPositionPercentX(0.9594)
layout:setPositionPercentY(0.9306)
layout:setPercentWidth(0.0625)
layout:setPercentHeight(0.1111)
layout:setSize({width = 80.0000, height = 80.0000})
layout:setLeftMargin(1188.0000)
layout:setRightMargin(12.0000)
layout:setTopMargin(10.0000)
layout:setBottomMargin(630.0000)
Layer:addChild(btn_return)

--Create node_ball
local node_ball=cc.Node:create()
node_ball:setName("node_ball")
node_ball:setTag(547)
node_ball:setCascadeColorEnabled(true)
node_ball:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(node_ball)
layout:setRightMargin(1280.0000)
layout:setTopMargin(720.0000)
Layer:addChild(node_ball)

--Create node_1
local node_1=cc.Node:create()
node_1:setName("node_1")
node_1:setTag(548)
node_1:setCascadeColorEnabled(true)
node_1:setCascadeOpacityEnabled(true)
node_1:setPosition(115.0000, 417.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(node_1)
layout:setLeftMargin(115.0000)
layout:setRightMargin(-115.0000)
layout:setTopMargin(-417.0000)
layout:setBottomMargin(417.0000)
node_ball:addChild(node_1)

--Create node_2
local node_2=cc.Node:create()
node_2:setName("node_2")
node_2:setTag(549)
node_2:setCascadeColorEnabled(true)
node_2:setCascadeOpacityEnabled(true)
node_2:setPosition(910.0000, 129.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(node_2)
layout:setLeftMargin(910.0000)
layout:setRightMargin(-910.0000)
layout:setTopMargin(-129.0000)
layout:setBottomMargin(129.0000)
node_ball:addChild(node_2)

--Create node_3
local node_3=cc.Node:create()
node_3:setName("node_3")
node_3:setTag(550)
node_3:setCascadeColorEnabled(true)
node_3:setCascadeOpacityEnabled(true)
node_3:setPosition(115.7899, 73.8075)
layout = ccui.LayoutComponent:bindLayoutComponent(node_3)
layout:setLeftMargin(115.7899)
layout:setRightMargin(-115.7899)
layout:setTopMargin(-73.8075)
layout:setBottomMargin(73.8075)
node_ball:addChild(node_3)

--Create node_4
local node_4=cc.Node:create()
node_4:setName("node_4")
node_4:setTag(551)
node_4:setCascadeColorEnabled(true)
node_4:setCascadeOpacityEnabled(true)
node_4:setPosition(1008.0430, 496.1024)
layout = ccui.LayoutComponent:bindLayoutComponent(node_4)
layout:setLeftMargin(1008.0430)
layout:setRightMargin(-1008.0430)
layout:setTopMargin(-496.1024)
layout:setBottomMargin(496.1024)
node_ball:addChild(node_4)

--Create node_5
local node_5=cc.Node:create()
node_5:setName("node_5")
node_5:setTag(552)
node_5:setCascadeColorEnabled(true)
node_5:setCascadeOpacityEnabled(true)
node_5:setPosition(281.2189, 354.4125)
layout = ccui.LayoutComponent:bindLayoutComponent(node_5)
layout:setLeftMargin(281.2189)
layout:setRightMargin(-281.2189)
layout:setTopMargin(-354.4125)
layout:setBottomMargin(354.4125)
node_ball:addChild(node_5)

--Create node_6
local node_6=cc.Node:create()
node_6:setName("node_6")
node_6:setTag(553)
node_6:setCascadeColorEnabled(true)
node_6:setCascadeOpacityEnabled(true)
node_6:setPosition(807.3250, 309.4300)
layout = ccui.LayoutComponent:bindLayoutComponent(node_6)
layout:setLeftMargin(807.3250)
layout:setRightMargin(-807.3250)
layout:setTopMargin(-309.4300)
layout:setBottomMargin(309.4300)
node_ball:addChild(node_6)

--Create node_7
local node_7=cc.Node:create()
node_7:setName("node_7")
node_7:setTag(554)
node_7:setCascadeColorEnabled(true)
node_7:setCascadeOpacityEnabled(true)
node_7:setPosition(530.3234, 309.0415)
layout = ccui.LayoutComponent:bindLayoutComponent(node_7)
layout:setLeftMargin(530.3234)
layout:setRightMargin(-530.3234)
layout:setTopMargin(-309.0415)
layout:setBottomMargin(309.0415)
node_ball:addChild(node_7)

--Create node_8
local node_8=cc.Node:create()
node_8:setName("node_8")
node_8:setTag(555)
node_8:setCascadeColorEnabled(true)
node_8:setCascadeOpacityEnabled(true)
node_8:setPosition(332.4346, 163.4713)
layout = ccui.LayoutComponent:bindLayoutComponent(node_8)
layout:setLeftMargin(332.4346)
layout:setRightMargin(-332.4346)
layout:setTopMargin(-163.4713)
layout:setBottomMargin(163.4713)
node_ball:addChild(node_8)

--Create node_9
local node_9=cc.Node:create()
node_9:setName("node_9")
node_9:setTag(556)
node_9:setCascadeColorEnabled(true)
node_9:setCascadeOpacityEnabled(true)
node_9:setPosition(417.0628, 497.8993)
layout = ccui.LayoutComponent:bindLayoutComponent(node_9)
layout:setLeftMargin(417.0628)
layout:setRightMargin(-417.0628)
layout:setTopMargin(-497.8993)
layout:setBottomMargin(497.8993)
node_ball:addChild(node_9)

--Create node_10
local node_10=cc.Node:create()
node_10:setName("node_10")
node_10:setTag(557)
node_10:setCascadeColorEnabled(true)
node_10:setCascadeOpacityEnabled(true)
node_10:setPosition(106.1093, 290.7618)
layout = ccui.LayoutComponent:bindLayoutComponent(node_10)
layout:setLeftMargin(106.1093)
layout:setRightMargin(-106.1093)
layout:setTopMargin(-290.7618)
layout:setBottomMargin(290.7618)
node_ball:addChild(node_10)

--Create node_11
local node_11=cc.Node:create()
node_11:setName("node_11")
node_11:setTag(558)
node_11:setCascadeColorEnabled(true)
node_11:setCascadeOpacityEnabled(true)
node_11:setPosition(730.1960, 499.8611)
layout = ccui.LayoutComponent:bindLayoutComponent(node_11)
layout:setLeftMargin(730.1960)
layout:setRightMargin(-730.1960)
layout:setTopMargin(-499.8611)
layout:setBottomMargin(499.8611)
node_ball:addChild(node_11)

--Create node_12
local node_12=cc.Node:create()
node_12:setName("node_12")
node_12:setTag(559)
node_12:setCascadeColorEnabled(true)
node_12:setCascadeOpacityEnabled(true)
node_12:setPosition(528.1598, 81.6454)
layout = ccui.LayoutComponent:bindLayoutComponent(node_12)
layout:setLeftMargin(528.1598)
layout:setRightMargin(-528.1598)
layout:setTopMargin(-81.6454)
layout:setBottomMargin(81.6454)
node_ball:addChild(node_12)

--Create node_small
local node_small=cc.Node:create()
node_small:setName("node_small")
node_small:setTag(564)
node_small:setCascadeColorEnabled(true)
node_small:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(node_small)
layout:setRightMargin(1280.0000)
layout:setTopMargin(720.0000)
Layer:addChild(node_small)

--Create node_draw
local node_draw=cc.Node:create()
node_draw:setName("node_draw")
node_draw:setTag(546)
node_draw:setCascadeColorEnabled(true)
node_draw:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(node_draw)
layout:setRightMargin(1280.0000)
layout:setTopMargin(720.0000)
Layer:addChild(node_draw)

--Create img_role
local img_role = ccui.Layout:create()
img_role:ignoreContentAdaptWithSize(false)
img_role:setClippingEnabled(false)
img_role:setBackGroundColorType(1)
img_role:setBackGroundColor({r = 0, g = 0, b = 0})
img_role:setBackGroundColorOpacity(204)
img_role:setTouchEnabled(true);
img_role:setLayoutComponentEnabled(true)
img_role:setName("img_role")
img_role:setTag(58)
img_role:setCascadeColorEnabled(true)
img_role:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(img_role)
layout:setPositionPercentXEnabled(true)
layout:setPositionPercentYEnabled(true)
layout:setPercentWidthEnabled(true)
layout:setPercentHeightEnabled(true)
layout:setPercentWidth(1.0000)
layout:setPercentHeight(1.0000)
layout:setSize({width = 1280.0000, height = 720.0000})
Layer:addChild(img_role)

--Create img_role111
local img_role111 = ccui.ImageView:create()
img_role111:ignoreContentAdaptWithSize(false)
img_role111:loadTexture("game/img_role.png",0)
img_role111:setLayoutComponentEnabled(true)
img_role111:setName("img_role111")
img_role111:setTag(23)
img_role111:setCascadeColorEnabled(true)
img_role111:setCascadeOpacityEnabled(true)
img_role111:setPosition(640.0000, 360.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(img_role111)
layout:setPositionPercentX(0.5000)
layout:setPositionPercentY(0.5000)
layout:setPercentWidth(1.0000)
layout:setPercentHeight(1.0000)
layout:setSize({width = 1280.0000, height = 720.0000})
img_role:addChild(img_role111)

--Create img_vs
local img_vs = ccui.ImageView:create()
img_vs:ignoreContentAdaptWithSize(false)
img_vs:loadTexture("game/img_vs.png",0)
img_vs:setLayoutComponentEnabled(true)
img_vs:setName("img_vs")
img_vs:setTag(24)
img_vs:setCascadeColorEnabled(true)
img_vs:setCascadeOpacityEnabled(true)
img_vs:setPosition(640.0000, 360.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(img_vs)
layout:setPositionPercentX(0.5000)
layout:setPositionPercentY(0.5000)
layout:setPercentWidth(0.4242)
layout:setPercentHeight(0.7208)
layout:setSize({width = 543.0000, height = 519.0000})
layout:setLeftMargin(368.5000)
layout:setRightMargin(368.5000)
layout:setTopMargin(100.5000)
layout:setBottomMargin(100.5000)
img_role111:addChild(img_vs)

--Create Animation
result['animation'] = ccs.ActionTimeline:create()
  
result['animation']:setDuration(0)
result['animation']:setTimeSpeed(1.0000)
--Create Animation List

result['root'] = Layer
return result;
end

return Result

