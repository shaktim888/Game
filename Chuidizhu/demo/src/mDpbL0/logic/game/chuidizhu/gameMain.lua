local Main = class("Main", cc.load("mvc").ModuleBase)

local chuidizhu = require("logic/game/chuidizhu/chuidizhu")
Main.RESOURCE_FILENAME = "game/chuidizhu/main.lua"

function Main:onbtnStartClick()
    chuidizhu.new():showWithScene()
end

function Main:onCreate()

    print("Main chuidizhu onCreate")
    global.utils.sound.playBgMusic("game/chuidizhu/sound/bgm.mp3")
end

function Main:onGame()
    print("Main:onGame:before============")

    local view = chuidizhu.new()
    print("Main:onGame:end===============")
    view:setGameType(2)
    global.viewMgr.showView(view, true)
end

function Main:onUnlimitGame()
    local view = chuidizhu.new()
    view:setGameType(1)
    global.viewMgr.showView(view, true)
end

return Main