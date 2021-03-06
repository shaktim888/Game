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

--Create gameBg
local gameBg = cc.Sprite:create("game/HeroLine/image/bg.png")
gameBg:setName("gameBg")
gameBg:setTag(41)
gameBg:setCascadeColorEnabled(true)
gameBg:setCascadeOpacityEnabled(true)
gameBg:setPosition(640.0000, 360.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(gameBg)
layout:setPositionPercentXEnabled(true)
layout:setPositionPercentYEnabled(true)
layout:setPositionPercentX(0.5000)
layout:setPositionPercentY(0.5000)
layout:setPercentWidth(1.0000)
layout:setPercentHeight(1.0000)
layout:setSize({width = 1280.0000, height = 720.0000})
gameBg:setBlendFunc({src = 1, dst = 771})
Scene:addChild(gameBg)

--Create linePool
local linePool = ccui.Layout:create()
linePool:ignoreContentAdaptWithSize(false)
linePool:setClippingEnabled(false)
linePool:setBackGroundColorOpacity(102)
linePool:setLayoutComponentEnabled(true)
linePool:setName("linePool")
linePool:setTag(12)
linePool:setCascadeColorEnabled(true)
linePool:setCascadeOpacityEnabled(true)
linePool:setAnchorPoint(0.5000, 0.5000)
linePool:setPosition(640.0000, 360.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(linePool)
layout:setPositionPercentXEnabled(true)
layout:setPositionPercentYEnabled(true)
layout:setPositionPercentX(0.5000)
layout:setPositionPercentY(0.5000)
layout:setPercentWidth(1.0000)
layout:setPercentHeight(1.0000)
layout:setSize({width = 1280.0000, height = 720.0000})
Scene:addChild(linePool)

--Create peoplePool
local peoplePool = ccui.Layout:create()
peoplePool:ignoreContentAdaptWithSize(false)
peoplePool:setClippingEnabled(false)
peoplePool:setBackGroundColorOpacity(102)
peoplePool:setLayoutComponentEnabled(true)
peoplePool:setName("peoplePool")
peoplePool:setTag(10)
peoplePool:setCascadeColorEnabled(true)
peoplePool:setCascadeOpacityEnabled(true)
peoplePool:setAnchorPoint(0.5000, 0.5000)
peoplePool:setPosition(640.0000, 360.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(peoplePool)
layout:setPositionPercentXEnabled(true)
layout:setPositionPercentYEnabled(true)
layout:setPositionPercentX(0.5000)
layout:setPositionPercentY(0.5000)
layout:setPercentWidth(1.0000)
layout:setPercentHeight(1.0000)
layout:setSize({width = 1280.0000, height = 720.0000})
Scene:addChild(peoplePool)

--Create returnBtn
local returnBtn = ccui.Button:create()
returnBtn:ignoreContentAdaptWithSize(false)
returnBtn:loadTextureNormal("game/HeroLine/image/returnBtn.png",0)
returnBtn:loadTexturePressed("game/HeroLine/image/returnBtn.png",0)
returnBtn:setTitleFontSize(14)
returnBtn:setTitleColor({r = 65, g = 65, b = 70})
returnBtn:setLayoutComponentEnabled(true)
returnBtn:setName("returnBtn")
returnBtn:setTag(45)
returnBtn:setCascadeColorEnabled(true)
returnBtn:setCascadeOpacityEnabled(true)
returnBtn:setPosition(1204.7280, 671.4309)
layout = ccui.LayoutComponent:bindLayoutComponent(returnBtn)
layout:setPositionPercentX(0.9412)
layout:setPositionPercentY(0.9325)
layout:setPercentWidth(0.0664)
layout:setPercentHeight(0.1181)
layout:setSize({width = 85.0000, height = 85.0000})
layout:setLeftMargin(1162.2280)
layout:setRightMargin(32.7721)
layout:setTopMargin(6.0691)
layout:setBottomMargin(628.9309)
Scene:addChild(returnBtn)

--Create scoreLabel
local scoreLabel = ccui.Text:create()
scoreLabel:ignoreContentAdaptWithSize(true)
scoreLabel:setTextAreaSize({width = 0, height = 0})
scoreLabel:setFontName("game/HeroLine/image/nvpk.ttf")
scoreLabel:setFontSize(48)
scoreLabel:setString([[?????????0]])
scoreLabel:setLayoutComponentEnabled(true)
scoreLabel:setName("scoreLabel")
scoreLabel:setTag(18)
scoreLabel:setCascadeColorEnabled(true)
scoreLabel:setCascadeOpacityEnabled(true)
scoreLabel:setAnchorPoint(0.0000, 0.5000)
scoreLabel:setPosition(184.0000, 670.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(scoreLabel)
layout:setPositionPercentX(0.1437)
layout:setPositionPercentY(0.9306)
layout:setPercentWidth(0.1344)
layout:setPercentHeight(0.0806)
layout:setSize({width = 172.0000, height = 58.0000})
layout:setLeftMargin(184.0000)
layout:setRightMargin(924.0000)
layout:setTopMargin(21.0000)
layout:setBottomMargin(641.0000)
Scene:addChild(scoreLabel)

--Create scoreLoadingBar
local scoreLoadingBar = ccui.LoadingBar:create()
scoreLoadingBar:loadTexture("Default/LoadingBarFile.png",0)
scoreLoadingBar:ignoreContentAdaptWithSize(false)
scoreLoadingBar:setPercent(0)
scoreLoadingBar:setLayoutComponentEnabled(true)
scoreLoadingBar:setName("scoreLoadingBar")
scoreLoadingBar:setTag(50)
scoreLoadingBar:setCascadeColorEnabled(true)
scoreLoadingBar:setCascadeOpacityEnabled(true)
scoreLoadingBar:setPosition(815.0000, 666.2830)
scoreLoadingBar:setColor({r = 255, g = 255, b = 0})
layout = ccui.LayoutComponent:bindLayoutComponent(scoreLoadingBar)
layout:setPositionPercentX(0.6367)
layout:setPositionPercentY(0.9254)
layout:setPercentWidth(0.3906)
layout:setPercentHeight(0.0278)
layout:setSize({width = 500.0000, height = 20.0000})
layout:setLeftMargin(565.0000)
layout:setRightMargin(215.0000)
layout:setTopMargin(43.7170)
layout:setBottomMargin(656.2830)
Scene:addChild(scoreLoadingBar)

--Create scoreLoadingImage
local scoreLoadingImage = ccui.ImageView:create()
scoreLoadingImage:ignoreContentAdaptWithSize(false)
scoreLoadingImage:loadTexture("game/HeroLine/image/progressbar.png",0)
scoreLoadingImage:setLayoutComponentEnabled(true)
scoreLoadingImage:setName("scoreLoadingImage")
scoreLoadingImage:setTag(49)
scoreLoadingImage:setCascadeColorEnabled(true)
scoreLoadingImage:setCascadeOpacityEnabled(true)
scoreLoadingImage:setPosition(815.0000, 670.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(scoreLoadingImage)
layout:setPositionPercentX(0.6367)
layout:setPositionPercentY(0.9306)
layout:setPercentWidth(0.4367)
layout:setPercentHeight(0.0903)
layout:setSize({width = 559.0000, height = 65.0000})
layout:setLeftMargin(535.5000)
layout:setRightMargin(185.5000)
layout:setTopMargin(17.5000)
layout:setBottomMargin(637.5000)
Scene:addChild(scoreLoadingImage)

--Create timeLoadingBar
local timeLoadingBar = ccui.LoadingBar:create()
timeLoadingBar:loadTexture("Default/LoadingBarFile.png",0)
timeLoadingBar:ignoreContentAdaptWithSize(false)
timeLoadingBar:setLayoutComponentEnabled(true)
timeLoadingBar:setName("timeLoadingBar")
timeLoadingBar:setTag(52)
timeLoadingBar:setCascadeColorEnabled(true)
timeLoadingBar:setCascadeOpacityEnabled(true)
timeLoadingBar:setPosition(86.5300, 320.0000)
timeLoadingBar:setRotationSkewX(-90.0000)
timeLoadingBar:setRotationSkewY(-90.0000)
timeLoadingBar:setColor({r = 255, g = 165, b = 0})
layout = ccui.LayoutComponent:bindLayoutComponent(timeLoadingBar)
layout:setPositionPercentX(0.0676)
layout:setPositionPercentY(0.4444)
layout:setPercentWidth(0.3281)
layout:setPercentHeight(0.1000)
layout:setSize({width = 420.0000, height = 72.0000})
layout:setLeftMargin(-123.4700)
layout:setRightMargin(983.4700)
layout:setTopMargin(364.0000)
layout:setBottomMargin(284.0000)
Scene:addChild(timeLoadingBar)

--Create timeLoadingImage
local timeLoadingImage = ccui.ImageView:create()
timeLoadingImage:ignoreContentAdaptWithSize(false)
timeLoadingImage:loadTexture("game/HeroLine/image/timebar.png",0)
timeLoadingImage:setLayoutComponentEnabled(true)
timeLoadingImage:setName("timeLoadingImage")
timeLoadingImage:setTag(53)
timeLoadingImage:setCascadeColorEnabled(true)
timeLoadingImage:setCascadeOpacityEnabled(true)
timeLoadingImage:setPosition(78.0002, 320.0001)
layout = ccui.LayoutComponent:bindLayoutComponent(timeLoadingImage)
layout:setPositionPercentX(0.0609)
layout:setPositionPercentY(0.4444)
layout:setPercentWidth(0.0773)
layout:setPercentHeight(0.7431)
layout:setSize({width = 99.0000, height = 535.0000})
layout:setLeftMargin(28.5002)
layout:setRightMargin(1152.5000)
layout:setTopMargin(132.4999)
layout:setBottomMargin(52.5001)
Scene:addChild(timeLoadingImage)

--Create gameGradeLabel
local gameGradeLabel = ccui.Text:create()
gameGradeLabel:ignoreContentAdaptWithSize(true)
gameGradeLabel:setTextAreaSize({width = 0, height = 0})
gameGradeLabel:setFontName("game/HeroLine/image/nvpk.ttf")
gameGradeLabel:setFontSize(48)
gameGradeLabel:setString([[1]])
gameGradeLabel:setLayoutComponentEnabled(true)
gameGradeLabel:setName("gameGradeLabel")
gameGradeLabel:setTag(11)
gameGradeLabel:setCascadeColorEnabled(true)
gameGradeLabel:setCascadeOpacityEnabled(true)
gameGradeLabel:setPosition(1056.9980, 665.9993)
layout = ccui.LayoutComponent:bindLayoutComponent(gameGradeLabel)
layout:setPositionPercentX(0.8258)
layout:setPositionPercentY(0.9250)
layout:setPercentWidth(0.0164)
layout:setPercentHeight(0.0806)
layout:setSize({width = 21.0000, height = 58.0000})
layout:setLeftMargin(1046.4980)
layout:setRightMargin(212.5020)
layout:setTopMargin(25.0007)
layout:setBottomMargin(636.9993)
Scene:addChild(gameGradeLabel)

--Create Animation
result['animation'] = ccs.ActionTimeline:create()
  
result['animation']:setDuration(0)
result['animation']:setTimeSpeed(1.0000)
--Create Animation List

result['root'] = Scene
return result;
end

return Result

