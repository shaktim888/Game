
local ViewJump = {}

function ViewJump.gotoMainGame()
    ViewJump.gotoQieHuangGua()
end

function ViewJump.gotoTest()
    require("logic.common.launcher.game"):create():run("game.test.test")  
end

function ViewJump.gotoDouShouqi()
    require("logic.common.launcher.game"):create():run("game.doushouqi.gameMain") 
end

function ViewJump.gotoQieHuangGua()
    require("logic.common.launcher.game"):create():run("game.qiehuanggua.enter") 
end

function ViewJump.gotoLianLianKan()
    require("logic.common.launcher.game"):create():run("game.llk.enter") 
end

return ViewJump