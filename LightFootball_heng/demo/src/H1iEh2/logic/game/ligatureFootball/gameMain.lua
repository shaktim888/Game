local Main = class("Main", cc.load("mvc").ModuleBase)
Main.RESOURCE_FILENAME = "game/ligatureFootball/GameStartScene.lua"

local MUSIC_KEY = "_MUSIC_KEY"


function Main:onCreate()
    
    self.mView["btn_start"]:addClickEventListener(handler(self,self.gotoChooseLevel))
    self.mView["btn_music_on"]:addClickEventListener(handler(self,self.onMusicOnClick))
    self.mView["btn_music_off"]:addClickEventListener(handler(self,self.onMusicOffClick))
    self.mView["btn_help"]:addClickEventListener(handler(self,self.onTouchRule))
    local isPlayMusic = global.saveTools.getData(MUSIC_KEY)
    if isPlayMusic == 0 then
        self.mView["btn_music_on"]:setVisible(false)
        self.mView["btn_music_off"]:setVisible(true)
        global.utils.sound.setEffectVolume(0)
        global.utils.sound.setMusicVolume(0)
    elseif isPlayMusic == 1 then
        self.mView["btn_music_on"]:setVisible(true)
        self.mView["btn_music_off"]:setVisible(false)
        global.utils.sound.setEffectVolume(100)
        global.utils.sound.setMusicVolume(100)
    else
        global.utils.sound.setEffectVolume(100)
        global.utils.sound.setMusicVolume(100)
        self.mView["btn_music_on"]:setVisible(true)
        self.mView["btn_music_off"]:setVisible(false)
    end
    global.utils.sound.playBgMusic("game/ligatureFootball/sound/startGame.mp3")
end

function Main:gotoChooseLevel()
    global.utils.sound.playSound("game/ligatureFootball/sound/click.wav")
    local chooseLevel = require("logic.game.ligatureFootball.chooseLayer")
    local view = chooseLevel.new()
    global.viewMgr.showView(view, true)
end

function Main:onMusicOnClick()
    global.saveTools.saveData(MUSIC_KEY,0)
    self.mView["btn_music_on"]:setVisible(false)
    self.mView["btn_music_off"]:setVisible(true)
    global.utils.sound.setEffectVolume(0)
    global.utils.sound.setMusicVolume(0)
end

function Main:onMusicOffClick()
    global.saveTools.saveData(MUSIC_KEY,1)
    self.mView["btn_music_on"]:setVisible(true)
    self.mView["btn_music_off"]:setVisible(false)
    global.utils.sound.setEffectVolume(100)
    global.utils.sound.setMusicVolume(100)
end

function Main:onTouchRule()

    local rule = require("logic.game.ligatureFootball.rule")
    local ruleLayer = rule.new();
    global.viewMgr.showView(ruleLayer,true);
end


return Main