local Select = class("Select", cc.load("mvc").ModuleBase)
Select.RESOURCE_FILENAME = "game/LongHuDou/Select.lua"
local Level = require("logic.game.LongHuDou.Level")
local Help = require("logic.game.LongHuDou.Help")
local cfg = require("logic.game.LongHuDou.cfg.cfg")
local MusicBtnImagePath = "game/LongHuDou/images/hall/"

Select.behavior ={
    "logic.common.behavior.BtnBinder",
    "logic.common.behavior.FontColorChange",
}
Select.changecolorfont = {
    best = {},
    last = {}
}
local SelectRole
function Select:onCreate()
    self.isOpenMusic = true
    self:init()
    
end 

function Select:init()
    SelectRole = {cfg.LONG,cfg.HU}
    self:bVisibleLongClick(true)
end



function Select:onlongBtnClick()
    AudioEngine.playEffect(cfg.Sound.click,false)
    SelectRole = {cfg.LONG,cfg.HU}
    self:bVisibleLongClick(true)
end

function Select:onhuBtnClick()
    AudioEngine.playEffect(cfg.Sound.click,false)
    SelectRole = {cfg.HU,cfg.LONG}
    self:bVisibleLongClick(false)
end

function Select:onstartBtnClick()
    AudioEngine.playEffect(cfg.Sound.click,false)
    Level.new(nil,nil,SelectRole):showWithScene()
end

function Select:bVisibleLongClick(bShowLong)
    self.mView["longBtn"]:getChildByName("click"):setVisible(bShowLong)
    self.mView["huBtn"]:getChildByName("click"):setVisible(not bShowLong)
end


function Select:onexitBtnClick()
    AudioEngine.playEffect(cfg.Sound.click,false)
    global.viewJump.gotofishJump()
end

return Select
