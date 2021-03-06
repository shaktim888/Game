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

--Create TopPanel
local TopPanel = ccui.Layout:create()
TopPanel:ignoreContentAdaptWithSize(false)
TopPanel:setClippingEnabled(false)
TopPanel:setBackGroundColorOpacity(102)
TopPanel:setTouchEnabled(true);
TopPanel:setLayoutComponentEnabled(true)
TopPanel:setName("TopPanel")
TopPanel:setTag(63)
TopPanel:setCascadeColorEnabled(true)
TopPanel:setCascadeOpacityEnabled(true)
TopPanel:setAnchorPoint(0.5000, 0.5000)
TopPanel:setPosition(360.0000, 640.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(TopPanel)
layout:setPositionPercentXEnabled(true)
layout:setPositionPercentYEnabled(true)
layout:setPositionPercentX(0.5000)
layout:setPositionPercentY(0.5000)
layout:setPercentWidth(1.0000)
layout:setPercentHeight(1.0000)
layout:setSize({width = 720.0000, height = 1280.0000})
Layer:addChild(TopPanel)

--Create bg
local bg = cc.Sprite:create("game/MountaintopJumps/image/popbg.png")
bg:setName("bg")
bg:setTag(236)
bg:setCascadeColorEnabled(true)
bg:setCascadeOpacityEnabled(true)
bg:setPosition(360.0000, 640.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(bg)
layout:setPositionPercentXEnabled(true)
layout:setPositionPercentYEnabled(true)
layout:setPositionPercentX(0.5000)
layout:setPositionPercentY(0.5000)
layout:setPercentWidth(0.0639)
layout:setPercentHeight(0.0359)
layout:setSize({width = 592.0000, height = 485.0000})
layout:setLeftMargin(337.0000)
layout:setRightMargin(337.0000)
layout:setTopMargin(617.0000)
layout:setBottomMargin(617.0000)
bg:setBlendFunc({src = 1, dst = 771})
TopPanel:addChild(bg)

--Create gameOverText
local gameOverText = ccui.Text:create()
gameOverText:ignoreContentAdaptWithSize(true)
gameOverText:setTextAreaSize({width = 0, height = 0})
gameOverText:setFontName("game/MountaintopJumps/image/nvpk.ttf")
gameOverText:setFontSize(72)
gameOverText:setString([[GameOver]])
gameOverText:setLayoutComponentEnabled(true)
gameOverText:setName("gameOverText")
gameOverText:setTag(74)
gameOverText:setCascadeColorEnabled(true)
gameOverText:setCascadeOpacityEnabled(true)
gameOverText:setPosition(360.0000, 663.0400)
layout = ccui.LayoutComponent:bindLayoutComponent(gameOverText)
layout:setPositionPercentXEnabled(true)
layout:setPositionPercentYEnabled(true)
layout:setPositionPercentX(0.5000)
layout:setPositionPercentY(0.5180)
layout:setPercentWidth(0.4861)
layout:setPercentHeight(0.0680)
layout:setSize({width = 350.0000, height = 87.0000})
layout:setLeftMargin(185.0000)
layout:setRightMargin(185.0000)
layout:setTopMargin(573.4600)
layout:setBottomMargin(619.5400)
TopPanel:addChild(gameOverText)

--Create exitBtn
local exitBtn = ccui.Button:create()
exitBtn:ignoreContentAdaptWithSize(false)
exitBtn:loadTextureNormal("game/MountaintopJumps/image/button.png",0)
exitBtn:setTitleFontName("game/MountaintopJumps/image/nvpk.ttf")
exitBtn:setTitleFontSize(48)
exitBtn:setTitleText("Exit")
exitBtn:setLayoutComponentEnabled(true)
exitBtn:setName("exitBtn")
exitBtn:setTag(64)
exitBtn:setCascadeColorEnabled(true)
exitBtn:setCascadeOpacityEnabled(true)
exitBtn:setPosition(360.0000, 464.1280)
layout = ccui.LayoutComponent:bindLayoutComponent(exitBtn)
layout:setPositionPercentXEnabled(true)
layout:setPositionPercentYEnabled(true)
layout:setPositionPercentX(0.5000)
layout:setPositionPercentY(0.3626)
layout:setPercentWidth(0.4944)
layout:setPercentHeight(0.0906)
layout:setSize({width = 356.0000, height = 116.0000})
layout:setLeftMargin(182.0000)
layout:setRightMargin(182.0000)
layout:setTopMargin(757.8720)
layout:setBottomMargin(406.1280)
TopPanel:addChild(exitBtn)

--Create Animation
result['animation'] = ccs.ActionTimeline:create()
  
result['animation']:setDuration(0)
result['animation']:setTimeSpeed(1.0000)
--Create Animation List

result['root'] = Layer
return result;
end

return Result

