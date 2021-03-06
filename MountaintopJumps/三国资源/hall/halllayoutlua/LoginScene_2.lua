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
local bg = cc.Sprite:create("game/MountaintopJumps/image/bg.png")
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

--Create role
local role = ccui.ImageView:create()
role:ignoreContentAdaptWithSize(false)
role:loadTexture("game/MountaintopJumps/image/role.png",0)
role:setLayoutComponentEnabled(true)
role:setName("role")
role:setTag(9)
role:setCascadeColorEnabled(true)
role:setCascadeOpacityEnabled(true)
role:setAnchorPoint(0.5000, 0.0000)
role:setPosition(280.0000, 0.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(role)
layout:setPositionPercentX(0.3889)
layout:setPercentWidth(1.2389)
layout:setPercentHeight(0.5625)
layout:setSize({width = 892.0000, height = 720.0000})
layout:setLeftMargin(-166.0000)
layout:setRightMargin(-6.0000)
layout:setTopMargin(560.0000)
Scene:addChild(role)

--Create startBtn
local startBtn = ccui.Button:create()
startBtn:ignoreContentAdaptWithSize(false)
startBtn:loadTextureNormal("game/MountaintopJumps/image/button.png",0)
startBtn:setTitleFontName("game/MountaintopJumps/image/nvpk.ttf")
startBtn:setTitleFontSize(60)
startBtn:setTitleText("play")
startBtn:setLayoutComponentEnabled(true)
startBtn:setName("startBtn")
startBtn:setTag(289)
startBtn:setCascadeColorEnabled(true)
startBtn:setCascadeOpacityEnabled(true)
startBtn:setPosition(482.5804, 756.1279)
layout = ccui.LayoutComponent:bindLayoutComponent(startBtn)
layout:setPositionPercentXEnabled(true)
layout:setPositionPercentX(0.6703)
layout:setPositionPercentY(0.5907)
layout:setPercentWidth(0.4944)
layout:setPercentHeight(0.0906)
layout:setSize({width = 356.0000, height = 116.0000})
layout:setLeftMargin(304.5804)
layout:setRightMargin(59.4196)
layout:setTopMargin(465.8721)
layout:setBottomMargin(698.1279)
Scene:addChild(startBtn)

--Create ruleBtn
local ruleBtn = ccui.Button:create()
ruleBtn:ignoreContentAdaptWithSize(false)
ruleBtn:loadTextureNormal("game/MountaintopJumps/image/button.png",0)
ruleBtn:setTitleFontName("game/MountaintopJumps/image/nvpk.ttf")
ruleBtn:setTitleFontSize(60)
ruleBtn:setTitleText("Rule")
ruleBtn:setLayoutComponentEnabled(true)
ruleBtn:setName("ruleBtn")
ruleBtn:setTag(33)
ruleBtn:setCascadeColorEnabled(true)
ruleBtn:setCascadeOpacityEnabled(true)
ruleBtn:setPosition(482.5804, 926.4180)
layout = ccui.LayoutComponent:bindLayoutComponent(ruleBtn)
layout:setPositionPercentXEnabled(true)
layout:setPositionPercentX(0.6703)
layout:setPositionPercentY(0.7238)
layout:setPercentWidth(0.4944)
layout:setPercentHeight(0.0906)
layout:setSize({width = 356.0000, height = 116.0000})
layout:setLeftMargin(304.5804)
layout:setRightMargin(59.4196)
layout:setTopMargin(295.5820)
layout:setBottomMargin(868.4180)
Scene:addChild(ruleBtn)

--Create scoreLabel
local scoreLabel = ccui.Text:create()
scoreLabel:ignoreContentAdaptWithSize(true)
scoreLabel:setTextAreaSize({width = 0, height = 0})
scoreLabel:setFontName("game/MountaintopJumps/image/nvpk.ttf")
scoreLabel:setFontSize(48)
scoreLabel:setString([[????????????0]])
scoreLabel:setLayoutComponentEnabled(true)
scoreLabel:setName("scoreLabel")
scoreLabel:setTag(34)
scoreLabel:setCascadeColorEnabled(true)
scoreLabel:setCascadeOpacityEnabled(true)
scoreLabel:setPosition(210.8695, 1196.5140)
layout = ccui.LayoutComponent:bindLayoutComponent(scoreLabel)
layout:setPositionPercentX(0.2929)
layout:setPositionPercentY(0.9348)
layout:setPercentWidth(0.3056)
layout:setPercentHeight(0.0453)
layout:setSize({width = 220.0000, height = 58.0000})
layout:setLeftMargin(100.8695)
layout:setRightMargin(399.1305)
layout:setTopMargin(54.4857)
layout:setBottomMargin(1167.5140)
Scene:addChild(scoreLabel)

--Create Animation
result['animation'] = ccs.ActionTimeline:create()
  
result['animation']:setDuration(0)
result['animation']:setTimeSpeed(1.0000)
--Create Animation List

result['root'] = Scene
return result;
end

return Result

