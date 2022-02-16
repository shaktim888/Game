local winLayer = class("winLayer", cc.load("mvc").ModuleBase)
winLayer.RESOURCE_FILENAME = "game/knight/balance.lua"
local knight = import(".knight")
local Shuffle = cc.load("tools").Shuffle

winLayer.behavior ={
    "logic.common.behavior.FontColorChange",
}

winLayer.changecolorfont = {
    mainBtn= {},
    againBtn = {}
}
--创建界面
function winLayer:onCreate()
    
end
function winLayer:setData(score)
    print(score)
   self.mView["score"]:setString(tostring(score))
end
function winLayer:onagainBtnClick()
    AudioEngine.playEffect("game/knight/sound/Button.mp3",false)
    knight.new():showWithScene1(nil,1,nil,{physics = 1})
end

function winLayer:onmainBtnClick()
    AudioEngine.playEffect("game/knight/sound/Button.mp3",false)
    global.viewJump.gotoMainGame()
    
end

return winLayer
