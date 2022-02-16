local UILogin = class("LoginScene", cc.load("mvc").ModuleBase)
UILogin.RESOURCE_FILENAME = "game/WitchPoker/LoginScene.lua"
print("你进入了登录界面")
local gameScene = require("logic.game.WitchPoker.gameScene")
local ruleLayer = require("logic.game.WitchPoker.ruleLayer")
local settingLayer = require("logic.game.WitchPoker.settingLayer")

-- local About = import(".about")
-- local Value = import(".value")
-- local FeedBack = import(".feedback")
--local Rule = import(".rule")
-- local Notice = import(".notice")

UILogin.behavior ={
    "logic.common.behavior.BtnBinder",
    "logic.common.behavior.TouchInterrupt",
    "logic.common.behavior.Listener",
    "logic.common.behavior.FontColorChange",
}

UILogin.changecolorfont = {
    best = {}
}

function UILogin:onCreate()
    
    self.startBtn = self.mView["startBtn"]
    self.ruleBtn = self.mView["ruleBtn"]
    --播放背景音乐
    audio.playMusic("game/WitchPoker/sound/bgm.mp3",true)
    self:initSound()
    local score = cc.UserDefault:getInstance():getIntegerForKey("WitchPokerHightScore")
    self.mView["best"]:setString("BEST:"..score)
end

function UILogin:initSound()
    local effect = global.saveTools.getData("nwpk_effectPercent")
    local music = global.saveTools.getData("nwpk_musicPercent")
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


--按钮事件监听
UILogin.btnBind = {
    startBtn = "startClick",
    ruleBtn = "ruleClick",
    settingBtn = "settingClick"
}

function UILogin:startClick()
    print("你点击了开始按钮");
    AudioEngine.playEffect("game/WitchPoker/sound/Button.wav",false)
    local UIgameScene = gameScene:create()
    UIgameScene:showWithScene()
    audio.stopMusic("game/WitchPoker/sound/bgm.mp3")
  
end
--规则按钮点击事件
function  UILogin:ruleClick()
        
    AudioEngine.playEffect("game/WitchPoker/sound/Button.wav",false)
    print("你点击了规则按钮");
    local rule = ruleLayer:create()
    self:addChild(rule)
    local size = rule:getContentSize()
    rule:setPosition(display.cx-size.width/2,display.cy-size.height/2)
end

function  UILogin:settingClick()
    AudioEngine.playEffect("game/WitchPoker/sound/Button.wav",false)
    print("你点击了设置按钮");
    local setting = settingLayer:create()
    self:addChild(setting)
    local size = setting:getContentSize()
    setting:setPosition(display.cx-size.width/2,display.cy-size.height/2)
   
end

function UILogin:onBtnFeedBackClick()
    -- Score.new():showWithScene()
    local view = FeedBack.new()
    global.viewMgr.showView(view, true)
end

function UILogin:onBtnNoticeClick()
    -- Score.new():showWithScene()
    local view = Notice.new()
    global.viewMgr.showView(view, true)
end

function UILogin:onBtnRuleClick()
    -- Score.new():showWithScene()
    local view = Rule.new()
    global.viewMgr.showView(view, true)
end

function UILogin:onBtnValueClick()
    -- Score.new():showWithScene()
    local view = Value.new()
    global.viewMgr.showView(view, true)
end


return UILogin
