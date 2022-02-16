local player = class("player", cc.load("mvc").BehaviorBase)
local attackEnable = false
local defenseEnable = false
local cfg = require("logic.game.LongHuDou.cfg.cfg")
function player:onClickBtnDefense()
    if not defenseEnable then return end
    AudioEngine.playEffect(cfg.Sound.click,false)

    self.isDefense = true
    self.roleMap[self.iPlayerIDx]:getChildByName("shield"):setVisible(true)
    
    global.async.delay(0.1):Then(function()
        self.roleMap[self.iPlayerIDx]:getChildByName("shield"):setVisible(false)
        self.isDefense = false
        print("预防失效")
    end)
    self.roleMap[self.iPlayerIDx]:getChildByName("btnDefense"):setEnabled(false)

end

function player:onClickBtnAttack()
    if not attackEnable then return end
    AudioEngine.playEffect(cfg.Sound.attack,false)
    self.bPlayerAttack = true
    self.roleMap[self.iPlayerIDx]:getChildByName("btnAttack"):setEnabled(false)
end

function player:playerRound()
    print("wanjai")
    defenseEnable = false
    attackEnable = true
    self.roleMap[self.iPlayerIDx]:getChildByName("btnDefense"):setEnabled(false)
    self.roleMap[self.iPlayerIDx]:getChildByName("btnAttack"):setEnabled(true)
    global.async.delay(2):Then(function()
        if self.bPlayerAttack == false  and self.round == "player" then
            self:switch()
        end
    end)

    
end

function player:AIRound()
    print("ai")

    defenseEnable = true
    attackEnable = false
    self.bStopPlayerMove = false
    self.bPlayerAttack = false
    self.isDefense = false
    self.roleMap[self.iPlayerIDx]:getChildByName("btnDefense"):setEnabled(true)
    self.roleMap[self.iPlayerIDx]:getChildByName("btnAttack"):setEnabled(false)
end

return player
