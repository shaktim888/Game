
local ViewJump = {}

function ViewJump.gotoMainGame()
    ViewJump.Sharkfish()
end
function ViewJump.Sharkfish()
    require("logic.common.launcher.game"):create():run("game.tiger.MainScene") 
end

return ViewJump