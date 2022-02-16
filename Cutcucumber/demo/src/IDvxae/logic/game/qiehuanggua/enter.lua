local Main = class("Main", cc.load("mvc").ModuleBase)
local Game = import(".game")
local about = import(".about")
local setting = import(".setting")
Main.RESOURCE_FILENAME = "game/qiehuanggua/main.lua"

Main.behavior = {
    "logic.common.behavior.FontColorChange",
}

Main.changecolorfont = {
    best = {},
    btnStart = {},
    btnAbout = {},
}

function Main:onbtnStartClick()
    Game.new():showWithScene()
end

function Main:onCreate()
    local info = global.saveTools.getData("qiehuangguaScore")
    if not info then
        info = 0
        global.saveTools.saveData("qiehuangguaScore", info)
    end
    self.mView["best"]:setString("BEST:"..info)
    global.utils.sound.playBgMusic("game/qiehuanggua/sound/bgm.mp3")
    self:isRecord()
end

function Main:isRecord()
    local info = global.saveTools.getData("qhg_sound") or {}
    if next(info) ~= nil then
        if not info.music then
            global.utils.sound.pauseMusic()
        end
        if not info.effect then
            global.utils.sound.stopAllSound()
        end
    end
end

function Main:onbtnAboutClick()
    local view = about.new()
    global.viewMgr.showView(view, true)
end

function Main:onbtnSettingClick()
    local view = setting.new()
    global.viewMgr.showView(view, false)
end

return Main