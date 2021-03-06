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
Image_1:loadTexture("game/niuniutiaozhan/images/bg.png",0)
Image_1:setLayoutComponentEnabled(true)
Image_1:setName("Image_1")
Image_1:setTag(8)
Image_1:setCascadeColorEnabled(true)
Image_1:setCascadeOpacityEnabled(true)
Image_1:setPosition(360.0000, 640.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(Image_1)
layout:setPositionPercentX(0.5000)
layout:setPositionPercentY(0.5000)
layout:setPercentWidth(1.0000)
layout:setPercentHeight(1.0000)
layout:setSize({width = 720.0000, height = 1280.0000})
Layer:addChild(Image_1)

--Create back
local back = ccui.Button:create()
back:ignoreContentAdaptWithSize(false)
back:loadTextureNormal("game/niuniutiaozhan/images/btns/back.png",0)
back:setTitleFontSize(14)
back:setTitleColor({r = 65, g = 65, b = 70})
back:setScale9Enabled(true)
back:setCapInsets({x = 15, y = 11, width = 101, height = 55})
back:setLayoutComponentEnabled(true)
back:setName("back")
back:setTag(9)
back:setCascadeColorEnabled(true)
back:setCascadeOpacityEnabled(true)
back:setPosition(123.2825, 1190.5640)
if callBackProvider~=nil then
      back:addClickEventListener(callBackProvider("niuniutiaozhan.lua", back, "onBack"))
end
layout = ccui.LayoutComponent:bindLayoutComponent(back)
layout:setPositionPercentX(0.1712)
layout:setPositionPercentY(0.9301)
layout:setPercentWidth(0.1819)
layout:setPercentHeight(0.0602)
layout:setSize({width = 131.0000, height = 77.0000})
layout:setLeftMargin(57.7825)
layout:setRightMargin(531.2175)
layout:setTopMargin(50.9359)
layout:setBottomMargin(1152.0640)
Layer:addChild(back)

--Create datapnl
local datapnl = ccui.Layout:create()
datapnl:ignoreContentAdaptWithSize(false)
datapnl:setClippingEnabled(false)
datapnl:setBackGroundColorOpacity(102)
datapnl:setTouchEnabled(true);
datapnl:setLayoutComponentEnabled(true)
datapnl:setName("datapnl")
datapnl:setTag(10)
datapnl:setCascadeColorEnabled(true)
datapnl:setCascadeOpacityEnabled(true)
datapnl:setPosition(109.9999, 794.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(datapnl)
layout:setPositionPercentX(0.1528)
layout:setPositionPercentY(0.6203)
layout:setPercentWidth(0.6944)
layout:setPercentHeight(0.2500)
layout:setSize({width = 500.0000, height = 320.0000})
layout:setLeftMargin(109.9999)
layout:setRightMargin(110.0001)
layout:setTopMargin(166.0000)
layout:setBottomMargin(794.0000)
Layer:addChild(datapnl)

--Create img_score
local img_score = ccui.ImageView:create()
img_score:ignoreContentAdaptWithSize(false)
img_score:loadTexture("game/niuniutiaozhan/images/img_txts/score.png",0)
img_score:setLayoutComponentEnabled(true)
img_score:setName("img_score")
img_score:setTag(11)
img_score:setCascadeColorEnabled(true)
img_score:setCascadeOpacityEnabled(true)
img_score:setPosition(250.0000, 225.4300)
layout = ccui.LayoutComponent:bindLayoutComponent(img_score)
layout:setPositionPercentX(0.5000)
layout:setPositionPercentY(0.7045)
layout:setPercentWidth(0.6340)
layout:setPercentHeight(0.3594)
layout:setSize({width = 317.0000, height = 115.0000})
layout:setLeftMargin(91.5000)
layout:setRightMargin(91.5000)
layout:setTopMargin(37.0700)
layout:setBottomMargin(167.9300)
datapnl:addChild(img_score)

--Create label_score
local label_score = ccui.Text:create()
label_score:ignoreContentAdaptWithSize(true)
label_score:setTextAreaSize({width = 0, height = 0})
label_score:setFontSize(60)
label_score:setString([[0]])
label_score:setLayoutComponentEnabled(true)
label_score:setName("label_score")
label_score:setTag(35)
label_score:setCascadeColorEnabled(true)
label_score:setCascadeOpacityEnabled(true)
label_score:setPosition(281.7509, 234.6204)
layout = ccui.LayoutComponent:bindLayoutComponent(label_score)
layout:setPositionPercentX(0.5635)
layout:setPositionPercentY(0.7332)
layout:setPercentWidth(0.0680)
layout:setPercentHeight(0.2125)
layout:setSize({width = 34.0000, height = 68.0000})
layout:setLeftMargin(264.7509)
layout:setRightMargin(201.2491)
layout:setTopMargin(51.3796)
layout:setBottomMargin(200.6204)
datapnl:addChild(label_score)

--Create img_time
local img_time = ccui.ImageView:create()
img_time:ignoreContentAdaptWithSize(false)
img_time:loadTexture("game/niuniutiaozhan/images/img_txts/time.png",0)
img_time:setLayoutComponentEnabled(true)
img_time:setName("img_time")
img_time:setTag(12)
img_time:setCascadeColorEnabled(true)
img_time:setCascadeOpacityEnabled(true)
img_time:setPosition(250.0000, 74.5389)
layout = ccui.LayoutComponent:bindLayoutComponent(img_time)
layout:setPositionPercentX(0.5000)
layout:setPositionPercentY(0.2329)
layout:setPercentWidth(0.6340)
layout:setPercentHeight(0.3594)
layout:setSize({width = 317.0000, height = 115.0000})
layout:setLeftMargin(91.5000)
layout:setRightMargin(91.5000)
layout:setTopMargin(187.9611)
layout:setBottomMargin(17.0389)
datapnl:addChild(img_time)

--Create label_time
local label_time = ccui.Text:create()
label_time:ignoreContentAdaptWithSize(true)
label_time:setTextAreaSize({width = 0, height = 0})
label_time:setFontSize(60)
label_time:setString([[0]])
label_time:setLayoutComponentEnabled(true)
label_time:setName("label_time")
label_time:setTag(36)
label_time:setCascadeColorEnabled(true)
label_time:setCascadeOpacityEnabled(true)
label_time:setPosition(281.7533, 74.4512)
layout = ccui.LayoutComponent:bindLayoutComponent(label_time)
layout:setPositionPercentX(0.5635)
layout:setPositionPercentY(0.2327)
layout:setPercentWidth(0.0680)
layout:setPercentHeight(0.2125)
layout:setSize({width = 34.0000, height = 68.0000})
layout:setLeftMargin(264.7533)
layout:setRightMargin(201.2467)
layout:setTopMargin(211.5488)
layout:setBottomMargin(40.4512)
datapnl:addChild(label_time)

--Create gamepnl
local gamepnl = ccui.Layout:create()
gamepnl:ignoreContentAdaptWithSize(false)
gamepnl:setClippingEnabled(false)
gamepnl:setBackGroundColorOpacity(102)
gamepnl:setTouchEnabled(true);
gamepnl:setLayoutComponentEnabled(true)
gamepnl:setName("gamepnl")
gamepnl:setTag(15)
gamepnl:setCascadeColorEnabled(true)
gamepnl:setCascadeOpacityEnabled(true)
gamepnl:setPosition(0.0000, 8.4888)
layout = ccui.LayoutComponent:bindLayoutComponent(gamepnl)
layout:setPositionPercentY(0.0066)
layout:setPercentWidth(1.0000)
layout:setPercentHeight(0.6094)
layout:setSize({width = 720.0000, height = 780.0000})
layout:setTopMargin(491.5112)
layout:setBottomMargin(8.4888)
Layer:addChild(gamepnl)

--Create gamebg
local gamebg = ccui.ImageView:create()
gamebg:ignoreContentAdaptWithSize(false)
gamebg:loadTexture("game/niuniutiaozhan/images/border/gameborder.png",0)
gamebg:setLayoutComponentEnabled(true)
gamebg:setName("gamebg")
gamebg:setTag(16)
gamebg:setCascadeColorEnabled(true)
gamebg:setCascadeOpacityEnabled(true)
gamebg:setPosition(357.0000, 394.7199)
layout = ccui.LayoutComponent:bindLayoutComponent(gamebg)
layout:setPositionPercentX(0.4958)
layout:setPositionPercentY(0.5061)
layout:setPercentWidth(1.0000)
layout:setPercentHeight(1.0244)
layout:setSize({width = 720.0000, height = 799.0000})
layout:setLeftMargin(-3.0000)
layout:setRightMargin(3.0000)
layout:setTopMargin(-14.2199)
layout:setBottomMargin(-4.7801)
gamepnl:addChild(gamebg)

--Create contentpnl
local contentpnl = ccui.Layout:create()
contentpnl:ignoreContentAdaptWithSize(false)
contentpnl:setClippingEnabled(false)
contentpnl:setBackGroundColorOpacity(102)
contentpnl:setTouchEnabled(true);
contentpnl:setLayoutComponentEnabled(true)
contentpnl:setName("contentpnl")
contentpnl:setTag(20)
contentpnl:setCascadeColorEnabled(true)
contentpnl:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(contentpnl)
layout:setPercentWidth(1.0000)
layout:setPercentHeight(1.0000)
layout:setSize({width = 720.0000, height = 780.0000})
gamepnl:addChild(contentpnl)

--Create cell
local cell = ccui.Layout:create()
cell:ignoreContentAdaptWithSize(false)
cell:setClippingEnabled(false)
cell:setBackGroundColorOpacity(102)
cell:setLayoutComponentEnabled(true)
cell:setName("cell")
cell:setTag(22)
cell:setCascadeColorEnabled(true)
cell:setCascadeOpacityEnabled(true)
cell:setAnchorPoint(0.5000, 0.5000)
cell:setPosition(-766.2372, 341.7526)
layout = ccui.LayoutComponent:bindLayoutComponent(cell)
layout:setPositionPercentX(-1.0642)
layout:setPositionPercentY(0.2670)
layout:setPercentWidth(0.2778)
layout:setPercentHeight(0.1563)
layout:setSize({width = 200.0000, height = 200.0000})
layout:setHorizontalEdge(3)
layout:setVerticalEdge(3)
layout:setLeftMargin(-866.2372)
layout:setRightMargin(1386.2370)
layout:setTopMargin(838.2474)
layout:setBottomMargin(241.7526)
Layer:addChild(cell)

--Create img
local img = ccui.ImageView:create()
img:ignoreContentAdaptWithSize(false)
img:loadTexture("game/niuniutiaozhan/images/icon/icon1.png",0)
img:setLayoutComponentEnabled(true)
img:setName("img")
img:setTag(23)
img:setCascadeColorEnabled(true)
img:setCascadeOpacityEnabled(true)
img:setPosition(100.0000, 100.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(img)
layout:setPositionPercentX(0.5000)
layout:setPositionPercentY(0.5000)
layout:setPercentWidth(0.9050)
layout:setPercentHeight(0.9050)
layout:setSize({width = 181.0000, height = 181.0000})
layout:setHorizontalEdge(3)
layout:setVerticalEdge(3)
layout:setLeftMargin(9.5000)
layout:setRightMargin(9.5000)
layout:setTopMargin(9.5000)
layout:setBottomMargin(9.5000)
cell:addChild(img)

--Create border
local border = ccui.ImageView:create()
border:ignoreContentAdaptWithSize(false)
border:loadTexture("game/niuniutiaozhan/images/border/click_border.png",0)
border:setLayoutComponentEnabled(true)
border:setName("border")
border:setTag(24)
border:setCascadeColorEnabled(true)
border:setCascadeOpacityEnabled(true)
border:setPosition(100.0000, 100.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(border)
layout:setPositionPercentX(0.5000)
layout:setPositionPercentY(0.5000)
layout:setPercentWidth(1.0950)
layout:setPercentHeight(1.0950)
layout:setSize({width = 219.0000, height = 219.0000})
layout:setHorizontalEdge(3)
layout:setVerticalEdge(3)
layout:setLeftMargin(-9.5000)
layout:setRightMargin(-9.5000)
layout:setTopMargin(-9.5000)
layout:setBottomMargin(-9.5000)
cell:addChild(border)

--Create img_ready
local img_ready = ccui.ImageView:create()
img_ready:ignoreContentAdaptWithSize(false)
img_ready:loadTexture("game/niuniutiaozhan/images/ready_go.png",0)
img_ready:setLayoutComponentEnabled(true)
img_ready:setName("img_ready")
img_ready:setTag(30)
img_ready:setCascadeColorEnabled(true)
img_ready:setCascadeOpacityEnabled(true)
img_ready:setPosition(-400.0000, 634.1019)
layout = ccui.LayoutComponent:bindLayoutComponent(img_ready)
layout:setPositionPercentX(-0.5556)
layout:setPositionPercentY(0.4954)
layout:setPercentWidth(0.6250)
layout:setPercentHeight(0.1898)
layout:setSize({width = 450.0000, height = 243.0000})
layout:setLeftMargin(-625.0000)
layout:setRightMargin(895.0000)
layout:setTopMargin(524.3981)
layout:setBottomMargin(512.6019)
Layer:addChild(img_ready)

--Create unclickcell
local unclickcell = ccui.Layout:create()
unclickcell:ignoreContentAdaptWithSize(false)
unclickcell:setClippingEnabled(false)
unclickcell:setBackGroundColorOpacity(102)
unclickcell:setLayoutComponentEnabled(true)
unclickcell:setName("unclickcell")
unclickcell:setTag(40)
unclickcell:setCascadeColorEnabled(true)
unclickcell:setCascadeOpacityEnabled(true)
unclickcell:setAnchorPoint(0.5000, 0.5000)
unclickcell:setPosition(-428.7291, 271.4225)
layout = ccui.LayoutComponent:bindLayoutComponent(unclickcell)
layout:setPositionPercentX(-0.5955)
layout:setPositionPercentY(0.2120)
layout:setPercentWidth(0.2778)
layout:setPercentHeight(0.1563)
layout:setSize({width = 200.0000, height = 200.0000})
layout:setHorizontalEdge(3)
layout:setVerticalEdge(3)
layout:setLeftMargin(-528.7291)
layout:setRightMargin(1048.7290)
layout:setTopMargin(908.5775)
layout:setBottomMargin(171.4225)
Layer:addChild(unclickcell)

--Create img
local img = ccui.ImageView:create()
img:ignoreContentAdaptWithSize(false)
img:loadTexture("game/niuniutiaozhan/images/icon/icon1.png",0)
img:setLayoutComponentEnabled(true)
img:setName("img")
img:setTag(41)
img:setCascadeColorEnabled(true)
img:setCascadeOpacityEnabled(true)
img:setPosition(100.0000, 100.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(img)
layout:setPositionPercentX(0.5000)
layout:setPositionPercentY(0.5000)
layout:setPercentWidth(0.9050)
layout:setPercentHeight(0.9050)
layout:setSize({width = 181.0000, height = 181.0000})
layout:setHorizontalEdge(3)
layout:setVerticalEdge(3)
layout:setLeftMargin(9.5000)
layout:setRightMargin(9.5000)
layout:setTopMargin(9.5000)
layout:setBottomMargin(9.5000)
unclickcell:addChild(img)

--Create border
local border = ccui.ImageView:create()
border:ignoreContentAdaptWithSize(false)
border:loadTexture("game/niuniutiaozhan/images/border/unclick_border.png",0)
border:setLayoutComponentEnabled(true)
border:setName("border")
border:setTag(42)
border:setCascadeColorEnabled(true)
border:setCascadeOpacityEnabled(true)
border:setPosition(100.0000, 100.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(border)
layout:setPositionPercentX(0.5000)
layout:setPositionPercentY(0.5000)
layout:setPercentWidth(1.0950)
layout:setPercentHeight(1.0950)
layout:setSize({width = 219.0000, height = 219.0000})
layout:setHorizontalEdge(3)
layout:setVerticalEdge(3)
layout:setLeftMargin(-9.5000)
layout:setRightMargin(-9.5000)
layout:setTopMargin(-9.5000)
layout:setBottomMargin(-9.5000)
unclickcell:addChild(border)

--Create Animation
result['animation'] = ccs.ActionTimeline:create()
  
result['animation']:setDuration(0)
result['animation']:setTimeSpeed(1.0000)
--Create Animation List

result['root'] = Layer
return result;
end

return Result

