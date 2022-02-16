local Main = class("Main", cc.load("mvc").ModuleBase)
Main.RESOURCE_FILENAME = "game/GuardCastle/Main.csb"
local Game = require("logic.game.GuardCastle.Game")
local cfg = require("logic.game.GuardCastle.cfg.cfg")
local MusicBtnImagePath = "game/GuardCastle/images/hall/"

Main.behavior ={
    "logic.common.behavior.BtnBinder",
    "logic.common.behavior.FontColorChange",
    "logic.common.behavior.MusicIsOpen"
}

Main.music_is_open = {
    musicBtn = {
        open  = MusicBtnImagePath.."but_on.png",
        close = MusicBtnImagePath.."but_off.png",
        bgm = cfg.Sound.bgm
    }
}

function Main:onCreate()
    self:initPlayerInfo()
end

function Main:onrandNameBtnClick()
    self:randToPlayerName()
end

function Main:initPlayerInfo()
    local  _aSaveInfo = global.saveTools.getData(cfg.PLAYER_INFO_SAVE_TO_LOCAL) or {}
    if not _aSaveInfo or not _aSaveInfo.sex or not _aSaveInfo.name then
        self.sex = 1
        self:randToPlayerName()
    else
        self.sex = _aSaveInfo.sex
        self.randName = _aSaveInfo.name
        self:setPlayerSexAndName()
    end
end

function Main:randToPlayerName()
    local txt = "game/GuardCastle/txt/name.txt"
    local name = cc.FileUtils:getInstance():getStringFromFile(txt);
    local a = name.split(name, "\n")
    local randName = a[math.random(1,#a)]
    self.randName = randName
    self.mView["roleName"]:setString(self.randName)
end

function Main:onbtnManClick()
    self.sex = 1
    self:setPlayerSexAndName()
    self:savePlayerInfoToLocal()
end

function Main:onbtnWomanClick()
    self.sex = 2
    self:setPlayerSexAndName()
    self:savePlayerInfoToLocal()
end


function Main:setPlayerSexAndName()
    if self.sex == 1 then
        self.mView["flushMan"]:setVisible(true)
        self.mView["flushWoman"]:setVisible(false)
        self.mView["role"]:loadTexture(cfg._sImagePath_.."select/role_1.png")
    else
        self.mView["flushWoman"]:setVisible(true)
        self.mView["flushMan"]:setVisible(false)
        self.mView["role"]:loadTexture(cfg._sImagePath_.."select/role_2.png")
    end
    self.mView["roleName"]:setString(self.randName)
end

function Main:onbtnPlayClick()
    self:savePlayerInfoToLocal()
    Game.new():showWithScene()
end

function Main:savePlayerInfoToLocal()
    local info = {name = self.randName, sex = self.sex}
    global.saveTools.saveData(cfg.PLAYER_INFO_SAVE_TO_LOCAL, info)
end

return Main
