local MainScene = class("MainScene", cc.load("mvc").ModuleBase)
MainScene.RESOURCE_FILENAME = "game/huangcheng/MainScene.lua"

local GameScene = require("logic.game.huangcheng.GameScene")
-- local RuleLayer = require("logic.game.huangcheng.RuleLayer")
MainScene.behavior ={
    "logic.common.behavior.BtnBinder",
    "logic.common.behavior.TouchInterrupt",
    "logic.common.behavior.Listener",
}

MainScene.btnBind = {

    start = "onStart",
}

function MainScene:onCreate()
    self.level = 1
    self.score = 0
    cc.UserDefault:getInstance():setIntegerForKey("self.level",self.level)
    cc.UserDefault:getInstance():setIntegerForKey("self.score",self.score)
end

function MainScene:onStart()
    print("开始游戏")
    CCDirector.sharedDirector():resume()
    GameScene.new():showWithScene()
    -- GameScene.new():showWithPhysicsScene()
end



return MainScene