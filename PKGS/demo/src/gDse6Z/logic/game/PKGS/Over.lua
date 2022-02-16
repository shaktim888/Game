-- 场景资源加载
local GameOverLayer = class("GameOverLayer", cc.load("mvc").ModuleBase)
GameOverLayer.RESOURCE_FILENAME = "game/PKGS/Over.csb"
local viewJump = require("logic.common.views.viewJump")

-- 事件行为加载
GameOverLayer.behavior ={
    "logic.common.behavior.BtnBinder",
    "logic.common.behavior.TouchInterrupt", 
    "logic.common.behavior.Listener",
    "logic.common.behavior.BlackHover",
}

-- 场景初始创建
function GameOverLayer:onCreate()
 
    self.butReplay      = self.mView["butReplay"]
    self.butHome        = self.mView["butHome"]
    self.textCombo      = self.mView["textCombo"]
    self.textScore      = self.mView["textScore"]
  
end

GameOverLayer.btnBind = {
    butHome     = "onButHome",
    butReplay   = "onButReplay"
}

function GameOverLayer:onButHome()
    CCDirector:getInstance():resume()
    viewJump.gotoMainGame()
end

function GameOverLayer:onButContinue()
    self:setVisible(false)
    CCDirector:getInstance():resume()
end

function GameOverLayer:init(gameScene,title)
    self.gameScene = gameScene
end

function GameOverLayer:OnButBaseClick(but,callback)
    if but:getActionByTag(1) == nil then
        audio.playSound("PKGS/game/music/but_se.mp3",false)
        local blowUp   = cc.ScaleBy:create(0.3,1.3)
        local blowDown = blowUp:reverse()
        local cb       = cc.CallFunc:create(callback)
        local but_anim = cc.Sequence:create(blowUp,blowDown,cb)
        but_anim:setTag(1)
        but:runAction(but_anim)
    end
end

function GameOverLayer:onButReplay()
    self.gameScene:onReplay()
    self:onButContinue()
end


function GameOverLayer:onUpdate()
    local ud = cc.UserDefault:getInstance()
    self.textCombo:setString(ud:getIntegerForKey("highCombo1" ))
    self.textScore:setString(ud:getIntegerForKey("highScore1" ))
end

return GameOverLayer
