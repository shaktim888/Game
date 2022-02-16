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

--Create gameBg
local gameBg = cc.Sprite:create("game/MountaintopJumps/image/bg.png")
gameBg:setName("gameBg")
gameBg:setTag(41)
gameBg:setCascadeColorEnabled(true)
gameBg:setCascadeOpacityEnabled(true)
gameBg:setPosition(360.0000, 640.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(gameBg)
layout:setPositionPercentXEnabled(true)
layout:setPositionPercentYEnabled(true)
layout:setPositionPercentX(0.5000)
layout:setPositionPercentY(0.5000)
layout:setPercentWidth(1.0000)
layout:setPercentHeight(1.0000)
layout:setSize({width = 720.0000, height = 1280.0000})
gameBg:setBlendFunc({src = 1, dst = 771})
Scene:addChild(gameBg)

--Create mapPool
local mapPool = ccui.Layout:create()
mapPool:ignoreContentAdaptWithSize(false)
mapPool:setClippingEnabled(false)
mapPool:setLayoutComponentEnabled(true)
mapPool:setName("mapPool")
mapPool:setTag(40)
mapPool:setCascadeColorEnabled(true)
mapPool:setCascadeOpacityEnabled(true)
mapPool:setAnchorPoint(0.5000, 0.5000)
mapPool:setPosition(360.0000, 640.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(mapPool)
layout:setPositionPercentXEnabled(true)
layout:setPositionPercentYEnabled(true)
layout:setPositionPercentX(0.5000)
layout:setPositionPercentY(0.5000)
layout:setPercentWidth(1.0000)
layout:setPercentHeight(1.0000)
layout:setSize({width = 720.0000, height = 1280.0000})
Scene:addChild(mapPool)

--Create peoplePool
local peoplePool = ccui.Layout:create()
peoplePool:ignoreContentAdaptWithSize(false)
peoplePool:setClippingEnabled(false)
peoplePool:setBackGroundColorOpacity(102)
peoplePool:setLayoutComponentEnabled(true)
peoplePool:setName("peoplePool")
peoplePool:setTag(47)
peoplePool:setCascadeColorEnabled(true)
peoplePool:setCascadeOpacityEnabled(true)
peoplePool:setAnchorPoint(0.5000, 0.5000)
peoplePool:setPosition(360.0000, 640.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(peoplePool)
layout:setPositionPercentXEnabled(true)
layout:setPositionPercentYEnabled(true)
layout:setPositionPercentX(0.5000)
layout:setPositionPercentY(0.5000)
layout:setPercentWidth(1.0000)
layout:setPercentHeight(1.0000)
layout:setSize({width = 720.0000, height = 1280.0000})
Scene:addChild(peoplePool)

--Create scoreLabel
local scoreLabel = ccui.Text:create()
scoreLabel:ignoreContentAdaptWithSize(true)
scoreLabel:setTextAreaSize({width = 0, height = 0})
scoreLabel:setFontName("game/MountaintopJumps/image/nvpk.ttf")
scoreLabel:setFontSize(48)
scoreLabel:setString([[分数：0]])
scoreLabel:setLayoutComponentEnabled(true)
scoreLabel:setName("scoreLabel")
scoreLabel:setTag(18)
scoreLabel:setCascadeColorEnabled(true)
scoreLabel:setCascadeOpacityEnabled(true)
scoreLabel:setPosition(360.0000, 1240.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(scoreLabel)
layout:setPositionPercentXEnabled(true)
layout:setPositionPercentX(0.5000)
layout:setPositionPercentY(0.9688)
layout:setPercentWidth(0.2389)
layout:setPercentHeight(0.0453)
layout:setSize({width = 172.0000, height = 58.0000})
layout:setLeftMargin(274.0000)
layout:setRightMargin(274.0000)
layout:setTopMargin(11.0000)
layout:setBottomMargin(1211.0000)
Scene:addChild(scoreLabel)

--Create btn_back
local btn_back = ccui.Button:create()
btn_back:ignoreContentAdaptWithSize(false)
btn_back:loadTextureNormal("game/MountaintopJumps/image/btn_return.png",0)
btn_back:loadTexturePressed("game/MountaintopJumps/image/btn_return.png",0)
btn_back:loadTextureDisabled("Default/Button_Disable.png",0)
btn_back:setTitleFontSize(14)
btn_back:setTitleColor({r = 65, g = 65, b = 70})
btn_back:setLayoutComponentEnabled(true)
btn_back:setName("btn_back")
btn_back:setTag(47)
btn_back:setCascadeColorEnabled(true)
btn_back:setCascadeOpacityEnabled(true)
btn_back:setAnchorPoint(1.0000, 1.0000)
btn_back:setPosition(700.0000, 1260.0000)
btn_back:setScaleX(0.5000)
btn_back:setScaleY(0.5000)
layout = ccui.LayoutComponent:bindLayoutComponent(btn_back)
layout:setPositionPercentX(0.9722)
layout:setPositionPercentY(0.9844)
layout:setPercentWidth(0.2278)
layout:setPercentHeight(0.1281)
layout:setSize({width = 164.0000, height = 164.0000})
layout:setLeftMargin(536.0000)
layout:setRightMargin(20.0000)
layout:setTopMargin(20.0000)
layout:setBottomMargin(1096.0000)
Scene:addChild(btn_back)

--Create Animation
result['animation'] = ccs.ActionTimeline:create()
  
result['animation']:setDuration(0)
result['animation']:setTimeSpeed(1.0000)
--Create Animation List

result['root'] = Scene
return result;
end

return Result

