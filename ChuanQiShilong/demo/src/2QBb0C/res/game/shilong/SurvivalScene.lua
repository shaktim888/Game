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
local bg = ccui.ImageView:create()
bg:ignoreContentAdaptWithSize(false)
bg:loadTexture("game/shilong/image/BG.png",0)
bg:setLayoutComponentEnabled(true)
bg:setName("bg")
bg:setTag(64)
bg:setCascadeColorEnabled(true)
bg:setCascadeOpacityEnabled(true)
bg:setPosition(360.0000, 640.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(bg)
layout:setPositionPercentX(0.5000)
layout:setPositionPercentY(0.5000)
layout:setPercentWidth(1.0000)
layout:setPercentHeight(1.0000)
layout:setSize({width = 720.0000, height = 1280.0000})
Scene:addChild(bg)

--Create BtnBack
local BtnBack = ccui.Button:create()
BtnBack:ignoreContentAdaptWithSize(false)
BtnBack:loadTextureNormal("game/shilong/image/fanhui.png",0)
BtnBack:setTitleFontSize(14)
BtnBack:setTitleColor({r = 65, g = 65, b = 70})
BtnBack:setLayoutComponentEnabled(true)
BtnBack:setName("BtnBack")
BtnBack:setTag(75)
BtnBack:setCascadeColorEnabled(true)
BtnBack:setCascadeOpacityEnabled(true)
BtnBack:setPosition(644.0000, 1128.5000)
layout = ccui.LayoutComponent:bindLayoutComponent(BtnBack)
layout:setPositionPercentX(0.8944)
layout:setPositionPercentY(0.8816)
layout:setPercentWidth(0.1167)
layout:setPercentHeight(0.0656)
layout:setSize({width = 84.0000, height = 84.0000})
layout:setLeftMargin(602.0000)
layout:setRightMargin(34.0000)
layout:setTopMargin(109.5000)
layout:setBottomMargin(1086.5000)
Scene:addChild(BtnBack)

--Create zhantai
local zhantai = ccui.ImageView:create()
zhantai:ignoreContentAdaptWithSize(false)
zhantai:loadTexture("game/shilong/image/zhantai.png",0)
zhantai:setLayoutComponentEnabled(true)
zhantai:setName("zhantai")
zhantai:setTag(67)
zhantai:setCascadeColorEnabled(true)
zhantai:setCascadeOpacityEnabled(true)
zhantai:setPosition(360.0000, 390.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(zhantai)
layout:setPositionPercentX(0.5000)
layout:setPositionPercentY(0.3047)
layout:setPercentWidth(0.4319)
layout:setPercentHeight(0.1320)
layout:setSize({width = 311.0000, height = 169.0000})
layout:setLeftMargin(204.5000)
layout:setRightMargin(204.5000)
layout:setTopMargin(805.5000)
layout:setBottomMargin(305.5000)
Scene:addChild(zhantai)

--Create zhanshi
local zhanshi = ccui.ImageView:create()
zhanshi:ignoreContentAdaptWithSize(false)
zhanshi:loadTexture("game/shilong/image/kan.png",0)
zhanshi:setLayoutComponentEnabled(true)
zhanshi:setName("zhanshi")
zhanshi:setTag(78)
zhanshi:setCascadeColorEnabled(true)
zhanshi:setCascadeOpacityEnabled(true)
zhanshi:setAnchorPoint(0.5000, 0.0000)
zhanshi:setPosition(360.0000, 420.0000)
zhanshi:setScaleX(0.8000)
zhanshi:setScaleY(0.8000)
layout = ccui.LayoutComponent:bindLayoutComponent(zhanshi)
layout:setPositionPercentX(0.5000)
layout:setPositionPercentY(0.3281)
layout:setPercentWidth(0.1639)
layout:setPercentHeight(0.1922)
layout:setSize({width = 118.0000, height = 246.0000})
layout:setLeftMargin(301.0000)
layout:setRightMargin(301.0000)
layout:setTopMargin(614.0000)
layout:setBottomMargin(420.0000)
Scene:addChild(zhanshi)

--Create boss
local boss = ccui.ImageView:create()
boss:ignoreContentAdaptWithSize(false)
boss:loadTexture("game/shilong/boss/boss1.png",0)
boss:setLayoutComponentEnabled(true)
boss:setName("boss")
boss:setTag(79)
boss:setCascadeColorEnabled(true)
boss:setCascadeOpacityEnabled(true)
boss:setVisible(false)
boss:setAnchorPoint(0.5000, 0.0000)
boss:setPosition(360.0002, 1000.0000)
boss:setScaleX(0.4000)
boss:setScaleY(0.4000)
layout = ccui.LayoutComponent:bindLayoutComponent(boss)
layout:setPositionPercentX(0.5000)
layout:setPositionPercentY(0.7813)
layout:setPercentWidth(1.0000)
layout:setPercentHeight(0.3680)
layout:setSize({width = 720.0000, height = 471.0000})
layout:setLeftMargin(0.0002)
layout:setRightMargin(-0.0002)
layout:setTopMargin(-191.0000)
layout:setBottomMargin(1000.0000)
Scene:addChild(boss)

--Create fenshu
local fenshu = ccui.Text:create()
fenshu:ignoreContentAdaptWithSize(true)
fenshu:setTextAreaSize({width = 0, height = 0})
fenshu:setFontName("game/shilong/image/mzdzt.ttf")
fenshu:setFontSize(48)
fenshu:setString([[0]])
fenshu:setLayoutComponentEnabled(true)
fenshu:setName("fenshu")
fenshu:setTag(80)
fenshu:setCascadeColorEnabled(true)
fenshu:setCascadeOpacityEnabled(true)
fenshu:setPosition(360.0000, 1240.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(fenshu)
layout:setPositionPercentX(0.5000)
layout:setPositionPercentY(0.9688)
layout:setPercentWidth(0.0347)
layout:setPercentHeight(0.0430)
layout:setSize({width = 25.0000, height = 55.0000})
layout:setLeftMargin(347.5000)
layout:setRightMargin(347.5000)
layout:setTopMargin(12.5000)
layout:setBottomMargin(1212.5000)
Scene:addChild(fenshu)

--Create top
local top = ccui.Layout:create()
top:ignoreContentAdaptWithSize(false)
top:setClippingEnabled(false)
top:setBackGroundColorOpacity(102)
top:setTouchEnabled(true);
top:setLayoutComponentEnabled(true)
top:setName("top")
top:setTag(81)
top:setCascadeColorEnabled(true)
top:setCascadeOpacityEnabled(true)
top:setAnchorPoint(0.0000, 1.0000)
top:setPosition(0.0000, 1280.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(top)
layout:setPositionPercentY(1.0000)
layout:setPercentWidth(1.0000)
layout:setPercentHeight(0.0703)
layout:setSize({width = 720.0000, height = 90.0000})
layout:setBottomMargin(1190.0000)
Scene:addChild(top)

--Create time
local time = ccui.Text:create()
time:ignoreContentAdaptWithSize(true)
time:setTextAreaSize({width = 0, height = 0})
time:setFontName("game/shilong/image/mzdzt.ttf")
time:setFontSize(48)
time:setString([[120]])
time:setLayoutComponentEnabled(true)
time:setName("time")
time:setTag(82)
time:setCascadeColorEnabled(true)
time:setCascadeOpacityEnabled(true)
time:setPosition(148.3501, 45.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(time)
layout:setPositionPercentX(0.2060)
layout:setPositionPercentY(0.5000)
layout:setPercentWidth(0.1014)
layout:setPercentHeight(0.6111)
layout:setSize({width = 73.0000, height = 55.0000})
layout:setLeftMargin(111.8501)
layout:setRightMargin(535.1499)
layout:setTopMargin(17.5000)
layout:setBottomMargin(17.5000)
top:addChild(time)

--Create longbitu
local longbitu = ccui.ImageView:create()
longbitu:ignoreContentAdaptWithSize(false)
longbitu:loadTexture("game/shilong/image/huobi.png",0)
longbitu:setLayoutComponentEnabled(true)
longbitu:setName("longbitu")
longbitu:setTag(83)
longbitu:setCascadeColorEnabled(true)
longbitu:setCascadeOpacityEnabled(true)
longbitu:setPosition(539.8055, 45.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(longbitu)
layout:setPositionPercentX(0.7497)
layout:setPositionPercentY(0.5000)
layout:setPercentWidth(0.0958)
layout:setPercentHeight(0.7667)
layout:setSize({width = 69.0000, height = 69.0000})
layout:setLeftMargin(505.3055)
layout:setRightMargin(145.6945)
layout:setTopMargin(10.5000)
layout:setBottomMargin(10.5000)
top:addChild(longbitu)

--Create longbi
local longbi = ccui.Text:create()
longbi:ignoreContentAdaptWithSize(true)
longbi:setTextAreaSize({width = 0, height = 0})
longbi:setFontName("game/shilong/image/mzdzt.ttf")
longbi:setFontSize(48)
longbi:setString([[x 0]])
longbi:setLayoutComponentEnabled(true)
longbi:setName("longbi")
longbi:setTag(84)
longbi:setCascadeColorEnabled(true)
longbi:setCascadeOpacityEnabled(true)
longbi:setAnchorPoint(0.0000, 0.5000)
longbi:setPosition(612.5619, 44.2740)
layout = ccui.LayoutComponent:bindLayoutComponent(longbi)
layout:setPositionPercentX(0.8508)
layout:setPositionPercentY(0.4919)
layout:setPercentWidth(0.0917)
layout:setPercentHeight(0.6111)
layout:setSize({width = 66.0000, height = 55.0000})
layout:setLeftMargin(612.5619)
layout:setRightMargin(41.4381)
layout:setTopMargin(18.2260)
layout:setBottomMargin(16.7740)
top:addChild(longbi)

--Create Animation
result['animation'] = ccs.ActionTimeline:create()
  
result['animation']:setDuration(0)
result['animation']:setTimeSpeed(1.0000)
--Create Animation List

result['root'] = Scene
return result;
end

return Result

