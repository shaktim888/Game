
local ViewJump = {}

function ViewJump.gotoMainGame()
    ViewJump.gotoDouShouqi()
end

function ViewJump.gotoTest()
    require("logic.common.launcher.game"):create():run("game.test.test")  
end

function ViewJump.gotoDouShouqi()
    require("logic.common.launcher.game"):create():run("game.doushouqi.gameMain") 
end

return ViewJump