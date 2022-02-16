local Jiesuan = class("Jiesuan", cc.load("mvc").ModuleBase)

Jiesuan.RESOURCE_FILENAME = "game/qiehuanggua/jiesuan.lua"

Jiesuan.behavior ={
}

function Jiesuan:onCreate(isWin)
    self.mView["WIN"]:setVisible(isWin)
    self.mView["FAIL"]:setVisible(not isWin)
    local player1 = self.mView["FAIL"]:getChildByName("pijiu_2")
    player1:setVisible(false)

    local player2 = self.mView["WIN"]:getChildByName("pijiu_2")
    player2:setVisible(false)
end

function Jiesuan:onbtnRetryClick()
    local Game = require("logic.game.qiehuanggua.game")
    Game.new():showWithScene()
end

function Jiesuan:onbtnBackClick()
    global.viewJump.gotoQieHuangGua()
end

return Jiesuan