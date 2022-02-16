local Main = class("Main", cc.load("mvc").ModuleBase)
Main.RESOURCE_FILENAME = "game/GuardCastle/Main.csb"
local Game = require("logic.game.GuardCastle.Game")
local cfg = require("logic.game.GuardCastle.cfg.cfg")
local MusicBtnImagePath = "game/GuardCastle/images/hall/"

Main.behavior ={
    "logic.common.behavior.BtnBinder",
    "logic.common.behavior.FontColorChange",
}
Main.changecolorfont = {
    bestText = {},
    lastText = {},
}

function Main:onCreate()
    self:init()
end

function Main:init()
    local info = global.saveTools.getData(cfg.GuardCastle_SAVE)
    if not info then
        info = {
            last = 0,
            best = 0,
            isOpenMusic =  true
        }
        global.saveTools.saveData(cfg.GuardCastle_SAVE, info)
    end
    self.isOpenMusic = info.isOpenMusic
    self:initSound(self.isOpenMusic)
    self.mView["bestText"]:setString(cfg.BEST..info.best)
    self.mView["lastText"]:setString(cfg.LAST..info.last)
end

function Main:onbtnPlayClick()
    Game.new():showWithScene()
end

function Main:onmusicBtnClick()
    if self.isOpenMusic then
        self.mView["musicBtn"]:loadTextureNormal(MusicBtnImagePath.."but_off.png",0)
        self.isOpenMusic = false
        global.utils.sound.isStopSound = true
        audio.stopMusic()
    else
        self.mView["musicBtn"]:loadTextureNormal(MusicBtnImagePath.."but_on.png",0)
        self.isOpenMusic = true
        AudioEngine.setMusicVolume(1)
        global.utils.sound.isStopSound = false
        audio.playMusic(cfg.Sound.bgm,true)
    end
    local info = global.saveTools.getData(cfg.GuardCastle_SAVE)
    info.isOpenMusic = self.isOpenMusic
    global.saveTools.saveData(cfg.GuardCastle_SAVE, info)
end

function Main:initSound(isOpen) 
    if not isOpen then
        self.mView["musicBtn"]:loadTextureNormal(MusicBtnImagePath.."but_off.png",0)
        global.utils.sound.isStopSound = true
        audio.stopMusic()
    else
        self.mView["musicBtn"]:loadTextureNormal(MusicBtnImagePath.."but_on.png",0)
        AudioEngine.setMusicVolume(1)
        global.utils.sound.isStopSound = false
        audio.playMusic(cfg.Sound.bgm,true)
    end
end

return Main
