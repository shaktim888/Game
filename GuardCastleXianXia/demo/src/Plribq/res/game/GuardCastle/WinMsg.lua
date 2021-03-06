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

--Create root
local root = ccui.Layout:create()
root:ignoreContentAdaptWithSize(false)
root:setClippingEnabled(false)
root:setBackGroundColorOpacity(102)
root:setTouchEnabled(true);
root:setLayoutComponentEnabled(true)
root:setName("root")
root:setTag(133)
root:setCascadeColorEnabled(true)
root:setCascadeOpacityEnabled(true)
root:setAnchorPoint(0.5000, 0.5000)
root:setPosition(640.0000, 360.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(root)
layout:setPositionPercentXEnabled(true)
layout:setPositionPercentYEnabled(true)
layout:setPositionPercentX(0.5000)
layout:setPositionPercentY(0.5000)
layout:setPercentWidth(0.4477)
layout:setPercentHeight(0.4958)
layout:setSize({width = 573.0000, height = 357.0000})
layout:setLeftMargin(353.5000)
layout:setRightMargin(353.5000)
layout:setTopMargin(181.5000)
layout:setBottomMargin(181.5000)
Layer:addChild(root)

--Create shade
local shade = ccui.Layout:create()
shade:ignoreContentAdaptWithSize(false)
shade:setClippingEnabled(false)
shade:setBackGroundColorType(1)
shade:setBackGroundColor({r = 0, g = 0, b = 0})
shade:setBackGroundColorOpacity(162)
shade:setTouchEnabled(true);
shade:setLayoutComponentEnabled(true)
shade:setName("shade")
shade:setTag(8)
shade:setCascadeColorEnabled(true)
shade:setCascadeOpacityEnabled(true)
shade:setPosition(-747.3639, -336.5000)
layout = ccui.LayoutComponent:bindLayoutComponent(shade)
layout:setPositionPercentXEnabled(true)
layout:setPositionPercentX(-1.3043)
layout:setPositionPercentY(-0.9426)
layout:setPercentWidth(3.4904)
layout:setPercentHeight(5.6022)
layout:setSize({width = 2000.0000, height = 2000.0000})
layout:setLeftMargin(-747.3639)
layout:setRightMargin(-679.6361)
layout:setTopMargin(-1306.5000)
layout:setBottomMargin(-336.5000)
root:addChild(shade)

--Create over
local over = cc.Sprite:create("game/GuardCastle/images/popBg/Over.png")
over:setName("over")
over:setTag(9)
over:setCascadeColorEnabled(true)
over:setCascadeOpacityEnabled(true)
over:setPosition(299.0000, 260.5000)
layout = ccui.LayoutComponent:bindLayoutComponent(over)
layout:setPositionPercentX(0.5218)
layout:setPositionPercentY(0.7297)
layout:setPercentWidth(1.2792)
layout:setPercentHeight(0.8095)
layout:setSize({width = 733.0000, height = 289.0000})
layout:setLeftMargin(-67.5000)
layout:setRightMargin(-92.5000)
layout:setTopMargin(-48.0000)
layout:setBottomMargin(116.0000)
over:setBlendFunc({src = 1, dst = 771})
root:addChild(over)

--Create btnRestart
local btnRestart = ccui.Button:create()
btnRestart:ignoreContentAdaptWithSize(false)
btnRestart:loadTextureNormal("game/GuardCastle/images/popBg/btnSmall.png",0)
btnRestart:setTitleFontName("game/GuardCastle/images/font/font.ttf")
btnRestart:setTitleFontSize(30)
btnRestart:setTitleText("??????")
btnRestart:setTitleColor({r = 255, g = 239, b = 199})
btnRestart:setLayoutComponentEnabled(true)
btnRestart:setName("btnRestart")
btnRestart:setTag(127)
btnRestart:setCascadeColorEnabled(true)
btnRestart:setCascadeOpacityEnabled(true)
btnRestart:setPosition(154.6713, 77.3062)
layout = ccui.LayoutComponent:bindLayoutComponent(btnRestart)
layout:setPositionPercentX(0.2699)
layout:setPositionPercentY(0.2165)
layout:setPercentWidth(0.3857)
layout:setPercentHeight(0.1961)
layout:setSize({width = 221.0000, height = 70.0000})
layout:setLeftMargin(44.1713)
layout:setRightMargin(307.8287)
layout:setTopMargin(244.6938)
layout:setBottomMargin(42.3062)
root:addChild(btnRestart)

--Create btnHome
local btnHome = ccui.Button:create()
btnHome:ignoreContentAdaptWithSize(false)
btnHome:loadTextureNormal("game/GuardCastle/images/popBg/btnSmall.png",0)
btnHome:setTitleFontName("game/GuardCastle/images/font/font.ttf")
btnHome:setTitleFontSize(30)
btnHome:setTitleText("??????")
btnHome:setTitleColor({r = 255, g = 239, b = 199})
btnHome:setLayoutComponentEnabled(true)
btnHome:setName("btnHome")
btnHome:setTag(126)
btnHome:setCascadeColorEnabled(true)
btnHome:setCascadeOpacityEnabled(true)
btnHome:setPosition(407.6714, 77.3062)
layout = ccui.LayoutComponent:bindLayoutComponent(btnHome)
layout:setPositionPercentX(0.7115)
layout:setPositionPercentY(0.2165)
layout:setPercentWidth(0.3857)
layout:setPercentHeight(0.1961)
layout:setSize({width = 221.0000, height = 70.0000})
layout:setLeftMargin(297.1714)
layout:setRightMargin(54.8286)
layout:setTopMargin(244.6938)
layout:setBottomMargin(42.3062)
root:addChild(btnHome)

--Create Animation
result['animation'] = ccs.ActionTimeline:create()
  
result['animation']:setDuration(0)
result['animation']:setTimeSpeed(1.0000)
--Create Animation List

result['root'] = Layer
return result;
end

return Result

