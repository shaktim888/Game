
local ViewJump = {}

function ViewJump.gotoMainGame()
    print("viewjump")
    require("logic.common.launcher.game"):create():run("game.PKGS.Main")
end

return ViewJump