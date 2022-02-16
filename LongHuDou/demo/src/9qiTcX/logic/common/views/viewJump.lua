
local ViewJump = {}

function ViewJump.gotoGame(gamepath)
    require("logic.common.launcher.game"):create():run(gamepath) 
end

function ViewJump.gotoMainGame()
    ViewJump.gotofishJump()
end

function ViewJump.gotofishJump()
    ViewJump.gotoGame("game.LongHuDou.Main")
end



return ViewJump
