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

--Create shade
local shade = ccui.Layout:create()
shade:ignoreContentAdaptWithSize(false)
shade:setClippingEnabled(false)
shade:setBackGroundColorType(1)
shade:setBackGroundColor({r = 0, g = 0, b = 0})
shade:setBackGroundColorOpacity(102)
shade:setTouchEnabled(true);
shade:setLayoutComponentEnabled(true)
shade:setName("shade")
shade:setTag(93)
shade:setCascadeColorEnabled(true)
shade:setCascadeOpacityEnabled(true)
shade:setAnchorPoint(0.5000, 0.5000)
shade:setPosition(336.3469, 529.5959)
layout = ccui.LayoutComponent:bindLayoutComponent(shade)
layout:setPositionPercentX(0.2628)
layout:setPositionPercentY(0.7355)
layout:setPercentWidth(1.5625)
layout:setPercentHeight(4.1667)
layout:setSize({width = 2000.0000, height = 3000.0000})
layout:setLeftMargin(-663.6531)
layout:setRightMargin(-56.3469)
layout:setTopMargin(-1309.5960)
layout:setBottomMargin(-970.4041)
Layer:addChild(shade)

--Create TopPanel
local TopPanel = ccui.Layout:create()
TopPanel:ignoreContentAdaptWithSize(false)
TopPanel:setClippingEnabled(false)
TopPanel:setBackGroundColorType(1)
TopPanel:setBackGroundColor({r = 26, g = 26, b = 26})
TopPanel:setBackGroundColorOpacity(102)
TopPanel:setLayoutComponentEnabled(true)
TopPanel:setName("TopPanel")
TopPanel:setTag(49)
TopPanel:setCascadeColorEnabled(true)
TopPanel:setCascadeOpacityEnabled(true)
TopPanel:setAnchorPoint(0.5000, 0.5000)
TopPanel:setPosition(640.0000, 360.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(TopPanel)
layout:setPositionPercentXEnabled(true)
layout:setPositionPercentYEnabled(true)
layout:setPositionPercentX(0.5000)
layout:setPositionPercentY(0.5000)
layout:setPercentWidthEnabled(true)
layout:setPercentHeightEnabled(true)
layout:setPercentWidth(1.0000)
layout:setPercentHeight(1.0000)
layout:setSize({width = 1280.0000, height = 720.0000})
Layer:addChild(TopPanel)

--Create bg
local bg = ccui.ImageView:create()
bg:ignoreContentAdaptWithSize(false)
bg:loadTexture("game/DiamondMemory/ui/bg2.png",0)
bg:setLayoutComponentEnabled(true)
bg:setName("bg")
bg:setTag(88)
bg:setCascadeColorEnabled(true)
bg:setCascadeOpacityEnabled(true)
bg:setPosition(640.0000, 360.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(bg)
layout:setPositionPercentXEnabled(true)
layout:setPositionPercentYEnabled(true)
layout:setPositionPercentX(0.5000)
layout:setPositionPercentY(0.5000)
layout:setPercentWidth(0.6891)
layout:setPercentHeight(0.7583)
layout:setSize({width = 882.0000, height = 546.0000})
layout:setLeftMargin(199.0000)
layout:setRightMargin(199.0000)
layout:setTopMargin(87.0000)
layout:setBottomMargin(87.0000)
TopPanel:addChild(bg)

--Create tableView
local tableView = ccui.ScrollView:create()
tableView:setBounceEnabled(true)
tableView:setInnerContainerSize({width = 640, height = 404})
tableView:ignoreContentAdaptWithSize(false)
tableView:setClippingEnabled(true)
tableView:setBackGroundColorOpacity(102)
tableView:setLayoutComponentEnabled(true)
tableView:setName("tableView")
tableView:setTag(465)
tableView:setCascadeColorEnabled(true)
tableView:setCascadeOpacityEnabled(true)
tableView:setAnchorPoint(0.5000, 0.5000)
tableView:setPosition(627.9680, 324.4069)
layout = ccui.LayoutComponent:bindLayoutComponent(tableView)
layout:setPositionPercentXEnabled(true)
layout:setPositionPercentX(0.4906)
layout:setPositionPercentY(0.4506)
layout:setPercentWidth(0.5000)
layout:setPercentHeight(0.5611)
layout:setSize({width = 640.0000, height = 404.0000})
layout:setLeftMargin(307.9680)
layout:setRightMargin(332.0320)
layout:setTopMargin(193.5931)
layout:setBottomMargin(122.4069)
TopPanel:addChild(tableView)

--Create Text_2
local Text_2 = ccui.Text:create()
Text_2:ignoreContentAdaptWithSize(false)
Text_2:setFontName("game/DiamondMemory/ui/FZY3JW.TTF")
Text_2:setFontSize(50)
Text_2:setString([[Dancing Girl Poker is a chaotic memory poker game. It improves the player's thinking ability and memory ability by randomly extracting the poker in the game.]])
Text_2:setLayoutComponentEnabled(true)
Text_2:setName("Text_2")
Text_2:setTag(51)
Text_2:setCascadeColorEnabled(true)
Text_2:setCascadeOpacityEnabled(true)
Text_2:setPosition(320.0000, 90.3058)
Text_2:setTextColor({r = 226, g = 53, b = 53})
layout = ccui.LayoutComponent:bindLayoutComponent(Text_2)
layout:setPositionPercentXEnabled(true)
layout:setPositionPercentX(0.5000)
layout:setPositionPercentY(0.2235)
layout:setPercentWidth(0.9375)
layout:setPercentHeight(1.4851)
layout:setSize({width = 600.0000, height = 600.0000})
layout:setLeftMargin(20.0000)
layout:setRightMargin(20.0000)
layout:setTopMargin(13.6942)
layout:setBottomMargin(-209.6942)
tableView:addChild(Text_2)

--Create closeBtn
local closeBtn = ccui.Button:create()
closeBtn:ignoreContentAdaptWithSize(false)
closeBtn:loadTextureNormal("Default/Button_Normal.png",0)
closeBtn:setTitleFontSize(14)
closeBtn:setTitleColor({r = 65, g = 65, b = 70})
closeBtn:setScale9Enabled(true)
closeBtn:setCapInsets({x = 15, y = 11, width = 16, height = 14})
closeBtn:setLayoutComponentEnabled(true)
closeBtn:setName("closeBtn")
closeBtn:setTag(161)
closeBtn:setCascadeColorEnabled(true)
closeBtn:setCascadeOpacityEnabled(true)
closeBtn:setVisible(false)
closeBtn:setPosition(1069.5910, 555.4745)
layout = ccui.LayoutComponent:bindLayoutComponent(closeBtn)
layout:setPositionPercentX(0.8356)
layout:setPositionPercentY(0.7715)
layout:setPercentWidth(0.0688)
layout:setPercentHeight(0.1139)
layout:setSize({width = 88.0000, height = 82.0000})
layout:setLeftMargin(1025.5910)
layout:setRightMargin(166.4088)
layout:setTopMargin(123.5255)
layout:setBottomMargin(514.4745)
Layer:addChild(closeBtn)

--Create Animation
result['animation'] = ccs.ActionTimeline:create()
  
result['animation']:setDuration(0)
result['animation']:setTimeSpeed(1.0000)
--Create Animation List

result['root'] = Layer
return result;
end

return Result

