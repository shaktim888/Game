local pause = class("pause", cc.load("mvc").ModuleBase)
pause.RESOURCE_FILENAME = "game/knight/pause.lua"


pause.groupMap = {
    {"continueBtn", "musicBtn", "restartBtn", "homeBtn"},
} 

pause.behavior ={
    "logic.common.behavior.FontColorChange",
}

pause.changecolorfont = {
    continueBtn= {},
    musicBtn = {},
    restartBtn = {},
    homeBtn = {}
}

function pause:oncontinueBtnClick()
    AudioEngine.playEffect("game/knight/sound/Button.mp3",false)
    self:setVisible(false)
end

function pause:onmusicBtnClick()
    AudioEngine.playEffect("game/knight/sound/Button.mp3",false)
    self.musicBtn = self.mView["musicBtn"]
    AudioEngine.playEffect("game/knight/sound/Button.mp3",false)
    if global.utils.sound.getMusicVolume() < 0.1 then
        self.musicBtn:setTitleText("Sound:on")
        global.utils.sound.setMusicVolume(1)
    else
        self.musicBtn:setTitleText("Sound:off")
        global.utils.sound.setMusicVolume(0)
    end
  
end


function pause:onrestartBtnClick()
    AudioEngine.playEffect("game/knight/sound/Button.mp3",false)
    game_.new():showWithScene1("RANDOM",1,nil,{physics = 1})
end

function pause:onhomeBtnClick()
    AudioEngine.playEffect("game/knight/sound/Button.mp3",false)
    global.viewJump.gotoMainGame()
end



return  pause

