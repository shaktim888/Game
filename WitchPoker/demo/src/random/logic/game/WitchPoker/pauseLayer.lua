local PauseLayer = class("PauseLayer", cc.load("mvc").ModuleBase)
PauseLayer.RESOURCE_FILENAME = "game/WitchPoker/PauseLayer.lua"
print("你进入了暂停界面")
--local gameScene = require("logic.game.WitchPoker.gameScene")
PauseLayer.behavior ={
    "logic.common.behavior.BtnBinder",
    "logic.common.behavior.TouchInterrupt",
    "logic.common.behavior.Listener",
}

function PauseLayer:onCreate()
    
    self.continueBtn = self.mView["continueBtn"]
    self.restartBtn = self.mView["restartBtn"]
    self.exitBtn = self.mView["exitBtn"]

end

--按钮事件绑定
PauseLayer.btnBind = {
    continueBtn = "continueBtnClick",
    restartBtn = "restartBtnClick",
    exitBtn = "exitBtnClick" 
}
function PauseLayer:continueBtnClick()
    AudioEngine.playEffect("game/WitchPoker/sound/Button.wav",false)
    self:setVisible(false)
    global.event.emit("ResumeTime")
    
end
function PauseLayer:restartBtnClick()
    print("你点击了重新开始按钮")
    AudioEngine.playEffect("game/WitchPoker/sound/Button.wav",false)
    self:setVisible(false)
    global.event.emit("AgainStart")
end
function PauseLayer:exitBtnClick()
    print("你点击了返回登录场景")
    AudioEngine.playEffect("game/WitchPoker/sound/Button.wav",false)
    global.event.emit("LoginScene")
end
return  PauseLayer

