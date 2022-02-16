local Node = cc.Node
local editorTools  = import(".EditorTools")

if imgui then
    function Node:onEditor()
        imgui.pushItemWidth(100)
        imgui.text("Position:") imgui.sameLine()
        editorTools.createNodeEditor(editorTools.Widget_Type.dragFloat  ,self ,"x" , "getPositionX" , "setPositionX")
        imgui.sameLine()
        editorTools.createNodeEditor(editorTools.Widget_Type.dragFloat  ,self ,"y" , "getPositionY" , "setPositionY")
        imgui.popItemWidth()
    
        imgui.pushItemWidth(100)
        imgui.text("Scale:") imgui.sameLine()
        editorTools.createNodeEditor(editorTools.Widget_Type.dragFloat  ,self ,"scaleX"   , "getScaleX" , "setScaleX" , 0.1)
        imgui.sameLine()
        editorTools.createNodeEditor(editorTools.Widget_Type.dragFloat  ,self ,"scaleY"   , "getScaleY" , "setScaleY" , 0.1)
        imgui.popItemWidth()
    
        imgui.text("Color:") imgui.sameLine()
        local ret
        local color = self:getColor()
        color.a = self:getOpacity()
        ret , color.r , color.g , color.b , color.a = imgui.colorEdit("color" , color.r / 255 , color.g / 255 , color.b / 255 , color.a / 255)
        if ret then
            color.r = color.r * 255
            color.g = color.g * 255
            color.b = color.b * 255
            color.a = color.a * 255
            self:setColor(color)
            self:setOpacity(color.a)
        end
    
        imgui.pushItemWidth(100)
        imgui.text("AnchorPoint:") imgui.sameLine()
        local anchorPoint = self:getAnchorPoint()
        editorTools.createNodeEditor(editorTools.Widget_Type.dragFloat  ,anchorPoint ,"ax" , "x" , "x" , 0.01 , 0 , 1)
        imgui.sameLine()
        editorTools.createNodeEditor(editorTools.Widget_Type.dragFloat  ,anchorPoint ,"ay" , "y" , "y" , 0.01 , 0 , 1)
        self:setAnchorPoint(anchorPoint)
        imgui.popItemWidth()
    
        if self:getRotationSkewX() ~= self:getRotationSkewY() then
            imgui.pushItemWidth(100)
            imgui.text("Rotation:") imgui.sameLine()
            editorTools.createNodeEditor(editorTools.Widget_Type.dragFloat  ,self ,"rotationX", "getRotationSkewX" , "setRotationSkewX", 1, -360 , 360)
            imgui.sameLine()
            editorTools.createNodeEditor(editorTools.Widget_Type.dragFloat  ,self ,"rotationY", "getRotationSkewY" , "setRotationSkewY", 1, -360 , 360)
            imgui.popItemWidth()
        else
            imgui.text("Rotation:") imgui.sameLine()
            editorTools.createNodeEditor(editorTools.Widget_Type.dragFloat  ,self ,"rotation", "getRotation" , "setRotation", 1, -360 , 360)
        end
        
        imgui.text("visible:") imgui.sameLine()
        editorTools.createNodeEditor(editorTools.Widget_Type.checkbox   ,self ,"" , "isVisible" , "setVisible")

        if self.getContentSize and self.setContentSize then
            imgui.text("ContentSize:") imgui.sameLine()
            local size = self:getContentSize()
            imgui.pushItemWidth(100)
            local ret , val = editorTools.createUI(editorTools.Widget_Type.dragInt , "width" , size.width , 1)
            if ret then
                size.width = val
            end
            imgui.sameLine()
            local ret , val = editorTools.createUI(editorTools.Widget_Type.dragInt , "height" , size.height , 1)
            if ret then
                size.height = val
            end
            imgui.popItemWidth()
            self:setContentSize(size)
        end
        if self.onEditorView then
            self:onEditorView(editorTools)
        end
        local data = tolua.getpeer(self)
        if data then
            editorTools.createTreeNode("Node_Data" , function()
                editorTools.showDataInfo(data, {showFunc = true})
            end)
        end
    end
end