local winLayer = class("winLayer", cc.load("mvc").ModuleBase)
winLayer.RESOURCE_FILENAME = "game/DiamondMemory/WinLayer.lua"
local Shuffle = cc.load("tools").Shuffle
winLayer.behavior ={
    "logic.common.behavior.BtnBinder",
    --"logic.common.behavior.WidgetRandomGroup",
    "logic.common.behavior.FontColorChange"
}
winLayer.changecolorfont = {
    againBtn = {},
    mainBtn = {}
}

winLayer.groupMap = {
    {"mainBtn","againBtn"},
}

--创建界面
function winLayer:onCreate()
    
    self.winText = self.mView["winText"]

    self.levelText = self.mView["levelText"]
    
    self.againBtn = self.mView["againBtn"]
    
    self.mainBtn = self.mView["mainBtn"]
  
end
--
winLayer.btnBind = {
    againBtn = "againClick",
    mainBtn = "mainClick" 
}

function winLayer:againClick()
    print("你点击了重新开始按钮")
    AudioEngine.playEffect("game/DiamondMemory/sound/Button.wav",false)
    self:setVisible(false)
    global.event.emit("AgainStart")
    
end

function winLayer:mainClick()
    print("你点击了返回登录场景")
    AudioEngine.playEffect("game/DiamondMemory/sound/Button.wav",false)
    global.event.emit("LoginScene")
end

function winLayer:addData(data)
    self.levelText:setString(data)
    local score = cc.UserDefault:getInstance():getIntegerForKey("DiamondMemoryHightScore")
    if score <= data then
        score = data
        cc.UserDefault:getInstance():setIntegerForKey("DiamondMemoryHightScore", score)
    end
end




return winLayer
