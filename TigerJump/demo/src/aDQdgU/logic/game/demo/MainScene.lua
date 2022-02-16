local MainScene = class("MainScene", cc.load("mvc").ModuleBase)
MainScene.RESOURCE_FILENAME = "game/sharkfish/MainScene.lua"

local GameScene = require("logic.game.sharkfish.GameScene")
local RuleLayer = require("logic.game.sharkfish.RuleLayer")
MainScene.behavior ={
    "logic.common.behavior.BtnBinder",
    "logic.common.behavior.TouchInterrupt",
    "logic.common.behavior.Listener",
}

MainScene.btnBind = {
    rule = "onRule",
    start = "onStart",
}

function MainScene:onCreate()
    -- cc.SimpleAudioEngine:getInstance():playMusic("game/sharkfish/image/backSound.mp3", true)
    -- SimpleAudioEngine sharedEngine] stopBackgroundMusic
end

function MainScene:onStart()
    print("开始")
    CCDirector.sharedDirector():resume()
    GameScene.new():showWithScene()
end
function MainScene:onRule()
    print("显示规则")
    local rule = RuleLayer.new()
    self:addChild(rule)
    rule:setVisible(true)
end


return MainScene