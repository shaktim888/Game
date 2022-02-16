local winLayer = class("winLayer", cc.load("mvc").ModuleBase)
print("你进入了结束界面")
winLayer.RESOURCE_FILENAME = "game/FarmerfFightLandlord/WinLayer.lua"
local viewJump = require("logic.common.views.viewJump")
local Shuffle = cc.load("tools").Shuffle
winLayer.behavior ={
    "logic.common.behavior.BtnBinder",
    "logic.common.behavior.TouchInterrupt",
    "logic.common.behavior.Listener",
    "logic.common.behavior.FontColorChange",
}

winLayer.changecolorfont = {
    gameOverText = {},
    exitBtn = {},
}

--按钮绑定事件
winLayer.btnBind = {
    exitBtn = "exitClick",
}

--创建界面
function winLayer:onCreate()
end

function winLayer:exitClick()
    print("你点击了返回登录场景")
    AudioEngine.playEffect("game/FarmerfFightLandlord/sound/Button.mp3",false)
    viewJump.gotoMainGame()
end

return winLayer
