-- 场景资源加载
local PauseLayer = class("PauseLayer", cc.load("mvc").ModuleBase)
PauseLayer.RESOURCE_FILENAME = "game/PKGS/Pause.csb"
local viewJump = require("logic.common.views.viewJump")

-- 事件行为加载
PauseLayer.behavior ={
"logic.common.behavior.BtnBinder",
"logic.common.behavior.TouchInterrupt",
"logic.common.behavior.Listener",
"logic.common.behavior.BlackHover",

}

local STRING_SOUND_ON  = "Sound:ON"
local STRING_SOUND_OFF = "Sound:OFF"

-- 场景初始创建
function PauseLayer:onCreate()
    self.butContinue = self.mView["butContinue"]
    self.butSound    = self.mView["butSound"]
    self.butReplay   = self.mView["butReplay"]
    self.butHome     = self.mView["butHome"]
    self.isPause     = false
end

PauseLayer.btnBind = {
    butContinue = "onButContinue",
    butSound    = "onButSound",
    butReplay   = "onButReplay",
    butHome     = "onButHome",

}

function PauseLayer:onButContinue()
    AudioEngine.playEffect(_Sound.click,false)
    self:setVisible(false)
    self.gameScene:onButPause()
end

function PauseLayer:init(gameScene)
    self.gameScene = gameScene
end

function PauseLayer:onButHome()
    AudioEngine.playEffect(_Sound.click,false)
    CCDirector:getInstance():resume()
    viewJump.gotoMainGame()
end

function PauseLayer:OnButBaseClick(but,callback)
    if but:getActionByTag(1) == nil then
        audio.playSound("game/music/but_se.mp3",false)
        local blowUp   = cc.ScaleBy:create(0.3,1.3)
        local blowDown = blowUp:reverse()
        local cb       = cc.CallFunc:create(callback)
        local but_anim = cc.Sequence:create(blowUp,blowDown,cb)
        but_anim:setTag(1)
        but:runAction(but_anim)
    end
end

function PauseLayer:onButSound()
    AudioEngine.playEffect(_Sound.click,false)
    if(self.isPause)then
        global.utils.sound.resumeMusic()
        self.isPause = false
        self.butSound:setTitleText(STRING_SOUND_ON)
    else
        global.utils.sound.pauseMusic()
        self.isPause = true
        self.butSound:setTitleText(STRING_SOUND_OFF)
    end
end

function PauseLayer:onButReplay()
    self.gameScene:onReplay()
    self:onButContinue()
end


return PauseLayer
