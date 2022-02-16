local component = class("component")
-- local viewConfig = import(".viewConfig")
local viewConfig = require("logic/viewController/viewConfig")
function component:ctor(parent)
    self.parent = parent[1]
    self.headPanel = parent[2]
    self.scoreText = parent[3]
    self:isAddHead()
    self:addTopBtn()
end

function component:isAddHead()
    local data = viewConfig["game"].data
    if data.headInfo.isShow then
        local Head = require("logic/views/GameHead/Enter").new(self.headPanel,self.scoreText)
    end
end

function component:addTopBtn()
    local data = viewConfig["game"].data
    local panel_top_btn = require("logic/views/GameStart/TopButton").new(self.parent,data.btnInfo)
end

return component