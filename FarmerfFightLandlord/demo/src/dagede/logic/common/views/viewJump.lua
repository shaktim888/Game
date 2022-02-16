
local ViewJump = {}

function ViewJump.gotoGame(gamepath)
    global.viewMgr.loadRandomGroupPageConf(gamepath)
    require("logic.common.launcher.game"):create():run(gamepath) 
end

function ViewJump.gotoMainGame()
    -- ViewJump.gotoGame("game.FarmerfFightLandlord.loginScene")
    ViewJump.gotoFarmerfFightLandlord()
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

function ViewJump.gotoFarmerfFightLandlord()
    -- require("logic.common.launcher.game"):create():run("game.FarmerfFightLandlord.loginScene")
    ViewJump.gotoGame("game.FarmerfFightLandlord.loginScene")
end

function ViewJump.grabScene2()
    -- require("logic.common.launcher.game"):create():run("game.pdk.gameMain") 
    ViewJump.gotoGame("game.FarmerfFightLandlord.gameScene")
end

function ViewJump.grabScene3()
    ViewJump.gotoGame("game.FarmerfFightLandlord.gameScene")
end

return ViewJump
