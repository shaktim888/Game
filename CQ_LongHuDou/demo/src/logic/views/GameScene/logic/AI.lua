local AI = class("AI", cc.load("mvc").BehaviorBase)
-- local cfg = require("logic.game.LongHuDou.cfg.cfg")
local cfg = require("logic.views.GameScene.cfg.cfg")


local MOVEX = 350
function AI:AIRound()

    self.isKill = false
    self.isDefenseSuccess = false
    self.roleMap[self.iAIIDx]:getChildByName("bg"):setColor(cc.c3b(255, 255, 255))
    self.roleMap[self.iAIIDx]:getChildByName("yun"):setVisible(false)
    global.async.delay(1):Then(function()
        self._bAIAattck = true
        AudioEngine.playEffect(cfg.Sound.attack, false)
    end)
end

function AI:playerRound()
    self.randAIDefenseTime = 0
    self._bAIAattck = false
    
    
end




return AI
