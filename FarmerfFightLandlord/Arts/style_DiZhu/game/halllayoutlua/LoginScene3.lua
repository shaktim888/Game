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

--Create bg
local bg = cc.Sprite:create("game/FarmerfFightLandlord/image/bg.png")
bg:setName("bg")
bg:setTag(38)
bg:setCascadeColorEnabled(true)
bg:setCascadeOpacityEnabled(true)
bg:setPosition(360.0000, 640.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(bg)
layout:setPositionPercentXEnabled(true)
layout:setPositionPercentYEnabled(true)
layout:setPositionPercentX(0.5000)
layout:setPositionPercentY(0.5000)
layout:setPercentWidth(1.0000)
layout:setPercentHeight(1.0000)
layout:setSize({width = 720.0000, height = 1280.0000})
bg:setBlendFunc({src = 1, dst = 771})
Scene:addChild(bg)

--Create pk
local pk = ccui.ImageView:create()
pk:ignoreContentAdaptWithSize(false)
pk:loadTexture("game/FarmerfFightLandlord/image/pk.png",0)
pk:setLayoutComponentEnabled(true)
pk:setName("pk")
pk:setTag(35)
pk:setCascadeColorEnabled(true)
pk:setCascadeOpacityEnabled(true)
pk:setPosition(360.0000, 570.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(pk)
layout:setPositionPercentX(0.5000)
layout:setPositionPercentY(0.4453)
layout:setPercentWidth(1.0000)
layout:setPercentHeight(0.5172)
layout:setSize({width = 720.0000, height = 662.0000})
layout:setTopMargin(379.0000)
layout:setBottomMargin(239.0000)
Scene:addChild(pk)

--Create shopBtn
local shopBtn = ccui.Button:create()
shopBtn:ignoreContentAdaptWithSize(false)
shopBtn:loadTextureNormal("game/FarmerfFightLandlord/image/shop.png",0)
shopBtn:setTitleFontSize(14)
shopBtn:setTitleColor({r = 65, g = 65, b = 70})
shopBtn:setLayoutComponentEnabled(true)
shopBtn:setName("shopBtn")
shopBtn:setTag(39)
shopBtn:setCascadeColorEnabled(true)
shopBtn:setCascadeOpacityEnabled(true)
shopBtn:setPosition(180.0000, 1050.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(shopBtn)
layout:setPositionPercentX(0.2500)
layout:setPositionPercentY(0.8203)
layout:setPercentWidth(0.2472)
layout:setPercentHeight(0.1461)
layout:setSize({width = 178.0000, height = 187.0000})
layout:setVerticalEdge(2)
layout:setLeftMargin(91.0000)
layout:setRightMargin(451.0000)
layout:setTopMargin(136.5000)
layout:setBottomMargin(956.5000)
Scene:addChild(shopBtn)

--Create startBtn
local startBtn = ccui.Button:create()
startBtn:ignoreContentAdaptWithSize(false)
startBtn:loadTextureNormal("game/FarmerfFightLandlord/image/button.png",0)
startBtn:setTitleFontName("game/FarmerfFightLandlord/image/nvpk.ttf")
startBtn:setTitleFontSize(60)
startBtn:setTitleText("play")
startBtn:setLayoutComponentEnabled(true)
startBtn:setName("startBtn")
startBtn:setTag(289)
startBtn:setCascadeColorEnabled(true)
startBtn:setCascadeOpacityEnabled(true)
startBtn:setPosition(195.0000, 306.9972)
layout = ccui.LayoutComponent:bindLayoutComponent(startBtn)
layout:setPositionPercentX(0.2708)
layout:setPositionPercentY(0.2398)
layout:setPercentWidth(0.3472)
layout:setPercentHeight(0.0781)
layout:setSize({width = 250.0000, height = 100.0000})
layout:setHorizontalEdge(3)
layout:setLeftMargin(70.0000)
layout:setRightMargin(400.0000)
layout:setTopMargin(923.0028)
layout:setBottomMargin(256.9972)
Scene:addChild(startBtn)

--Create ruleBtn
local ruleBtn = ccui.Button:create()
ruleBtn:ignoreContentAdaptWithSize(false)
ruleBtn:loadTextureNormal("game/FarmerfFightLandlord/image/button.png",0)
ruleBtn:setTitleFontName("game/FarmerfFightLandlord/image/nvpk.ttf")
ruleBtn:setTitleFontSize(60)
ruleBtn:setTitleText("Rule")
ruleBtn:setLayoutComponentEnabled(true)
ruleBtn:setName("ruleBtn")
ruleBtn:setTag(288)
ruleBtn:setCascadeColorEnabled(true)
ruleBtn:setCascadeOpacityEnabled(true)
ruleBtn:setPosition(195.0000, 157.9965)
layout = ccui.LayoutComponent:bindLayoutComponent(ruleBtn)
layout:setPositionPercentX(0.2708)
layout:setPositionPercentY(0.1234)
layout:setPercentWidth(0.3472)
layout:setPercentHeight(0.0781)
layout:setSize({width = 250.0000, height = 100.0000})
layout:setHorizontalEdge(3)
layout:setLeftMargin(70.0000)
layout:setRightMargin(400.0000)
layout:setTopMargin(1072.0040)
layout:setBottomMargin(107.9965)
Scene:addChild(ruleBtn)

--Create Animation
result['animation'] = ccs.ActionTimeline:create()
  
result['animation']:setDuration(0)
result['animation']:setTimeSpeed(1.0000)
--Create Animation List

result['root'] = Scene
return result;
end

return Result

