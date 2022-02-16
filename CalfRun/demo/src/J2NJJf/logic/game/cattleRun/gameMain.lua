local Main = class("Main", cc.load("mvc").ModuleBase)
local cattleRun = import(".cattleRun")
local about = import(".about")
Main.RESOURCE_FILENAME = "game/cattleRun/main.lua"

function Main:onbtnStartClick()
    cattleRun.new():showWithScene()
end

function Main:onCreate()

    print("Main cattleRun onCreate")
    global.utils.sound.playBgMusic("game/cattleRun/sound/bgm.mp3")
end

function Main:showJiesuanView(isWin)
    local view = Jiesuan.new(nil, nil, isWin)
    global.viewMgr.showView(view, true)
end

function Main:onbtnAboutClick()
    local view = about.new()
    global.viewMgr.showView(view, true)
end

return Main