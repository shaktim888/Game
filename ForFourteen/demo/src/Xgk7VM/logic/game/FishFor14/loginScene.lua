local LoginScene = class("LoginScene", cc.load("mvc").ModuleBase)
LoginScene.RESOURCE_FILENAME = "game/FishFor14/LoginScene.lua"
print("你进入了登录界面")
local gameScene = require("logic.game.FishFor14.gameScene")
local ruleLayer = require("logic.game.FishFor14.ruleLayer")
LoginScene.behavior ={
    "logic.common.behavior.BtnBinder",
    "logic.common.behavior.TouchInterrupt",
    "logic.common.behavior.Listener",
    "logic.common.behavior.FontColorChange",
}
    
LoginScene.changecolorfont = {
    best = {}
}

function LoginScene:onCreate()
    self.startBtn = self.mView["startBtn"]
    self.ruleBtn = self.mView["ruleBtn"]

    
    --播放背景音乐
    audio.playMusic("game/FishFor14/sound/bgm.mp3",true)
    self:isRecord()

    local score = cc.UserDefault:getInstance():getIntegerForKey("fishHightScore")
    self.mView['best']:setString("BEST:"..score)
end

function LoginScene:isRecord()
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
LoginScene.btnBind = {
    startBtn = "startClick",
    ruleBtn = "ruleClick",
}

function LoginScene:startClick()
    print("你点击了开始按钮");
    AudioEngine.playEffect("game/FishFor14/sound/Button.wav",false)
    local UIgameScene = gameScene:create()
    UIgameScene:showWithScene()
    --audio.stopMusic("game/FishFor14/sound/bgm.mp3")
  
end
--规则按钮点击事件
function  LoginScene:ruleClick()
    AudioEngine.playEffect("game/FishFor14/sound/Button.wav",false)
    print("你点击了规则按钮");
    local rule = ruleLayer:create()
    self:addChild(rule)
    local size = rule:getContentSize()
    rule:setPosition(display.cx-size.width/2,display.cy-size.height/2)
end



return LoginScene
