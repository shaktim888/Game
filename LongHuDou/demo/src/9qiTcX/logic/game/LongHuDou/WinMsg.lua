local WinMsg = class("WinMsg", cc.load("mvc").ModuleBase)
WinMsg.RESOURCE_FILENAME = "game/LongHuDou/WinMsg.lua"
WinMsg.behavior ={
    "logic.common.behavior.FontColorChange",
}

WinMsg.changecolorfont = {
    text = {}
}
local cfg = require("logic.game.LongHuDou.cfg.cfg")

function WinMsg:onCreate(text,mode)
    self.mView["text"]:setString(text)
    local aBtn = {}
    if mode == cfg.MSG.FAIl then
        aBtn = {false,false,true,true,false,false}
    elseif mode == cfg.MSG.EXIT then
        aBtn = {true,true,false,false,false,false}
    elseif mode == cfg.MSG.NEXT_LEVEL then
        aBtn = {false,false,true,false,true,false}
    elseif mode == cfg.MSG.PAUSE then
        aBtn = {false,false,false,true,false,true}
    end
    self.mView['btnYes']:setVisible(aBtn[1])
    self.mView["btnNo"]:setVisible(aBtn[2])
    self.mView["btnHome"]:setVisible(aBtn[3])
    self.mView['btnRestart']:setVisible(aBtn[4])
    self.mView['btnNext']:setVisible(aBtn[5])
    -- self.mView["btnBigNext"]:setVisible(aBtn[6])
end

function WinMsg:onbtnYesClick()
    AudioEngine.playEffect(cfg.Sound.click,false)
    global.viewJump.gotofishJump()
end

function WinMsg:onbtnNoClick()
    AudioEngine.playEffect(cfg.Sound.click,false)
    self:removeFromParent(true)
end

function WinMsg:onbtnRestartClick()
    AudioEngine.playEffect(cfg.Sound.click,false)
    local localSave = global.saveTools.getData(cfg.LocalSave)
    local game = require("logic.game.LongHuDou.Game")
    game.new(nil,nil,localSave.curlevel,localSave.select):showWithScene()
end

function WinMsg:onbtnHomeClick()
    AudioEngine.playEffect(cfg.Sound.click,false)
    global.viewJump.gotofishJump()
end

-- function WinMsg:onbtnBigNextClick()
    
-- end

function WinMsg:onbtnNextClick()
    local localSave = global.saveTools.getData(cfg.LocalSave)
    if( localSave.curlevel >= localSave.level ) then
        localSave.level = localSave.curlevel + 1
    end
    localSave.curlevel = localSave.curlevel + 1
    global.saveTools.saveData(cfg.LocalSave, localSave)
    local game = require("logic.game.LongHuDou.Game")
    game.new(nil,nil,localSave.curlevel,localSave.select):showWithScene()
end

return  WinMsg

