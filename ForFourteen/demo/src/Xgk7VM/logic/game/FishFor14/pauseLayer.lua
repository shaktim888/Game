local PauseLayer = class("PauseLayer", cc.load("mvc").ModuleBase)
PauseLayer.RESOURCE_FILENAME = "game/FishFor14/PauseLayer.lua"
print("你进入了暂停界面")
--local gameScene = require("logic.game.FishFor14.gameScene")
PauseLayer.behavior ={
    "logic.common.behavior.BtnBinder",
    "logic.common.behavior.TouchInterrupt",
    "logic.common.behavior.Listener",
}

function PauseLayer:onCreate()
    
    self.continueBtn = self.mView["continueBtn"]
    self.exitBtn = self.mView["exitBtn"]

end

--按钮事件绑定
PauseLayer.btnBind = {
    continueBtn = "continueBtnClick",
   
    exitBtn = "exitBtnClick" 
}
function PauseLayer:continueBtnClick()
    AudioEngine.playEffect("game/FishFor14/sound/Button.wav",false)
    self:setVisible(false)
   

end

function PauseLayer:exitBtnClick()
    print("你点击了返回登录场景")
    AudioEngine.playEffect("game/FishFor14/sound/Button.wav",false)
    global.event.emit("LoginScene")
end
return  PauseLayer

