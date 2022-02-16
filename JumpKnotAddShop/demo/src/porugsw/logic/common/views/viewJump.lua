
local ViewJump = {}

function ViewJump.gotoGame(gamepath)
    global.viewMgr.loadRandomGroupPageConf(gamepath)
    print("--------------------------2")
    require("logic.common.launcher.game"):create():run(gamepath) 
end

function ViewJump.gotoMainGame()
    print("enter game")
    ViewJump.gotoshilong()
end

function ViewJump.gotoTest()
    require("logic.common.launcher.game"):create():run("game.test.test")  
end

function ViewJump.gotoDouShouqi()
    require("logic.common.launcher.game"):create():run("game.doushouqi.gameMain") 
end

function ViewJump.gotoJiandao()
    require("logic.common.launcher.game"):create():run("game.jiandao.gameMain") 
end

function ViewJump.gotoFastlabor()
    require("logic.common.launcher.game"):create():run("game.fastlabor.gameMain") 
end

function ViewJump.gotohaborfall()
    require("logic.common.launcher.game"):create():run("game.haborfall.haborfall") 
end

function ViewJump.gotopdk()
    -- require("logic.common.launcher.game"):create():run("game.pdk.gameMain") 
    ViewJump.gotoGame("game.pdk.gameMain")
end

function ViewJump.gotoshilong()
    -- require("logic.common.launcher.game"):create():run("game.pdk.gameMain")
    print("--------------------------1")
    ViewJump.gotoGame("game.jump.MainScene")
end

return ViewJump
