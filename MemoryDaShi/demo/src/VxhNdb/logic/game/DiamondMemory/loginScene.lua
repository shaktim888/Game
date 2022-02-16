local UILogin = class("LoginScene", cc.load("mvc").ModuleBase)
UILogin.RESOURCE_FILENAME = "game/DiamondMemory/login.lua"

local rule = import(".hall_rule")
cc.exports.set = import(".hall_set")
cc.exports.game_ = import(".gameScene")


cc.exports.EMPER_PATH = "game/DiamondMemory/images/"
-- UILogin.RESOURCE_FILENAME_MAX_INDEX = 2
-- UILogin.groupMap = {
--     {"noticeBtn", "feedbackBtn", "aboutBtn", "setBtn"},
--     {"gamestartBtn","ruleBtn"}
-- }

-- UILogin.behavior = {
--     "logic.common.behavior.WidgetRandomGroup",
--     "logic.common.behavior.RandomLayout",

-- }
UILogin.behavior ={
    "logic.common.behavior.FontColorChange"
}
UILogin.changecolorfont = {
    gamestartBtn = {},
    ruleBtn = {},
    best = {}
}

function UILogin:onCreate()
    audio.playMusic("game/DiamondMemory/sound/bgm.mp3",true)
    self:initSound()
    local score = cc.UserDefault:getInstance():getIntegerForKey("DiamondMemoryHightScore")
    self.mView["best"]:setString("BEST:"..score)
end

function UILogin:initSound()
    local effect = global.saveTools.getData("dm_effectPercent")
    local music = global.saveTools.getData("dm_musicPercent")
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

function UILogin:ongamestartBtnClick()
    
    AudioEngine.playEffect("game/DiamondMemory/sound/Button.mp3",false)
    
    local level = global.saveTools.getData("LEVEL")

    if not level then
        global.saveTools.saveData("LEVEL",6)
    end

    local cur = global.saveTools.getData("LEVEL")
    game_.new(nil,nil,cur):showWithScene()
end


function  UILogin:onruleBtnClick()
    AudioEngine.playEffect("game/DiamondMemory/sound/Button.mp3",false)
    global.viewMgr.showView(rule.new(), true)
end


function  UILogin:onruleBtnClick()
    AudioEngine.playEffect("game/DiamondMemory/sound/Button.mp3",false)
    global.viewMgr.showView(rule.new(), true)
end

function UILogin:onfeedbackBtnClick()
    AudioEngine.playEffect("game/DiamondMemory/sound/Button.mp3",false)
    global.viewMgr.showView(feedback.new(), true)

end

function UILogin:onaboutBtnClick()
    AudioEngine.playEffect("game/DiamondMemory/sound/Button.mp3",false)
    global.viewMgr.showView(about.new(), true)


end

function UILogin:onnoticeBtnClick()
    AudioEngine.playEffect("game/DiamondMemory/sound/Button.mp3",false)
    global.viewMgr.showView(notice.new(), true)
end

function UILogin:onsetBtnClick()
    AudioEngine.playEffect("game/DiamondMemory/sound/Button.mp3",false)
    global.viewMgr.showView(set.new(), true)

end





return UILogin
