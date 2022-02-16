local Jiesuan = class("Jiesuan", cc.load("mvc").ModuleBase)
local chuidizhu = import(".chuidizhu")

Jiesuan.RESOURCE_FILENAME = "game/chuidizhu/balance.lua"

Jiesuan.behavior = {
    "logic.common.behavior.BlackHover",
    "logic.common.behavior.TouchInterrupt",
}

function Jiesuan:onCreate(data_)
    dump(data_)

    self.mView["Score"]:setString(data_.score)
    -- self.mView["high"]:setString(data_.history_max)
end

function Jiesuan:onbtnRetryClick()
    chuidizhu.new():showWithScene()
end

function Jiesuan:onbtnBackClick()
    local gameMain = require("logic/game/chuidizhu/gameMain")
    gameMain.new():showWithScene()
end

return Jiesuan  