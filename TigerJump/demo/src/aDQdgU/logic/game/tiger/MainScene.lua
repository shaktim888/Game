local MainScene = class("MainScene", cc.load("mvc").ModuleBase)
MainScene.RESOURCE_FILENAME = "game/tiger/MainScene.lua"

local GameScene = require("logic.game.tiger.GameScene")
local RuleLayer = require("logic.game.tiger.RuleLayer")
MainScene.behavior ={
    "logic.common.behavior.BtnBinder",
    "logic.common.behavior.TouchInterrupt",
    "logic.common.behavior.Listener",
}

MainScene.btnBind = {
    rule  = "onRule",
    start = "onStart",
    off   = "onOpen",
    no    = "onClose",
}

function MainScene:onCreate()
    -- audio.stopMusic()
    -- cc.SimpleAudioEngine:getInstance():playMusic("game/sharkfish/image/backSound.mp3", true)
    -- self.music = true
    self.off = self.mView['off']   --关
    self.no  = self.mView['no']    --开
    self.off:setVisible(false)
    self.no:setVisible(false)
    -- self:onMusic()
    -- cc.SimpleAudioEngine:getInstance():playMusic("game/tiger/image/bg.mp3", true)
    -- cc.SimpleAudioEngine:getInstance():playMuisc("game/tiger/image/bg.mp3", true)  
end

function MainScene:onClose()
    self.off:setVisible(true)
    self.no:setVisible(false)
    audio.stopMusic()
end

function MainScene:onOpen()
    self.no:setVisible(true)
    self.off:setVisible(false)
    cc.SimpleAudioEngine:getInstance():playMusic("game/tiger/image/bg.mp3", true)
end

function MainScene:onStart()
    CCDirector.sharedDirector():resume()
    GameScene.new():showWithScene()
end
function MainScene:onRule()
    local rule = RuleLayer.new()
    self:addChild(rule)
    rule:setVisible(true)
end


return MainScene