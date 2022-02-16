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
local bg = cc.Sprite:create("game/WitchPoker/image/ui2/bg.png")
bg:setName("bg")
bg:setTag(38)
bg:setCascadeColorEnabled(true)
bg:setCascadeOpacityEnabled(true)
bg:setPosition(638.9760, 360.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(bg)
layout:setPositionPercentX(0.4992)
layout:setPositionPercentY(0.5000)
layout:setPercentWidth(1.0000)
layout:setPercentHeight(1.0000)
layout:setSize({width = 1280.0000, height = 720.0000})
layout:setHorizontalEdge(3)
layout:setVerticalEdge(3)
layout:setLeftMargin(-1.0240)
layout:setRightMargin(1.0240)
bg:setBlendFunc({src = 1, dst = 771})
Scene:addChild(bg)

--Create role
local role = ccui.ImageView:create()
role:ignoreContentAdaptWithSize(false)
role:loadTexture("game/WitchPoker/image/ui2/role.png",0)
role:setLayoutComponentEnabled(true)
role:setName("role")
role:setTag(55)
role:setCascadeColorEnabled(true)
role:setCascadeOpacityEnabled(true)
role:setAnchorPoint(0.5000, 0.0000)
role:setPosition(476.2021, 0.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(role)
layout:setPositionPercentYEnabled(true)
layout:setPositionPercentX(0.3720)
layout:setPercentWidth(1.0000)
layout:setPercentHeight(1.0000)
layout:setSize({width = 1280.0000, height = 720.0000})
layout:setLeftMargin(-163.7979)
layout:setRightMargin(163.7979)
Scene:addChild(role)

--Create startBtn
local startBtn = ccui.Button:create()
startBtn:ignoreContentAdaptWithSize(false)
startBtn:loadTextureNormal("game/WitchPoker/image/ui2/beginBtn.png",0)
startBtn:setTitleFontSize(14)
startBtn:setTitleColor({r = 65, g = 65, b = 70})
startBtn:setLayoutComponentEnabled(true)
startBtn:setName("startBtn")
startBtn:setTag(5)
startBtn:setCascadeColorEnabled(true)
startBtn:setCascadeOpacityEnabled(true)
startBtn:setPosition(962.0480, 366.0400)
layout = ccui.LayoutComponent:bindLayoutComponent(startBtn)
layout:setPositionPercentX(0.7516)
layout:setPositionPercentY(0.5084)
layout:setPercentWidth(0.1172)
layout:setPercentHeight(0.2083)
layout:setSize({width = 150.0000, height = 150.0000})
layout:setHorizontalEdge(3)
layout:setLeftMargin(887.0480)
layout:setRightMargin(242.9519)
layout:setTopMargin(278.9600)
layout:setBottomMargin(291.0400)
Scene:addChild(startBtn)

--Create ruleBtn
local ruleBtn = ccui.Button:create()
ruleBtn:ignoreContentAdaptWithSize(false)
ruleBtn:loadTextureNormal("game/WitchPoker/image/ui2/ruleBtn.png",0)
ruleBtn:setTitleFontSize(14)
ruleBtn:setTitleColor({r = 65, g = 65, b = 70})
ruleBtn:setLayoutComponentEnabled(true)
ruleBtn:setName("ruleBtn")
ruleBtn:setTag(6)
ruleBtn:setCascadeColorEnabled(true)
ruleBtn:setCascadeOpacityEnabled(true)
ruleBtn:setAnchorPoint(0.5681, 0.4513)
ruleBtn:setPosition(972.2880, 125.9645)
layout = ccui.LayoutComponent:bindLayoutComponent(ruleBtn)
layout:setPositionPercentX(0.7596)
layout:setPositionPercentY(0.1750)
layout:setPercentWidth(0.1172)
layout:setPercentHeight(0.2083)
layout:setSize({width = 150.0000, height = 150.0000})
layout:setHorizontalEdge(3)
layout:setLeftMargin(887.0730)
layout:setRightMargin(242.9270)
layout:setTopMargin(511.7305)
layout:setBottomMargin(58.2695)
Scene:addChild(ruleBtn)

--Create settingBtn
local settingBtn = ccui.Button:create()
settingBtn:ignoreContentAdaptWithSize(false)
settingBtn:loadTextureNormal("game/WitchPoker/image/ui2/settingBtn.png",0)
settingBtn:setTitleFontSize(14)
settingBtn:setTitleColor({r = 65, g = 65, b = 70})
settingBtn:setLayoutComponentEnabled(true)
settingBtn:setName("settingBtn")
settingBtn:setTag(39)
settingBtn:setCascadeColorEnabled(true)
settingBtn:setCascadeOpacityEnabled(true)
settingBtn:setPosition(962.0480, 598.3741)
layout = ccui.LayoutComponent:bindLayoutComponent(settingBtn)
layout:setPositionPercentXEnabled(true)
layout:setPositionPercentX(0.7516)
layout:setPositionPercentY(0.8311)
layout:setPercentWidth(0.1172)
layout:setPercentHeight(0.2083)
layout:setSize({width = 150.0000, height = 150.0000})
layout:setVerticalEdge(2)
layout:setLeftMargin(887.0480)
layout:setRightMargin(242.9519)
layout:setTopMargin(46.6259)
layout:setBottomMargin(523.3741)
Scene:addChild(settingBtn)

--Create best
local best = ccui.Text:create()
best:ignoreContentAdaptWithSize(true)
best:setTextAreaSize({width = 0, height = 0})
best:setFontName("game/WitchPoker/nvpk.ttf")
best:setFontSize(45)
best:setString([[BEST:1000]])
best:setLayoutComponentEnabled(true)
best:setName("best")
best:setTag(81)
best:setCascadeColorEnabled(true)
best:setCascadeOpacityEnabled(true)
best:setPosition(210.0000, 611.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(best)
layout:setPositionPercentX(0.1641)
layout:setPositionPercentY(0.8486)
layout:setPercentWidth(0.1656)
layout:setPercentHeight(0.0750)
layout:setSize({width = 212.0000, height = 54.0000})
layout:setLeftMargin(104.0000)
layout:setRightMargin(964.0000)
layout:setTopMargin(82.0000)
layout:setBottomMargin(584.0000)
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

