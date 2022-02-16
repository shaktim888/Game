local Game = class("Game", cc.load("mvc").ModuleBase)

Game.RESOURCE_FILENAME = "game/cattleRun/cattleRun.lua"

Game.behavior = {
    "logic.views.GameScene.logic.uiControl",    
    "logic.views.GameScene.logic.stateControl",
    "logic.views.GameScene.logic.player",
}

function Game:onCreate(_data)
    -- global.utils.sound.playBgMusic("game/cattleRun/sound/bgm.mp3")
    self.mView["img_xiaoguo1"]:setVisible(false)

    self.mView["text_score"]:setString(0)
    global.async.delay(1):Then(function() 
        self:start()
    end)
    self.data = _data
    local panel_top_btn = require("logic/viewController/componentController").new(self,self.data.btnInfo)
    self:initGameRole()
    if global.isGrabScreenMode == 1 then
        self.mView["img_xiaoguo1"]:setVisible(true)
    end
end


function Game:initGameRole()
    local  _aSaveInfo = global.saveTools.getData(global.viewData.PLAYER_INFO_SAVE_TO_LOCAL) or {}
    if _aSaveInfo.sex and _aSaveInfo.name then
        if _aSaveInfo.sex == 2 then
            self.mView["plate"]:loadTexture("game/cattleRun/image/plate.png")
        else
            self.mView["plate"]:loadTexture("game/cattleRun/image/role_2.png")
        end
    end
end


function Game:onbtnAttackClick()
    local show = cc.Show:create()
    local fadeIn = cc.FadeIn:create(0.5)
    local fadeOut = cc.FadeOut:create(0.5)
    local seq = cc.Sequence:create(show,fadeIn,fadeOut)
    self.mView["img_xiaoguo1"]:runAction(seq)
end

return Game