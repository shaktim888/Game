local Game = class("Game", cc.load("mvc").ModuleBase)
local about = import(".about")

Game.RESOURCE_FILENAME = "game/cattleRun/cattleRun.lua"

Game.behavior = {
    "logic.game.cattleRun.logic.uiControl",    
    "logic.game.cattleRun.logic.stateControl",
    "logic.game.cattleRun.logic.player",
}

function Game:onbtnRetryClick()
    -- Game.new():showWithScene()
    print("Game cattleRun!")
    self:nextPlate()
end

function Game:onbtnBackClick()
    -- todo: 弹出确认框

    self:stopFall()
    
    global.viewJump.gotoCattleRun()
end

function Game:onbtnAboutClick()
    print("onbtnAboutClick")
    local view = about.new()
    global.viewMgr.showView(view, true)
end

function Game:onCreate()
    self.mView["soundOff"]:setVisible(true)
    self.mView["soundOn"]:setVisible(false)
    global.utils.sound.playBgMusic("game/cattleRun/sound/bgm.mp3")
end

function Game:onsoundOffClick()
    self.mView["soundOff"]:setVisible(false)
    self.mView["soundOn"]:setVisible(true)
    global.utils.sound.stopAllSound()
    global.utils.sound.pauseMusic()
end

function Game:onsoundOnClick()
    self.mView["soundOff"]:setVisible(true)
    self.mView["soundOn"]:setVisible(false)
    global.utils.sound.unStopAllSound()
    global.utils.sound.resumeMusic()                                                                                                                                                                   
end

function Game:onbtnStartClick(sender_)
    print("===Game:onbtnStartClick==")

    self:start()
    -- sender_:setVisible(false)
    self.mView["mainPnl"]:setVisible(false)
    self.mView["score_num"]:setString(0)
end

-- function Game:start()
--     print("Game:start")
-- end

return Game