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

--Create Image_1
local Image_1 = ccui.ImageView:create()
Image_1:ignoreContentAdaptWithSize(false)
Image_1:loadTexture("game/Spacels/image/Maininterface/BG1.png",0)
Image_1:setLayoutComponentEnabled(true)
Image_1:setName("Image_1")
Image_1:setTag(189)
Image_1:setCascadeColorEnabled(true)
Image_1:setCascadeOpacityEnabled(true)
Image_1:setPosition(640.0000, 600.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(Image_1)
layout:setPositionPercentX(0.6667)
layout:setPositionPercentY(0.9375)
layout:setPercentWidth(1.3333)
layout:setPercentHeight(0.3734)
layout:setSize({width = 1280.0000, height = 239.0000})
layout:setRightMargin(-320.0000)
layout:setTopMargin(-79.5000)
layout:setBottomMargin(480.5000)
Scene:addChild(Image_1)

--Create Image_2
local Image_2 = ccui.ImageView:create()
Image_2:ignoreContentAdaptWithSize(false)
Image_2:loadTexture("game/Spacels/image/Maininterface/BG2.png",0)
Image_2:setLayoutComponentEnabled(true)
Image_2:setName("Image_2")
Image_2:setTag(190)
Image_2:setCascadeColorEnabled(true)
Image_2:setCascadeOpacityEnabled(true)
Image_2:setPosition(640.0000, 360.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(Image_2)
layout:setPositionPercentX(0.6667)
layout:setPositionPercentY(0.5625)
layout:setPercentWidth(1.3333)
layout:setPercentHeight(0.3750)
layout:setSize({width = 1280.0000, height = 240.0000})
layout:setRightMargin(-320.0000)
layout:setTopMargin(160.0000)
layout:setBottomMargin(240.0000)
Scene:addChild(Image_2)

--Create Image_3
local Image_3 = ccui.ImageView:create()
Image_3:ignoreContentAdaptWithSize(false)
Image_3:loadTexture("game/Spacels/image/Maininterface/BG3.png",0)
Image_3:setLayoutComponentEnabled(true)
Image_3:setName("Image_3")
Image_3:setTag(191)
Image_3:setCascadeColorEnabled(true)
Image_3:setCascadeOpacityEnabled(true)
Image_3:setPosition(640.0000, 120.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(Image_3)
layout:setPositionPercentX(0.6667)
layout:setPositionPercentY(0.1875)
layout:setPercentWidth(1.3333)
layout:setPercentHeight(0.3750)
layout:setSize({width = 1280.0000, height = 240.0000})
layout:setRightMargin(-320.0000)
layout:setTopMargin(400.0000)
Scene:addChild(Image_3)

--Create Image_4
local Image_4 = ccui.ImageView:create()
Image_4:ignoreContentAdaptWithSize(false)
Image_4:loadTexture("game/Spacels/image/role_hall/1_0.png",0)
Image_4:setLayoutComponentEnabled(true)
Image_4:setName("Image_4")
Image_4:setTag(121)
Image_4:setCascadeColorEnabled(true)
Image_4:setCascadeOpacityEnabled(true)
Image_4:setPosition(640.0000, 360.0000)
Image_4:setOpacity(204)
layout = ccui.LayoutComponent:bindLayoutComponent(Image_4)
layout:setPositionPercentX(0.6667)
layout:setPositionPercentY(0.5625)
layout:setPercentWidth(0.6740)
layout:setPercentHeight(1.1016)
layout:setSize({width = 647.0000, height = 705.0000})
layout:setLeftMargin(316.5000)
layout:setRightMargin(-3.5000)
layout:setTopMargin(-72.5000)
layout:setBottomMargin(7.5000)
Scene:addChild(Image_4)

--Create game
local game = ccui.Button:create()
game:ignoreContentAdaptWithSize(false)
game:loadTextureNormal("game/Spacels/image/Maininterface/BACK_BACKTOMENU.png",0)
game:loadTexturePressed("game/Spacels/image/Maininterface/BACK_BACKTOMENU.png",0)
game:loadTextureDisabled("Default/Button_Disable.png",0)
game:setTitleFontName("game/Spacels/image/Maininterface/FZY3JW.TTF")
game:setTitleFontSize(22)
game:setTitleText("PlAY")
game:setTitleColor({r = 0, g = 0, b = 0})
game:setLayoutComponentEnabled(true)
game:setName("game")
game:setTag(193)
game:setCascadeColorEnabled(true)
game:setCascadeOpacityEnabled(true)
game:setPosition(371.0000, 376.7500)
layout = ccui.LayoutComponent:bindLayoutComponent(game)
layout:setPositionPercentX(0.3865)
layout:setPositionPercentY(0.5887)
layout:setPercentWidth(0.1250)
layout:setPercentHeight(0.0625)
layout:setSize({width = 120.0000, height = 40.0000})
layout:setLeftMargin(311.0000)
layout:setRightMargin(529.0000)
layout:setTopMargin(243.2500)
layout:setBottomMargin(356.7500)
Scene:addChild(game)

--Create star2
local star2 = ccui.ImageView:create()
star2:ignoreContentAdaptWithSize(false)
star2:loadTexture("game/Spacels/image/Maininterface/star.png",0)
star2:setLayoutComponentEnabled(true)
star2:setName("star2")
star2:setTag(58)
star2:setCascadeColorEnabled(true)
star2:setCascadeOpacityEnabled(true)
star2:setAnchorPoint(0.0000, 0.0000)
star2:setPosition(620.0000, 480.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(star2)
layout:setPositionPercentX(0.6458)
layout:setPositionPercentY(0.7500)
layout:setPercentWidth(0.0417)
layout:setPercentHeight(0.0625)
layout:setSize({width = 40.0000, height = 40.0000})
layout:setLeftMargin(620.0000)
layout:setRightMargin(300.0000)
layout:setTopMargin(120.0000)
layout:setBottomMargin(480.0000)
Scene:addChild(star2)

--Create about
local about = ccui.Button:create()
about:ignoreContentAdaptWithSize(false)
about:loadTextureNormal("game/Spacels/image/Maininterface/BACK_BACKTOMENU.png",0)
about:loadTexturePressed("game/Spacels/image/Maininterface/BACK_BACKTOMENU.png",0)
about:loadTextureDisabled("Default/Button_Disable.png",0)
about:setTitleFontName("game/Spacels/image/Maininterface/FZY3JW.TTF")
about:setTitleFontSize(22)
about:setTitleText("RULE")
about:setTitleColor({r = 0, g = 0, b = 0})
about:setLayoutComponentEnabled(true)
about:setName("about")
about:setTag(194)
about:setCascadeColorEnabled(true)
about:setCascadeOpacityEnabled(true)
about:setPosition(632.0000, 378.7500)
layout = ccui.LayoutComponent:bindLayoutComponent(about)
layout:setPositionPercentX(0.6583)
layout:setPositionPercentY(0.5918)
layout:setPercentWidth(0.1250)
layout:setPercentHeight(0.0625)
layout:setSize({width = 120.0000, height = 40.0000})
layout:setLeftMargin(572.0000)
layout:setRightMargin(268.0000)
layout:setTopMargin(241.2500)
layout:setBottomMargin(358.7500)
Scene:addChild(about)

--Create select
local select = ccui.Button:create()
select:ignoreContentAdaptWithSize(false)
select:loadTextureNormal("game/Spacels/image/Maininterface/BACK_BACKTOMENU.png",0)
select:loadTexturePressed("game/Spacels/image/Maininterface/BACK_BACKTOMENU.png",0)
select:loadTextureDisabled("Default/Button_Disable.png",0)
select:setTitleFontSize(22)
select:setTitleText("SELECT LEVEL")
select:setTitleColor({r = 0, g = 0, b = 0})
select:setTouchEnabled(false);
select:setLayoutComponentEnabled(true)
select:setName("select")
select:setTag(195)
select:setCascadeColorEnabled(true)
select:setCascadeOpacityEnabled(true)
select:setVisible(false)
select:setPosition(971.0000, 560.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(select)
layout:setPositionPercentX(1.0115)
layout:setPositionPercentY(0.8750)
layout:setPercentWidth(0.1250)
layout:setPercentHeight(0.0625)
layout:setSize({width = 120.0000, height = 40.0000})
layout:setLeftMargin(911.0000)
layout:setRightMargin(-71.0000)
layout:setTopMargin(60.0000)
layout:setBottomMargin(540.0000)
Scene:addChild(select)

--Create exit
local exit = ccui.Button:create()
exit:ignoreContentAdaptWithSize(false)
exit:loadTextureNormal("game/Spacels/image/Maininterface/BACK_BACKTOMENU.png",0)
exit:loadTexturePressed("game/Spacels/image/Maininterface/BACK_BACKTOMENU.png",0)
exit:loadTextureDisabled("Default/Button_Disable.png",0)
exit:setTitleFontName("game/Spacels/image/Maininterface/FZY3JW.TTF")
exit:setTitleFontSize(22)
exit:setTitleText("EXIT")
exit:setTitleColor({r = 26, g = 26, b = 26})
exit:setLayoutComponentEnabled(true)
exit:setName("exit")
exit:setTag(196)
exit:setCascadeColorEnabled(true)
exit:setCascadeOpacityEnabled(true)
exit:setPosition(906.0000, 376.7500)
layout = ccui.LayoutComponent:bindLayoutComponent(exit)
layout:setPositionPercentX(0.9438)
layout:setPositionPercentY(0.5887)
layout:setPercentWidth(0.1250)
layout:setPercentHeight(0.0625)
layout:setSize({width = 120.0000, height = 40.0000})
layout:setLeftMargin(846.0000)
layout:setRightMargin(-6.0000)
layout:setTopMargin(243.2500)
layout:setBottomMargin(356.7500)
Scene:addChild(exit)

--Create unit
local unit = ccui.ImageView:create()
unit:ignoreContentAdaptWithSize(false)
unit:loadTexture("game/Spacels/image/Maininterface/unit.png",0)
unit:setLayoutComponentEnabled(true)
unit:setName("unit")
unit:setTag(197)
unit:setCascadeColorEnabled(true)
unit:setCascadeOpacityEnabled(true)
unit:setPosition(-20.0000, 500.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(unit)
layout:setPositionPercentX(-0.0208)
layout:setPositionPercentY(0.7813)
layout:setPercentWidth(0.0417)
layout:setPercentHeight(0.0625)
layout:setSize({width = 40.0000, height = 40.0000})
layout:setLeftMargin(-40.0000)
layout:setRightMargin(960.0000)
layout:setTopMargin(120.0000)
layout:setBottomMargin(480.0000)
Scene:addChild(unit)

--Create unit1
local unit1 = ccui.ImageView:create()
unit1:ignoreContentAdaptWithSize(false)
unit1:loadTexture("game/Spacels/image/Maininterface/unit.png",0)
unit1:setLayoutComponentEnabled(true)
unit1:setName("unit1")
unit1:setTag(200)
unit1:setCascadeColorEnabled(true)
unit1:setCascadeOpacityEnabled(true)
unit1:setPosition(1301.0000, 260.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(unit1)
layout:setPositionPercentX(1.3552)
layout:setPositionPercentY(0.4063)
layout:setPercentWidth(0.0417)
layout:setPercentHeight(0.0625)
layout:setSize({width = 40.0000, height = 40.0000})
layout:setLeftMargin(1281.0000)
layout:setRightMargin(-361.0000)
layout:setTopMargin(360.0000)
layout:setBottomMargin(240.0000)
Scene:addChild(unit1)

--Create unit2
local unit2 = ccui.ImageView:create()
unit2:ignoreContentAdaptWithSize(false)
unit2:loadTexture("game/Spacels/image/Maininterface/unit.png",0)
unit2:setLayoutComponentEnabled(true)
unit2:setName("unit2")
unit2:setTag(201)
unit2:setCascadeColorEnabled(true)
unit2:setCascadeOpacityEnabled(true)
unit2:setPosition(-20.0000, 20.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(unit2)
layout:setPositionPercentX(-0.0208)
layout:setPositionPercentY(0.0313)
layout:setPercentWidth(0.0417)
layout:setPercentHeight(0.0625)
layout:setSize({width = 40.0000, height = 40.0000})
layout:setLeftMargin(-40.0000)
layout:setRightMargin(960.0000)
layout:setTopMargin(600.0000)
Scene:addChild(unit2)

--Create star4
local star4 = ccui.ImageView:create()
star4:ignoreContentAdaptWithSize(false)
star4:loadTexture("game/Spacels/image/Maininterface/point.png",0)
star4:setLayoutComponentEnabled(true)
star4:setName("star4")
star4:setTag(51)
star4:setCascadeColorEnabled(true)
star4:setCascadeOpacityEnabled(true)
star4:setAnchorPoint(1.0000, 1.0000)
star4:setPosition(169.7467, 273.6961)
star4:setRotationSkewX(16.0370)
star4:setRotationSkewY(16.0381)
layout = ccui.LayoutComponent:bindLayoutComponent(star4)
layout:setPositionPercentX(0.1768)
layout:setPositionPercentY(0.4277)
layout:setPercentWidth(0.0417)
layout:setPercentHeight(0.0625)
layout:setSize({width = 40.0000, height = 40.0000})
layout:setLeftMargin(129.7467)
layout:setRightMargin(790.2533)
layout:setTopMargin(366.3039)
layout:setBottomMargin(233.6961)
Scene:addChild(star4)

--Create star5
local star5 = ccui.ImageView:create()
star5:ignoreContentAdaptWithSize(false)
star5:loadTexture("game/Spacels/image/Maininterface/star.png",0)
star5:setLayoutComponentEnabled(true)
star5:setName("star5")
star5:setTag(52)
star5:setCascadeColorEnabled(true)
star5:setCascadeOpacityEnabled(true)
star5:setAnchorPoint(1.0000, 0.0000)
star5:setPosition(278.0000, 240.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(star5)
layout:setPositionPercentX(0.2896)
layout:setPositionPercentY(0.3750)
layout:setPercentWidth(0.0417)
layout:setPercentHeight(0.0625)
layout:setSize({width = 40.0000, height = 40.0000})
layout:setLeftMargin(238.0000)
layout:setRightMargin(682.0000)
layout:setTopMargin(360.0000)
layout:setBottomMargin(240.0000)
Scene:addChild(star5)

--Create star6
local star6 = ccui.ImageView:create()
star6:ignoreContentAdaptWithSize(false)
star6:loadTexture("game/Spacels/image/Maininterface/point.png",0)
star6:setLayoutComponentEnabled(true)
star6:setName("star6")
star6:setTag(53)
star6:setCascadeColorEnabled(true)
star6:setCascadeOpacityEnabled(true)
star6:setAnchorPoint(1.0000, 1.0000)
star6:setPosition(379.1778, 274.6772)
star6:setRotationSkewX(13.7402)
star6:setRotationSkewY(13.7402)
layout = ccui.LayoutComponent:bindLayoutComponent(star6)
layout:setPositionPercentX(0.3950)
layout:setPositionPercentY(0.4292)
layout:setPercentWidth(0.0417)
layout:setPercentHeight(0.0625)
layout:setSize({width = 40.0000, height = 40.0000})
layout:setLeftMargin(339.1778)
layout:setRightMargin(580.8222)
layout:setTopMargin(365.3228)
layout:setBottomMargin(234.6772)
Scene:addChild(star6)

--Create star7
local star7 = ccui.ImageView:create()
star7:ignoreContentAdaptWithSize(false)
star7:loadTexture("game/Spacels/image/Maininterface/star.png",0)
star7:setLayoutComponentEnabled(true)
star7:setName("star7")
star7:setTag(54)
star7:setCascadeColorEnabled(true)
star7:setCascadeOpacityEnabled(true)
star7:setAnchorPoint(1.0000, 0.0000)
star7:setPosition(838.0000, 240.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(star7)
layout:setPositionPercentX(0.8729)
layout:setPositionPercentY(0.3750)
layout:setPercentWidth(0.0417)
layout:setPercentHeight(0.0625)
layout:setSize({width = 40.0000, height = 40.0000})
layout:setLeftMargin(798.0000)
layout:setRightMargin(122.0000)
layout:setTopMargin(360.0000)
layout:setBottomMargin(240.0000)
Scene:addChild(star7)

--Create star8
local star8 = ccui.ImageView:create()
star8:ignoreContentAdaptWithSize(false)
star8:loadTexture("game/Spacels/image/Maininterface/point.png",0)
star8:setLayoutComponentEnabled(true)
star8:setName("star8")
star8:setTag(55)
star8:setCascadeColorEnabled(true)
star8:setCascadeOpacityEnabled(true)
star8:setAnchorPoint(1.0000, 1.0000)
star8:setPosition(945.9826, 274.1643)
star8:setRotationSkewX(14.9510)
star8:setRotationSkewY(14.9472)
layout = ccui.LayoutComponent:bindLayoutComponent(star8)
layout:setPositionPercentX(0.9854)
layout:setPositionPercentY(0.4284)
layout:setPercentWidth(0.0417)
layout:setPercentHeight(0.0625)
layout:setSize({width = 40.0000, height = 40.0000})
layout:setLeftMargin(905.9826)
layout:setRightMargin(14.0174)
layout:setTopMargin(365.8357)
layout:setBottomMargin(234.1643)
Scene:addChild(star8)

--Create star9
local star9 = ccui.ImageView:create()
star9:ignoreContentAdaptWithSize(false)
star9:loadTexture("game/Spacels/image/Maininterface/star.png",0)
star9:setLayoutComponentEnabled(true)
star9:setName("star9")
star9:setTag(56)
star9:setCascadeColorEnabled(true)
star9:setCascadeOpacityEnabled(true)
star9:setAnchorPoint(1.0000, 0.0000)
star9:setPosition(1062.0000, 240.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(star9)
layout:setPositionPercentX(1.1063)
layout:setPositionPercentY(0.3750)
layout:setPercentWidth(0.0417)
layout:setPercentHeight(0.0625)
layout:setSize({width = 40.0000, height = 40.0000})
layout:setLeftMargin(1022.0000)
layout:setRightMargin(-102.0000)
layout:setTopMargin(360.0000)
layout:setBottomMargin(240.0000)
Scene:addChild(star9)

--Create star1
local star1 = ccui.ImageView:create()
star1:ignoreContentAdaptWithSize(false)
star1:loadTexture("game/Spacels/image/Maininterface/star.png",0)
star1:setLayoutComponentEnabled(true)
star1:setName("star1")
star1:setTag(57)
star1:setCascadeColorEnabled(true)
star1:setCascadeOpacityEnabled(true)
star1:setAnchorPoint(0.0000, 0.0000)
star1:setPosition(380.0000, 480.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(star1)
layout:setPositionPercentX(0.3958)
layout:setPositionPercentY(0.7500)
layout:setPercentWidth(0.0417)
layout:setPercentHeight(0.0625)
layout:setSize({width = 40.0000, height = 40.0000})
layout:setLeftMargin(380.0000)
layout:setRightMargin(540.0000)
layout:setTopMargin(120.0000)
layout:setBottomMargin(480.0000)
Scene:addChild(star1)

--Create star3
local star3 = ccui.ImageView:create()
star3:ignoreContentAdaptWithSize(false)
star3:loadTexture("game/Spacels/image/Maininterface/star.png",0)
star3:setLayoutComponentEnabled(true)
star3:setName("star3")
star3:setTag(59)
star3:setCascadeColorEnabled(true)
star3:setCascadeOpacityEnabled(true)
star3:setAnchorPoint(0.0000, 0.0000)
star3:setPosition(849.0000, 480.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(star3)
layout:setPositionPercentX(0.8844)
layout:setPositionPercentY(0.7500)
layout:setPercentWidth(0.0417)
layout:setPercentHeight(0.0625)
layout:setSize({width = 40.0000, height = 40.0000})
layout:setLeftMargin(849.0000)
layout:setRightMargin(71.0000)
layout:setTopMargin(120.0000)
layout:setBottomMargin(480.0000)
Scene:addChild(star3)

--Create star10
local star10 = ccui.ImageView:create()
star10:ignoreContentAdaptWithSize(false)
star10:loadTexture("game/Spacels/image/Maininterface/star.png",0)
star10:setLayoutComponentEnabled(true)
star10:setName("star10")
star10:setTag(60)
star10:setCascadeColorEnabled(true)
star10:setCascadeOpacityEnabled(true)
star10:setAnchorPoint(0.0000, 0.0000)
star10:setPosition(360.5000, 0.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(star10)
layout:setPositionPercentX(0.3755)
layout:setPercentWidth(0.0417)
layout:setPercentHeight(0.0625)
layout:setSize({width = 40.0000, height = 40.0000})
layout:setLeftMargin(360.5000)
layout:setRightMargin(559.5000)
layout:setTopMargin(600.0000)
Scene:addChild(star10)

--Create star11
local star11 = ccui.ImageView:create()
star11:ignoreContentAdaptWithSize(false)
star11:loadTexture("game/Spacels/image/Maininterface/star.png",0)
star11:setLayoutComponentEnabled(true)
star11:setName("star11")
star11:setTag(61)
star11:setCascadeColorEnabled(true)
star11:setCascadeOpacityEnabled(true)
star11:setAnchorPoint(0.0000, 0.0000)
star11:setPosition(619.0000, 0.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(star11)
layout:setPositionPercentX(0.6448)
layout:setPercentWidth(0.0417)
layout:setPercentHeight(0.0625)
layout:setSize({width = 40.0000, height = 40.0000})
layout:setLeftMargin(619.0000)
layout:setRightMargin(301.0000)
layout:setTopMargin(600.0000)
Scene:addChild(star11)

--Create star12
local star12 = ccui.ImageView:create()
star12:ignoreContentAdaptWithSize(false)
star12:loadTexture("game/Spacels/image/Maininterface/star.png",0)
star12:setLayoutComponentEnabled(true)
star12:setName("star12")
star12:setTag(62)
star12:setCascadeColorEnabled(true)
star12:setCascadeOpacityEnabled(true)
star12:setAnchorPoint(0.0000, 0.0000)
star12:setPosition(873.5000, 0.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(star12)
layout:setPositionPercentX(0.9099)
layout:setPercentWidth(0.0417)
layout:setPercentHeight(0.0625)
layout:setSize({width = 40.0000, height = 40.0000})
layout:setLeftMargin(873.5000)
layout:setRightMargin(46.5000)
layout:setTopMargin(600.0000)
Scene:addChild(star12)

--Create title
local title = ccui.Text:create()
title:ignoreContentAdaptWithSize(true)
title:setTextAreaSize({width = 0, height = 0})
title:setFontSize(36)
title:setString([[DREAM IN MIRROR]])
title:setLayoutComponentEnabled(true)
title:setName("title")
title:setTag(63)
title:setCascadeColorEnabled(true)
title:setCascadeOpacityEnabled(true)
title:setVisible(false)
title:setPosition(640.0000, 360.0000)
title:setTextColor({r = 0, g = 0, b = 0})
layout = ccui.LayoutComponent:bindLayoutComponent(title)
layout:setPositionPercentX(0.6667)
layout:setPositionPercentY(0.5625)
layout:setPercentWidth(0.3458)
layout:setPercentHeight(0.0656)
layout:setSize({width = 332.0000, height = 42.0000})
layout:setLeftMargin(474.0000)
layout:setRightMargin(154.0000)
layout:setTopMargin(259.0000)
layout:setBottomMargin(339.0000)
Scene:addChild(title)

--Create Animation
result['animation'] = ccs.ActionTimeline:create()
  
result['animation']:setDuration(0)
result['animation']:setTimeSpeed(1.0000)
--Create Animation List

result['root'] = Scene
return result;
end

return Result

