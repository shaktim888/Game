local AccountLayer = class("AccountLayer", cc.load("mvc").ModuleBase)
AccountLayer.RESOURCE_FILENAME = "game/ligatureFootball/AccountLayout.lua"

local CURRENT_LEVEL_KEY = "_CURRENT_LEVEL_KEY"

function AccountLayer:onCreate(status,level)
    self.mView["btn_menu"]:addTouchEventListener(handler(self,self.onMenuClick))
    self.mView["btn_restart"]:addTouchEventListener(handler(self,self.onRestartClick))
    self.mView["btn_next"]:addTouchEventListener(handler(self,self.onNextClick))
    self.mView["btn_again"]:addTouchEventListener(handler(self,self.onAgainClick))
    self.mView["pauseNode"]:setVisible(false)
    self.mView["winNode"]:setVisible(false)
    self.mView["loseNode"]:setVisible(false)
    if status == "pause" then
        self.mView["pauseNode"]:setVisible(true)
    elseif status == "win" then
        global.utils.sound.playSound("game/ligatureFootball/sound/oh.wav")
        self.mView["winNode"]:setVisible(true)
    else
        global.utils.sound.playSound("game/ligatureFootball/sound/xu.wav")
        self.mView["loseNode"]:setVisible(true)
    end

    self.currentLevel = level
end

function AccountLayer:onRestartClick()
    global.utils.sound.playSound("game/ligatureFootball/sound/click.wav")
    local shareDirector = cc.Director:getInstance()
    shareDirector:resume()
    self:removeFromParent()
end

function AccountLayer:onAgainClick()
    global.utils.sound.playSound("game/ligatureFootball/sound/click.wav")
    local gameLayer = require("logic.game.ligatureFootball.gameLayer")
    local view = gameLayer.new(nil,nil,self.currentLevel)
    global.viewMgr.showView(view, true)

end

function AccountLayer:onNextClick()
    global.utils.sound.playSound("game/ligatureFootball/sound/click.wav")
    local nextLevel = self.currentLevel + 1
    local histortLevel  = global.saveTools.getData(CURRENT_LEVEL_KEY)
    if histortLevel < nextLevel then
        global.saveTools.saveData(CURRENT_LEVEL_KEY,nextLevel)
    end

    --已通关
    if self.currentLevel == 49 then
        nextLevel = 49
        global.saveTools.saveData(CURRENT_LEVEL_KEY,49)
    end
    
    local gameLayer = import("logic.game.ligatureFootball.gameLayer")
    local view = gameLayer.new(nil,nil,nextLevel)
    global.viewMgr.showView(view, true)

end

function AccountLayer:onMenuClick()
    global.utils.sound.playSound("game/ligatureFootball/sound/click.wav")
    local shareDirector = cc.Director:getInstance()
    shareDirector:resume()
    local gameLayer = import("logic.game.ligatureFootball.chooseLayer")
    local view = gameLayer.new()
    global.viewMgr.showView(view, true)
end

return AccountLayer