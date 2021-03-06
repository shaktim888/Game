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

--Create item
local item = ccui.Layout:create()
item:ignoreContentAdaptWithSize(false)
item:setClippingEnabled(false)
item:setBackGroundColorOpacity(102)
item:setTouchEnabled(true);
item:setLayoutComponentEnabled(true)
item:setName("item")
item:setTag(251)
item:setCascadeColorEnabled(true)
item:setCascadeOpacityEnabled(true)
item:setPosition(-209.0000, 83.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(item)
layout:setPositionPercentX(-0.1633)
layout:setPositionPercentY(0.1153)
layout:setPercentWidth(0.0781)
layout:setPercentHeight(0.1389)
layout:setSize({width = 100.0000, height = 100.0000})
layout:setLeftMargin(-209.0000)
layout:setRightMargin(1389.0000)
layout:setTopMargin(537.0000)
layout:setBottomMargin(83.0000)
Layer:addChild(item)

--Create duigou
local duigou = ccui.ImageView:create()
duigou:ignoreContentAdaptWithSize(false)
duigou:loadTexture("Default/ImageFile.png",0)
duigou:setLayoutComponentEnabled(true)
duigou:setName("duigou")
duigou:setTag(250)
duigou:setCascadeColorEnabled(true)
duigou:setCascadeOpacityEnabled(true)
duigou:setPosition(50.0000, 21.4999)
duigou:setScaleX(0.2000)
duigou:setScaleY(0.2000)
layout = ccui.LayoutComponent:bindLayoutComponent(duigou)
layout:setPositionPercentX(0.5000)
layout:setPositionPercentY(0.2150)
layout:setPercentWidth(0.4600)
layout:setPercentHeight(0.4600)
layout:setSize({width = 46.0000, height = 46.0000})
layout:setLeftMargin(27.0000)
layout:setRightMargin(27.0000)
layout:setTopMargin(55.5001)
layout:setBottomMargin(-1.5001)
item:addChild(duigou)

--Create choice_item
local choice_item = ccui.Layout:create()
choice_item:ignoreContentAdaptWithSize(false)
choice_item:setClippingEnabled(false)
choice_item:setBackGroundImageCapInsets({x = -23, y = -26, width = 46, height = 52})
choice_item:setBackGroundColorOpacity(102)
choice_item:setBackGroundImageScale9Enabled(true)
choice_item:setLayoutComponentEnabled(true)
choice_item:setName("choice_item")
choice_item:setTag(130)
choice_item:setCascadeColorEnabled(true)
choice_item:setCascadeOpacityEnabled(true)
choice_item:setPosition(-530.3528, 135.2942)
layout = ccui.LayoutComponent:bindLayoutComponent(choice_item)
layout:setPositionPercentX(-0.4143)
layout:setPositionPercentY(0.1879)
layout:setPercentWidth(0.1641)
layout:setPercentHeight(0.1111)
layout:setSize({width = 210.0000, height = 80.0000})
layout:setLeftMargin(-530.3528)
layout:setRightMargin(1600.3530)
layout:setTopMargin(504.7058)
layout:setBottomMargin(135.2942)
Layer:addChild(choice_item)

--Create img
local img = ccui.ImageView:create()
img:ignoreContentAdaptWithSize(false)
img:loadTexture("Default/ImageFile.png",0)
img:setLayoutComponentEnabled(true)
img:setName("img")
img:setTag(24)
img:setCascadeColorEnabled(true)
img:setCascadeOpacityEnabled(true)
img:setPosition(105.0000, 0.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(img)
layout:setPositionPercentXEnabled(true)
layout:setPositionPercentX(0.5000)
layout:setPercentWidth(0.2190)
layout:setPercentHeight(0.5750)
layout:setSize({width = 46.0000, height = 46.0000})
layout:setLeftMargin(82.0000)
layout:setRightMargin(82.0000)
layout:setTopMargin(57.0000)
layout:setBottomMargin(-23.0000)
choice_item:addChild(img)

--Create bgImg
local bgImg = ccui.ImageView:create()
bgImg:ignoreContentAdaptWithSize(false)
bgImg:loadTexture("game/cattleRun/image/bg.png",0)
bgImg:setLayoutComponentEnabled(true)
bgImg:setName("bgImg")
bgImg:setTag(51)
bgImg:setCascadeColorEnabled(true)
bgImg:setCascadeOpacityEnabled(true)
bgImg:setPosition(639.6401, 360.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(bgImg)
layout:setPositionPercentX(0.4997)
layout:setPositionPercentY(0.5000)
layout:setPercentWidth(1.0000)
layout:setPercentHeight(0.9958)
layout:setSize({width = 1280.0000, height = 717.0000})
layout:setLeftMargin(-0.3599)
layout:setRightMargin(0.3599)
layout:setTopMargin(1.5000)
layout:setBottomMargin(1.5000)
layout:setStretchWidthEnabled(true)
layout:setStretchHeightEnabled(true)
Layer:addChild(bgImg)

--Create Image_6
local Image_6 = ccui.ImageView:create()
Image_6:ignoreContentAdaptWithSize(false)
Image_6:loadTexture("game/cattleRun/image/zhuozi.png",0)
Image_6:setLayoutComponentEnabled(true)
Image_6:setName("Image_6")
Image_6:setTag(127)
Image_6:setCascadeColorEnabled(true)
Image_6:setCascadeOpacityEnabled(true)
Image_6:setPosition(639.6401, 359.8834)
layout = ccui.LayoutComponent:bindLayoutComponent(Image_6)
layout:setPositionPercentX(0.4997)
layout:setPositionPercentY(0.4998)
layout:setPercentWidth(0.8367)
layout:setPercentHeight(1.0000)
layout:setSize({width = 1071.0000, height = 720.0000})
layout:setLeftMargin(104.1401)
layout:setRightMargin(104.8599)
layout:setTopMargin(0.1166)
layout:setBottomMargin(-0.1166)
Layer:addChild(Image_6)

--Create Image_6_0
local Image_6_0 = ccui.ImageView:create()
Image_6_0:ignoreContentAdaptWithSize(false)
Image_6_0:loadTexture("game/cattleRun/image/scoreImg.png",0)
Image_6_0:setLayoutComponentEnabled(true)
Image_6_0:setName("Image_6_0")
Image_6_0:setTag(38)
Image_6_0:setCascadeColorEnabled(true)
Image_6_0:setCascadeOpacityEnabled(true)
Image_6_0:setPosition(97.1410, 654.8815)
layout = ccui.LayoutComponent:bindLayoutComponent(Image_6_0)
layout:setPositionPercentX(0.0759)
layout:setPositionPercentY(0.9096)
layout:setPercentWidth(0.1023)
layout:setPercentHeight(0.0833)
layout:setSize({width = 131.0000, height = 60.0000})
layout:setLeftMargin(31.6410)
layout:setRightMargin(1117.3590)
layout:setTopMargin(35.1185)
layout:setBottomMargin(624.8815)
Layer:addChild(Image_6_0)

--Create score_num
local score_num = ccui.TextBMFont:create()
score_num:setFntFile("game/cattleRun/image/scorenumber.fnt")
score_num:setString([[123]])
score_num:setLayoutComponentEnabled(true)
score_num:setName("score_num")
score_num:setTag(44)
score_num:setCascadeColorEnabled(true)
score_num:setCascadeOpacityEnabled(true)
score_num:setAnchorPoint(0.0000, 0.5000)
score_num:setPosition(185.4134, 653.5653)
score_num:setScaleX(1.8000)
score_num:setScaleY(1.8000)
layout = ccui.LayoutComponent:bindLayoutComponent(score_num)
layout:setPositionPercentX(0.1449)
layout:setPositionPercentY(0.9077)
layout:setPercentWidth(0.0336)
layout:setPercentHeight(0.0278)
layout:setSize({width = 43.0000, height = 20.0000})
layout:setLeftMargin(185.4134)
layout:setRightMargin(1051.5870)
layout:setTopMargin(56.4347)
layout:setBottomMargin(643.5653)
Layer:addChild(score_num)

--Create plate
local plate = ccui.ImageView:create()
plate:ignoreContentAdaptWithSize(false)
plate:loadTexture("game/cattleRun/image/plate.png",0)
plate:setLayoutComponentEnabled(true)
plate:setName("plate")
plate:setTag(73)
plate:setCascadeColorEnabled(true)
plate:setCascadeOpacityEnabled(true)
plate:setPosition(643.9285, 83.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(plate)
layout:setPositionPercentX(0.5031)
layout:setPositionPercentY(0.1153)
layout:setPercentWidth(0.0961)
layout:setPercentHeight(0.2111)
layout:setSize({width = 123.0000, height = 152.0000})
layout:setLeftMargin(582.4285)
layout:setRightMargin(574.5715)
layout:setTopMargin(561.0000)
layout:setBottomMargin(7.0000)
Layer:addChild(plate)

--Create fallpnl
local fallpnl = ccui.Layout:create()
fallpnl:ignoreContentAdaptWithSize(false)
fallpnl:setClippingEnabled(false)
fallpnl:setBackGroundColorOpacity(102)
fallpnl:setLayoutComponentEnabled(true)
fallpnl:setName("fallpnl")
fallpnl:setTag(75)
fallpnl:setCascadeColorEnabled(true)
fallpnl:setCascadeOpacityEnabled(true)
fallpnl:setPosition(185.9840, 182.5000)
layout = ccui.LayoutComponent:bindLayoutComponent(fallpnl)
layout:setPositionPercentXEnabled(true)
layout:setPositionPercentX(0.1453)
layout:setPositionPercentY(0.2535)
layout:setPercentWidthEnabled(true)
layout:setPercentHeightEnabled(true)
layout:setPercentWidth(0.7031)
layout:setPercentHeight(0.7500)
layout:setSize({width = 899.9680, height = 540.0000})
layout:setVerticalEdge(2)
layout:setLeftMargin(185.9840)
layout:setRightMargin(194.0480)
layout:setTopMargin(-2.5000)
layout:setBottomMargin(182.5000)
Layer:addChild(fallpnl)

--Create pnl1
local pnl1 = ccui.Layout:create()
pnl1:ignoreContentAdaptWithSize(false)
pnl1:setClippingEnabled(true)
pnl1:setBackGroundColorOpacity(102)
pnl1:setLayoutComponentEnabled(true)
pnl1:setName("pnl1")
pnl1:setTag(188)
pnl1:setCascadeColorEnabled(true)
pnl1:setCascadeOpacityEnabled(true)
pnl1:setPosition(7.0198, 2.9861)
layout = ccui.LayoutComponent:bindLayoutComponent(pnl1)
layout:setPositionPercentX(0.0078)
layout:setPositionPercentY(0.0055)
layout:setPercentWidthEnabled(true)
layout:setPercentHeightEnabled(true)
layout:setPercentWidth(0.3200)
layout:setPercentHeight(1.0000)
layout:setSize({width = 287.9897, height = 540.0000})
layout:setHorizontalEdge(3)
layout:setVerticalEdge(2)
layout:setLeftMargin(7.0198)
layout:setRightMargin(604.9585)
layout:setTopMargin(-2.9861)
layout:setBottomMargin(2.9861)
fallpnl:addChild(pnl1)

--Create pnl2
local pnl2 = ccui.Layout:create()
pnl2:ignoreContentAdaptWithSize(false)
pnl2:setClippingEnabled(true)
pnl2:setBackGroundColorOpacity(102)
pnl2:setLayoutComponentEnabled(true)
pnl2:setName("pnl2")
pnl2:setTag(189)
pnl2:setCascadeColorEnabled(true)
pnl2:setCascadeOpacityEnabled(true)
pnl2:setPosition(298.9694, 0.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(pnl2)
layout:setPositionPercentX(0.3322)
layout:setPercentWidthEnabled(true)
layout:setPercentHeightEnabled(true)
layout:setPercentWidth(0.3400)
layout:setPercentHeight(1.0000)
layout:setSize({width = 305.9891, height = 540.0000})
layout:setHorizontalEdge(3)
layout:setVerticalEdge(2)
layout:setLeftMargin(298.9694)
layout:setRightMargin(295.0095)
fallpnl:addChild(pnl2)

--Create pnl3
local pnl3 = ccui.Layout:create()
pnl3:ignoreContentAdaptWithSize(false)
pnl3:setClippingEnabled(true)
pnl3:setBackGroundColorOpacity(102)
pnl3:setLayoutComponentEnabled(true)
pnl3:setName("pnl3")
pnl3:setTag(190)
pnl3:setCascadeColorEnabled(true)
pnl3:setCascadeOpacityEnabled(true)
pnl3:setPosition(608.0184, 0.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(pnl3)
layout:setPositionPercentX(0.6756)
layout:setPercentWidthEnabled(true)
layout:setPercentHeightEnabled(true)
layout:setPercentWidth(0.3200)
layout:setPercentHeight(1.0000)
layout:setSize({width = 287.9897, height = 540.0000})
layout:setHorizontalEdge(3)
layout:setVerticalEdge(2)
layout:setLeftMargin(608.0184)
layout:setRightMargin(3.9599)
fallpnl:addChild(pnl3)

--Create fadepnl
local fadepnl = ccui.Layout:create()
fadepnl:ignoreContentAdaptWithSize(false)
fadepnl:setClippingEnabled(false)
fadepnl:setBackGroundColorOpacity(102)
fadepnl:setTouchEnabled(true);
fadepnl:setLayoutComponentEnabled(true)
fadepnl:setName("fadepnl")
fadepnl:setTag(60)
fadepnl:setCascadeColorEnabled(true)
fadepnl:setCascadeOpacityEnabled(true)
fadepnl:setPosition(1282.8820, -272.2410)
layout = ccui.LayoutComponent:bindLayoutComponent(fadepnl)
layout:setPositionPercentX(1.4255)
layout:setPositionPercentY(-0.5042)
layout:setPercentWidth(1.2867)
layout:setPercentHeight(0.6556)
layout:setSize({width = 1158.0000, height = 354.0000})
layout:setLeftMargin(1282.8820)
layout:setRightMargin(-1540.9140)
layout:setTopMargin(458.2410)
layout:setBottomMargin(-272.2410)
fallpnl:addChild(fadepnl)

--Create touchpnl
local touchpnl = ccui.Layout:create()
touchpnl:ignoreContentAdaptWithSize(false)
touchpnl:setClippingEnabled(false)
touchpnl:setBackGroundColorOpacity(102)
touchpnl:setTouchEnabled(true);
touchpnl:setLayoutComponentEnabled(true)
touchpnl:setName("touchpnl")
touchpnl:setTag(194)
touchpnl:setCascadeColorEnabled(true)
touchpnl:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(touchpnl)
layout:setPercentWidth(1.0000)
layout:setPercentHeight(1.0000)
layout:setSize({width = 1280.0000, height = 720.0000})
Layer:addChild(touchpnl)

--Create btnBack
local btnBack = ccui.Button:create()
btnBack:ignoreContentAdaptWithSize(false)
btnBack:setTitleFontSize(14)
btnBack:setTitleColor({r = 65, g = 65, b = 70})
btnBack:setScale9Enabled(true)
btnBack:setCapInsets({x = -15, y = -11, width = 30, height = 22})
btnBack:setLayoutComponentEnabled(true)
btnBack:setName("btnBack")
btnBack:setTag(17)
btnBack:setCascadeColorEnabled(true)
btnBack:setCascadeOpacityEnabled(true)
btnBack:setPosition(-240.9998, 506.0002)
layout = ccui.LayoutComponent:bindLayoutComponent(btnBack)
layout:setPositionPercentX(-0.1883)
layout:setPositionPercentY(0.7028)
layout:setHorizontalEdge(1)
layout:setVerticalEdge(2)
layout:setLeftMargin(-240.9998)
layout:setRightMargin(1521.0000)
layout:setTopMargin(213.9998)
layout:setBottomMargin(506.0002)
Layer:addChild(btnBack)

--Create mainPnl
local mainPnl = ccui.Layout:create()
mainPnl:ignoreContentAdaptWithSize(false)
mainPnl:setClippingEnabled(false)
mainPnl:setBackGroundColorType(1)
mainPnl:setBackGroundColor({r = 150, g = 200, b = 255})
mainPnl:setBackGroundColorOpacity(102)
mainPnl:setTouchEnabled(true);
mainPnl:setLayoutComponentEnabled(true)
mainPnl:setName("mainPnl")
mainPnl:setTag(35)
mainPnl:setCascadeColorEnabled(true)
mainPnl:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(mainPnl)
layout:setPercentWidth(1.0000)
layout:setPercentHeight(1.0000)
layout:setSize({width = 1280.0000, height = 720.0000})
Layer:addChild(mainPnl)

--Create bg
local bg = ccui.ImageView:create()
bg:ignoreContentAdaptWithSize(false)
bg:loadTexture("game/cattleRun/image/bg.png",0)
bg:setLayoutComponentEnabled(true)
bg:setName("bg")
bg:setTag(36)
bg:setCascadeColorEnabled(true)
bg:setCascadeOpacityEnabled(true)
bg:setPosition(640.0000, 360.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(bg)
layout:setPositionPercentX(0.5000)
layout:setPositionPercentY(0.5000)
layout:setPercentWidth(1.0000)
layout:setPercentHeight(0.9958)
layout:setSize({width = 1280.0000, height = 717.0000})
layout:setTopMargin(1.5000)
layout:setBottomMargin(1.5000)
mainPnl:addChild(bg)

--Create btnStart
local btnStart = ccui.Button:create()
btnStart:ignoreContentAdaptWithSize(false)
btnStart:loadTextureNormal("game/cattleRun/image/kaishi.png",0)
btnStart:setTitleFontSize(14)
btnStart:setTitleColor({r = 65, g = 65, b = 70})
btnStart:setScale9Enabled(true)
btnStart:setCapInsets({x = 15, y = 11, width = 412, height = 80})
btnStart:setLayoutComponentEnabled(true)
btnStart:setName("btnStart")
btnStart:setTag(65)
btnStart:setCascadeColorEnabled(true)
btnStart:setCascadeOpacityEnabled(true)
btnStart:setPosition(1059.3100, 71.3969)
layout = ccui.LayoutComponent:bindLayoutComponent(btnStart)
layout:setPositionPercentX(0.8276)
layout:setPositionPercentY(0.0992)
layout:setPercentWidth(0.3453)
layout:setPercentHeight(0.1417)
layout:setSize({width = 442.0000, height = 102.0000})
layout:setLeftMargin(838.3098)
layout:setRightMargin(-0.3098)
layout:setTopMargin(597.6031)
layout:setBottomMargin(20.3969)
mainPnl:addChild(btnStart)

--Create role
local role = ccui.ImageView:create()
role:ignoreContentAdaptWithSize(false)
role:loadTexture("game/cattleRun/image/role.png",0)
role:setLayoutComponentEnabled(true)
role:setName("role")
role:setTag(126)
role:setCascadeColorEnabled(true)
role:setCascadeOpacityEnabled(true)
role:setAnchorPoint(0.0000, 0.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(role)
layout:setPercentWidth(0.5625)
layout:setPercentHeight(0.8333)
layout:setSize({width = 720.0000, height = 600.0000})
layout:setRightMargin(560.0000)
layout:setTopMargin(120.0000)
mainPnl:addChild(role)

--Create btnAbout
local btnAbout = ccui.Button:create()
btnAbout:ignoreContentAdaptWithSize(false)
btnAbout:loadTextureNormal("game/cattleRun/image/wenhao.png",0)
btnAbout:setTitleFontSize(14)
btnAbout:setTitleColor({r = 65, g = 65, b = 70})
btnAbout:setLayoutComponentEnabled(true)
btnAbout:setName("btnAbout")
btnAbout:setTag(102)
btnAbout:setCascadeColorEnabled(true)
btnAbout:setCascadeOpacityEnabled(true)
btnAbout:setPosition(1081.0020, 648.8220)
layout = ccui.LayoutComponent:bindLayoutComponent(btnAbout)
layout:setPositionPercentX(0.8445)
layout:setPositionPercentY(0.9011)
layout:setPercentWidth(0.0898)
layout:setPercentHeight(0.1639)
layout:setSize({width = 115.0000, height = 118.0000})
layout:setLeftMargin(1023.5020)
layout:setRightMargin(141.4977)
layout:setTopMargin(12.1780)
layout:setBottomMargin(589.8220)
Layer:addChild(btnAbout)

--Create soundOn
local soundOn = ccui.Button:create()
soundOn:ignoreContentAdaptWithSize(false)
soundOn:loadTextureNormal("game/cattleRun/image/soundClose.png",0)
soundOn:setTitleFontSize(14)
soundOn:setTitleColor({r = 65, g = 65, b = 70})
soundOn:setScale9Enabled(true)
soundOn:setCapInsets({x = 15, y = 11, width = 85, height = 96})
soundOn:setLayoutComponentEnabled(true)
soundOn:setName("soundOn")
soundOn:setTag(75)
soundOn:setCascadeColorEnabled(true)
soundOn:setCascadeOpacityEnabled(true)
soundOn:setPosition(1205.1560, 648.8231)
layout = ccui.LayoutComponent:bindLayoutComponent(soundOn)
layout:setPositionPercentX(0.9415)
layout:setPositionPercentY(0.9011)
layout:setPercentWidth(0.0898)
layout:setPercentHeight(0.1639)
layout:setSize({width = 115.0000, height = 118.0000})
layout:setHorizontalEdge(2)
layout:setVerticalEdge(2)
layout:setLeftMargin(1147.6560)
layout:setRightMargin(17.3436)
layout:setTopMargin(12.1769)
layout:setBottomMargin(589.8231)
Layer:addChild(soundOn)

--Create soundOff
local soundOff = ccui.Button:create()
soundOff:ignoreContentAdaptWithSize(false)
soundOff:loadTextureNormal("game/cattleRun/image/soundOpen.png",0)
soundOff:setTitleFontSize(14)
soundOff:setTitleColor({r = 65, g = 65, b = 70})
soundOff:setScale9Enabled(true)
soundOff:setCapInsets({x = 15, y = 11, width = 85, height = 96})
soundOff:setLayoutComponentEnabled(true)
soundOff:setName("soundOff")
soundOff:setTag(76)
soundOff:setCascadeColorEnabled(true)
soundOff:setCascadeOpacityEnabled(true)
soundOff:setPosition(1205.1560, 648.8231)
layout = ccui.LayoutComponent:bindLayoutComponent(soundOff)
layout:setPositionPercentX(0.9415)
layout:setPositionPercentY(0.9011)
layout:setPercentWidth(0.0898)
layout:setPercentHeight(0.1639)
layout:setSize({width = 115.0000, height = 118.0000})
layout:setHorizontalEdge(2)
layout:setVerticalEdge(2)
layout:setLeftMargin(1147.6560)
layout:setRightMargin(17.3436)
layout:setTopMargin(12.1769)
layout:setBottomMargin(589.8231)
Layer:addChild(soundOff)

--Create Animation
result['animation'] = ccs.ActionTimeline:create()
  
result['animation']:setDuration(0)
result['animation']:setTimeSpeed(1.0000)
--Create Animation List

result['root'] = Layer
return result;
end

return Result

