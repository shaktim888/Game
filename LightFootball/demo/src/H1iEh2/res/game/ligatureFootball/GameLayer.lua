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

--Create bg
local bg = ccui.ImageView:create()
bg:ignoreContentAdaptWithSize(false)
bg:loadTexture("game/ligatureFootball/gameLayer/bg_scene.png",0)
bg:setLayoutComponentEnabled(true)
bg:setName("bg")
bg:setTag(173)
bg:setCascadeColorEnabled(true)
bg:setCascadeOpacityEnabled(true)
bg:setPosition(360.0000, 640.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(bg)
layout:setPositionPercentX(0.5000)
layout:setPositionPercentY(0.5000)
layout:setPercentWidth(1.0000)
layout:setPercentHeight(1.0000)
layout:setSize({width = 720.0000, height = 1280.0000})
Layer:addChild(bg)

--Create wang
local wang = cc.Sprite:create("game/ligatureFootball/gameLayer/goal.png")
wang:setName("wang")
wang:setTag(172)
wang:setCascadeColorEnabled(true)
wang:setCascadeOpacityEnabled(true)
wang:setPosition(360.0000, 1174.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(wang)
layout:setPositionPercentX(0.5000)
layout:setPositionPercentY(0.9172)
layout:setPercentWidth(0.7667)
layout:setPercentHeight(0.0977)
layout:setSize({width = 552.0000, height = 125.0000})
layout:setLeftMargin(84.0000)
layout:setRightMargin(84.0000)
layout:setTopMargin(43.5000)
layout:setBottomMargin(1111.5000)
wang:setBlendFunc({src = 1, dst = 771})
Layer:addChild(wang)

--Create enemyLayer
local enemyLayer=cc.Node:create()
enemyLayer:setName("enemyLayer")
enemyLayer:setTag(171)
enemyLayer:setCascadeColorEnabled(true)
enemyLayer:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(enemyLayer)
layout:setRightMargin(720.0000)
layout:setTopMargin(1280.0000)
Layer:addChild(enemyLayer)

--Create num_level
local num_level = ccui.Text:create()
num_level:ignoreContentAdaptWithSize(true)
num_level:setTextAreaSize({width = 0, height = 0})
num_level:setFontName("game/ligatureFootball/font.ttf")
num_level:setFontSize(40)
num_level:setString([[25]])
num_level:setLayoutComponentEnabled(true)
num_level:setName("num_level")
num_level:setTag(169)
num_level:setCascadeColorEnabled(true)
num_level:setCascadeOpacityEnabled(true)
num_level:setPosition(392.5000, 1250.0000)
num_level:setTextColor({r = 255, g = 255, b = 0})
layout = ccui.LayoutComponent:bindLayoutComponent(num_level)
layout:setPositionPercentX(0.5451)
layout:setPositionPercentY(0.9766)
layout:setPercentWidth(0.0750)
layout:setPercentHeight(0.0359)
layout:setSize({width = 54.0000, height = 46.0000})
layout:setLeftMargin(365.5000)
layout:setRightMargin(300.5000)
layout:setTopMargin(7.0000)
layout:setBottomMargin(1227.0000)
Layer:addChild(num_level)

--Create img_level
local img_level = cc.Sprite:create("game/ligatureFootball/gameLayer/level.png")
img_level:setName("img_level")
img_level:setTag(170)
img_level:setCascadeColorEnabled(true)
img_level:setCascadeOpacityEnabled(true)
img_level:setPosition(302.0000, 1253.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(img_level)
layout:setPositionPercentX(0.4194)
layout:setPositionPercentY(0.9789)
layout:setPercentWidth(0.1347)
layout:setPercentHeight(0.0305)
layout:setSize({width = 97.0000, height = 39.0000})
layout:setLeftMargin(253.5000)
layout:setRightMargin(369.5000)
layout:setTopMargin(7.5000)
layout:setBottomMargin(1233.5000)
img_level:setBlendFunc({src = 1, dst = 771})
Layer:addChild(img_level)

--Create ball
local ball = cc.Sprite:create("game/ligatureFootball/obstacle/ball.png")
ball:setName("ball")
ball:setTag(168)
ball:setCascadeColorEnabled(true)
ball:setCascadeOpacityEnabled(true)
ball:setPosition(-135.0000, 30.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(ball)
layout:setPositionPercentX(-0.1875)
layout:setPositionPercentY(0.0234)
layout:setPercentWidth(0.0361)
layout:setPercentHeight(0.0203)
layout:setSize({width = 26.0000, height = 26.0000})
layout:setLeftMargin(-148.0000)
layout:setRightMargin(842.0000)
layout:setTopMargin(1237.0000)
layout:setBottomMargin(17.0000)
ball:setBlendFunc({src = 1, dst = 771})
Layer:addChild(ball)

--Create touchLayer
local touchLayer = ccui.Layout:create()
touchLayer:ignoreContentAdaptWithSize(false)
touchLayer:setClippingEnabled(false)
touchLayer:setBackGroundColorOpacity(102)
touchLayer:setTouchEnabled(true);
touchLayer:setLayoutComponentEnabled(true)
touchLayer:setName("touchLayer")
touchLayer:setTag(167)
touchLayer:setCascadeColorEnabled(true)
touchLayer:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(touchLayer)
layout:setPercentWidth(1.0000)
layout:setPercentHeight(1.0000)
layout:setSize({width = 720.0000, height = 1280.0000})
Layer:addChild(touchLayer)

--Create btn_music_on
local btn_music_on = ccui.Button:create()
btn_music_on:ignoreContentAdaptWithSize(false)
btn_music_on:loadTextureNormal("game/ligatureFootball/gamebtn/UI_music_1.png",0)
btn_music_on:loadTexturePressed("game/ligatureFootball/gamebtn/UI_music_1.png",0)
btn_music_on:loadTextureDisabled("game/ligatureFootball/gamebtn/UI_music_1.png",0)
btn_music_on:setTitleFontSize(14)
btn_music_on:setTitleColor({r = 65, g = 65, b = 70})
btn_music_on:setLayoutComponentEnabled(true)
btn_music_on:setName("btn_music_on")
btn_music_on:setTag(163)
btn_music_on:setCascadeColorEnabled(true)
btn_music_on:setCascadeOpacityEnabled(true)
btn_music_on:setPosition(83.0000, 1197.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(btn_music_on)
layout:setPositionPercentX(0.1153)
layout:setPositionPercentY(0.9352)
layout:setPercentWidth(0.2319)
layout:setPercentHeight(0.1305)
layout:setSize({width = 167.0000, height = 167.0000})
layout:setLeftMargin(-0.5000)
layout:setRightMargin(553.5000)
layout:setTopMargin(-0.5000)
layout:setBottomMargin(1113.5000)
Layer:addChild(btn_music_on)

--Create btn_music_off
local btn_music_off = ccui.Button:create()
btn_music_off:ignoreContentAdaptWithSize(false)
btn_music_off:loadTextureNormal("game/ligatureFootball/gamebtn/UI_music_2.png",0)
btn_music_off:loadTexturePressed("game/ligatureFootball/gamebtn/UI_music_2.png",0)
btn_music_off:loadTextureDisabled("game/ligatureFootball/gamebtn/UI_music_2.png",0)
btn_music_off:setTitleFontSize(14)
btn_music_off:setTitleColor({r = 65, g = 65, b = 70})
btn_music_off:setLayoutComponentEnabled(true)
btn_music_off:setName("btn_music_off")
btn_music_off:setTag(164)
btn_music_off:setCascadeColorEnabled(true)
btn_music_off:setCascadeOpacityEnabled(true)
btn_music_off:setPosition(83.0000, 1197.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(btn_music_off)
layout:setPositionPercentX(0.1153)
layout:setPositionPercentY(0.9352)
layout:setPercentWidth(0.2319)
layout:setPercentHeight(0.1305)
layout:setSize({width = 167.0000, height = 167.0000})
layout:setLeftMargin(-0.5000)
layout:setRightMargin(553.5000)
layout:setTopMargin(-0.5000)
layout:setBottomMargin(1113.5000)
Layer:addChild(btn_music_off)

--Create btn_shoot
local btn_shoot = ccui.Button:create()
btn_shoot:ignoreContentAdaptWithSize(false)
btn_shoot:loadTextureNormal("game/ligatureFootball/gamebtn/UI_shoot.png",0)
btn_shoot:loadTexturePressed("game/ligatureFootball/gamebtn/UI_shoot.png",0)
btn_shoot:loadTextureDisabled("game/ligatureFootball/gamebtn/UI_shoot.png",0)
btn_shoot:setTitleFontSize(14)
btn_shoot:setTitleColor({r = 65, g = 65, b = 70})
btn_shoot:setScale9Enabled(true)
btn_shoot:setCapInsets({x = 15, y = 11, width = 137, height = 145})
btn_shoot:setLayoutComponentEnabled(true)
btn_shoot:setName("btn_shoot")
btn_shoot:setTag(165)
btn_shoot:setCascadeColorEnabled(true)
btn_shoot:setCascadeOpacityEnabled(true)
btn_shoot:setPosition(636.0000, 84.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(btn_shoot)
layout:setPositionPercentX(0.8833)
layout:setPositionPercentY(0.0656)
layout:setPercentWidth(0.2319)
layout:setPercentHeight(0.1305)
layout:setSize({width = 167.0000, height = 167.0000})
layout:setLeftMargin(552.5000)
layout:setRightMargin(0.5000)
layout:setTopMargin(1112.5000)
layout:setBottomMargin(0.5000)
Layer:addChild(btn_shoot)

--Create btn_pause
local btn_pause = ccui.Button:create()
btn_pause:ignoreContentAdaptWithSize(false)
btn_pause:loadTextureNormal("game/ligatureFootball/gamebtn/UI_stopNormal.png",0)
btn_pause:loadTexturePressed("game/ligatureFootball/gamebtn/UI_stopNormal.png",0)
btn_pause:loadTextureDisabled("game/ligatureFootball/gamebtn/UI_stopNormal.png",0)
btn_pause:setTitleFontSize(14)
btn_pause:setTitleColor({r = 65, g = 65, b = 70})
btn_pause:setScale9Enabled(true)
btn_pause:setCapInsets({x = 15, y = 11, width = 124, height = 132})
btn_pause:setLayoutComponentEnabled(true)
btn_pause:setName("btn_pause")
btn_pause:setTag(166)
btn_pause:setCascadeColorEnabled(true)
btn_pause:setCascadeOpacityEnabled(true)
btn_pause:setPosition(655.0000, 1199.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(btn_pause)
layout:setPositionPercentX(0.9097)
layout:setPositionPercentY(0.9367)
layout:setPercentWidth(0.2139)
layout:setPercentHeight(0.1203)
layout:setSize({width = 154.0000, height = 154.0000})
layout:setLeftMargin(578.0000)
layout:setRightMargin(-12.0000)
layout:setTopMargin(4.0000)
layout:setBottomMargin(1122.0000)
Layer:addChild(btn_pause)

--Create accoutLayer
local accoutLayer=cc.Node:create()
accoutLayer:setName("accoutLayer")
accoutLayer:setTag(162)
accoutLayer:setCascadeColorEnabled(true)
accoutLayer:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(accoutLayer)
layout:setRightMargin(720.0000)
layout:setTopMargin(1280.0000)
Layer:addChild(accoutLayer)

--Create Animation
result['animation'] = ccs.ActionTimeline:create()
  
result['animation']:setDuration(0)
result['animation']:setTimeSpeed(1.0000)
--Create Animation List

result['root'] = Layer
return result;
end

return Result

