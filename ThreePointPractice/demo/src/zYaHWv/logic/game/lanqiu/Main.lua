local GameScene = require("logic.game.lanqiu.Game")
-- local LuaScene = require ("logic.game.lanqiu.LuaScene")
local MainScene = class("MainScene", cc.load("mvc").ModuleBase)
local ruleLayer = require("logic.game.lanqiu.RuleLayer")

MainScene.RESOURCE_FILENAME = "game/basketball/MainScene.lua"

MainScene.behavior = {
    "logic.common.behavior.BtnBinder",
    "logic.common.behavior.TouchInterrupt",
    "logic.common.behavior.Listener",
    "logic.common.behavior.FontColorChange",
}

MainScene.changecolorfont = {
    best = {},
}

--按钮触发事件
MainScene.btnBind = {
    began = "onBegan",
    help = "onHelp",
}

function MainScene:onCreate()
    -- self.panel = self.mView['panel']
    -- self.panel:addTouchEventListener(function(sender,eventType)
    --     if eventType == ccui.TouchEventType.ended then
    --         self:RuleClose()
    --     end
    -- end)
    self.Rule = ruleLayer:create()
    self:addChild(self.Rule)
    local size = self.Rule:getContentSize()
    self.Rule:setPosition(display.cx - size.width / 2, display.cy - size.height / 2)
    self.Rule:setVisible(false)
    local score = cc.UserDefault:getInstance():getIntegerForKey("self.hight")
    self.mView['best']:setString("BEST:"..score)
end

function MainScene:onBegan()
    print("跳转游戏界面")
    local gameScene = GameScene.new();
    gameScene:showWithScene();
end

function MainScene:onHelp()
    -- local luaScene = LuaScene.new();
    -- luaScene:showWithScene();
    print("显示规则")
    -- self.panel:setVisible(true)
    self.Rule:setVisible(true)
end

function MainScene:RuleClose()
    print("关闭规则")
    -- self.panel:setVisible(false)
    self.Rule:setVisible(false)
end

return MainScene