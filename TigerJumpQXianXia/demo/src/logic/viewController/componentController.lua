local component = class("component")
local viewConfig = import(".viewConfig")
function component:ctor(parent)
    self.parent = parent
    self:isAddHead()
    self:addTopBtn()
end

function component:isAddHead()
    local data = viewConfig["game"].data
    if data.headInfo.isShow then
        local Head = require("logic/views/GameStart/Head").new(self.parent)
    end
end

function component:addTopBtn()
    local data = viewConfig["game"].data
    local panel_top_btn = require("logic/views/GameStart/TopButton").new(self.parent,data.btnInfo)
end

return component