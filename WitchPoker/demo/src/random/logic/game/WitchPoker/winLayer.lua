local winLayer = class("winLayer", cc.load("mvc").ModuleBase)
winLayer.RESOURCE_FILENAME = "game/WitchPoker/WinLayer.lua"
local Shuffle = cc.load("tools").Shuffle
winLayer.behavior ={
    "logic.common.behavior.BtnBinder",
    "logic.common.behavior.TouchInterrupt",
    "logic.common.behavior.Listener"
}
--创建界面
function winLayer:onCreate()
    
    self.winText = self.mView["winText"]
    self.winText:setVisible(false)
    self.loseText = self.mView["loseText"]
    self.againBtn = self.mView["againBtn"]
    self.nextBtn = self.mView["nextBtn"]
    self.nextBtn:setVisible(false)
    self.mainBtn = self.mView["mainBtn"]
  
end
--
winLayer.btnBind = {
    againBtn = "againClick",
    nextBtn = "nextClick",
    mainBtn = "mainClick"
   
}

function winLayer:nextClick()
    print("你点击了下一关按钮")
    AudioEngine.playEffect("game/WitchPoker/sound/Button.wav",false)
    self:setVisible(false)
    global.event.emit("NextLevel")
end

function winLayer:againClick()
    print("你点击了重新开始按钮")
    AudioEngine.playEffect("game/WitchPoker/sound/Button.wav",false)
    self:setVisible(false)
    global.event.emit("AgainStart")
    
end

function winLayer:mainClick()
    print("你点击了返回登录场景")
    AudioEngine.playEffect("game/WitchPoker/sound/Button.wav",false)
    global.event.emit("LoginScene")
    
end




function winLayer:isShowWin(isWin)
    if isWin then
        self.nextBtn:setVisible(true)
        self.winText:setVisible(true)
        self.loseText:setVisible(false)
    else
        self.nextBtn:setVisible(false)
        self.winText:setVisible(false)
        self.loseText:setVisible(true)
    end
    
end

return winLayer
