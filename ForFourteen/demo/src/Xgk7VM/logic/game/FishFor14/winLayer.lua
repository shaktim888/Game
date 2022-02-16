local winLayer = class("winLayer", cc.load("mvc").ModuleBase)
winLayer.RESOURCE_FILENAME = "game/FishFor14/WinLayer.lua"
local Shuffle = cc.load("tools").Shuffle
winLayer.behavior ={
    "logic.common.behavior.BtnBinder",
    "logic.common.behavior.TouchInterrupt",
    "logic.common.behavior.Listener"
}
--创建界面
function winLayer:onCreate()
    
    self.againBtn = self.mView["againBtn"]
    self.mainBtn = self.mView["mainBtn"]
    self.scoreText = self.mView["scoreText"]
    
   
end
--
winLayer.btnBind = {
    againBtn = "againClick",
    mainBtn = "mainClick"
}



function winLayer:againClick()
    print("你点击了重新开始按钮")
    AudioEngine.playEffect("game/FishFor14/sound/Button.wav",false)
    self:setVisible(false)
    global.event.emit("AgainStart")
    
end

function winLayer:mainClick()
    print("你点击了返回登录场景")
    AudioEngine.playEffect("game/FishFor14/sound/Button.wav",false)
    global.event.emit("LoginScene")
    
end


function winLayer:setData(data)
    self.scoreText:setString(data)
    local score = cc.UserDefault:getInstance():getIntegerForKey("fishHightScore")
    if score <= data then
        score = data
        cc.UserDefault:getInstance():setIntegerForKey("fishHightScore", score)
    end
end




return winLayer
