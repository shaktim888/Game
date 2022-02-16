local Jiesuan = class("Jiesuan", cc.load("mvc").ModuleBase)
local cattleRun = import(".cattleRun")

Jiesuan.RESOURCE_FILENAME = "game/cattleRun/balance.lua"

Jiesuan.behavior = {
    "logic.common.behavior.BlackHover",
    "logic.common.behavior.TouchInterrupt",
}

function Jiesuan:onCreate(data_)
    dump(data_)

    -- self.mView["score"]:setString(data_.score)
    -- self.mView["high"]:setString(data_.history_max)
end

function Jiesuan:onbtnRetryClick()
    cattleRun.new():showWithScene()
end

function Jiesuan:onbtnBackClick()
    global.viewJump.gotoCattleRun()
end

return Jiesuan  