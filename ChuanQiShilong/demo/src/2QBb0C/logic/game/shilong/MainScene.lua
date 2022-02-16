local MainScene = class("MainScene", cc.load("mvc").ModuleBase)
local classicScene = require("logic/game/shilong/ClassicScene")
local survivalScene = require("logic/game/shilong/SurvivalScene")
MainScene.RESOURCE_FILENAME = "game/shilong/MainScene.lua"

-- local Level = import(".level")
local Setting = import(".setting")
-- local Score = import(".score")

MainScene.behavior ={
    "logic.common.behavior.BtnBinder",
    "logic.common.behavior.TouchInterrupt",
    "logic.common.behavior.Listener",
    "logic.common.behavior.FontColorChange",
}

MainScene.changecolorfont = {
    survival= {},
    classic = {},
    best = {},
}

--按钮触发事件
MainScene.btnBind = {
    classic = "onClassic",
    survival = "onSurvival",
}


function MainScene:onCreate()
    print("开始游戏")

     local function getRgb()
        local textArray = {{231,207,205},{211,209,184},{232,232,232},{219,205,196},{223,190,121},{192,178,151}}
        local index = math.random(1,6)
        local r = textArray[index][1]
        local g = textArray[index][2]
        local b = textArray[index][3]
        return cc.c3b(r,g,b)
    end
    local fontcolor = getRgb()

    self.fen = 0   -- 分数
    cc.UserDefault:getInstance():setIntegerForKey("shilong.fen",self.fen)
    self.shengming = 3   --生命
    cc.UserDefault:getInstance():setIntegerForKey("shilong.shengming",self.shengming)

    global.utils.sound.playBgMusic("game/shilong/sound/bgm.mp3")
    local hightscore = cc.UserDefault:getInstance():getIntegerForKey("shilong.hightscore")
    self.mView['best']:setString("BEST:"..hightscore)
    self.mView['best']:setColor(fontcolor)
    self.mView['survival_text']:setColor(fontcolor)
    self.mView['class_text']:setColor(fontcolor)

    self.initSound()
end
function MainScene:initSound()
    local effect = global.saveTools.getData("shilong_effectPercent")
    local music = global.saveTools.getData("shilong_musicPercent")
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

function MainScene:onClassic()
    print("跳转经典模式")
    classicScene.new():showWithScene()
end

function MainScene:onSurvival()
    print("跳转计时模式")
    survivalScene.new():showWithScene()
end


function MainScene:onBtnSetClick()
    -- Setting.new():showWithScene()
    local view = Setting.new()
    global.viewMgr.showView(view, true)
end

function MainScene:onBtnScoreClick()
    -- Score.new():showWithScene()
    local view = Score.new()
    global.viewMgr.showView(view, true)
end

-- function MainScene:onBtnSetClick()
--     -- Setting.new():showWithScene()
--     local view = Setting.new()
--     global.viewMgr.showView(view, true)
-- end

function MainScene:onBtnFeedBackClick()
    -- Score.new():showWithScene()
    local view = FeedBack.new()
    global.viewMgr.showView(view, true)
end

function MainScene:onBtnNoticeClick()
    -- Score.new():showWithScene()
    local view = Notice.new()
    global.viewMgr.showView(view, true)
end

function MainScene:onBtnRuleClick()
    -- Score.new():showWithScene()
    local view = Rule.new()
    global.viewMgr.showView(view, true)
end

function MainScene:onBtnValueClick()
    -- Score.new():showWithScene()
    local view = Value.new()
    global.viewMgr.showView(view, true)
end

return MainScene