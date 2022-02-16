
local ListviewItemMultipartTemplate = class("ListviewItemMultipartTemplate", ccui.Layout)

function ListviewItemMultipartTemplate:init(child_node_tbl_, pos_tbl_, size_, node_clickcb_)
    self:setContentSize(size_.width, size_.height)

    -- self:setCascadeColorEnabled(true)
    -- self:setBackGroundColorType(1)
    -- self:setBackGroundColor({r=0,g=0,b=123})
    -- self:setOpacity(99)

    -- dump(size_)

    if type(child_node_tbl_) ~= "table" then
        child_node_tbl_ = {child_node_tbl_}
    end

    self._node_tbl = child_node_tbl_
    for i = 1, #child_node_tbl_ do
        local node = child_node_tbl_[i]
        self:add(node)
        
        local pos = pos_tbl_[i]
        if pos then
            node:setPosition(pos[1], pos[2])
        end
    end

    self:setTouchEnabled(true)
    self:addClickEventListener(handler(self, self.clickEventCall))

    self._node_cb = node_clickcb_
end

function ListviewItemMultipartTemplate:setData(data_, setNodeDataCallback_)
    self._cell_data = data_
end

function ListviewItemMultipartTemplate:clickEventCall(sender_, touch_pos_)
    local pos = touch_pos_ or sender_:getTouchEndPosition()

    local index = -1

    local target
    for i, v in ipairs(self._node_tbl) do
        if global.utils.hitTest(v, pos) then
            index = i
            target = v
            break
        end
    end

    print(index)
    
    if index == -1 then
        return 
    end

    if self._node_cb then
        self._node_cb(target, index)
    end
end

return ListviewItemMultipartTemplate