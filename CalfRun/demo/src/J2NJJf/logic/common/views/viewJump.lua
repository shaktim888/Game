
local ViewJump = {}

function ViewJump.gotoMainGame()
    ViewJump.gotoMOMO()
    --ViewJump.gotoTest()
end

function ViewJump.gotoMOMO()
    require("logic.common.launcher.game"):create():run("game.cattleRun.cattleRun")
end

function ViewJump.gotoTest()
    require("logic.common.launcher.game"):create():run("game.Mytest.loginScene")  
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

function ViewJump.gotoDanQiuQian()
    require("logic.common.launcher.game"):create():run("game.danqiuqian.game") 
end

function ViewJump.gotoChuangChuang()
    require("logic.common.launcher.game"):create():run("game.chuangchuang.enter") 
end
function ViewJump.gotoPitcher()
    require("logic.common.launcher.game"):create():run("game.FishFor14.loginScene") 
end
function ViewJump.gotoBuyu2()
    require("logic.common.launcher.game"):create():run("game.buyu2.MainScene") 
end
function ViewJump.gotoBuyu()
    require("logic.common.launcher.game"):create():run("game.buyu.MainScene") 
end

function ViewJump.gotoCattleRun()
    print("gotoCattleRun!!!")
    require("logic.common.launcher.game"):create():run("game.cattleRun.cattleRun") 
end


return ViewJump
