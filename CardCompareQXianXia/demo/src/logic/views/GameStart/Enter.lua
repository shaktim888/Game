local GameStartLayer = class("GameStartLayer", cc.load("mvc").ModuleBase)
GameStartLayer.RESOURCE_FILENAME = "start/Start_Layer.lua"

local ManRoleImage = "start/res/role_man.png"
local WomanRoleImage = "start/res/role_woman.png"

function GameStartLayer:onCreate(_data)
    self.data = _data
    self.mView["role"]:ignoreContentAdaptWithSize(true)
    self.mView["panel_top_btn"]:setTouchEnabled(false)
 
    local panel_top_btn = require("logic/views/GameStart/TopButton").new(self,self.data.btnInfo)
    self.mView["panel_top_btn"] = panel_top_btn:getLayout()
    local btn_music =  self.mView["panel_top_btn"]:getChildByName("btn_music")
    if btn_music then
        local is_open = global.viewData.isMusicOpen()
        if is_open == global.viewData.State.Open then
            btn_music:loadTexture("common/btn_icon/btn_music_on.png")
            global.viewData:playBgMusic()
        else
            btn_music:loadTexture("common/btn_icon/btn_music_off.png")
            global.viewData:stopPlayBgMusic()
        end
    end
    self.mView["btn_music"] = btn_music
    self:initPlayerInfo()
end


function GameStartLayer:onBtnStartClick()
    self:savePlayerInfoToLocal()
    global.viewController.gotoView("game")
end

function GameStartLayer:onrandNameBtnClick()
    self:randToPlayerName()
    self:savePlayerInfoToLocal()
end

function GameStartLayer:onbtnManClick()
    self.sex = 1
    self:setPlayerSexAndName()
    self:savePlayerInfoToLocal()
end

function GameStartLayer:onbtnWomanClick()
    self.sex = 2
    self:setPlayerSexAndName()
    self:savePlayerInfoToLocal()
end

function GameStartLayer:initPlayerInfo()
    local  _aSaveInfo = global.saveTools.getData(global.viewData.PLAYER_INFO_SAVE_TO_LOCAL) or {}
   
    if not _aSaveInfo or not _aSaveInfo.sex or not _aSaveInfo.name then
        self.sex = 1
        
        
        self:randToPlayerName()
        self:setPlayerSexAndName()
    else
        self.sex = _aSaveInfo.sex
        self.randName = _aSaveInfo.name
        self:setPlayerSexAndName()
    end
    if global.isGrabScreenMode == 1 then
        local randClick = math.random()
        if randClick > 0.5 then
            self:onbtnManClick()
        else
            self:onbtnWomanClick()
        end
        self:onrandNameBtnClick()
    end
end

function GameStartLayer:randToPlayerName()
    local txt = "common/txt/name.txt"
    local name = cc.FileUtils:getInstance():getStringFromFile(txt)
    local a = name.split(name, "\n")
    math.randomseed(tostring(os.time()):reverse():sub(1, 7))
    local randName = a[math.random(1,#a)]
    self.randName = randName
    self.mView["roleName"]:setString(self.randName)
end

function GameStartLayer:setPlayerSexAndName()
    if self.sex == 1 then
        self.mView["flushMan"]:setVisible(true)
        self.mView["flushWoman"]:setVisible(false)
        self.mView["role"]:loadTexture(ManRoleImage)
    else
        self.mView["flushWoman"]:setVisible(true)
        self.mView["flushMan"]:setVisible(false)
        self.mView["role"]:loadTexture(WomanRoleImage)
    end
    self.mView["roleName"]:setString(self.randName)
end

function GameStartLayer:savePlayerInfoToLocal()
    local headImage = "start/head/head_"..self.sex..".png"
    local info = {name = self.randName, sex = self.sex, headImage = headImage}
    global.saveTools.saveData(global.viewData.PLAYER_INFO_SAVE_TO_LOCAL, info)
end

return GameStartLayer