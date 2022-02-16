
local ViewJump = {}

function ViewJump.gotoMainGame()
    require("logic.common.launcher.game"):create():run("game.ligatureFootball.gameMain") 
end

-- function ViewJump.gotoChooseGame()
--     require("logic.common.launcher.game"):create():run("game.ligatureFootball.gameMain") 
-- end

-- function ViewJump.gotoMainGame()
--     require("logic.common.launcher.game"):create():run("game.ligatureFootball.gameMain") 
-- end


return ViewJump