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
local bg = cc.Sprite:create("game/FishFor14/ui2/bg.png")
bg:setName("bg")
bg:setTag(19)
bg:setCascadeColorEnabled(true)
bg:setCascadeOpacityEnabled(true)
bg:setPosition(640.0000, 358.5600)
layout = ccui.LayoutComponent:bindLayoutComponent(bg)
layout:setPositionPercentX(0.5000)
layout:setPositionPercentY(0.4980)
layout:setPercentWidth(1.0000)
layout:setPercentHeight(1.0000)
layout:setSize({width = 1280.0000, height = 720.0000})
layout:setHorizontalEdge(3)
layout:setVerticalEdge(3)
layout:setTopMargin(1.4400)
layout:setBottomMargin(-1.4400)
bg:setBlendFunc({src = 1, dst = 771})
Scene:addChild(bg)

--Create role
local role = ccui.ImageView:create()
role:ignoreContentAdaptWithSize(false)
role:loadTexture("game/FishFor14/ui2/role.png",0)
role:setLayoutComponentEnabled(true)
role:setName("role")
role:setTag(39)
role:setCascadeColorEnabled(true)
role:setCascadeOpacityEnabled(true)
role:setAnchorPoint(0.0000, 0.0000)
role:setPosition(520.0000, 0.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(role)
layout:setPositionPercentX(0.4063)
layout:setPercentWidth(0.5375)
layout:setPercentHeight(0.9319)
layout:setSize({width = 688.0000, height = 671.0000})
layout:setLeftMargin(520.0000)
layout:setRightMargin(72.0000)
layout:setTopMargin(49.0000)
Scene:addChild(role)

--Create startBtn
local startBtn = ccui.Button:create()
startBtn:ignoreContentAdaptWithSize(false)
startBtn:loadTextureNormal("game/FishFor14/ui2/startBtn.png",0)
startBtn:setTitleFontSize(14)
startBtn:setTitleColor({r = 65, g = 65, b = 70})
startBtn:setLayoutComponentEnabled(true)
startBtn:setName("startBtn")
startBtn:setTag(7)
startBtn:setCascadeColorEnabled(true)
startBtn:setCascadeOpacityEnabled(true)
startBtn:setPosition(359.0400, 329.2283)
layout = ccui.LayoutComponent:bindLayoutComponent(startBtn)
layout:setPositionPercentX(0.2805)
layout:setPositionPercentY(0.4573)
layout:setPercentWidth(0.2242)
layout:setPercentHeight(0.1069)
layout:setSize({width = 287.0000, height = 77.0000})
layout:setHorizontalEdge(3)
layout:setLeftMargin(215.5400)
layout:setRightMargin(777.4600)
layout:setTopMargin(352.2717)
layout:setBottomMargin(290.7283)
Scene:addChild(startBtn)

--Create ruleBtn
local ruleBtn = ccui.Button:create()
ruleBtn:ignoreContentAdaptWithSize(false)
ruleBtn:loadTextureNormal("game/FishFor14/ui2/ruleBtn.png",0)
ruleBtn:setTitleFontSize(14)
ruleBtn:setTitleColor({r = 65, g = 65, b = 70})
ruleBtn:setLayoutComponentEnabled(true)
ruleBtn:setName("ruleBtn")
ruleBtn:setTag(8)
ruleBtn:setCascadeColorEnabled(true)
ruleBtn:setCascadeOpacityEnabled(true)
ruleBtn:setPosition(359.0400, 149.9723)
layout = ccui.LayoutComponent:bindLayoutComponent(ruleBtn)
layout:setPositionPercentX(0.2805)
layout:setPositionPercentY(0.2083)
layout:setPercentWidth(0.2242)
layout:setPercentHeight(0.1069)
layout:setSize({width = 287.0000, height = 77.0000})
layout:setHorizontalEdge(3)
layout:setLeftMargin(215.5400)
layout:setRightMargin(777.4600)
layout:setTopMargin(531.5277)
layout:setBottomMargin(111.4723)
Scene:addChild(ruleBtn)

--Create best
local best = ccui.Text:create()
best:ignoreContentAdaptWithSize(true)
best:setTextAreaSize({width = 0, height = 0})
best:setFontName("game/FishFor14/ui2/body.TTF")
best:setFontSize(45)
best:setString([[BEST:10000]])
best:setLayoutComponentEnabled(true)
best:setName("best")
best:setTag(26)
best:setCascadeColorEnabled(true)
best:setCascadeOpacityEnabled(true)
best:setPosition(1020.0000, 621.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(best)
layout:setPositionPercentX(0.7969)
layout:setPositionPercentY(0.8625)
layout:setPercentWidth(0.1750)
layout:setPercentHeight(0.0750)
layout:setSize({width = 224.0000, height = 54.0000})
layout:setLeftMargin(908.0000)
layout:setRightMargin(148.0000)
layout:setTopMargin(72.0000)
layout:setBottomMargin(594.0000)
Scene:addChild(best)

--Create Animation
result['animation'] = ccs.ActionTimeline:create()
  
result['animation']:setDuration(0)
result['animation']:setTimeSpeed(1.0000)
--Create Animation List

result['root'] = Scene
return result;
end

return Result

