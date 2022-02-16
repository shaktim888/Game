local Game = class("Game", cc.load("mvc").ModuleBase)
-- local about = 

Game.RESOURCE_FILENAME = "game/niuniutiaozhan/niuniutiaozhan.lua"

Game.behavior = {
    "logic.game.niuniutiaozhan.logic.uiControl",    
    "logic.game.niuniutiaozhan.logic.stateControl",
    -- "logic.game.niuniutiaozhan.logic.player",
}

local obj = nil
function Game:onCreate()
    obj = self

    
end

function Game:initLabel()
    if global.isGrabScreenMode == 1 then
        self.mView['label_score']:setString(math.random(30,80))
        self.mView['label_time']:setString(math.random(5,25))
    end
end

local gametype = 1
function Game:isBaseModel()
    return (gametype == 1) or (gametype == 3)
end

function Game:isEyeModel()
    return (gametype == 2)
end

function Game:isNomissModel()
    return (gametype == 4)
end

function Game:isShowTimeModel()
    return (gametype == 5)
end

function Game:setGameType(gametype_)
    gametype = gametype_
end

function Game:onbtnRetryClick()
    -- Game.new():showWithScene()
    print("Game niuniutiaozhan!")
    -- self:nextPlate()
end

function Game:onBack()
    -- todo: 弹出确认框
    global.viewJump.gotoMainGame()
end

function Game:onSet()
    print("Game:onSet")
    -- dump(self.onPauseGame)
    -- dump(obj)
    -- print(self.__cname)
    local view = require("logic.game.niuniutiaozhan.about").new()
    global.viewMgr.showView(view, true)

    local orig_func = view.onExit
    view.onExit = function ()
        self:onResumeGame()
        if orig_func then
            orig_func()
        end
    end
    -- if (obj ~= self) and (obj ~= nil)  then
    --     obj:onPauseGame()
    -- end
    self:onPauseGame()
end

function Game:onbtnAboutClick()
    print("onbtnAboutClick")
    local view = about.new()
    global.viewMgr.showView(view, true)
end

function Game:onCreate()
    -- self.mView["soundOff"]:setVisible(true)
    -- self.mView["soundOn"]:setVisible(false)

    -- global.async.runInNextFrame(function ()
    --     self:start()    
    -- end)
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

function Game:gotoJiesuanView()
    print("我进来了")
    local Jiesuan = require("logic/game/niuniutiaozhan/jiesuan")
    local view = Jiesuan.new(nil, nil,{score = 0,time = 0})
    global.viewMgr.showView(view, true)
end

-- function Game:onbtnStartClick(sender_)
--     print("===Game:onbtnStartClick==")

--     self:start()
--     -- sender_:setVisible(false)
--     self.mView["mainPnl"]:setVisible(false)
-- end

-- function Game:start()
--     print("Game:start")
-- end

return Game