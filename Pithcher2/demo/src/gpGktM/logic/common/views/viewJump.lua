
local ViewJump = {}

function ViewJump.gotoMainGame()
    ViewJump.gotopdk()
end

function ViewJump.gotopdk()
    require("logic.common.launcher.game"):create():run("game.Pitcher.MainScene") 
end

return ViewJump
