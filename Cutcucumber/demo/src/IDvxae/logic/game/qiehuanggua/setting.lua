local Setting = class("Setting", cc.load("mvc").ModuleBase)

Setting.RESOURCE_FILENAME = "game/qiehuanggua/setting.lua"

Setting.behavior = {
    "logic.common.behavior.ClickToClose",
}

function Setting:onCreate()
    self.mView["btnMusicOn"]:setVisible(global.utils.sound.isMusicStopped())
    self.mView["btnMusicOff"]:setVisible(not global.utils.sound.isMusicStopped())
    self.mView["btnSoundOn"]:setVisible(global.utils.sound.isSoundStopped())
    self.mView["btnSoundOff"]:setVisible(not global.utils.sound.isSoundStopped())
    local info = global.saveTools.getData("qhg_sound") or {}
    if next(info) ~= nil then
        if info.music ~= nil then
            if info.music then
                self.mView["btnMusicOff"]:setVisible(true)
                self.mView["btnMusicOn"]:setVisible(false)
            else
                self.mView["btnMusicOff"]:setVisible(false)
                self.mView["btnMusicOn"]:setVisible(true)
            end
        end
        if info.effect ~= nil then
            if info.effect then
                self.mView["btnSoundOff"]:setVisible(true)
                self.mView["btnSoundOn"]:setVisible(false)
            else
                self.mView["btnSoundOff"]:setVisible(false)
                self.mView["btnSoundOn"]:setVisible(true)
            end 
        end 
    end
end

function Setting:onbtnMusicOffClick()
    self.mView["btnMusicOff"]:setVisible(false)
    self.mView["btnMusicOn"]:setVisible(true)
    global.utils.sound.pauseMusic()
    local info = global.saveTools.getData("qhg_sound") or {}
    info.music = false
    global.saveTools.saveData("qhg_sound", info)
end

function Setting:onbtnMusicOnClick()
    self.mView["btnMusicOff"]:setVisible(true)
    self.mView["btnMusicOn"]:setVisible(false)
    global.utils.sound.resumeMusic()
    local info = global.saveTools.getData("qhg_sound") or {}
    info.music = true
    global.saveTools.saveData("qhg_sound", info)
end

function Setting:onbtnSoundOffClick()
    self.mView["btnSoundOff"]:setVisible(false)
    self.mView["btnSoundOn"]:setVisible(true)
    global.utils.sound.stopAllSound()
    local info = global.saveTools.getData("qhg_sound") or {}
    info.effect = false
    global.saveTools.saveData("qhg_sound", info)
end

function Setting:onbtnSoundOnClick()
    self.mView["btnSoundOff"]:setVisible(true)
    self.mView["btnSoundOn"]:setVisible(false)
    global.utils.sound.unStopAllSound()
    local info = global.saveTools.getData("qhg_sound") or {}
    info.effect = true
    global.saveTools.saveData("qhg_sound", info)
end

return Setting