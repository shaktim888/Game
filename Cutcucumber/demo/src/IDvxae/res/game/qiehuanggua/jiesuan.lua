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

--Create WIN
local WIN = ccui.ImageView:create()
WIN:ignoreContentAdaptWithSize(false)
WIN:loadTexture("game/qiehuanggua/image/winBg.png",0)
WIN:setLayoutComponentEnabled(true)
WIN:setName("WIN")
WIN:setTag(36)
WIN:setCascadeColorEnabled(true)
WIN:setCascadeOpacityEnabled(true)
WIN:setPosition(640.0000, 360.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(WIN)
layout:setPositionPercentX(0.5000)
layout:setPositionPercentY(0.5000)
layout:setPercentWidth(1.0000)
layout:setPercentHeight(1.0000)
layout:setSize({width = 1280.0000, height = 720.0000})
Scene:addChild(WIN)

--Create pijiu_2
local pijiu_2 = cc.Sprite:create("game/qiehuanggua/image/c36.png")
pijiu_2:setName("pijiu_2")
pijiu_2:setTag(37)
pijiu_2:setCascadeColorEnabled(true)
pijiu_2:setCascadeOpacityEnabled(true)
pijiu_2:setPosition(383.5799, 354.4904)
pijiu_2:setScaleX(0.8000)
pijiu_2:setScaleY(0.8000)
layout = ccui.LayoutComponent:bindLayoutComponent(pijiu_2)
layout:setPositionPercentX(0.2997)
layout:setPositionPercentY(0.4923)
layout:setPercentWidth(0.4406)
layout:setPercentHeight(1.1222)
layout:setSize({width = 564.0000, height = 808.0000})
layout:setLeftMargin(101.5799)
layout:setRightMargin(614.4201)
layout:setTopMargin(-38.4904)
layout:setBottomMargin(-49.5096)
pijiu_2:setBlendFunc({src = 1, dst = 771})
WIN:addChild(pijiu_2)

--Create Text_1
local Text_1 = ccui.Text:create()
Text_1:ignoreContentAdaptWithSize(true)
Text_1:setTextAreaSize({width = 0, height = 0})
Text_1:setFontName("game/qiehuanggua/image/zh_qhg.ttf")
Text_1:setFontSize(90)
Text_1:setString([[you win!
]])
Text_1:setLayoutComponentEnabled(true)
Text_1:setName("Text_1")
Text_1:setTag(38)
Text_1:setCascadeColorEnabled(true)
Text_1:setCascadeOpacityEnabled(true)
Text_1:setPosition(746.3234, 394.3616)
Text_1:setTextColor({r = 251, g = 243, b = 67})
layout = ccui.LayoutComponent:bindLayoutComponent(Text_1)
layout:setPositionPercentX(0.5831)
layout:setPositionPercentY(0.5477)
layout:setPercentWidth(0.2867)
layout:setPercentHeight(0.2500)
layout:setSize({width = 367.0000, height = 180.0000})
layout:setLeftMargin(562.8234)
layout:setRightMargin(350.1766)
layout:setTopMargin(235.6384)
layout:setBottomMargin(304.3616)
WIN:addChild(Text_1)

--Create Text_1_0
local Text_1_0 = ccui.Text:create()
Text_1_0:ignoreContentAdaptWithSize(true)
Text_1_0:setTextAreaSize({width = 0, height = 0})
Text_1_0:setFontName("game/qiehuanggua/image/zh_qhg.ttf")
Text_1_0:setFontSize(30)
Text_1_0:setString([[The general manager has been promoted!]])
Text_1_0:setLayoutComponentEnabled(true)
Text_1_0:setName("Text_1_0")
Text_1_0:setTag(39)
Text_1_0:setCascadeColorEnabled(true)
Text_1_0:setCascadeOpacityEnabled(true)
Text_1_0:setPosition(742.4535, 351.8422)
Text_1_0:setTextColor({r = 251, g = 243, b = 67})
layout = ccui.LayoutComponent:bindLayoutComponent(Text_1_0)
layout:setPositionPercentX(0.5800)
layout:setPositionPercentY(0.4887)
layout:setPercentWidth(0.4805)
layout:setPercentHeight(0.0417)
layout:setSize({width = 615.0000, height = 30.0000})
layout:setLeftMargin(434.9535)
layout:setRightMargin(230.0465)
layout:setTopMargin(353.1578)
layout:setBottomMargin(336.8422)
WIN:addChild(Text_1_0)

--Create FAIL
local FAIL = ccui.ImageView:create()
FAIL:ignoreContentAdaptWithSize(false)
FAIL:loadTexture("game/qiehuanggua/image/winBg.png",0)
FAIL:setLayoutComponentEnabled(true)
FAIL:setName("FAIL")
FAIL:setTag(210)
FAIL:setCascadeColorEnabled(true)
FAIL:setCascadeOpacityEnabled(true)
FAIL:setPosition(640.0000, 360.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(FAIL)
layout:setPositionPercentX(0.5000)
layout:setPositionPercentY(0.5000)
layout:setPercentWidth(1.0000)
layout:setPercentHeight(1.0000)
layout:setSize({width = 1280.0000, height = 720.0000})
Scene:addChild(FAIL)

--Create pijiu_2
local pijiu_2 = cc.Sprite:create("game/qiehuanggua/image/o0.png")
pijiu_2:setName("pijiu_2")
pijiu_2:setTag(211)
pijiu_2:setCascadeColorEnabled(true)
pijiu_2:setCascadeOpacityEnabled(true)
pijiu_2:setPosition(383.5799, 354.4904)
pijiu_2:setScaleX(0.8000)
pijiu_2:setScaleY(0.8000)
layout = ccui.LayoutComponent:bindLayoutComponent(pijiu_2)
layout:setPositionPercentX(0.2997)
layout:setPositionPercentY(0.4923)
layout:setPercentWidth(0.4406)
layout:setPercentHeight(1.0444)
layout:setSize({width = 564.0000, height = 752.0000})
layout:setLeftMargin(101.5799)
layout:setRightMargin(614.4201)
layout:setTopMargin(-10.4904)
layout:setBottomMargin(-21.5096)
pijiu_2:setBlendFunc({src = 1, dst = 771})
FAIL:addChild(pijiu_2)

--Create m1_5
local m1_5 = cc.Sprite:create("game/qiehuanggua/image/m1.png")
m1_5:setName("m1_5")
m1_5:setTag(217)
m1_5:setCascadeColorEnabled(true)
m1_5:setCascadeOpacityEnabled(true)
m1_5:setPosition(283.7470, 374.4991)
layout = ccui.LayoutComponent:bindLayoutComponent(m1_5)
layout:setPositionPercentX(0.5031)
layout:setPositionPercentY(0.4980)
layout:setPercentWidth(1.0000)
layout:setPercentHeight(1.0000)
layout:setSize({width = 564.0000, height = 752.0000})
layout:setLeftMargin(1.7470)
layout:setRightMargin(-1.7470)
layout:setTopMargin(1.5009)
layout:setBottomMargin(-1.5009)
m1_5:setBlendFunc({src = 1, dst = 771})
pijiu_2:addChild(m1_5)

--Create Text_1
local Text_1 = ccui.Text:create()
Text_1:ignoreContentAdaptWithSize(true)
Text_1:setTextAreaSize({width = 0, height = 0})
Text_1:setFontName("game/qiehuanggua/image/zh_qhg.ttf")
Text_1:setFontSize(90)
Text_1:setString([[you lose!
]])
Text_1:setLayoutComponentEnabled(true)
Text_1:setName("Text_1")
Text_1:setTag(212)
Text_1:setCascadeColorEnabled(true)
Text_1:setCascadeOpacityEnabled(true)
Text_1:setPosition(764.3235, 394.3616)
Text_1:setTextColor({r = 0, g = 128, b = 0})
layout = ccui.LayoutComponent:bindLayoutComponent(Text_1)
layout:setPositionPercentX(0.5971)
layout:setPositionPercentY(0.5477)
layout:setPercentWidth(0.3133)
layout:setPercentHeight(0.2500)
layout:setSize({width = 401.0000, height = 180.0000})
layout:setLeftMargin(563.8235)
layout:setRightMargin(315.1765)
layout:setTopMargin(235.6384)
layout:setBottomMargin(304.3616)
FAIL:addChild(Text_1)

--Create Text_1_0
local Text_1_0 = ccui.Text:create()
Text_1_0:ignoreContentAdaptWithSize(true)
Text_1_0:setTextAreaSize({width = 0, height = 0})
Text_1_0:setFontName("game/qiehuanggua/image/zh_qhg.ttf")
Text_1_0:setFontSize(30)
Text_1_0:setString([[You will become a poor]])
Text_1_0:setLayoutComponentEnabled(true)
Text_1_0:setName("Text_1_0")
Text_1_0:setTag(213)
Text_1_0:setCascadeColorEnabled(true)
Text_1_0:setCascadeOpacityEnabled(true)
Text_1_0:setPosition(742.4535, 351.8422)
Text_1_0:setTextColor({r = 0, g = 128, b = 0})
layout = ccui.LayoutComponent:bindLayoutComponent(Text_1_0)
layout:setPositionPercentX(0.5800)
layout:setPositionPercentY(0.4887)
layout:setPercentWidth(0.2656)
layout:setPercentHeight(0.0417)
layout:setSize({width = 340.0000, height = 30.0000})
layout:setLeftMargin(572.4535)
layout:setRightMargin(367.5465)
layout:setTopMargin(353.1578)
layout:setBottomMargin(336.8422)
FAIL:addChild(Text_1_0)

--Create btnRetry
local btnRetry = ccui.Button:create()
btnRetry:ignoreContentAdaptWithSize(false)
btnRetry:loadTextureNormal("game/qiehuanggua/image/Retry.png",0)
btnRetry:setTitleFontSize(14)
btnRetry:setTitleColor({r = 65, g = 65, b = 70})
btnRetry:setLayoutComponentEnabled(true)
btnRetry:setName("btnRetry")
btnRetry:setTag(215)
btnRetry:setCascadeColorEnabled(true)
btnRetry:setCascadeOpacityEnabled(true)
btnRetry:setPosition(655.0000, 250.5000)
layout = ccui.LayoutComponent:bindLayoutComponent(btnRetry)
layout:setPositionPercentX(0.5117)
layout:setPositionPercentY(0.3479)
layout:setPercentWidth(0.0758)
layout:setPercentHeight(0.1347)
layout:setSize({width = 97.0000, height = 97.0000})
layout:setLeftMargin(606.5000)
layout:setRightMargin(576.5000)
layout:setTopMargin(421.0000)
layout:setBottomMargin(202.0000)
Scene:addChild(btnRetry)

--Create btnBack
local btnBack = ccui.Button:create()
btnBack:ignoreContentAdaptWithSize(false)
btnBack:loadTextureNormal("game/qiehuanggua/image/back.png",0)
btnBack:setTitleFontSize(14)
btnBack:setTitleColor({r = 65, g = 65, b = 70})
btnBack:setLayoutComponentEnabled(true)
btnBack:setName("btnBack")
btnBack:setTag(216)
btnBack:setCascadeColorEnabled(true)
btnBack:setCascadeOpacityEnabled(true)
btnBack:setPosition(842.0000, 250.5000)
layout = ccui.LayoutComponent:bindLayoutComponent(btnBack)
layout:setPositionPercentX(0.6578)
layout:setPositionPercentY(0.3479)
layout:setPercentWidth(0.0758)
layout:setPercentHeight(0.1347)
layout:setSize({width = 97.0000, height = 97.0000})
layout:setLeftMargin(793.5000)
layout:setRightMargin(389.5000)
layout:setTopMargin(421.0000)
layout:setBottomMargin(202.0000)
Scene:addChild(btnBack)

--Create Animation
result['animation'] = ccs.ActionTimeline:create()
  
result['animation']:setDuration(0)
result['animation']:setTimeSpeed(1.0000)
--Create Animation List

result['root'] = Scene
return result;
end

return Result

