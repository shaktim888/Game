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
bg:setTag(39)
bg:setCascadeColorEnabled(true)
bg:setCascadeOpacityEnabled(true)
bg:setPosition(641.0000, 361.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(bg)
layout:setPositionPercentX(0.5008)
layout:setPositionPercentY(0.5014)
layout:setPercentWidth(1.0000)
layout:setPercentHeight(1.0000)
layout:setSize({width = 1280.0000, height = 720.0000})
layout:setLeftMargin(1.0000)
layout:setRightMargin(-1.0000)
layout:setTopMargin(-1.0000)
layout:setBottomMargin(1.0000)
Layer:addChild(bg)

--Create img_player_head_1
local img_player_head_1 = ccui.ImageView:create()
img_player_head_1:ignoreContentAdaptWithSize(false)
img_player_head_1:loadTexture("game/img_icon.png",0)
img_player_head_1:setLayoutComponentEnabled(true)
img_player_head_1:setName("img_player_head_1")
img_player_head_1:setTag(95)
img_player_head_1:setCascadeColorEnabled(true)
img_player_head_1:setCascadeOpacityEnabled(true)
img_player_head_1:setPosition(160.0000, 120.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(img_player_head_1)
layout:setPositionPercentX(0.1250)
layout:setPositionPercentY(0.1667)
layout:setPercentWidth(0.0703)
layout:setPercentHeight(0.1250)
layout:setSize({width = 90.0000, height = 90.0000})
layout:setLeftMargin(115.0000)
layout:setRightMargin(1075.0000)
layout:setTopMargin(555.0000)
layout:setBottomMargin(75.0000)
Layer:addChild(img_player_head_1)

--Create img_gold_bg
local img_gold_bg = ccui.ImageView:create()
img_gold_bg:ignoreContentAdaptWithSize(false)
img_gold_bg:loadTexture("game/img_gold_bg.png",0)
img_gold_bg:setLayoutComponentEnabled(true)
img_gold_bg:setName("img_gold_bg")
img_gold_bg:setTag(96)
img_gold_bg:setCascadeColorEnabled(true)
img_gold_bg:setCascadeOpacityEnabled(true)
img_gold_bg:setPosition(45.0000, -31.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(img_gold_bg)
layout:setPositionPercentX(0.5000)
layout:setPositionPercentY(-0.3444)
layout:setPercentWidth(1.8333)
layout:setPercentHeight(0.4444)
layout:setSize({width = 165.0000, height = 40.0000})
layout:setLeftMargin(-37.5000)
layout:setRightMargin(-37.5000)
layout:setTopMargin(101.0000)
layout:setBottomMargin(-51.0000)
img_player_head_1:addChild(img_gold_bg)

--Create text_HP
local text_HP = ccui.Text:create()
text_HP:ignoreContentAdaptWithSize(true)
text_HP:setTextAreaSize({width = 0, height = 0})
text_HP:setFontName("common/font/font.ttf")
text_HP:setFontSize(20)
text_HP:setString([[HP: 10000]])
text_HP:setLayoutComponentEnabled(true)
text_HP:setName("text_HP")
text_HP:setTag(97)
text_HP:setCascadeColorEnabled(true)
text_HP:setCascadeOpacityEnabled(true)
text_HP:setPosition(44.0000, -33.0000)
text_HP:setTextColor({r = 252, g = 237, b = 167})
layout = ccui.LayoutComponent:bindLayoutComponent(text_HP)
layout:setPositionPercentX(0.4889)
layout:setPositionPercentY(-0.3667)
layout:setPercentWidth(1.2556)
layout:setPercentHeight(0.2556)
layout:setSize({width = 113.0000, height = 23.0000})
layout:setLeftMargin(-12.5000)
layout:setRightMargin(-10.5000)
layout:setTopMargin(111.5000)
layout:setBottomMargin(-44.5000)
img_player_head_1:addChild(text_HP)

--Create img_headclip
local img_headclip = ccui.ImageView:create()
img_headclip:ignoreContentAdaptWithSize(false)
img_headclip:loadTexture("game/img_icon_bg.png",0)
img_headclip:setLayoutComponentEnabled(true)
img_headclip:setName("img_headclip")
img_headclip:setTag(98)
img_headclip:setCascadeColorEnabled(true)
img_headclip:setCascadeOpacityEnabled(true)
img_headclip:setPosition(45.0000, 45.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(img_headclip)
layout:setPositionPercentX(0.5000)
layout:setPositionPercentY(0.5000)
layout:setPercentWidth(1.2889)
layout:setPercentHeight(1.2889)
layout:setSize({width = 116.0000, height = 116.0000})
layout:setLeftMargin(-13.0000)
layout:setRightMargin(-13.0000)
layout:setTopMargin(-13.0000)
layout:setBottomMargin(-13.0000)
img_player_head_1:addChild(img_headclip)

--Create text_jian
local text_jian = ccui.Text:create()
text_jian:ignoreContentAdaptWithSize(true)
text_jian:setTextAreaSize({width = 0, height = 0})
text_jian:setFontName("common/font/font.ttf")
text_jian:setFontSize(32)
text_jian:setString([[-5]])
text_jian:enableShadow({r = 110, g = 110, b = 110, a = 255}, {width = 2, height = -2}, 0)
text_jian:setLayoutComponentEnabled(true)
text_jian:setName("text_jian")
text_jian:setTag(239)
text_jian:setCascadeColorEnabled(true)
text_jian:setCascadeOpacityEnabled(true)
text_jian:setPosition(135.0000, 45.5000)
text_jian:setTextColor({r = 252, g = 237, b = 167})
layout = ccui.LayoutComponent:bindLayoutComponent(text_jian)
layout:setPositionPercentX(1.5000)
layout:setPositionPercentY(0.5056)
layout:setPercentWidth(0.5000)
layout:setPercentHeight(0.4111)
layout:setSize({width = 45.0000, height = 37.0000})
layout:setLeftMargin(112.5000)
layout:setRightMargin(-67.5000)
layout:setTopMargin(26.0000)
layout:setBottomMargin(27.0000)
img_player_head_1:addChild(text_jian)

--Create img_player_head_2
local img_player_head_2 = ccui.ImageView:create()
img_player_head_2:ignoreContentAdaptWithSize(false)
img_player_head_2:loadTexture("game/img_icon.png",0)
img_player_head_2:setLayoutComponentEnabled(true)
img_player_head_2:setName("img_player_head_2")
img_player_head_2:setTag(75)
img_player_head_2:setCascadeColorEnabled(true)
img_player_head_2:setCascadeOpacityEnabled(true)
img_player_head_2:setPosition(160.0000, 649.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(img_player_head_2)
layout:setPositionPercentX(0.1250)
layout:setPositionPercentY(0.9014)
layout:setPercentWidth(0.0703)
layout:setPercentHeight(0.1250)
layout:setSize({width = 90.0000, height = 90.0000})
layout:setLeftMargin(115.0000)
layout:setRightMargin(1075.0000)
layout:setTopMargin(26.0000)
layout:setBottomMargin(604.0000)
Layer:addChild(img_player_head_2)

--Create img_gold_bg
local img_gold_bg = ccui.ImageView:create()
img_gold_bg:ignoreContentAdaptWithSize(false)
img_gold_bg:loadTexture("game/img_gold_bg.png",0)
img_gold_bg:setLayoutComponentEnabled(true)
img_gold_bg:setName("img_gold_bg")
img_gold_bg:setTag(76)
img_gold_bg:setCascadeColorEnabled(true)
img_gold_bg:setCascadeOpacityEnabled(true)
img_gold_bg:setPosition(45.0000, -31.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(img_gold_bg)
layout:setPositionPercentX(0.5000)
layout:setPositionPercentY(-0.3444)
layout:setPercentWidth(1.8333)
layout:setPercentHeight(0.4444)
layout:setSize({width = 165.0000, height = 40.0000})
layout:setLeftMargin(-37.5000)
layout:setRightMargin(-37.5000)
layout:setTopMargin(101.0000)
layout:setBottomMargin(-51.0000)
img_player_head_2:addChild(img_gold_bg)

--Create text_HP
local text_HP = ccui.Text:create()
text_HP:ignoreContentAdaptWithSize(true)
text_HP:setTextAreaSize({width = 0, height = 0})
text_HP:setFontName("common/font/font.ttf")
text_HP:setFontSize(20)
text_HP:setString([[HP: 10000]])
text_HP:setLayoutComponentEnabled(true)
text_HP:setName("text_HP")
text_HP:setTag(77)
text_HP:setCascadeColorEnabled(true)
text_HP:setCascadeOpacityEnabled(true)
text_HP:setPosition(45.0000, -33.0000)
text_HP:setTextColor({r = 252, g = 237, b = 167})
layout = ccui.LayoutComponent:bindLayoutComponent(text_HP)
layout:setPositionPercentX(0.5000)
layout:setPositionPercentY(-0.3667)
layout:setPercentWidth(1.2556)
layout:setPercentHeight(0.2556)
layout:setSize({width = 113.0000, height = 23.0000})
layout:setLeftMargin(-11.5000)
layout:setRightMargin(-11.5000)
layout:setTopMargin(111.5000)
layout:setBottomMargin(-44.5000)
img_player_head_2:addChild(text_HP)

--Create img_headclip
local img_headclip = ccui.ImageView:create()
img_headclip:ignoreContentAdaptWithSize(false)
img_headclip:loadTexture("game/img_icon_bg.png",0)
img_headclip:setLayoutComponentEnabled(true)
img_headclip:setName("img_headclip")
img_headclip:setTag(78)
img_headclip:setCascadeColorEnabled(true)
img_headclip:setCascadeOpacityEnabled(true)
img_headclip:setPosition(45.0000, 45.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(img_headclip)
layout:setPositionPercentX(0.5000)
layout:setPositionPercentY(0.5000)
layout:setPercentWidth(1.2889)
layout:setPercentHeight(1.2889)
layout:setSize({width = 116.0000, height = 116.0000})
layout:setLeftMargin(-13.0000)
layout:setRightMargin(-13.0000)
layout:setTopMargin(-13.0000)
layout:setBottomMargin(-13.0000)
img_player_head_2:addChild(img_headclip)

--Create text_jian
local text_jian = ccui.Text:create()
text_jian:ignoreContentAdaptWithSize(true)
text_jian:setTextAreaSize({width = 0, height = 0})
text_jian:setFontName("common/font/font.ttf")
text_jian:setFontSize(32)
text_jian:setString([[-5]])
text_jian:enableShadow({r = 110, g = 110, b = 110, a = 255}, {width = 2, height = -2}, 0)
text_jian:setLayoutComponentEnabled(true)
text_jian:setName("text_jian")
text_jian:setTag(240)
text_jian:setCascadeColorEnabled(true)
text_jian:setCascadeOpacityEnabled(true)
text_jian:setPosition(135.0000, 47.5000)
text_jian:setTextColor({r = 252, g = 237, b = 167})
layout = ccui.LayoutComponent:bindLayoutComponent(text_jian)
layout:setPositionPercentX(1.5000)
layout:setPositionPercentY(0.5278)
layout:setPercentWidth(0.5000)
layout:setPercentHeight(0.4111)
layout:setSize({width = 45.0000, height = 37.0000})
layout:setLeftMargin(112.5000)
layout:setRightMargin(-67.5000)
layout:setTopMargin(24.0000)
layout:setBottomMargin(29.0000)
img_player_head_2:addChild(text_jian)

--Create img_myhero_1
local img_myhero_1 = ccui.ImageView:create()
img_myhero_1:ignoreContentAdaptWithSize(false)
img_myhero_1:loadTexture("game/card/hero.png",0)
img_myhero_1:setLayoutComponentEnabled(true)
img_myhero_1:setName("img_myhero_1")
img_myhero_1:setTag(91)
img_myhero_1:setCascadeColorEnabled(true)
img_myhero_1:setCascadeOpacityEnabled(true)
img_myhero_1:setPosition(406.0000, 108.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(img_myhero_1)
layout:setPositionPercentX(0.3172)
layout:setPositionPercentY(0.1500)
layout:setPercentWidth(0.1063)
layout:setPercentHeight(0.2639)
layout:setSize({width = 136.0000, height = 190.0000})
layout:setLeftMargin(338.0000)
layout:setRightMargin(806.0000)
layout:setTopMargin(517.0000)
layout:setBottomMargin(13.0000)
Layer:addChild(img_myhero_1)

--Create img_card
local img_card = ccui.ImageView:create()
img_card:ignoreContentAdaptWithSize(false)
img_card:loadTexture("game/card/card_di_s.png",0)
img_card:setLayoutComponentEnabled(true)
img_card:setName("img_card")
img_card:setTag(92)
img_card:setCascadeColorEnabled(true)
img_card:setCascadeOpacityEnabled(true)
img_card:setPosition(66.0000, 96.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(img_card)
layout:setPositionPercentX(0.4853)
layout:setPositionPercentY(0.5053)
layout:setPercentWidth(1.1176)
layout:setPercentHeight(1.0895)
layout:setSize({width = 152.0000, height = 207.0000})
layout:setLeftMargin(-10.0000)
layout:setRightMargin(-6.0000)
layout:setTopMargin(-9.5000)
layout:setBottomMargin(-7.5000)
img_myhero_1:addChild(img_card)

--Create text_def
local text_def = ccui.Text:create()
text_def:ignoreContentAdaptWithSize(true)
text_def:setTextAreaSize({width = 0, height = 0})
text_def:setFontName("common/font/font.ttf")
text_def:setFontSize(25)
text_def:setString([[8]])
text_def:setTextHorizontalAlignment(1)
text_def:setTextVerticalAlignment(1)
text_def:enableShadow({r = 0, g = 0, b = 0, a = 255}, {width = 2, height = -2}, 0)
text_def:setLayoutComponentEnabled(true)
text_def:setName("text_def")
text_def:setTag(93)
text_def:setCascadeColorEnabled(true)
text_def:setCascadeOpacityEnabled(true)
text_def:setPosition(118.0000, 18.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(text_def)
layout:setPositionPercentX(0.8676)
layout:setPositionPercentY(0.0947)
layout:setPercentWidth(0.1397)
layout:setPercentHeight(0.1526)
layout:setSize({width = 19.0000, height = 29.0000})
layout:setLeftMargin(108.5000)
layout:setRightMargin(8.5000)
layout:setTopMargin(157.5000)
layout:setBottomMargin(3.5000)
img_myhero_1:addChild(text_def)

--Create text_ack
local text_ack = ccui.Text:create()
text_ack:ignoreContentAdaptWithSize(true)
text_ack:setTextAreaSize({width = 0, height = 0})
text_ack:setFontName("common/font/font.ttf")
text_ack:setFontSize(25)
text_ack:setString([[8]])
text_ack:setTextHorizontalAlignment(1)
text_ack:setTextVerticalAlignment(1)
text_ack:enableShadow({r = 0, g = 0, b = 0, a = 255}, {width = 2, height = -2}, 0)
text_ack:setLayoutComponentEnabled(true)
text_ack:setName("text_ack")
text_ack:setTag(94)
text_ack:setCascadeColorEnabled(true)
text_ack:setCascadeOpacityEnabled(true)
text_ack:setPosition(18.0000, 15.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(text_ack)
layout:setPositionPercentX(0.1324)
layout:setPositionPercentY(0.0789)
layout:setPercentWidth(0.1397)
layout:setPercentHeight(0.1526)
layout:setSize({width = 19.0000, height = 29.0000})
layout:setLeftMargin(8.5000)
layout:setRightMargin(108.5000)
layout:setTopMargin(160.5000)
layout:setBottomMargin(0.5000)
img_myhero_1:addChild(text_ack)

--Create img_myhero_2
local img_myhero_2 = ccui.ImageView:create()
img_myhero_2:ignoreContentAdaptWithSize(false)
img_myhero_2:loadTexture("game/card/hero.png",0)
img_myhero_2:setLayoutComponentEnabled(true)
img_myhero_2:setName("img_myhero_2")
img_myhero_2:setTag(87)
img_myhero_2:setCascadeColorEnabled(true)
img_myhero_2:setCascadeOpacityEnabled(true)
img_myhero_2:setPosition(562.0000, 108.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(img_myhero_2)
layout:setPositionPercentX(0.4391)
layout:setPositionPercentY(0.1500)
layout:setPercentWidth(0.1063)
layout:setPercentHeight(0.2639)
layout:setSize({width = 136.0000, height = 190.0000})
layout:setLeftMargin(494.0000)
layout:setRightMargin(650.0000)
layout:setTopMargin(517.0000)
layout:setBottomMargin(13.0000)
Layer:addChild(img_myhero_2)

--Create img_card
local img_card = ccui.ImageView:create()
img_card:ignoreContentAdaptWithSize(false)
img_card:loadTexture("game/card/card_di_s.png",0)
img_card:setLayoutComponentEnabled(true)
img_card:setName("img_card")
img_card:setTag(88)
img_card:setCascadeColorEnabled(true)
img_card:setCascadeOpacityEnabled(true)
img_card:setPosition(68.0000, 97.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(img_card)
layout:setPositionPercentX(0.5000)
layout:setPositionPercentY(0.5105)
layout:setPercentWidth(1.1176)
layout:setPercentHeight(1.0895)
layout:setSize({width = 152.0000, height = 207.0000})
layout:setLeftMargin(-8.0000)
layout:setRightMargin(-8.0000)
layout:setTopMargin(-10.5000)
layout:setBottomMargin(-6.5000)
img_myhero_2:addChild(img_card)

--Create text_def
local text_def = ccui.Text:create()
text_def:ignoreContentAdaptWithSize(true)
text_def:setTextAreaSize({width = 0, height = 0})
text_def:setFontName("common/font/font.ttf")
text_def:setFontSize(25)
text_def:setString([[8]])
text_def:setTextHorizontalAlignment(1)
text_def:setTextVerticalAlignment(1)
text_def:enableShadow({r = 0, g = 0, b = 0, a = 255}, {width = 2, height = -2}, 0)
text_def:setLayoutComponentEnabled(true)
text_def:setName("text_def")
text_def:setTag(89)
text_def:setCascadeColorEnabled(true)
text_def:setCascadeOpacityEnabled(true)
text_def:setPosition(121.0000, 18.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(text_def)
layout:setPositionPercentX(0.8897)
layout:setPositionPercentY(0.0947)
layout:setPercentWidth(0.1397)
layout:setPercentHeight(0.1526)
layout:setSize({width = 19.0000, height = 29.0000})
layout:setLeftMargin(111.5000)
layout:setRightMargin(5.5000)
layout:setTopMargin(157.5000)
layout:setBottomMargin(3.5000)
img_myhero_2:addChild(text_def)

--Create text_ack
local text_ack = ccui.Text:create()
text_ack:ignoreContentAdaptWithSize(true)
text_ack:setTextAreaSize({width = 0, height = 0})
text_ack:setFontName("common/font/font.ttf")
text_ack:setFontSize(25)
text_ack:setString([[8]])
text_ack:setTextHorizontalAlignment(1)
text_ack:setTextVerticalAlignment(1)
text_ack:enableShadow({r = 0, g = 0, b = 0, a = 255}, {width = 2, height = -2}, 0)
text_ack:setLayoutComponentEnabled(true)
text_ack:setName("text_ack")
text_ack:setTag(90)
text_ack:setCascadeColorEnabled(true)
text_ack:setCascadeOpacityEnabled(true)
text_ack:setPosition(19.0000, 16.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(text_ack)
layout:setPositionPercentX(0.1397)
layout:setPositionPercentY(0.0842)
layout:setPercentWidth(0.1397)
layout:setPercentHeight(0.1526)
layout:setSize({width = 19.0000, height = 29.0000})
layout:setLeftMargin(9.5000)
layout:setRightMargin(107.5000)
layout:setTopMargin(159.5000)
layout:setBottomMargin(1.5000)
img_myhero_2:addChild(text_ack)

--Create img_myhero_3
local img_myhero_3 = ccui.ImageView:create()
img_myhero_3:ignoreContentAdaptWithSize(false)
img_myhero_3:loadTexture("game/card/hero.png",0)
img_myhero_3:setLayoutComponentEnabled(true)
img_myhero_3:setName("img_myhero_3")
img_myhero_3:setTag(83)
img_myhero_3:setCascadeColorEnabled(true)
img_myhero_3:setCascadeOpacityEnabled(true)
img_myhero_3:setPosition(718.0000, 108.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(img_myhero_3)
layout:setPositionPercentX(0.5609)
layout:setPositionPercentY(0.1500)
layout:setPercentWidth(0.1063)
layout:setPercentHeight(0.2639)
layout:setSize({width = 136.0000, height = 190.0000})
layout:setLeftMargin(650.0000)
layout:setRightMargin(494.0000)
layout:setTopMargin(517.0000)
layout:setBottomMargin(13.0000)
Layer:addChild(img_myhero_3)

--Create img_card
local img_card = ccui.ImageView:create()
img_card:ignoreContentAdaptWithSize(false)
img_card:loadTexture("game/card/card_di_s.png",0)
img_card:setLayoutComponentEnabled(true)
img_card:setName("img_card")
img_card:setTag(84)
img_card:setCascadeColorEnabled(true)
img_card:setCascadeOpacityEnabled(true)
img_card:setPosition(68.0000, 96.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(img_card)
layout:setPositionPercentX(0.5000)
layout:setPositionPercentY(0.5053)
layout:setPercentWidth(1.1176)
layout:setPercentHeight(1.0895)
layout:setSize({width = 152.0000, height = 207.0000})
layout:setLeftMargin(-8.0000)
layout:setRightMargin(-8.0000)
layout:setTopMargin(-9.5000)
layout:setBottomMargin(-7.5000)
img_myhero_3:addChild(img_card)

--Create text_def
local text_def = ccui.Text:create()
text_def:ignoreContentAdaptWithSize(true)
text_def:setTextAreaSize({width = 0, height = 0})
text_def:setFontName("common/font/font.ttf")
text_def:setFontSize(25)
text_def:setString([[8]])
text_def:setTextHorizontalAlignment(1)
text_def:setTextVerticalAlignment(1)
text_def:enableShadow({r = 0, g = 0, b = 0, a = 255}, {width = 2, height = -2}, 0)
text_def:setLayoutComponentEnabled(true)
text_def:setName("text_def")
text_def:setTag(85)
text_def:setCascadeColorEnabled(true)
text_def:setCascadeOpacityEnabled(true)
text_def:setPosition(121.0000, 18.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(text_def)
layout:setPositionPercentX(0.8897)
layout:setPositionPercentY(0.0947)
layout:setPercentWidth(0.1397)
layout:setPercentHeight(0.1526)
layout:setSize({width = 19.0000, height = 29.0000})
layout:setLeftMargin(111.5000)
layout:setRightMargin(5.5000)
layout:setTopMargin(157.5000)
layout:setBottomMargin(3.5000)
img_myhero_3:addChild(text_def)

--Create text_ack
local text_ack = ccui.Text:create()
text_ack:ignoreContentAdaptWithSize(true)
text_ack:setTextAreaSize({width = 0, height = 0})
text_ack:setFontName("common/font/font.ttf")
text_ack:setFontSize(25)
text_ack:setString([[8]])
text_ack:setTextHorizontalAlignment(1)
text_ack:setTextVerticalAlignment(1)
text_ack:enableShadow({r = 0, g = 0, b = 0, a = 255}, {width = 2, height = -2}, 0)
text_ack:setLayoutComponentEnabled(true)
text_ack:setName("text_ack")
text_ack:setTag(86)
text_ack:setCascadeColorEnabled(true)
text_ack:setCascadeOpacityEnabled(true)
text_ack:setPosition(19.0000, 16.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(text_ack)
layout:setPositionPercentX(0.1397)
layout:setPositionPercentY(0.0842)
layout:setPercentWidth(0.1397)
layout:setPercentHeight(0.1526)
layout:setSize({width = 19.0000, height = 29.0000})
layout:setLeftMargin(9.5000)
layout:setRightMargin(107.5000)
layout:setTopMargin(159.5000)
layout:setBottomMargin(1.5000)
img_myhero_3:addChild(text_ack)

--Create img_myhero_4
local img_myhero_4 = ccui.ImageView:create()
img_myhero_4:ignoreContentAdaptWithSize(false)
img_myhero_4:loadTexture("game/card/hero.png",0)
img_myhero_4:setLayoutComponentEnabled(true)
img_myhero_4:setName("img_myhero_4")
img_myhero_4:setTag(79)
img_myhero_4:setCascadeColorEnabled(true)
img_myhero_4:setCascadeOpacityEnabled(true)
img_myhero_4:setPosition(884.0000, 108.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(img_myhero_4)
layout:setPositionPercentX(0.6906)
layout:setPositionPercentY(0.1500)
layout:setPercentWidth(0.1063)
layout:setPercentHeight(0.2639)
layout:setSize({width = 136.0000, height = 190.0000})
layout:setLeftMargin(816.0000)
layout:setRightMargin(328.0000)
layout:setTopMargin(517.0000)
layout:setBottomMargin(13.0000)
Layer:addChild(img_myhero_4)

--Create img_card
local img_card = ccui.ImageView:create()
img_card:ignoreContentAdaptWithSize(false)
img_card:loadTexture("game/card/card_di_s.png",0)
img_card:setLayoutComponentEnabled(true)
img_card:setName("img_card")
img_card:setTag(80)
img_card:setCascadeColorEnabled(true)
img_card:setCascadeOpacityEnabled(true)
img_card:setPosition(68.0000, 96.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(img_card)
layout:setPositionPercentX(0.5000)
layout:setPositionPercentY(0.5053)
layout:setPercentWidth(1.1176)
layout:setPercentHeight(1.0895)
layout:setSize({width = 152.0000, height = 207.0000})
layout:setLeftMargin(-8.0000)
layout:setRightMargin(-8.0000)
layout:setTopMargin(-9.5000)
layout:setBottomMargin(-7.5000)
img_myhero_4:addChild(img_card)

--Create text_def
local text_def = ccui.Text:create()
text_def:ignoreContentAdaptWithSize(true)
text_def:setTextAreaSize({width = 0, height = 0})
text_def:setFontName("common/font/font.ttf")
text_def:setFontSize(25)
text_def:setString([[8]])
text_def:setTextHorizontalAlignment(1)
text_def:setTextVerticalAlignment(1)
text_def:enableShadow({r = 0, g = 0, b = 0, a = 255}, {width = 2, height = -2}, 0)
text_def:setLayoutComponentEnabled(true)
text_def:setName("text_def")
text_def:setTag(81)
text_def:setCascadeColorEnabled(true)
text_def:setCascadeOpacityEnabled(true)
text_def:setPosition(121.0000, 18.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(text_def)
layout:setPositionPercentX(0.8897)
layout:setPositionPercentY(0.0947)
layout:setPercentWidth(0.1397)
layout:setPercentHeight(0.1526)
layout:setSize({width = 19.0000, height = 29.0000})
layout:setLeftMargin(111.5000)
layout:setRightMargin(5.5000)
layout:setTopMargin(157.5000)
layout:setBottomMargin(3.5000)
img_myhero_4:addChild(text_def)

--Create text_ack
local text_ack = ccui.Text:create()
text_ack:ignoreContentAdaptWithSize(true)
text_ack:setTextAreaSize({width = 0, height = 0})
text_ack:setFontName("common/font/font.ttf")
text_ack:setFontSize(25)
text_ack:setString([[8]])
text_ack:setTextHorizontalAlignment(1)
text_ack:setTextVerticalAlignment(1)
text_ack:enableShadow({r = 0, g = 0, b = 0, a = 255}, {width = 2, height = -2}, 0)
text_ack:setLayoutComponentEnabled(true)
text_ack:setName("text_ack")
text_ack:setTag(82)
text_ack:setCascadeColorEnabled(true)
text_ack:setCascadeOpacityEnabled(true)
text_ack:setPosition(20.0000, 16.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(text_ack)
layout:setPositionPercentX(0.1471)
layout:setPositionPercentY(0.0842)
layout:setPercentWidth(0.1397)
layout:setPercentHeight(0.1526)
layout:setSize({width = 19.0000, height = 29.0000})
layout:setLeftMargin(10.5000)
layout:setRightMargin(106.5000)
layout:setTopMargin(159.5000)
layout:setBottomMargin(1.5000)
img_myhero_4:addChild(text_ack)

--Create img_enemy_1
local img_enemy_1 = ccui.ImageView:create()
img_enemy_1:ignoreContentAdaptWithSize(false)
img_enemy_1:loadTexture("game/card/card_bei.png",0)
img_enemy_1:setLayoutComponentEnabled(true)
img_enemy_1:setName("img_enemy_1")
img_enemy_1:setTag(104)
img_enemy_1:setCascadeColorEnabled(true)
img_enemy_1:setCascadeOpacityEnabled(true)
img_enemy_1:setPosition(447.0000, 640.0000)
img_enemy_1:setScaleX(0.7000)
img_enemy_1:setScaleY(0.7000)
layout = ccui.LayoutComponent:bindLayoutComponent(img_enemy_1)
layout:setPositionPercentX(0.3492)
layout:setPositionPercentY(0.8889)
layout:setPercentWidth(0.1188)
layout:setPercentHeight(0.2875)
layout:setSize({width = 152.0000, height = 207.0000})
layout:setLeftMargin(371.0000)
layout:setRightMargin(757.0000)
layout:setTopMargin(-23.5000)
layout:setBottomMargin(536.5000)
Layer:addChild(img_enemy_1)

--Create img_enemy_2
local img_enemy_2 = ccui.ImageView:create()
img_enemy_2:ignoreContentAdaptWithSize(false)
img_enemy_2:loadTexture("game/card/card_bei.png",0)
img_enemy_2:setLayoutComponentEnabled(true)
img_enemy_2:setName("img_enemy_2")
img_enemy_2:setTag(105)
img_enemy_2:setCascadeColorEnabled(true)
img_enemy_2:setCascadeOpacityEnabled(true)
img_enemy_2:setPosition(572.0000, 640.0000)
img_enemy_2:setScaleX(0.7000)
img_enemy_2:setScaleY(0.7000)
layout = ccui.LayoutComponent:bindLayoutComponent(img_enemy_2)
layout:setPositionPercentX(0.4469)
layout:setPositionPercentY(0.8889)
layout:setPercentWidth(0.1188)
layout:setPercentHeight(0.2875)
layout:setSize({width = 152.0000, height = 207.0000})
layout:setLeftMargin(496.0000)
layout:setRightMargin(632.0000)
layout:setTopMargin(-23.5000)
layout:setBottomMargin(536.5000)
Layer:addChild(img_enemy_2)

--Create img_enemy_3
local img_enemy_3 = ccui.ImageView:create()
img_enemy_3:ignoreContentAdaptWithSize(false)
img_enemy_3:loadTexture("game/card/card_bei.png",0)
img_enemy_3:setLayoutComponentEnabled(true)
img_enemy_3:setName("img_enemy_3")
img_enemy_3:setTag(106)
img_enemy_3:setCascadeColorEnabled(true)
img_enemy_3:setCascadeOpacityEnabled(true)
img_enemy_3:setPosition(694.0000, 640.0000)
img_enemy_3:setScaleX(0.7000)
img_enemy_3:setScaleY(0.7000)
layout = ccui.LayoutComponent:bindLayoutComponent(img_enemy_3)
layout:setPositionPercentX(0.5422)
layout:setPositionPercentY(0.8889)
layout:setPercentWidth(0.1188)
layout:setPercentHeight(0.2875)
layout:setSize({width = 152.0000, height = 207.0000})
layout:setLeftMargin(618.0000)
layout:setRightMargin(510.0000)
layout:setTopMargin(-23.5000)
layout:setBottomMargin(536.5000)
Layer:addChild(img_enemy_3)

--Create img_enemy_4
local img_enemy_4 = ccui.ImageView:create()
img_enemy_4:ignoreContentAdaptWithSize(false)
img_enemy_4:loadTexture("game/card/card_bei.png",0)
img_enemy_4:setLayoutComponentEnabled(true)
img_enemy_4:setName("img_enemy_4")
img_enemy_4:setTag(107)
img_enemy_4:setCascadeColorEnabled(true)
img_enemy_4:setCascadeOpacityEnabled(true)
img_enemy_4:setPosition(822.0000, 639.9999)
img_enemy_4:setScaleX(0.7000)
img_enemy_4:setScaleY(0.7000)
layout = ccui.LayoutComponent:bindLayoutComponent(img_enemy_4)
layout:setPositionPercentX(0.6422)
layout:setPositionPercentY(0.8889)
layout:setPercentWidth(0.1188)
layout:setPercentHeight(0.2875)
layout:setSize({width = 152.0000, height = 207.0000})
layout:setLeftMargin(746.0000)
layout:setRightMargin(382.0000)
layout:setTopMargin(-23.4999)
layout:setBottomMargin(536.4999)
Layer:addChild(img_enemy_4)

--Create img_all_card
local img_all_card = ccui.ImageView:create()
img_all_card:ignoreContentAdaptWithSize(false)
img_all_card:loadTexture("game/card/card_bei.png",0)
img_all_card:setLayoutComponentEnabled(true)
img_all_card:setName("img_all_card")
img_all_card:setTag(111)
img_all_card:setCascadeColorEnabled(true)
img_all_card:setCascadeOpacityEnabled(true)
img_all_card:setPosition(137.9996, 380.0000)
img_all_card:setScaleX(0.7000)
img_all_card:setScaleY(0.7000)
layout = ccui.LayoutComponent:bindLayoutComponent(img_all_card)
layout:setPositionPercentX(0.1078)
layout:setPositionPercentY(0.5278)
layout:setPercentWidth(0.1188)
layout:setPercentHeight(0.2875)
layout:setSize({width = 152.0000, height = 207.0000})
layout:setLeftMargin(61.9996)
layout:setRightMargin(1066.0000)
layout:setTopMargin(236.5000)
layout:setBottomMargin(276.5000)
Layer:addChild(img_all_card)

--Create card_bg
local card_bg = ccui.ImageView:create()
card_bg:ignoreContentAdaptWithSize(false)
card_bg:loadTexture("game/card_bg.png",0)
card_bg:setLayoutComponentEnabled(true)
card_bg:setName("card_bg")
card_bg:setTag(235)
card_bg:setCascadeColorEnabled(true)
card_bg:setCascadeOpacityEnabled(true)
card_bg:setPosition(640.0000, 385.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(card_bg)
layout:setPositionPercentX(0.5000)
layout:setPositionPercentY(0.5347)
layout:setPercentWidth(0.2766)
layout:setPercentHeight(0.3361)
layout:setSize({width = 354.0000, height = 242.0000})
layout:setLeftMargin(463.0000)
layout:setRightMargin(463.0000)
layout:setTopMargin(214.0000)
layout:setBottomMargin(264.0000)
Layer:addChild(card_bg)

--Create img_xian
local img_xian = ccui.ImageView:create()
img_xian:ignoreContentAdaptWithSize(false)
img_xian:loadTexture("game/img_xian.png",0)
img_xian:setLayoutComponentEnabled(true)
img_xian:setName("img_xian")
img_xian:setTag(236)
img_xian:setCascadeColorEnabled(true)
img_xian:setCascadeOpacityEnabled(true)
img_xian:setPosition(640.0000, 370.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(img_xian)
layout:setPositionPercentX(0.5000)
layout:setPositionPercentY(0.5139)
layout:setPercentWidth(0.0688)
layout:setPercentHeight(0.3278)
layout:setSize({width = 88.0000, height = 236.0000})
layout:setLeftMargin(596.0000)
layout:setRightMargin(596.0000)
layout:setTopMargin(232.0000)
layout:setBottomMargin(252.0000)
Layer:addChild(img_xian)

--Create img_enemy
local img_enemy = ccui.ImageView:create()
img_enemy:ignoreContentAdaptWithSize(false)
img_enemy:loadTexture("game/img_enemy.png",0)
img_enemy:setLayoutComponentEnabled(true)
img_enemy:setName("img_enemy")
img_enemy:setTag(237)
img_enemy:setCascadeColorEnabled(true)
img_enemy:setCascadeOpacityEnabled(true)
img_enemy:setPosition(730.0000, 476.5000)
layout = ccui.LayoutComponent:bindLayoutComponent(img_enemy)
layout:setPositionPercentX(0.5703)
layout:setPositionPercentY(0.6618)
layout:setPercentWidth(0.0500)
layout:setPercentHeight(0.0389)
layout:setSize({width = 64.0000, height = 28.0000})
layout:setLeftMargin(698.0000)
layout:setRightMargin(518.0000)
layout:setTopMargin(229.5000)
layout:setBottomMargin(462.5000)
Layer:addChild(img_enemy)

--Create img_my
local img_my = ccui.ImageView:create()
img_my:ignoreContentAdaptWithSize(false)
img_my:loadTexture("game/img_my.png",0)
img_my:setLayoutComponentEnabled(true)
img_my:setName("img_my")
img_my:setTag(238)
img_my:setCascadeColorEnabled(true)
img_my:setCascadeOpacityEnabled(true)
img_my:setAnchorPoint(0.5234, 0.5357)
img_my:setPosition(564.5000, 477.5000)
layout = ccui.LayoutComponent:bindLayoutComponent(img_my)
layout:setPositionPercentX(0.4410)
layout:setPositionPercentY(0.6632)
layout:setPercentWidth(0.0500)
layout:setPercentHeight(0.0389)
layout:setSize({width = 64.0000, height = 28.0000})
layout:setLeftMargin(531.0024)
layout:setRightMargin(684.9976)
layout:setTopMargin(229.4996)
layout:setBottomMargin(462.5004)
Layer:addChild(img_my)

--Create img_enemy_out
local img_enemy_out = ccui.ImageView:create()
img_enemy_out:ignoreContentAdaptWithSize(false)
img_enemy_out:loadTexture("game/img_di.png",0)
img_enemy_out:setLayoutComponentEnabled(true)
img_enemy_out:setName("img_enemy_out")
img_enemy_out:setTag(110)
img_enemy_out:setCascadeColorEnabled(true)
img_enemy_out:setCascadeOpacityEnabled(true)
img_enemy_out:setPosition(725.9999, 380.0000)
img_enemy_out:setScaleX(0.9000)
img_enemy_out:setScaleY(0.9000)
layout = ccui.LayoutComponent:bindLayoutComponent(img_enemy_out)
layout:setPositionPercentX(0.5672)
layout:setPositionPercentY(0.5278)
layout:setPercentWidth(0.0992)
layout:setPercentHeight(0.2444)
layout:setSize({width = 127.0000, height = 176.0000})
layout:setLeftMargin(662.4999)
layout:setRightMargin(490.5001)
layout:setTopMargin(252.0000)
layout:setBottomMargin(292.0000)
Layer:addChild(img_enemy_out)

--Create img_my_out
local img_my_out = ccui.ImageView:create()
img_my_out:ignoreContentAdaptWithSize(false)
img_my_out:loadTexture("game/img_di.png",0)
img_my_out:setLayoutComponentEnabled(true)
img_my_out:setName("img_my_out")
img_my_out:setTag(109)
img_my_out:setCascadeColorEnabled(true)
img_my_out:setCascadeOpacityEnabled(true)
img_my_out:setPosition(561.0000, 380.0000)
img_my_out:setScaleX(0.9000)
img_my_out:setScaleY(0.9000)
layout = ccui.LayoutComponent:bindLayoutComponent(img_my_out)
layout:setPositionPercentX(0.4383)
layout:setPositionPercentY(0.5278)
layout:setPercentWidth(0.0992)
layout:setPercentHeight(0.2444)
layout:setSize({width = 127.0000, height = 176.0000})
layout:setLeftMargin(497.5000)
layout:setRightMargin(655.5000)
layout:setTopMargin(252.0000)
layout:setBottomMargin(292.0000)
Layer:addChild(img_my_out)

--Create Animation
result['animation'] = ccs.ActionTimeline:create()
  
result['animation']:setDuration(0)
result['animation']:setTimeSpeed(1.0000)
--Create Animation List

result['root'] = Layer
return result;
end

return Result

