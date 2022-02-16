local Main = class("Main", cc.load("mvc").ModuleBase)
local Doushouqi = import(".doushouqi")
local about = import(".about")
Main.RESOURCE_FILENAME = "game/doushouqi/main.csb"

function Main:onbtnStartClick()
    Doushouqi.new():showWithScene()
end

function Main:onCreate()
    global.utils.sound.playBgMusic("game/doushouqi/sound/bgm.mp3")
end

function Main:onbtnAboutClick()
    local view = about.new()
    global.viewMgr.showView(view, true)
end

return Main