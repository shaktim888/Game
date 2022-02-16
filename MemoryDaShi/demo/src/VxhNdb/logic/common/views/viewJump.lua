
local ViewJump = {}

function ViewJump.gotoGame(gamepath)
    -- global.viewMgr.loadRandomGroupPageConf(gamepath)
    require("logic.common.launcher.game"):create():run(gamepath) 
end

function ViewJump.gotoMainGame()
    ViewJump.gotoFkJy()
end

function ViewJump.gotoFkJy()
    ViewJump.gotoGame("game.DiamondMemory.loginScene")
end

return ViewJump
