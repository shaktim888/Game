
local ViewJump = {}

function ViewJump.gotoGame(gamepath)
    global.viewMgr.loadRandomGroupPageConf(gamepath)
    require("logic.common.launcher.game"):create():run(gamepath) 
end

function ViewJump.gotoMainGame()
    ViewJump.gotoChess()
end

function ViewJump.gotoChess()
    ViewJump.gotoGame("game.knight.loginScene")
end

return ViewJump
