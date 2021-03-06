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

--Create Image_1
local Image_1 = ccui.ImageView:create()
Image_1:ignoreContentAdaptWithSize(false)
Image_1:loadTexture("game/chuangchuang/images/bg.png",0)
Image_1:setLayoutComponentEnabled(true)
Image_1:setName("Image_1")
Image_1:setTag(65)
Image_1:setCascadeColorEnabled(true)
Image_1:setCascadeOpacityEnabled(true)
Image_1:setPosition(360.0000, 640.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(Image_1)
layout:setPositionPercentX(0.5000)
layout:setPositionPercentY(0.5000)
layout:setPercentWidth(1.0000)
layout:setPercentHeight(1.0000)
layout:setSize({width = 720.0000, height = 1280.0000})
layout:setStretchWidthEnabled(true)
layout:setStretchHeightEnabled(true)
Layer:addChild(Image_1)

--Create role
local role = cc.Sprite:create("game/chuangchuang/images/role.png")
role:setName("role")
role:setTag(33)
role:setCascadeColorEnabled(true)
role:setCascadeOpacityEnabled(true)
role:setAnchorPoint(0.5000, 0.0000)
role:setPosition(233.8600, 0.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(role)
layout:setPositionPercentX(0.3248)
layout:setPercentWidth(1.7778)
layout:setPercentHeight(0.5625)
layout:setSize({width = 1280.0000, height = 720.0000})
layout:setLeftMargin(-406.1400)
layout:setRightMargin(-153.8600)
layout:setTopMargin(560.0000)
role:setBlendFunc({src = 1, dst = 771})
Layer:addChild(role)

--Create btnStart
local btnStart = ccui.Button:create()
btnStart:ignoreContentAdaptWithSize(false)
btnStart:loadTextureNormal("game/chuangchuang/images/btn.png",0)
btnStart:setTitleFontName("game/chuangchuang/images/hwxk.ttf")
btnStart:setTitleFontSize(35)
btnStart:setTitleText("Play")
btnStart:setTitleColor({r = 0, g = 0, b = 0})
btnStart:setLayoutComponentEnabled(true)
btnStart:setName("btnStart")
btnStart:setTag(53)
btnStart:setCascadeColorEnabled(true)
btnStart:setCascadeOpacityEnabled(true)
btnStart:setPosition(458.4240, 588.0320)
layout = ccui.LayoutComponent:bindLayoutComponent(btnStart)
layout:setPositionPercentX(0.6367)
layout:setPositionPercentY(0.4594)
layout:setPercentWidth(0.3222)
layout:setPercentHeight(0.0742)
layout:setSize({width = 232.0000, height = 95.0000})
layout:setHorizontalEdge(3)
layout:setVerticalEdge(3)
layout:setLeftMargin(342.4240)
layout:setRightMargin(145.5760)
layout:setTopMargin(644.4680)
layout:setBottomMargin(540.5320)
Layer:addChild(btnStart)

--Create btnAbout
local btnAbout = ccui.Button:create()
btnAbout:ignoreContentAdaptWithSize(false)
btnAbout:loadTextureNormal("game/chuangchuang/images/btn.png",0)
btnAbout:setTitleFontName("game/chuangchuang/images/hwxk.ttf")
btnAbout:setTitleFontSize(35)
btnAbout:setTitleText("Rule")
btnAbout:setTitleColor({r = 0, g = 0, b = 0})
btnAbout:setLayoutComponentEnabled(true)
btnAbout:setName("btnAbout")
btnAbout:setTag(54)
btnAbout:setCascadeColorEnabled(true)
btnAbout:setCascadeOpacityEnabled(true)
btnAbout:setPosition(458.4240, 427.1360)
layout = ccui.LayoutComponent:bindLayoutComponent(btnAbout)
layout:setPositionPercentX(0.6367)
layout:setPositionPercentY(0.3337)
layout:setPercentWidth(0.3222)
layout:setPercentHeight(0.0742)
layout:setSize({width = 232.0000, height = 95.0000})
layout:setHorizontalEdge(3)
layout:setVerticalEdge(3)
layout:setLeftMargin(342.4240)
layout:setRightMargin(145.5760)
layout:setTopMargin(805.3640)
layout:setBottomMargin(379.6360)
Layer:addChild(btnAbout)

--Create btnSetting
local btnSetting = ccui.Button:create()
btnSetting:ignoreContentAdaptWithSize(false)
btnSetting:loadTextureNormal("game/chuangchuang/images/shezhi.png",0)
btnSetting:loadTexturePressed("game/chuangchuang/images/shezhi.png",0)
btnSetting:loadTextureDisabled("Default/Button_Disable.png",0)
btnSetting:setTitleFontSize(14)
btnSetting:setTitleColor({r = 65, g = 65, b = 70})
btnSetting:setLayoutComponentEnabled(true)
btnSetting:setName("btnSetting")
btnSetting:setTag(66)
btnSetting:setCascadeColorEnabled(true)
btnSetting:setCascadeOpacityEnabled(true)
btnSetting:setPosition(639.2356, 1216.8850)
layout = ccui.LayoutComponent:bindLayoutComponent(btnSetting)
layout:setPositionPercentX(0.8878)
layout:setPositionPercentY(0.9507)
layout:setPercentWidth(0.1139)
layout:setPercentHeight(0.0617)
layout:setSize({width = 82.0000, height = 79.0000})
layout:setHorizontalEdge(2)
layout:setVerticalEdge(2)
layout:setLeftMargin(598.2356)
layout:setRightMargin(39.7644)
layout:setTopMargin(23.6151)
layout:setBottomMargin(1177.3850)
Layer:addChild(btnSetting)

--Create logo_1
local logo_1 = cc.Sprite:create("Default/Sprite.png")
logo_1:setName("logo_1")
logo_1:setTag(33)
logo_1:setCascadeColorEnabled(true)
logo_1:setCascadeOpacityEnabled(true)
logo_1:setVisible(false)
logo_1:setPosition(368.8292, 983.2872)
layout = ccui.LayoutComponent:bindLayoutComponent(logo_1)
layout:setPositionPercentX(0.5123)
layout:setPositionPercentY(0.7682)
layout:setPercentWidth(0.0639)
layout:setPercentHeight(0.0359)
layout:setSize({width = 46.0000, height = 46.0000})
layout:setLeftMargin(345.8292)
layout:setRightMargin(328.1708)
layout:setTopMargin(273.7128)
layout:setBottomMargin(960.2872)
logo_1:setBlendFunc({src = 1, dst = 771})
Layer:addChild(logo_1)

--Create best
local best = ccui.Text:create()
best:ignoreContentAdaptWithSize(true)
best:setTextAreaSize({width = 0, height = 0})
best:setFontName("game/chuangchuang/images/hwxk.ttf")
best:setFontSize(45)
best:setString([[BEAT:1000]])
best:setLayoutComponentEnabled(true)
best:setName("best")
best:setTag(32)
best:setCascadeColorEnabled(true)
best:setCascadeOpacityEnabled(true)
best:setPosition(206.3874, 1099.9140)
layout = ccui.LayoutComponent:bindLayoutComponent(best)
layout:setPositionPercentX(0.2866)
layout:setPositionPercentY(0.8593)
layout:setPercentWidth(0.2764)
layout:setPercentHeight(0.0383)
layout:setSize({width = 199.0000, height = 49.0000})
layout:setLeftMargin(106.8874)
layout:setRightMargin(414.1126)
layout:setTopMargin(155.5863)
layout:setBottomMargin(1075.4140)
Layer:addChild(best)

--Create Animation
result['animation'] = ccs.ActionTimeline:create()
  
result['animation']:setDuration(0)
result['animation']:setTimeSpeed(1.0000)
--Create Animation List

result['root'] = Layer
return result;
end

return Result

