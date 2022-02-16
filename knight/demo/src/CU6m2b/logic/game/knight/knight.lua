local gameScene = class("gameScene", cc.load("mvc").ModuleBase)
local pause = import(".pause")
gameScene.RESOURCE_FILENAME = "game/knight/game.lua"

gameScene.behavior = {
    "logic.game.knight.logic.uiControl",
}
function gameScene:onCreate()
    audio.playMusic("game/knight/sound/bgm_02.mp3",true)
    self:isRecord()
end

function gameScene:isRecord()
    local effect = global.saveTools.getData("knight_effectPercent")
    local music = global.saveTools.getData("knight_musicPercent")
    local perEffect = 0.5
    local perMusic = 0.5
    if effect then
        perEffect = effect
    end
    if music then
        perMusic = music
    end
    global.utils.sound.setEffectVolume(perEffect) 
    global.utils.sound.setMusicVolume(perMusic)
end

function gameScene:showWithScene1(transition, time, more,param)
    self:setVisible(true)
    local scene = display.newScene(self:getName(),param)
    scene:addChild(self)
    display.runScene(scene, transition, time, more)
    if self.animEnter then
        self:animEnter()
    end 
    return self
end


function gameScene:onsettingBtnClick()
    AudioEngine.playEffect("game/knight/sound/Button.mp3",false)
    local view = pause.new()
    global.viewMgr.showView(view, true)
end

function gameScene:onExit()
    if self.time then
        local scheduler = cc.Director:getInstance():getScheduler()
        scheduler:unscheduleScriptEntry(self.time)
        self.time = nil
    end

end

return gameScene
