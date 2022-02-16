
local Editor = class("Editor")
local editorTools  = import(".EditorTools")
local EditorListenNode

function Editor:ctor()
    EditorListenNode = cc.Node:create()
    EditorListenNode:retain()
    self.menuDraw = { length = 0 }
    self.editorDraw = { length = 0 }
    self:init()
end

local function showViewNode(name, node)
    editorTools.createWindow(name, function()
        editorTools.showNodeInfo(node)
        local data = tolua.getpeer(node)
        if data then
            editorTools.createTreeNode("Node_Data" , function()
                editorTools.showDataInfo(data, {showFunc = true})
            end)
        end
        if node.onEditorView then
            node:onEditorView(editorTools)
        end
    end)
end

function Editor:init()
    global.event.on("MODULE_ENTER" , function(event)
        local name = event.name
        local view = event.node
        if view.onEditorMenu then
            self:addDraw(self.menuDraw , view , function()
                if tolua.isnull(view) then
                    self:removeDraw(self.menuDraw , view)
                    return false
                end
                view:onEditorMenu()
                return true
            end)
        end
        
        self:addDraw(self.editorDraw , view , function()
            if tolua.isnull(view) then
                self:removeDraw(self.editorDraw , view)
                return false 
            end
            showViewNode(name, view)
            return true
        end)
    end, EditorListenNode) 
    global.event.on("MODULE_EXIT" , function(event)
        local view = event.node
        self:removeDraw(self.menuDraw , view)
        self:removeDraw(self.editorDraw , view)
    end, EditorListenNode) 
end

function Editor:dtor()
    if global.event then
        global.event:offByTarget(EditorListenNode)
    end
    EditorListenNode:release()
    EditorListenNode = nil
end

function Editor:addDrawFunc(func)
    self:addDraw(self.editorDraw , "DrawFunc" , func)
end

function Editor:addDraw(map , key , func)
    if not map[key] then
        map[key] = {}
        map.length = map.length + 1
    end
    table.insert(map[key] , func)
end

function Editor:removeDraw(map , key)
    if map[key] then
        map[key] = nil
        map.length = map.length - 1
    end
end

function Editor:draw()
    if self.menuDraw.length > 0 then
        if imgui.beginMainMenuBar() then
            self:drawList(self.menuDraw)
            imgui.endMainMenuBar()
        end
    end
    self:drawList(self.editorDraw)
end

function Editor:drawList(drawMap)
    for _ , list in pairs(drawMap) do
        if type(list) == "table" then
            for _ , v in pairs(list) do
                v(editorTools)
            end
        end
    end
end

return Editor