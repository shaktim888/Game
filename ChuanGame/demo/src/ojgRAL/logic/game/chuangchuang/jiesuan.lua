local Jiesuan = class("Jiesuan", cc.load("mvc").ModuleBase)

Jiesuan.RESOURCE_FILENAME = "game/chuangchuang/jiesuan.lua"

Jiesuan.behavior ={
    "logic.common.behavior.BlackHover",
    "logic.common.behavior.TouchInterrupt",
    "logic.common.behavior.FontColorChange",
}

Jiesuan.changecolorfont = {
    Text_1_0_0= {},
    win = {},
    btnRetry = {},
}

function Jiesuan:onCreate(score)
    local KEY = "CHUANGCHUANG"
    local info = global.saveTools.getData(KEY) or {}
    info.highestScore = info.highestScore or 0
    if score > info.highestScore then
        self.mView["win"]:setVisible(true)
        info.highestScore = score
    else
        self.mView["win"]:setVisible(false)
    end
    global.saveTools.saveData(KEY, info)

    self.mView["txtHighest"]:setString(info.highestScore)
    self.mView["txtScore"]:setString(score)
end

function Jiesuan:onbtnRetryClick()
    local Game = require("logic.game.chuangchuang.game")
    Game.new():showWithScene("random")
end

function Jiesuan:onbtnAgainClick()
    local Game = require("logic.game.chuangchuang.game")
    Game.new():showWithScene("random")
end

function Jiesuan:onbtnBackClick()
    local Game = require("logic.game.chuangchuang.enter")
    Game.new():showWithScene("random")
end

return Jiesuan