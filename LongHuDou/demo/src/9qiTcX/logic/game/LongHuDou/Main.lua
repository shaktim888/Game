local Main = class("Main", cc.load("mvc").ModuleBase)
Main.RESOURCE_FILENAME = "game/LongHuDou/Main.lua"
local Select = require("logic.game.LongHuDou.Select")
local Help = require("logic.game.LongHuDou.Help")
local cfg = require("logic.game.LongHuDou.cfg.cfg")
local MusicBtnImagePath = "game/LongHuDou/images/hall/"

Main.behavior ={
    "logic.common.behavior.BtnBinder",
    "logic.common.behavior.FontColorChange",
}
Main.changecolorfont = {
    best = {},
    last = {}
}
function Main:onCreate()
    
    self:init()
end 

function Main:init()
    local info = global.saveTools.getData(cfg.LocalSave)
    if not info then
        info = {level = 1,score = 0,best = 0,last = 0,curlevel = 0,isOpenMusic = self.isOpenMusic}
        global.saveTools.saveData(cfg.LocalSave, info)
    end
    self.isOpenMusic = info.isOpenMusic
    self:initSound(self.isOpenMusic)
    self.mView['last']:setString("LAST:"..info.last)
    self.mView["best"]:setString("BEST:"..info.best)
end

function Main:onhelpBtnClick()
    AudioEngine.playEffect(cfg.Sound.click,false)
    local view = Help.new()
    global.viewMgr.showView(view, true)
end



function Main:onstartBtnClick()
    AudioEngine.playEffect(cfg.Sound.click,false)
    Select.new(nil,nil,{cfg.HU,cfg.LONG}):showWithScene()
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
    local info = global.saveTools.getData(cfg.LocalSave)
    info.isOpenMusic = self.isOpenMusic
    global.saveTools.saveData(cfg.LocalSave, info)
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
