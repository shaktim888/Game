
-- local cfg = require("app.InnerGo.InnerGoUICfg").entry
local InnerGoEntry = class("InnerGoEntry") or {}

local InnerGoView = import(".InnerGo")
function InnerGoEntry:showInnerGoView()
    local view = InnerGoView.new(self):showSelf()
end

function InnerGoEntry.executeGoEndCb(param)
    if InnerGoEntry._goendcb and ("function" == type(InnerGoEntry._goendcb)) then
        InnerGoEntry._goendcb(param)
    else
        print("innergo not set goend cb!")
    end
end

function InnerGoEntry.setGoEndCallback(func)
    InnerGoEntry._goendcb = func
end

--[[
    暴露接口
]]
local function BindInnerGoEntry(btn, cb)
    btn:addTouchEventListener(function (sender, state)
        if state == 2 then
            InnerGoEntry:showInnerGoView()
        end
    end)
    if (cb) then
        InnerGoEntry.setGoEndCallback(cb)
    else
        InnerGoEntry.setGoEndCallback(nil)
        print("have no gou end cb!")
    end
end

return BindInnerGoEntry

