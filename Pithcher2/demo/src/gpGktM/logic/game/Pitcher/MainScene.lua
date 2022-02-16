local MainScene = class("MainScene", cc.load("mvc").ModuleBase)
MainScene.RESOURCE_FILENAME = "game/Pitcher/MainScene.csb"
local GameScene = require("logic.game.Pitcher.GameScene")
local RuleScene = require("logic.game.Pitcher.RuleLayer")



MainScene.behavior ={
    "logic.common.behavior.BtnBinder",
    "logic.common.behavior.TouchInterrupt",
    "logic.common.behavior.Listener",
}
local SoundPath = "game/Pitcher/sound/"  --音乐路径
local sound = {
    kaishi = "01.mp3",
    pengzhuang = "02.mp3",
    jinqiu = "05.mp3",
    jieshu = "11.mp3",
    bgm = "bgm.mp3"
}
function MainScene:onCreate()
    audio.playMusic(SoundPath  ..  sound.bgm,true)
end
--跳转游戏界面
function MainScene:onbeganClick()
    GameScene.new():showWithScene1(nil,1,nil,{physics = 1})
    -- require("logic.game.Pitcher.GameScene2").new():showWithScene()
end
--显示规则
function MainScene:onruleClick()
    print("显示规则")
    local rule = RuleScene.new()
    self:addChild(rule)
    rule:setVisible(true)
end

return MainScene