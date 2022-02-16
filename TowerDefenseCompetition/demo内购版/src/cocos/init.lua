--[[

Copyright (c) 2014-2017 Chukong Technologies Inc.

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.

]]

--1")

require "cocos.cocos2d.Cocos2d"
--11")
require "cocos.cocos2d.Cocos2dConstants"
--12")
require "cocos.cocos2d.functions"

--2")
__G__TRACKBACK__ = function(msg)
    -- record the message
    local message = msg


    local msg = debug.traceback(msg, 3)
    print(msg)
    -- release_print(msg)

    -- report lua exception
    buglyReportLuaException(tostring(message), debug.traceback())


    return msg
end

--3")

-- audio
require "cocos.cocosdenshion.AudioEngine"


-- cocosstudio
if nil ~= ccs then
    require "cocos.cocostudio.CocoStudio"
end

--[[
-- opengl
require "cocos.cocos2d.Opengl"
require "cocos.cocos2d.OpenglConstants"


-- ui
if nil ~= ccui then
    require "cocos.ui.GuiConstants"
    require "cocos.ui.experimentalUIConstants"
end

]]

require("cocos.adapter.adapter2_0_6")
if nil ~= ccui then
    require "cocos.ui.GuiConstants"
    require "cocos.ui.experimentalUIConstants"
end

--4")

-- extensions
require "cocos.extension.ExtensionConstants"
-- network
require "cocos.network.NetworkConstants"
-- Spine
if nil ~= sp then
    require "cocos.spine.SpineConstants"
end

--5")

require "cocos.cocos2d.deprecated"
require "cocos.cocos2d.DrawPrimitives"

-- Lua extensions
require "cocos.cocos2d.bitExtend"

--6")

-- CCLuaEngine
require "cocos.cocos2d.DeprecatedCocos2dClass"
--7")
require "cocos.cocos2d.DeprecatedCocos2dEnum"
--8")
require "cocos.cocos2d.DeprecatedCocos2dFunc"
--9")
require "cocos.cocos2d.DeprecatedOpenglEnum"

-- register_cocostudio_module
if nil ~= ccs then
    require "cocos.cocostudio.DeprecatedCocoStudioClass"
    require "cocos.cocostudio.DeprecatedCocoStudioFunc"
end

--10")
-- register_cocosbuilder_module
require "cocos.cocosbuilder.DeprecatedCocosBuilderClass"

-- register_cocosdenshion_module
require "cocos.cocosdenshion.DeprecatedCocosDenshionClass"
require "cocos.cocosdenshion.DeprecatedCocosDenshionFunc"

--11")
-- register_extension_module
require "cocos.extension.DeprecatedExtensionClass"
require "cocos.extension.DeprecatedExtensionEnum"
require "cocos.extension.DeprecatedExtensionFunc"

--12")
-- register_network_module
require "cocos.network.DeprecatedNetworkClass"
require "cocos.network.DeprecatedNetworkEnum"
require "cocos.network.DeprecatedNetworkFunc"

--13")
-- register_ui_module
if nil ~= ccui then
    --require "cocos.ui.DeprecatedUIEnum"
    ----15")
    --require "cocos.ui.DeprecatedUIFunc"
    ----16")
end

-- cocosbuilder
-- require "cocos.cocosbuilder.CCBReaderLoad"

--14")
-- physics3d
-- require "cocos.physics3d.physics3d-constants"


if CC_USE_FRAMEWORK then
    --15")
    require "cocos.framework.init"
end
