local Jiesuan = class("Jiesuan", cc.load("mvc").ModuleBase)
local Doushouqi = import(".doushouqi")

Jiesuan.RESOURCE_FILENAME = "game/doushouqi/jiesuan.csb"

Jiesuan.behavior ={
    "logic.common.behavior.BlackHover",
    "logic.common.behavior.TouchInterrupt",
}

function Jiesuan:onCreate(isWin, isDraw)
    self.mView["WIN"]:setVisible(not isDraw and isWin)
    self.mView["LOST"]:setVisible(not isDraw and not isWin)
    self.mView["DRAW"]:setVisible(not not isDraw)
end

function Jiesuan:onbtnRetryClick()
    Doushouqi.new():showWithScene()
end

function Jiesuan:onbtnBackClick()
    global.viewJump.gotoDouShouqi()
end

return Jiesuan