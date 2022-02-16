if not imgui then return end
local Editor       = import(".Editor")
local editorTools  = import(".EditorTools")
import(".EditorForNode")

local IS_OPEN_EDITOR = true
local isShowDemo = false

local isShowFrameGraph = false
local isShowMemory = false
local frameArr = {0}
local memoryArr = {0}
local gameSpeed = 1
local CC_SHOW_FPS = cc.Director:getInstance():isDisplayStats()
local function addGlobalEditor(editorTools)
    local str = cc.Director:getInstance():getTextureCache():getCachedTextureInfo()
    local _, index = string.find(str, "TextureCache dumpDebugInfo:")
    editorTools.createUI("text", "c++:"..string.sub(str, index + 2))
    editorTools.createUI("text",  string.format("Lua Memory: %.2f M", collectgarbage("count")/1024))
    editorTools.createTreeNode("Setting" , function()
        local ret  , v = imgui.checkbox("Demo" , isShowDemo and 1 or 0)
        isShowDemo = v
        if isShowDemo then
            editorTools.showDemo()
        end
        local ret , v = imgui.checkbox("Show FPS" , CC_SHOW_FPS and 1 or 0)
        if CC_SHOW_FPS ~= v then
            CC_SHOW_FPS = v 
            cc.Director:getInstance():setDisplayStats(CC_SHOW_FPS)
        end

        local ret , v = imgui.checkbox("Open Editor" , IS_OPEN_EDITOR and 1 or 0)
        IS_OPEN_EDITOR = v 

        local ret , v = imgui.sliderFloat("gameSpeed:" , gameSpeed , 0 , 3)
        if gameSpeed ~= v then
            gameSpeed = v
            cc.Director:getInstance():getScheduler():setTimeScale(gameSpeed)
        end
        local ret  , v = imgui.checkbox("memory" , isShowMemory and 1 or 0)
        isShowMemory = v
        if isShowMemory then
            table.insert(memoryArr , collectgarbage("count"))
            if #memoryArr >= 200 then
                table.remove(memoryArr , 1)
            end 
            imgui.plotLines("" , memoryArr , 0 , "memory" , 0 , 30000 , 0 , 100)
        end
        local ret  , v = imgui.checkbox("FrameGraph" , isShowFrameGraph and 1 or 0)
        isShowFrameGraph = v
        if isShowFrameGraph then
            table.insert(frameArr , cc.Director:getInstance():getFrameRate())
            if #frameArr >= 200 then
                table.remove(frameArr , 1)
            end
            imgui.plotLines("" , frameArr , 0 , "frameNum" , 0 , 60 , 0 , 100)
        end
    end)
    local scene = cc.Director:getInstance():getRunningScene()
    if (scene) then
        editorTools.createTreeNode("currentScene" , function()
            editorTools.showNodeInfo(scene)
        end)
    end
end

local editor = Editor.new()
editor:addDrawFunc(addGlobalEditor)
imgui.draw = function ()
    if IS_OPEN_EDITOR then
        editor:draw()
    end
end

return editorTools