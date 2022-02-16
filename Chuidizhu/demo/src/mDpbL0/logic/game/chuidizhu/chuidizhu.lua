local Game = class("Game", cc.load("mvc").ModuleBase)
-- local about = 

Game.RESOURCE_FILENAME = "game/chuidizhu/chuidizhu.lua"

Game.behavior = {
    "logic.game.chuidizhu.logic.uiControl",    
    "logic.game.chuidizhu.logic.stateControl",
    -- "logic.game.chuidizhu.logic.player",
}

local obj = nil
function Game:onCreate()
    print("Game:oncreate===================")
    obj = self
end

local gametype = 1
function Game:isLifeModel()
    return (gametype == 1) 
end

function Game:setGameType(gametype_)
    print("setGameType ==============111== "..tostring(gametype_))
    
    gametype = gametype_
    print("setGameType =============222=== "..tostring(gametype))
end

function Game:onbtnRetryClick()
    -- Game.new():showWithScene()
    print("Game chuidizhu!")
    -- self:nextPlate()
end

function Game:onbtnBackClick()
    -- todo: 弹出确认框
    global.viewJump.gotoMainGame()
end

function Game:onGrabscreenClick()
    self:onPauseGame()
    self.mView["pnl"]:setVisible(true)
    local score = self.mView["top1"]:getChildByName("score")
    score:setString(math.random(1,40))
    math.randomseed(string.reverse(os.time()))
    for i = 1,8 do
        if math.fmod( math.random(1,40), 2) == 0 then
            local cell = self.mView["pnl"]:getChildByName("cell"..i)
            cell:setVisible(true)
            local tool = cell:getChildByName("tool")
            tool:setVisible(true)
            local img = tool:getChildByName("img")
            img:setVisible(true)
        end
    end
    
end

function Game:onSet()
    print("Game:onSet")
    -- dump(self.onPauseGame)
    -- dump(obj)
    -- print(self.__cname)
    local view = require("logic.game.chuidizhu.about").new()
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
    self.mView["soundOff"]:setVisible(true)
    self.mView["soundOn"]:setVisible(false)

    global.async.runInNextFrame(function ()
        self:start()    
    end)
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