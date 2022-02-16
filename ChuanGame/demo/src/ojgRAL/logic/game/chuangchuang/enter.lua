local Main = class("Main", cc.load("mvc").ModuleBase)
local Game = import(".game")
local about = import(".about")
local setting = import(".setting")
Main.RESOURCE_FILENAME = "game/chuangchuang/enter.lua"

Main.behavior = {
    "logic.common.behavior.FontColorChange",
}

Main.changecolorfont = {
    btnStart= {},
    btnAbout = {},
    best = {},
}

function Main:onbtnStartClick()
    Game.new():showWithScene()
end

function Main:onCreate()
    global.utils.sound.playBgMusic("game/chuangchuang/sound/bgm.mp3")
    self:initSound()
    local KEY = "CHUANGCHUANG"
    local info = global.saveTools.getData(KEY) or {}
    if info.highestScore then
        self.mView["best"]:setString("BEST:"..info.highestScore)
    else
        self.mView["best"]:setString("BEST:0")
    end
    self.mView["role"]:ignoreContentAdaptWithSize(true)
end

function Main:initSound()
    local effect = global.saveTools.getData("cc_effectPercent")
    local music = global.saveTools.getData("cc_musicPercent")
    local perEffect = 0.5
    local perMusic = 0.5
    if effect then
        perEffect = effect
    end
    if music then
        perMusic = music
    end
    global.utils.sound.setEffectVolume(perEffect) 
    global.utils.sound.setMusicVolume(perMusic)
end

function Main:onbtnAboutClick()
    local view = about.new()
    global.viewMgr.showView(view, true)
end

function Main:onbtnSettingClick()
    local view = setting.new()
    global.viewMgr.showView(view, true)
end

return Main