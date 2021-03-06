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
local bg = cc.Sprite:create("game/HeroLine/image/bg.png")
bg:setName("bg")
bg:setTag(38)
bg:setCascadeColorEnabled(true)
bg:setCascadeOpacityEnabled(true)
bg:setPosition(640.0000, 360.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(bg)
layout:setPositionPercentXEnabled(true)
layout:setPositionPercentYEnabled(true)
layout:setPositionPercentX(0.5000)
layout:setPositionPercentY(0.5000)
layout:setPercentWidth(1.0000)
layout:setPercentHeight(1.0000)
layout:setSize({width = 1280.0000, height = 720.0000})
bg:setBlendFunc({src = 1, dst = 771})
Scene:addChild(bg)

--Create role
local role = ccui.ImageView:create()
role:ignoreContentAdaptWithSize(false)
role:loadTexture("game/HeroLine/image/role.png",0)
role:setLayoutComponentEnabled(true)
role:setName("role")
role:setTag(9)
role:setCascadeColorEnabled(true)
role:setCascadeOpacityEnabled(true)
role:setAnchorPoint(0.5000, 0.0000)
role:setPosition(320.0000, 0.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(role)
layout:setPositionPercentX(0.2500)
layout:setPercentWidth(0.5422)
layout:setPercentHeight(0.7778)
layout:setSize({width = 694.0000, height = 560.0000})
layout:setLeftMargin(-27.0000)
layout:setRightMargin(613.0000)
layout:setTopMargin(160.0000)
Scene:addChild(role)

--Create startBtn
local startBtn = ccui.Button:create()
startBtn:ignoreContentAdaptWithSize(false)
startBtn:loadTextureNormal("game/HeroLine/image/button.png",0)
startBtn:setTitleFontName("game/HeroLine/image/nvpk.ttf")
startBtn:setTitleFontSize(60)
startBtn:setTitleText("play")
startBtn:setLayoutComponentEnabled(true)
startBtn:setName("startBtn")
startBtn:setTag(289)
startBtn:setCascadeColorEnabled(true)
startBtn:setCascadeOpacityEnabled(true)
startBtn:setPosition(934.0000, 381.0001)
layout = ccui.LayoutComponent:bindLayoutComponent(startBtn)
layout:setPositionPercentXEnabled(true)
layout:setPositionPercentX(0.7297)
layout:setPositionPercentY(0.5292)
layout:setPercentWidth(0.2781)
layout:setPercentHeight(0.1611)
layout:setSize({width = 356.0000, height = 116.0000})
layout:setLeftMargin(756.0000)
layout:setRightMargin(168.0000)
layout:setTopMargin(280.9999)
layout:setBottomMargin(323.0001)
Scene:addChild(startBtn)

--Create ruleBtn
local ruleBtn = ccui.Button:create()
ruleBtn:ignoreContentAdaptWithSize(false)
ruleBtn:loadTextureNormal("game/HeroLine/image/button.png",0)
ruleBtn:setTitleFontName("game/HeroLine/image/nvpk.ttf")
ruleBtn:setTitleFontSize(60)
ruleBtn:setTitleText("Rule")
ruleBtn:setLayoutComponentEnabled(true)
ruleBtn:setName("ruleBtn")
ruleBtn:setTag(33)
ruleBtn:setCascadeColorEnabled(true)
ruleBtn:setCascadeOpacityEnabled(true)
ruleBtn:setPosition(862.0000, 178.2897)
layout = ccui.LayoutComponent:bindLayoutComponent(ruleBtn)
layout:setPositionPercentXEnabled(true)
layout:setPositionPercentX(0.6734)
layout:setPositionPercentY(0.2476)
layout:setPercentWidth(0.2781)
layout:setPercentHeight(0.1611)
layout:setSize({width = 356.0000, height = 116.0000})
layout:setLeftMargin(684.0000)
layout:setRightMargin(240.0000)
layout:setTopMargin(483.7103)
layout:setBottomMargin(120.2897)
Scene:addChild(ruleBtn)

--Create scoreLabel
local scoreLabel = ccui.Text:create()
scoreLabel:ignoreContentAdaptWithSize(true)
scoreLabel:setTextAreaSize({width = 0, height = 0})
scoreLabel:setFontName("game/HeroLine/image/nvpk.ttf")
scoreLabel:setFontSize(48)
scoreLabel:setString([[????????????0]])
scoreLabel:setLayoutComponentEnabled(true)
scoreLabel:setName("scoreLabel")
scoreLabel:setTag(34)
scoreLabel:setCascadeColorEnabled(true)
scoreLabel:setCascadeOpacityEnabled(true)
scoreLabel:setPosition(641.9993, 629.3873)
layout = ccui.LayoutComponent:bindLayoutComponent(scoreLabel)
layout:setPositionPercentX(0.5016)
layout:setPositionPercentY(0.8741)
layout:setPercentWidth(0.1719)
layout:setPercentHeight(0.0806)
layout:setSize({width = 220.0000, height = 58.0000})
layout:setLeftMargin(531.9993)
layout:setRightMargin(528.0007)
layout:setTopMargin(61.6127)
layout:setBottomMargin(600.3873)
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

