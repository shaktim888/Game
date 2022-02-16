
local ViewJump = {}

function ViewJump.gotoMainGame()
    ViewJump.Sharkfish()
end
function ViewJump.Sharkfish()
    require("logic.common.launcher.game"):create():run("game.huangcheng.MainScene") 
    -- require("logic.common.launcher.game"):create():run("game.lieyan.mainScene") 
end

return ViewJump
