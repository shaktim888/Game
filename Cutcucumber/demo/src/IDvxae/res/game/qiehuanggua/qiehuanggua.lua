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
Image_12:setTag(127)
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

--Create template
local template = ccui.Layout:create()
template:ignoreContentAdaptWithSize(false)
template:setClippingEnabled(false)
template:setBackGroundColorOpacity(102)
template:setLayoutComponentEnabled(true)
template:setName("template")
template:setTag(93)
template:setCascadeColorEnabled(true)
template:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(template)
layout:setPercentWidth(0.1563)
layout:setPercentHeight(0.2778)
layout:setSize({width = 200.0000, height = 200.0000})
layout:setRightMargin(1080.0000)
layout:setTopMargin(520.0000)
Scene:addChild(template)

--Create TemplateHuangua
local TemplateHuangua = ccui.Layout:create()
TemplateHuangua:ignoreContentAdaptWithSize(false)
TemplateHuangua:setClippingEnabled(false)
TemplateHuangua:setBackGroundColorOpacity(102)
TemplateHuangua:setLayoutComponentEnabled(true)
TemplateHuangua:setName("TemplateHuangua")
TemplateHuangua:setTag(94)
TemplateHuangua:setCascadeColorEnabled(true)
TemplateHuangua:setCascadeOpacityEnabled(true)
TemplateHuangua:setAnchorPoint(0.0000, 1.0000)
TemplateHuangua:setPosition(47.0000, 559.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(TemplateHuangua)
layout:setPositionPercentX(0.2350)
layout:setPositionPercentY(2.7950)
layout:setPercentWidth(0.3250)
layout:setPercentHeight(1.0200)
layout:setSize({width = 65.0000, height = 204.0000})
layout:setLeftMargin(47.0000)
layout:setRightMargin(88.0000)
layout:setTopMargin(-359.0000)
layout:setBottomMargin(355.0000)
template:addChild(TemplateHuangua)

--Create cutPoint
local cutPoint = ccui.Layout:create()
cutPoint:ignoreContentAdaptWithSize(false)
cutPoint:setClippingEnabled(false)
cutPoint:setBackGroundColorOpacity(102)
cutPoint:setLayoutComponentEnabled(true)
cutPoint:setName("cutPoint")
cutPoint:setTag(95)
cutPoint:setCascadeColorEnabled(true)
cutPoint:setCascadeOpacityEnabled(true)
cutPoint:setPosition(38.0000, 129.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(cutPoint)
layout:setPositionPercentX(0.5846)
layout:setPositionPercentY(0.6324)
layout:setPercentWidth(0.3077)
layout:setPercentHeight(0.0980)
layout:setSize({width = 20.0000, height = 20.0000})
layout:setLeftMargin(38.0000)
layout:setRightMargin(7.0000)
layout:setTopMargin(55.0000)
layout:setBottomMargin(129.0000)
TemplateHuangua:addChild(cutPoint)

--Create hg1
local hg1 = ccui.ImageView:create()
hg1:ignoreContentAdaptWithSize(false)
hg1:loadTexture("game/qiehuanggua/image/hg2.png",0)
hg1:setLayoutComponentEnabled(true)
hg1:setName("hg1")
hg1:setTag(96)
hg1:setCascadeColorEnabled(true)
hg1:setCascadeOpacityEnabled(true)
hg1:setAnchorPoint(0.5000, 1.0000)
hg1:setPosition(29.6131, 125.3867)
layout = ccui.LayoutComponent:bindLayoutComponent(hg1)
layout:setPositionPercentX(0.4556)
layout:setPositionPercentY(0.6146)
layout:setPercentWidth(0.8462)
layout:setPercentHeight(0.4118)
layout:setSize({width = 55.0000, height = 84.0000})
layout:setLeftMargin(2.1131)
layout:setRightMargin(7.8869)
layout:setTopMargin(78.6134)
layout:setBottomMargin(41.3867)
TemplateHuangua:addChild(hg1)

--Create hg2
local hg2 = ccui.ImageView:create()
hg2:ignoreContentAdaptWithSize(false)
hg2:loadTexture("game/qiehuanggua/image/hg1.png",0)
hg2:setLayoutComponentEnabled(true)
hg2:setName("hg2")
hg2:setTag(97)
hg2:setCascadeColorEnabled(true)
hg2:setCascadeOpacityEnabled(true)
hg2:setAnchorPoint(0.5000, 0.0000)
hg2:setPosition(30.0000, 124.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(hg2)
layout:setPositionPercentX(0.4615)
layout:setPositionPercentY(0.6078)
layout:setPercentWidth(0.6154)
layout:setPercentHeight(0.3137)
layout:setSize({width = 40.0000, height = 64.0000})
layout:setLeftMargin(10.0000)
layout:setRightMargin(15.0000)
layout:setTopMargin(16.0000)
layout:setBottomMargin(124.0000)
TemplateHuangua:addChild(hg2)

--Create hg
local hg = ccui.ImageView:create()
hg:ignoreContentAdaptWithSize(false)
hg:loadTexture("game/qiehuanggua/image/fullHg.png",0)
hg:setLayoutComponentEnabled(true)
hg:setName("hg")
hg:setTag(98)
hg:setCascadeColorEnabled(true)
hg:setCascadeOpacityEnabled(true)
hg:setAnchorPoint(0.5000, 1.0000)
hg:setPosition(27.4254, 187.8394)
layout = ccui.LayoutComponent:bindLayoutComponent(hg)
layout:setPositionPercentX(0.4219)
layout:setPositionPercentY(0.9208)
layout:setPercentWidth(1.0000)
layout:setPercentHeight(0.7059)
layout:setSize({width = 65.0000, height = 144.0000})
layout:setLeftMargin(-5.0746)
layout:setRightMargin(5.0746)
layout:setTopMargin(16.1606)
layout:setBottomMargin(43.8394)
TemplateHuangua:addChild(hg)

--Create TemplateCard
local TemplateCard = ccui.Layout:create()
TemplateCard:ignoreContentAdaptWithSize(false)
TemplateCard:setClippingEnabled(false)
TemplateCard:setBackGroundColorOpacity(102)
TemplateCard:setLayoutComponentEnabled(true)
TemplateCard:setName("TemplateCard")
TemplateCard:setTag(99)
TemplateCard:setCascadeColorEnabled(true)
TemplateCard:setCascadeOpacityEnabled(true)
TemplateCard:setAnchorPoint(0.5000, 0.5000)
TemplateCard:setPosition(481.5000, 400.5000)
layout = ccui.LayoutComponent:bindLayoutComponent(TemplateCard)
layout:setPositionPercentX(2.4075)
layout:setPositionPercentY(2.0025)
layout:setPercentWidth(0.3950)
layout:setPercentHeight(0.5600)
layout:setSize({width = 79.0000, height = 112.0000})
layout:setLeftMargin(442.0000)
layout:setRightMargin(-321.0000)
layout:setTopMargin(-256.5000)
layout:setBottomMargin(344.5000)
template:addChild(TemplateCard)

--Create cardWrap
local cardWrap = ccui.Layout:create()
cardWrap:ignoreContentAdaptWithSize(false)
cardWrap:setClippingEnabled(false)
cardWrap:setBackGroundColorOpacity(102)
cardWrap:setLayoutComponentEnabled(true)
cardWrap:setName("cardWrap")
cardWrap:setTag(100)
cardWrap:setCascadeColorEnabled(true)
cardWrap:setCascadeOpacityEnabled(true)
cardWrap:setAnchorPoint(0.5000, 0.5000)
cardWrap:setPosition(40.0000, 56.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(cardWrap)
layout:setPositionPercentX(0.5063)
layout:setPositionPercentY(0.5000)
layout:setPercentWidth(1.0000)
layout:setPercentHeight(1.0000)
layout:setSize({width = 79.0000, height = 112.0000})
layout:setLeftMargin(0.5000)
layout:setRightMargin(-0.5000)
TemplateCard:addChild(cardWrap)

--Create cardImage
local cardImage = ccui.ImageView:create()
cardImage:ignoreContentAdaptWithSize(false)
cardImage:loadTexture("game/qiehuanggua/image/card.png",0)
cardImage:setLayoutComponentEnabled(true)
cardImage:setName("cardImage")
cardImage:setTag(101)
cardImage:setCascadeColorEnabled(true)
cardImage:setCascadeOpacityEnabled(true)
cardImage:setPosition(39.0000, 53.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(cardImage)
layout:setPositionPercentX(0.4937)
layout:setPositionPercentY(0.4732)
layout:setPercentWidth(1.0000)
layout:setPercentHeight(1.0000)
layout:setSize({width = 79.0000, height = 112.0000})
layout:setLeftMargin(-0.5000)
layout:setRightMargin(0.5000)
layout:setTopMargin(3.0000)
layout:setBottomMargin(-3.0000)
cardWrap:addChild(cardImage)

--Create TemplateBlue
local TemplateBlue = ccui.ImageView:create()
TemplateBlue:ignoreContentAdaptWithSize(false)
TemplateBlue:loadTexture("game/qiehuanggua/image/blueBlock.png",0)
TemplateBlue:setLayoutComponentEnabled(true)
TemplateBlue:setName("TemplateBlue")
TemplateBlue:setTag(102)
TemplateBlue:setCascadeColorEnabled(true)
TemplateBlue:setCascadeOpacityEnabled(true)
TemplateBlue:setAnchorPoint(0.5000, 0.0000)
TemplateBlue:setPosition(-607.0000, 31.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(TemplateBlue)
layout:setPositionPercentX(-3.0350)
layout:setPositionPercentY(0.1550)
layout:setPercentWidth(0.1200)
layout:setPercentHeight(0.2950)
layout:setSize({width = 24.0000, height = 59.0000})
layout:setLeftMargin(-619.0000)
layout:setRightMargin(795.0000)
layout:setTopMargin(110.0000)
layout:setBottomMargin(31.0000)
template:addChild(TemplateBlue)

--Create TemplateRed
local TemplateRed = ccui.ImageView:create()
TemplateRed:ignoreContentAdaptWithSize(false)
TemplateRed:loadTexture("game/qiehuanggua/image/redBlock.png",0)
TemplateRed:setLayoutComponentEnabled(true)
TemplateRed:setName("TemplateRed")
TemplateRed:setTag(103)
TemplateRed:setCascadeColorEnabled(true)
TemplateRed:setCascadeOpacityEnabled(true)
TemplateRed:setAnchorPoint(0.5000, 0.0000)
TemplateRed:setPosition(-526.0000, 35.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(TemplateRed)
layout:setPositionPercentX(-2.6300)
layout:setPositionPercentY(0.1750)
layout:setPercentWidth(0.1200)
layout:setPercentHeight(0.2950)
layout:setSize({width = 24.0000, height = 59.0000})
layout:setLeftMargin(-538.0000)
layout:setRightMargin(714.0000)
layout:setTopMargin(106.0000)
layout:setBottomMargin(35.0000)
template:addChild(TemplateRed)

--Create PanelBottom
local PanelBottom = ccui.Layout:create()
PanelBottom:ignoreContentAdaptWithSize(false)
PanelBottom:setClippingEnabled(false)
PanelBottom:setBackGroundColorOpacity(102)
PanelBottom:setLayoutComponentEnabled(true)
PanelBottom:setName("PanelBottom")
PanelBottom:setTag(104)
PanelBottom:setCascadeColorEnabled(true)
PanelBottom:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(PanelBottom)
layout:setPercentWidth(1.0000)
layout:setPercentHeight(1.0000)
layout:setSize({width = 1280.0000, height = 720.0000})
Scene:addChild(PanelBottom)

--Create huadong
local huadong = ccui.ImageView:create()
huadong:ignoreContentAdaptWithSize(false)
huadong:loadTexture("game/qiehuanggua/image/pandingcao.png",0)
huadong:setLayoutComponentEnabled(true)
huadong:setName("huadong")
huadong:setTag(105)
huadong:setCascadeColorEnabled(true)
huadong:setCascadeOpacityEnabled(true)
huadong:setPosition(640.0000, 86.5000)
layout = ccui.LayoutComponent:bindLayoutComponent(huadong)
layout:setPositionPercentX(0.5000)
layout:setPositionPercentY(0.1201)
layout:setPercentWidth(0.2727)
layout:setPercentHeight(0.0819)
layout:setSize({width = 349.0000, height = 59.0000})
layout:setLeftMargin(465.5000)
layout:setRightMargin(465.5000)
layout:setTopMargin(604.0000)
layout:setBottomMargin(57.0000)
PanelBottom:addChild(huadong)

--Create huakuaiContainer
local huakuaiContainer=cc.Node:create()
huakuaiContainer:setName("huakuaiContainer")
huakuaiContainer:setTag(106)
huakuaiContainer:setCascadeColorEnabled(true)
huakuaiContainer:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(huakuaiContainer)
layout:setRightMargin(349.0000)
layout:setTopMargin(59.0000)
huadong:addChild(huakuaiContainer)

--Create ball
local ball = ccui.ImageView:create()
ball:ignoreContentAdaptWithSize(false)
ball:loadTexture("game/qiehuanggua/image/hero1_1_move_3.png",0)
ball:setLayoutComponentEnabled(true)
ball:setName("ball")
ball:setTag(107)
ball:setCascadeColorEnabled(true)
ball:setCascadeOpacityEnabled(true)
ball:setPosition(32.6750, 38.2049)
layout = ccui.LayoutComponent:bindLayoutComponent(ball)
layout:setPositionPercentX(0.0936)
layout:setPositionPercentY(0.6475)
layout:setPercentWidth(0.1691)
layout:setPercentHeight(1.0847)
layout:setSize({width = 59.0000, height = 64.0000})
layout:setLeftMargin(3.1750)
layout:setRightMargin(286.8250)
layout:setTopMargin(-11.2049)
layout:setBottomMargin(6.2049)
huadong:addChild(ball)

--Create Text_9
local Text_9 = ccui.Text:create()
Text_9:ignoreContentAdaptWithSize(true)
Text_9:setTextAreaSize({width = 0, height = 0})
Text_9:setFontName("game/qiehuanggua/image/zh_qhg.ttf")
Text_9:setFontSize(42)
Text_9:setString([[Knife]])
Text_9:enableShadow({r = 110, g = 110, b = 110, a = 255}, {width = 2, height = -2}, 0)
Text_9:enableOutline({r = 255, g = 255, b = 255, a = 255}, 1)
Text_9:setLayoutComponentEnabled(true)
Text_9:setName("Text_9")
Text_9:setTag(108)
Text_9:setCascadeColorEnabled(true)
Text_9:setCascadeOpacityEnabled(true)
Text_9:setPosition(116.2093, 99.2092)
Text_9:setTextColor({r = 0, g = 0, b = 0})
layout = ccui.LayoutComponent:bindLayoutComponent(Text_9)
layout:setPositionPercentX(0.0908)
layout:setPositionPercentY(0.1378)
layout:setPercentWidth(0.0922)
layout:setPercentHeight(0.0611)
layout:setSize({width = 118.0000, height = 44.0000})
layout:setLeftMargin(57.2093)
layout:setRightMargin(1104.7910)
layout:setTopMargin(598.7908)
layout:setBottomMargin(77.2092)
PanelBottom:addChild(Text_9)

--Create btnPush
local btnPush = ccui.Button:create()
btnPush:ignoreContentAdaptWithSize(false)
btnPush:loadTextureNormal("game/qiehuanggua/image/btn.png",0)
btnPush:setTitleFontName("game/qiehuanggua/image/zh_qhg.ttf")
btnPush:setTitleFontSize(50)
btnPush:setTitleText("hit")
btnPush:setTitleColor({r = 65, g = 65, b = 70})
btnPush:setLayoutComponentEnabled(true)
btnPush:setName("btnPush")
btnPush:setTag(109)
btnPush:setCascadeColorEnabled(true)
btnPush:setCascadeOpacityEnabled(true)
btnPush:setPosition(1111.0000, 119.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(btnPush)
layout:setPositionPercentX(0.8680)
layout:setPositionPercentY(0.1653)
layout:setPercentWidth(0.2039)
layout:setPercentHeight(0.1319)
layout:setSize({width = 261.0000, height = 95.0000})
layout:setLeftMargin(980.5000)
layout:setRightMargin(38.5000)
layout:setTopMargin(553.5000)
layout:setBottomMargin(71.5000)
PanelBottom:addChild(btnPush)

--Create life_1
local life_1 = ccui.ImageView:create()
life_1:ignoreContentAdaptWithSize(false)
life_1:loadTexture("game/qiehuanggua/image/card.png",0)
life_1:setLayoutComponentEnabled(true)
life_1:setName("life_1")
life_1:setTag(110)
life_1:setCascadeColorEnabled(true)
life_1:setCascadeOpacityEnabled(true)
life_1:setPosition(248.5000, 111.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(life_1)
layout:setPositionPercentX(0.1941)
layout:setPositionPercentY(0.1542)
layout:setPercentWidth(0.0617)
layout:setPercentHeight(0.1556)
layout:setSize({width = 79.0000, height = 112.0000})
layout:setLeftMargin(209.0000)
layout:setRightMargin(992.0000)
layout:setTopMargin(553.0000)
layout:setBottomMargin(55.0000)
PanelBottom:addChild(life_1)

--Create life_2
local life_2 = ccui.ImageView:create()
life_2:ignoreContentAdaptWithSize(false)
life_2:loadTexture("game/qiehuanggua/image/card.png",0)
life_2:setLayoutComponentEnabled(true)
life_2:setName("life_2")
life_2:setTag(111)
life_2:setCascadeColorEnabled(true)
life_2:setCascadeOpacityEnabled(true)
life_2:setPosition(300.5000, 110.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(life_2)
layout:setPositionPercentX(0.2348)
layout:setPositionPercentY(0.1528)
layout:setPercentWidth(0.0617)
layout:setPercentHeight(0.1556)
layout:setSize({width = 79.0000, height = 112.0000})
layout:setLeftMargin(261.0000)
layout:setRightMargin(940.0000)
layout:setTopMargin(554.0000)
layout:setBottomMargin(54.0000)
PanelBottom:addChild(life_2)

--Create life_3
local life_3 = ccui.ImageView:create()
life_3:ignoreContentAdaptWithSize(false)
life_3:loadTexture("game/qiehuanggua/image/card.png",0)
life_3:setLayoutComponentEnabled(true)
life_3:setName("life_3")
life_3:setTag(112)
life_3:setCascadeColorEnabled(true)
life_3:setCascadeOpacityEnabled(true)
life_3:setPosition(353.5000, 110.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(life_3)
layout:setPositionPercentX(0.2762)
layout:setPositionPercentY(0.1528)
layout:setPercentWidth(0.0617)
layout:setPercentHeight(0.1556)
layout:setSize({width = 79.0000, height = 112.0000})
layout:setLeftMargin(314.0000)
layout:setRightMargin(887.0000)
layout:setTopMargin(554.0000)
layout:setBottomMargin(54.0000)
PanelBottom:addChild(life_3)

--Create cardStart
local cardStart=cc.Node:create()
cardStart:setName("cardStart")
cardStart:setTag(113)
cardStart:setCascadeColorEnabled(true)
cardStart:setCascadeOpacityEnabled(true)
cardStart:setPosition(1135.5000, 553.5000)
layout = ccui.LayoutComponent:bindLayoutComponent(cardStart)
layout:setPositionPercentX(0.8871)
layout:setPositionPercentY(0.7688)
layout:setLeftMargin(1135.5000)
layout:setRightMargin(144.5000)
layout:setTopMargin(166.5000)
layout:setBottomMargin(553.5000)
PanelBottom:addChild(cardStart)

--Create flyPath
local flyPath=cc.Node:create()
flyPath:setName("flyPath")
flyPath:setTag(114)
flyPath:setCascadeColorEnabled(true)
flyPath:setCascadeOpacityEnabled(true)
flyPath:setPosition(1135.0000, 553.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(flyPath)
layout:setPositionPercentX(0.8867)
layout:setPositionPercentY(0.7681)
layout:setLeftMargin(1135.0000)
layout:setRightMargin(145.0000)
layout:setTopMargin(167.0000)
layout:setBottomMargin(553.0000)
PanelBottom:addChild(flyPath)

--Create point_0
local point_0=cc.Node:create()
point_0:setName("point_0")
point_0:setTag(115)
point_0:setCascadeColorEnabled(true)
point_0:setCascadeOpacityEnabled(true)
point_0:setPosition(-1.0000, -1.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(point_0)
layout:setLeftMargin(-1.0000)
layout:setRightMargin(1.0000)
layout:setTopMargin(1.0000)
layout:setBottomMargin(-1.0000)
flyPath:addChild(point_0)

--Create point_1
local point_1=cc.Node:create()
point_1:setName("point_1")
point_1:setTag(116)
point_1:setCascadeColorEnabled(true)
point_1:setCascadeOpacityEnabled(true)
point_1:setPosition(-79.0000, -38.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(point_1)
layout:setLeftMargin(-79.0000)
layout:setRightMargin(79.0000)
layout:setTopMargin(38.0000)
layout:setBottomMargin(-38.0000)
flyPath:addChild(point_1)

--Create point_2
local point_2=cc.Node:create()
point_2:setName("point_2")
point_2:setTag(117)
point_2:setCascadeColorEnabled(true)
point_2:setCascadeOpacityEnabled(true)
point_2:setPosition(-172.0000, -26.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(point_2)
layout:setLeftMargin(-172.0000)
layout:setRightMargin(172.0000)
layout:setTopMargin(26.0000)
layout:setBottomMargin(-26.0000)
flyPath:addChild(point_2)

--Create PanelLeftTop
local PanelLeftTop = ccui.Layout:create()
PanelLeftTop:ignoreContentAdaptWithSize(false)
PanelLeftTop:setClippingEnabled(false)
PanelLeftTop:setBackGroundColorOpacity(102)
PanelLeftTop:setLayoutComponentEnabled(true)
PanelLeftTop:setName("PanelLeftTop")
PanelLeftTop:setTag(118)
PanelLeftTop:setCascadeColorEnabled(true)
PanelLeftTop:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(PanelLeftTop)
layout:setPercentWidth(1.0000)
layout:setPercentHeight(1.0000)
layout:setSize({width = 1280.0000, height = 720.0000})
Scene:addChild(PanelLeftTop)

--Create PanelRightTop
local PanelRightTop = ccui.Layout:create()
PanelRightTop:ignoreContentAdaptWithSize(false)
PanelRightTop:setClippingEnabled(false)
PanelRightTop:setBackGroundColorOpacity(102)
PanelRightTop:setLayoutComponentEnabled(true)
PanelRightTop:setName("PanelRightTop")
PanelRightTop:setTag(119)
PanelRightTop:setCascadeColorEnabled(true)
PanelRightTop:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(PanelRightTop)
layout:setPercentWidth(1.0000)
layout:setPercentHeight(1.0000)
layout:setSize({width = 1280.0000, height = 720.0000})
Scene:addChild(PanelRightTop)

--Create Text_3
local Text_3 = ccui.Text:create()
Text_3:ignoreContentAdaptWithSize(true)
Text_3:setTextAreaSize({width = 0, height = 0})
Text_3:setFontName("game/qiehuanggua/image/zh_qhg.ttf")
Text_3:setFontSize(42)
Text_3:setString([[SOCRE:]])
Text_3:enableShadow({r = 110, g = 110, b = 110, a = 255}, {width = 2, height = -2}, 0)
Text_3:enableOutline({r = 255, g = 255, b = 255, a = 255}, 1)
Text_3:setLayoutComponentEnabled(true)
Text_3:setName("Text_3")
Text_3:setTag(120)
Text_3:setCascadeColorEnabled(true)
Text_3:setCascadeOpacityEnabled(true)
Text_3:setPosition(957.0023, 671.2069)
Text_3:setTextColor({r = 0, g = 0, b = 0})
layout = ccui.LayoutComponent:bindLayoutComponent(Text_3)
layout:setPositionPercentX(0.7477)
layout:setPositionPercentY(0.9322)
layout:setPercentWidth(0.1359)
layout:setPercentHeight(0.0611)
layout:setSize({width = 174.0000, height = 44.0000})
layout:setLeftMargin(870.0023)
layout:setRightMargin(235.9977)
layout:setTopMargin(26.7931)
layout:setBottomMargin(649.2069)
PanelRightTop:addChild(Text_3)

--Create txtScore
local txtScore = ccui.Text:create()
txtScore:ignoreContentAdaptWithSize(true)
txtScore:setTextAreaSize({width = 0, height = 0})
txtScore:setFontName("game/qiehuanggua/image/zh_qhg.ttf")
txtScore:setFontSize(26)
txtScore:setString([[1]])
txtScore:enableShadow({r = 110, g = 110, b = 110, a = 255}, {width = 2, height = -2}, 0)
txtScore:enableOutline({r = 255, g = 255, b = 255, a = 255}, 1)
txtScore:setLayoutComponentEnabled(true)
txtScore:setName("txtScore")
txtScore:setTag(121)
txtScore:setCascadeColorEnabled(true)
txtScore:setCascadeOpacityEnabled(true)
txtScore:setPosition(1102.0000, 672.0000)
txtScore:setTextColor({r = 0, g = 0, b = 0})
layout = ccui.LayoutComponent:bindLayoutComponent(txtScore)
layout:setPositionPercentX(0.8609)
layout:setPositionPercentY(0.9333)
layout:setPercentWidth(0.0078)
layout:setPercentHeight(0.0389)
layout:setSize({width = 10.0000, height = 28.0000})
layout:setLeftMargin(1097.0000)
layout:setRightMargin(173.0000)
layout:setTopMargin(34.0000)
layout:setBottomMargin(658.0000)
PanelRightTop:addChild(txtScore)

--Create btnSet
local btnSet = ccui.ImageView:create()
btnSet:ignoreContentAdaptWithSize(false)
btnSet:loadTexture("game/qiehuanggua/image/set.png",0)
btnSet:setTouchEnabled(true);
btnSet:setLayoutComponentEnabled(true)
btnSet:setName("btnSet")
btnSet:setTag(122)
btnSet:setCascadeColorEnabled(true)
btnSet:setCascadeOpacityEnabled(true)
btnSet:setPosition(1223.0180, 662.0823)
layout = ccui.LayoutComponent:bindLayoutComponent(btnSet)
layout:setPositionPercentX(0.9555)
layout:setPositionPercentY(0.9196)
layout:setPercentWidth(0.0664)
layout:setPercentHeight(0.1181)
layout:setSize({width = 85.0000, height = 85.0000})
layout:setLeftMargin(1180.5180)
layout:setRightMargin(14.4822)
layout:setTopMargin(15.4177)
layout:setBottomMargin(619.5823)
PanelRightTop:addChild(btnSet)

--Create PanelCenter
local PanelCenter = ccui.Layout:create()
PanelCenter:ignoreContentAdaptWithSize(false)
PanelCenter:setClippingEnabled(false)
PanelCenter:setBackGroundColorOpacity(102)
PanelCenter:setLayoutComponentEnabled(true)
PanelCenter:setName("PanelCenter")
PanelCenter:setTag(123)
PanelCenter:setCascadeColorEnabled(true)
PanelCenter:setCascadeOpacityEnabled(true)
PanelCenter:setPosition(1.0000, 0.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(PanelCenter)
layout:setPositionPercentX(0.0008)
layout:setPercentWidth(1.0000)
layout:setPercentHeight(1.0000)
layout:setSize({width = 1280.0000, height = 720.0000})
layout:setLeftMargin(1.0000)
layout:setRightMargin(-1.0000)
Scene:addChild(PanelCenter)

--Create container
local container=cc.Node:create()
container:setName("container")
container:setTag(124)
container:setCascadeColorEnabled(true)
container:setCascadeOpacityEnabled(true)
container:setPosition(5.0000, 599.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(container)
layout:setPositionPercentX(0.0039)
layout:setPositionPercentY(0.8319)
layout:setLeftMargin(5.0000)
layout:setRightMargin(1275.0000)
layout:setTopMargin(121.0000)
layout:setBottomMargin(599.0000)
PanelCenter:addChild(container)

--Create Image_5
local Image_5 = ccui.ImageView:create()
Image_5:ignoreContentAdaptWithSize(false)
Image_5:loadTexture("game/qiehuanggua/image/jiazi.png",0)
Image_5:setLayoutComponentEnabled(true)
Image_5:setName("Image_5")
Image_5:setTag(125)
Image_5:setCascadeColorEnabled(true)
Image_5:setCascadeOpacityEnabled(true)
Image_5:setPosition(448.5000, 594.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(Image_5)
layout:setPositionPercentX(0.3504)
layout:setPositionPercentY(0.8250)
layout:setPercentWidth(0.6992)
layout:setPercentHeight(0.0736)
layout:setSize({width = 895.0000, height = 53.0000})
layout:setLeftMargin(1.0000)
layout:setRightMargin(384.0000)
layout:setTopMargin(99.5000)
layout:setBottomMargin(567.5000)
PanelCenter:addChild(Image_5)

--Create btnBack
local btnBack = ccui.Button:create()
btnBack:ignoreContentAdaptWithSize(false)
btnBack:loadTextureNormal("game/qiehuanggua/image/back.png",0)
btnBack:setTitleFontSize(14)
btnBack:setTitleColor({r = 65, g = 65, b = 70})
btnBack:setScale9Enabled(true)
btnBack:setCapInsets({x = 15, y = 11, width = 67, height = 75})
btnBack:setLayoutComponentEnabled(true)
btnBack:setName("btnBack")
btnBack:setTag(126)
btnBack:setCascadeColorEnabled(true)
btnBack:setCascadeOpacityEnabled(true)
btnBack:setPosition(53.0000, 668.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(btnBack)
layout:setPositionPercentX(0.0414)
layout:setPositionPercentY(0.9278)
layout:setPercentWidth(0.0750)
layout:setPercentHeight(0.1333)
layout:setSize({width = 96.0000, height = 96.0000})
layout:setLeftMargin(5.0000)
layout:setRightMargin(1179.0000)
layout:setTopMargin(4.0000)
layout:setBottomMargin(620.0000)
PanelCenter:addChild(btnBack)

--Create Animation
result['animation'] = ccs.ActionTimeline:create()
  
result['animation']:setDuration(0)
result['animation']:setTimeSpeed(1.0000)
--Create Animation List

result['root'] = Scene
return result;
end

return Result

