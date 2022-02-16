local Game = class("Game", cc.load("mvc").ModuleBase)

Game.RESOURCE_FILENAME = "game/doushouqi/doushouqi.csb"

Game.behavior ={
    "logic.game.doushouqi.logic.uiControl",
    "logic.game.doushouqi.logic.stateControl",
    "logic.game.doushouqi.logic.player",
    "logic.game.doushouqi.logic.AI",
}

function Game:onbtnRetryClick()
    Game.new():showWithScene()
end

function Game:onbtnBackClick()
    -- todo: 弹出确认框
    global.viewJump.gotoDouShouqi()
end

function Game:onCreate()
    self.mView["soundOff"]:setVisible(true)
    self.mView["soundOn"]:setVisible(false)
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

return Game