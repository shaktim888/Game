
print("--------------------------")
local MainScene = class("MainScene", cc.load("mvc").ModuleBase)

MainScene.RESOURCE_FILENAME = "game/jump/MainScene.lua"
local GameScene = require("logic/game/jump/GameScene")
local GameShop = require("logic/game/jump/GameShop")

local PayUtils = require("logic/InnerGo/PayUtils.lua")

local MONEY_SAVE_KEY = "_MONEY_SAVE_KEY_"
local HERO_INDEX_SAVE_KEY = "_HERO_INDEX_SAVE_KEY_"
local HEIGHT_SCORE_SAVE_KEY = "_HEIGHT_SCORE_SAVE_KEY_"

local MUSIC_SAVE_KEY = "_MUSIC_SAVE_KEY_"

function MainScene:onCreate()
    if not global.saveTools.getData(HERO_INDEX_SAVE_KEY) then
        global.saveTools.saveData(HERO_INDEX_SAVE_KEY,1)
    end
    if not global.saveTools.getData(MONEY_SAVE_KEY) then
        global.saveTools.saveData(MONEY_SAVE_KEY,0)
    end

    if not global.saveTools.getData(MUSIC_SAVE_KEY) then
        global.saveTools.saveData(MUSIC_SAVE_KEY,1)
    end

    if not global.saveTools.getData(HEIGHT_SCORE_SAVE_KEY) then
        global.saveTools.saveData(HEIGHT_SCORE_SAVE_KEY,0)
    end

    local str = global.saveTools.getData(MUSIC_SAVE_KEY)
    global.utils.sound.playBgMusic("game/jump/sound.mp3")

    if global.saveTools.getData(MUSIC_SAVE_KEY)==1 then
        self.mView['btn_sound_off']:setVisible(true)
        self.mView['btn_sound_on']:setVisible(false)
        global.utils.sound.resumeMusic()
        print("音乐开")
    else
        global.utils.sound.pauseMusic()
        self.mView['btn_sound_off']:setVisible(false)
        self.mView['btn_sound_on']:setVisible(true)
        print("音乐关")
    end
    self.mView['role']:ignoreContentAdaptWithSize(true)

    self.mView['btn_start']:setTouchEnabled(true)
    self.mView['btn_start']:addTouchEventListener(handler(self,self.onStartClick))

    self.mView['btn_shop']:setTouchEnabled(true)
    self.mView['btn_shop']:addTouchEventListener(handler(self,self.onShopClick))

    self.mView['btn_sound_off']:setTouchEnabled(true)
    self.mView['btn_sound_off']:addTouchEventListener(handler(self,self.onMusicOffClick))

    self.mView['btn_sound_on']:setTouchEnabled(true)
    self.mView['btn_sound_on']:addTouchEventListener(handler(self,self.onMusicOnClick))

    self.mView["role"]:ignoreContentAdaptWithSize(true)

    require("logic.InnerGo.InnerGoEntry")(self.mView['btn_shop'], function (info)
        if info and info.value then
            local tgold = tonumber(global.saveTools.getData(MONEY_SAVE_KEY)) + info.value
            global.saveTools.saveData(MONEY_SAVE_KEY, tgold)
        end
    end)
end

function MainScene:onMusicOffClick()
    global.saveTools.saveData(MUSIC_SAVE_KEY,0)
    self.mView['btn_sound_off']:setVisible(false)
    self.mView['btn_sound_on']:setVisible(true)
    global.utils.sound.pauseMusic()
end

function MainScene:onMusicOnClick()
    global.saveTools.saveData(MUSIC_SAVE_KEY,1)
    self.mView['btn_sound_off']:setVisible(true)
    self.mView['btn_sound_on']:setVisible(false)
    global.utils.sound.resumeMusic()
end

function MainScene:onStartClick()
    GameScene.new():showWithScene()
end

function MainScene:onShopClick()
    GameShop.new():showWithScene()
end

return MainScene
