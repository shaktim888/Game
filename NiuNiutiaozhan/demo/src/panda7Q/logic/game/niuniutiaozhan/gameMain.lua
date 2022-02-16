local Main = class("Main", cc.load("mvc").ModuleBase)
local niuniutiaozhan = import(".niuniutiaozhan")
local upmodelGuide = import(".upmodelGuide")
Main.RESOURCE_FILENAME = "game/niuniutiaozhan/main.lua"

local Jiesuan = import(".jiesuan")

local HEIGHT_SCORE_SAVE_KEY = "_HEIGHT_SCORE_SAVE_KEY_"

function Main:onbtnStartClick()
    niuniutiaozhan.new():showWithScene()
end

function Main:onCreate()
    print("Main niuniutiaozhan onCreate")
    global.utils.sound.playBgMusic("game/niuniutiaozhan/sound/bgm.mp3")
    self.mView['role']:ignoreContentAdaptWithSize(true)

    if not global.saveTools.getData(HEIGHT_SCORE_SAVE_KEY) then
        global.saveTools.saveData(HEIGHT_SCORE_SAVE_KEY,0)
    end

    local score = global.saveTools.getData(HEIGHT_SCORE_SAVE_KEY)
    self.mView['text_bestScore']:setString(score)

    if global.isGrabScreenMode == 1 then
        self.mView['text_bestScore']:setString(math.random(30,80))
    end
end

function Main:onBaseModel()
    local view = niuniutiaozhan.new()
    view:setGameType(1)
    global.viewMgr.showView(view, true)
end

function Main:onUpModel()
    local view = upmodelGuide.new()
    -- view:setGameType(2)
    global.viewMgr.showView(view, true)
end

return Main