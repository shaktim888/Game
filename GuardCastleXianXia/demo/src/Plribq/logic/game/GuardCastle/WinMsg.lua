local WinMsg = class("WinMsg", cc.load("mvc").ModuleBase)
WinMsg.RESOURCE_FILENAME = "game/GuardCastle/WinMsg.csb"
WinMsg.behavior ={
    "logic.common.behavior.FontColorChange",
}

WinMsg.changecolorfont = {
    text = {},
    -- btnRestart = {},
    -- btnHome = {}
}
local cfg = require("logic.game.GuardCastle.cfg.cfg")

function WinMsg:onCreate(text,mode)
    -- self.mView["text"]:setString(text)
    local aBtn = {}
    if mode == cfg.MSG.FAIL then
        aBtn = {false,false,true,true,false,false}
    elseif mode == cfg.MSG.EXIT then
        aBtn = {true,true,false,false,false,false}
    elseif mode == cfg.MSG.NEXT then
        aBtn = {false,false,true,false,true,false}
    elseif mode == cfg.MSG.PAUSE then
        aBtn = {false,false,false,true,false,true}
    end
    -- self.mView['btnYes']:setVisible(aBtn[1])
    -- self.mView["btnNo"]:setVisible(aBtn[2])
    self.mView["btnHome"]:setVisible(aBtn[3])
    self.mView['btnRestart']:setVisible(aBtn[4])
  
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
    local game = require("logic.game.GuardCastle.Game")
    game.new():showWithScene()
end


function WinMsg:onbtnHomeClick()
    audio.playSound(cfg.Sound.click,false)
    global.viewJump.gotofishJump()
end



return  WinMsg

