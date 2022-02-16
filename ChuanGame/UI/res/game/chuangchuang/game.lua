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
Image_1:setTag(67)
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

--Create gunzi
local gunzi = ccui.ImageView:create()
gunzi:ignoreContentAdaptWithSize(false)
gunzi:loadTexture("game/chuangchuang/images/gunzi.png",0)
gunzi:setLayoutComponentEnabled(true)
gunzi:setName("gunzi")
gunzi:setTag(38)
gunzi:setCascadeColorEnabled(true)
gunzi:setCascadeOpacityEnabled(true)
gunzi:setAnchorPoint(0.5000, 1.0000)
gunzi:setPosition(338.3280, 5.2593)
gunzi:setScaleX(0.5000)
gunzi:setColor({r = 255, g = 0, b = 0})
layout = ccui.LayoutComponent:bindLayoutComponent(gunzi)
layout:setPositionPercentX(0.4699)
layout:setPositionPercentY(0.0041)
layout:setPercentWidth(0.0972)
layout:setPercentHeight(0.3750)
layout:setSize({width = 70.0000, height = 480.0000})
layout:setHorizontalEdge(3)
layout:setLeftMargin(303.3280)
layout:setRightMargin(346.6720)
layout:setTopMargin(1274.7410)
layout:setBottomMargin(-474.7407)
Layer:addChild(gunzi)

--Create startPoint
local startPoint = ccui.Layout:create()
startPoint:ignoreContentAdaptWithSize(false)
startPoint:setClippingEnabled(false)
startPoint:setBackGroundColorOpacity(102)
startPoint:setTouchEnabled(true);
startPoint:setLayoutComponentEnabled(true)
startPoint:setName("startPoint")
startPoint:setTag(68)
startPoint:setCascadeColorEnabled(true)
startPoint:setCascadeOpacityEnabled(true)
startPoint:setAnchorPoint(0.5000, 0.5000)
startPoint:setPosition(34.8513, 345.1945)
layout = ccui.LayoutComponent:bindLayoutComponent(startPoint)
layout:setPositionPercentX(0.4979)
layout:setPositionPercentY(0.7192)
layout:setPercentWidth(0.7143)
layout:setPercentHeight(0.1042)
layout:setSize({width = 50.0000, height = 50.0000})
layout:setLeftMargin(9.8513)
layout:setRightMargin(10.1487)
layout:setTopMargin(109.8055)
layout:setBottomMargin(320.1945)
gunzi:addChild(startPoint)

--Create checkPoint
local checkPoint = ccui.Layout:create()
checkPoint:ignoreContentAdaptWithSize(false)
checkPoint:setClippingEnabled(false)
checkPoint:setBackGroundColorOpacity(102)
checkPoint:setTouchEnabled(true);
checkPoint:setLayoutComponentEnabled(true)
checkPoint:setName("checkPoint")
checkPoint:setTag(69)
checkPoint:setCascadeColorEnabled(true)
checkPoint:setCascadeOpacityEnabled(true)
checkPoint:setAnchorPoint(0.5000, 0.5000)
checkPoint:setPosition(32.3078, 463.0569)
layout = ccui.LayoutComponent:bindLayoutComponent(checkPoint)
layout:setPositionPercentX(0.4615)
layout:setPositionPercentY(0.9647)
layout:setPercentWidth(0.7143)
layout:setPercentHeight(0.1042)
layout:setSize({width = 50.0000, height = 50.0000})
layout:setLeftMargin(7.3078)
layout:setRightMargin(12.6922)
layout:setTopMargin(-8.0569)
layout:setBottomMargin(438.0569)
gunzi:addChild(checkPoint)

--Create shootParent
local shootParent = ccui.Layout:create()
shootParent:ignoreContentAdaptWithSize(false)
shootParent:setClippingEnabled(false)
shootParent:setBackGroundColorOpacity(102)
shootParent:setTouchEnabled(true);
shootParent:setLayoutComponentEnabled(true)
shootParent:setName("shootParent")
shootParent:setTag(70)
shootParent:setCascadeColorEnabled(true)
shootParent:setCascadeOpacityEnabled(true)
shootParent:setPosition(1.6358, 476.0326)
layout = ccui.LayoutComponent:bindLayoutComponent(shootParent)
layout:setPositionPercentX(0.0234)
layout:setPositionPercentY(0.9917)
layout:setPercentWidth(0.7143)
layout:setPercentHeight(0.1042)
layout:setSize({width = 50.0000, height = 50.0000})
layout:setLeftMargin(1.6358)
layout:setRightMargin(18.3642)
layout:setTopMargin(-46.0326)
layout:setBottomMargin(476.0326)
gunzi:addChild(shootParent)

--Create Image_2
local Image_2 = ccui.ImageView:create()
Image_2:ignoreContentAdaptWithSize(false)
Image_2:loadTexture("game/chuangchuang/images/bottom.png",0)
Image_2:setLayoutComponentEnabled(true)
Image_2:setName("Image_2")
Image_2:setTag(28)
Image_2:setCascadeColorEnabled(true)
Image_2:setCascadeOpacityEnabled(true)
Image_2:setPosition(360.0000, 1215.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(Image_2)
layout:setPositionPercentXEnabled(true)
layout:setPositionPercentX(0.5000)
layout:setPositionPercentY(0.9492)
layout:setPercentWidth(1.0000)
layout:setPercentHeight(0.1016)
layout:setSize({width = 720.0000, height = 130.0000})
layout:setBottomMargin(1150.0000)
Layer:addChild(Image_2)

--Create btnBack
local btnBack = ccui.Button:create()
btnBack:ignoreContentAdaptWithSize(false)
btnBack:loadTextureNormal("game/chuangchuang/images/fanhui.png",0)
btnBack:loadTexturePressed("game/chuangchuang/images/fanhui.png",0)
btnBack:loadTextureDisabled("Default/Button_Disable.png",0)
btnBack:setTitleFontSize(14)
btnBack:setTitleColor({r = 65, g = 65, b = 70})
btnBack:setLayoutComponentEnabled(true)
btnBack:setName("btnBack")
btnBack:setTag(60)
btnBack:setCascadeColorEnabled(true)
btnBack:setCascadeOpacityEnabled(true)
btnBack:setPosition(647.4739, 1219.6320)
layout = ccui.LayoutComponent:bindLayoutComponent(btnBack)
layout:setPositionPercentX(0.8993)
layout:setPositionPercentY(0.9528)
layout:setPercentWidth(0.1139)
layout:setPercentHeight(0.0617)
layout:setSize({width = 82.0000, height = 79.0000})
layout:setHorizontalEdge(1)
layout:setVerticalEdge(2)
layout:setLeftMargin(606.4739)
layout:setRightMargin(31.5261)
layout:setTopMargin(20.8676)
layout:setBottomMargin(1180.1320)
Layer:addChild(btnBack)

--Create txtScore
local txtScore = ccui.Text:create()
txtScore:ignoreContentAdaptWithSize(true)
txtScore:setTextAreaSize({width = 0, height = 0})
txtScore:setFontName("game/chuangchuang/images/hwxk.ttf")
txtScore:setFontSize(50)
txtScore:setString([[SCORE: 0]])
txtScore:setLayoutComponentEnabled(true)
txtScore:setName("txtScore")
txtScore:setTag(71)
txtScore:setCascadeColorEnabled(true)
txtScore:setCascadeOpacityEnabled(true)
txtScore:setPosition(292.8740, 1219.6320)
txtScore:setTextColor({r = 0, g = 0, b = 0})
layout = ccui.LayoutComponent:bindLayoutComponent(txtScore)
layout:setPositionPercentX(0.4068)
layout:setPositionPercentY(0.9528)
layout:setPercentWidth(0.2931)
layout:setPercentHeight(0.0430)
layout:setSize({width = 211.0000, height = 55.0000})
layout:setHorizontalEdge(1)
layout:setVerticalEdge(2)
layout:setLeftMargin(187.3740)
layout:setRightMargin(321.6260)
layout:setTopMargin(32.8683)
layout:setBottomMargin(1192.1320)
Layer:addChild(txtScore)

--Create Text_1_0
local Text_1_0 = ccui.Text:create()
Text_1_0:ignoreContentAdaptWithSize(true)
Text_1_0:setTextAreaSize({width = 0, height = 0})
Text_1_0:setFontName("game/chuangchuang/images/hwxk.ttf")
Text_1_0:setFontSize(50)
Text_1_0:setString([[SCORE:]])
Text_1_0:setLayoutComponentEnabled(true)
Text_1_0:setName("Text_1_0")
Text_1_0:setTag(72)
Text_1_0:setCascadeColorEnabled(true)
Text_1_0:setCascadeOpacityEnabled(true)
Text_1_0:setVisible(false)
Text_1_0:setPosition(251.0001, 1219.6320)
Text_1_0:setTextColor({r = 0, g = 0, b = 0})
layout = ccui.LayoutComponent:bindLayoutComponent(Text_1_0)
layout:setPositionPercentX(0.3486)
layout:setPositionPercentY(0.9528)
layout:setPercentWidth(0.2389)
layout:setPercentHeight(0.0430)
layout:setSize({width = 172.0000, height = 55.0000})
layout:setHorizontalEdge(1)
layout:setVerticalEdge(2)
layout:setLeftMargin(165.0001)
layout:setRightMargin(382.9999)
layout:setTopMargin(32.8676)
layout:setBottomMargin(1192.1320)
Layer:addChild(Text_1_0)

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
btnSetting:setTag(73)
btnSetting:setCascadeColorEnabled(true)
btnSetting:setCascadeOpacityEnabled(true)
btnSetting:setPosition(537.6707, 1219.6320)
layout = ccui.LayoutComponent:bindLayoutComponent(btnSetting)
layout:setPositionPercentX(0.7468)
layout:setPositionPercentY(0.9528)
layout:setPercentWidth(0.1139)
layout:setPercentHeight(0.0617)
layout:setSize({width = 82.0000, height = 79.0000})
layout:setHorizontalEdge(2)
layout:setVerticalEdge(2)
layout:setLeftMargin(496.6707)
layout:setRightMargin(141.3293)
layout:setTopMargin(20.8676)
layout:setBottomMargin(1180.1320)
Layer:addChild(btnSetting)

--Create Image_4
local Image_4 = ccui.ImageView:create()
Image_4:ignoreContentAdaptWithSize(false)
Image_4:loadTexture("game/chuangchuang/images/gunzi.png",0)
Image_4:setScale9Enabled(true)
Image_4:setCapInsets({x = 2, y = 15, width = 66, height = 450})
Image_4:setLayoutComponentEnabled(true)
Image_4:setName("Image_4")
Image_4:setTag(76)
Image_4:setCascadeColorEnabled(true)
Image_4:setCascadeOpacityEnabled(true)
Image_4:setPosition(49.3499, 1215.6320)
Image_4:setScaleX(0.5000)
Image_4:setScaleY(0.2500)
layout = ccui.LayoutComponent:bindLayoutComponent(Image_4)
layout:setPositionPercentX(0.0685)
layout:setPositionPercentY(0.9497)
layout:setPercentWidth(0.0972)
layout:setPercentHeight(0.3750)
layout:setSize({width = 70.0000, height = 480.0000})
layout:setHorizontalEdge(1)
layout:setVerticalEdge(2)
layout:setLeftMargin(14.3499)
layout:setRightMargin(635.6501)
layout:setTopMargin(-175.6324)
layout:setBottomMargin(975.6324)
Layer:addChild(Image_4)

--Create txtLife
local txtLife = ccui.Text:create()
txtLife:ignoreContentAdaptWithSize(true)
txtLife:setTextAreaSize({width = 0, height = 0})
txtLife:setFontName("game/chuangchuang/images/hwxk.ttf")
txtLife:setFontSize(50)
txtLife:setString([[x3]])
txtLife:setLayoutComponentEnabled(true)
txtLife:setName("txtLife")
txtLife:setTag(77)
txtLife:setCascadeColorEnabled(true)
txtLife:setCascadeOpacityEnabled(true)
txtLife:setAnchorPoint(0.0000, 0.5000)
txtLife:setPosition(64.3680, 1219.6320)
txtLife:setTextColor({r = 0, g = 0, b = 0})
layout = ccui.LayoutComponent:bindLayoutComponent(txtLife)
layout:setPositionPercentX(0.0894)
layout:setPositionPercentY(0.9528)
layout:setPercentWidth(0.0625)
layout:setPercentHeight(0.0430)
layout:setSize({width = 45.0000, height = 55.0000})
layout:setHorizontalEdge(3)
layout:setVerticalEdge(2)
layout:setLeftMargin(64.3680)
layout:setRightMargin(610.6320)
layout:setTopMargin(32.8676)
layout:setBottomMargin(1192.1320)
Layer:addChild(txtLife)

--Create container
local container = ccui.Layout:create()
container:ignoreContentAdaptWithSize(false)
container:setClippingEnabled(false)
container:setBackGroundColorOpacity(102)
container:setLayoutComponentEnabled(true)
container:setName("container")
container:setTag(41)
container:setCascadeColorEnabled(true)
container:setCascadeOpacityEnabled(true)
container:setAnchorPoint(0.5000, 0.0000)
container:setPosition(360.0000, 0.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(container)
layout:setPositionPercentX(0.5000)
layout:setPercentWidth(1.0000)
layout:setPercentHeight(1.0000)
layout:setSize({width = 720.0000, height = 1280.0000})
layout:setVerticalEdge(2)
layout:setStretchWidthEnabled(true)
Layer:addChild(container)

--Create click
local click = ccui.Layout:create()
click:ignoreContentAdaptWithSize(false)
click:setClippingEnabled(false)
click:setBackGroundColorOpacity(102)
click:setLayoutComponentEnabled(true)
click:setName("click")
click:setTag(45)
click:setCascadeColorEnabled(true)
click:setCascadeOpacityEnabled(true)
click:setAnchorPoint(0.5000, 0.0000)
click:setPosition(360.0000, 0.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(click)
layout:setPositionPercentX(0.5000)
layout:setPercentWidth(1.0000)
layout:setPercentHeight(0.8984)
layout:setSize({width = 720.0000, height = 1149.9520})
layout:setVerticalEdge(1)
layout:setTopMargin(130.0480)
layout:setStretchWidthEnabled(true)
layout:setStretchHeightEnabled(true)
Layer:addChild(click)

--Create Animation
result['animation'] = ccs.ActionTimeline:create()
  
result['animation']:setDuration(0)
result['animation']:setTimeSpeed(1.0000)
--Create Animation List

result['root'] = Layer
return result;
end

return Result

