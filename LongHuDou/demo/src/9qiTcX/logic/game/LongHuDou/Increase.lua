local Increase = class("Increase", cc.load("mvc").ModuleBase)
Increase.RESOURCE_FILENAME = "game/LongHuDou/Increase.lua"
Increase.behavior ={
    "logic.common.behavior.FontColorChange",
}

Increase.changecolorfont = {
    text = {}
}
local cfg = require("logic.game.LongHuDou.cfg.cfg")

function Increase:onCreate(text,mode)
    
end

function Increase:onbtnAddClick()
    AudioEngine.playEffect(cfg.Sound.click,false)
end

function Increase:onbtnNoClick()
    AudioEngine.playEffect(cfg.Sound.click,false)
    self:removeFromParent(true)
end

function Increase:onbtnRestartClick()
    AudioEngine.playEffect(cfg.Sound.click,false)
    local localSave = global.saveTools.getData(cfg.LocalSave)
    local game = require("logic.game.LongHuDou.Game")
    game.new(nil,nil,localSave.curlevel,localSave.select):showWithScene()
end

function Increase:onbtnHomeClick()
    AudioEngine.playEffect(cfg.Sound.click,false)
    global.viewJump.gotofishJump()
end

-- function Increase:onbtnBigNextClick()
    
-- end

function Increase:onbtnNextClick()
    local localSave = global.saveTools.getData(cfg.LocalSave)
    if( localSave.curlevel >= localSave.level ) then
        localSave.level = localSave.curlevel + 1
    end
    localSave.curlevel = localSave.curlevel + 1
    global.saveTools.saveData(cfg.LocalSave, localSave)
    local game = require("logic.game.LongHuDou.Game")
    game.new(nil,nil,localSave.curlevel,localSave.select):showWithScene()
end

return  Increase

