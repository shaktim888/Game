local UILogin = class("LoginScene", cc.load("mvc").ModuleBase)
UILogin.RESOURCE_FILENAME = "game/knight/login.lua"

local rule = import(".hall_rule")
cc.exports.set = import(".hall_set")
cc.exports.game_ = import(".knight")

UILogin.behavior ={
    "logic.common.behavior.FontColorChange",
}

UILogin.changecolorfont = {
    ruleBtn = {},
    gamestartBtn = {},
}

function UILogin:onCreate()
    audio.playMusic("game/knight/sound/bgm.mp3",true)
    self:isRecord()
    self:addTitleAction()
end

function UILogin:isRecord()
    local effect = global.saveTools.getData("knight_effectPercent")
    local music = global.saveTools.getData("knight_musicPercent")
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


function UILogin:addTitleAction()
end


function UILogin:ongamestartBtnClick()
    AudioEngine.playEffect("game/knight/sound/Button.mp3",false)
    game_.new():showWithScene1(nil,1,nil,{physics = 1})
end

function  UILogin:onruleBtnClick()
    AudioEngine.playEffect("game/knight/sound/Button.mp3",false)
    global.viewMgr.showView(rule.new(), true)
end

function UILogin:onfeedbackBtnClick()
    AudioEngine.playEffect("game/knight/sound/Button.mp3",false)
    global.viewMgr.showView(feedback.new(), true)
end

function UILogin:onaboutBtnClick()
    AudioEngine.playEffect("game/knight/sound/Button.mp3",false)
    global.viewMgr.showView(about.new(), true)
end

function UILogin:onnoticeBtnClick()
    AudioEngine.playEffect("game/knight/sound/Button.mp3",false)
    global.viewMgr.showView(notice.new(), true)
end

function UILogin:onsetBtnClick()
    AudioEngine.playEffect("game/knight/sound/Button.mp3",false)
    global.viewMgr.showView(set.new(), true)
end

return UILogin
