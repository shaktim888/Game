local Setting = class("Setting", cc.load("mvc").ModuleBase)
Setting.RESOURCE_FILENAME = "game/chuangchuang/setting.lua"

Setting.behavior = {
    "logic.common.behavior.BlackHover",
    "logic.common.behavior.TouchInterrupt",
    "logic.common.behavior.FontColorChange",
}

Setting.changecolorfont = {
    Text_1_0 = {},
    Text_1 = {},
}

function Setting:onbtnBackClick()
    if self.removeView then
        self:removeView()
    else
        self:removeFromParent()
    end
end

function Setting:onCreate()
    self.mView["Slider_Music"]:setPercent(global.utils.sound.getMusicVolume() * 100)
    self.mView["Slider_Music"]:onEvent(function(event)
        if event.name == "ON_PERCENTAGE_CHANGED" then
            local percent = event.target:getPercent()
            global.saveTools.saveData("cc_musicPercent", percent / 100)
            global.utils.sound.setMusicVolume(percent / 100)
        end
    end)
    self.mView["Slider_Sound"]:setPercent(global.utils.sound.getEffectVolume() * 100)
    self.mView["Slider_Sound"]:onEvent(function(event)
        if event.name == "ON_PERCENTAGE_CHANGED" then
            local percent = event.target:getPercent()
            global.saveTools.saveData("cc_effectPercent", percent / 100)
            global.utils.sound.setEffectVolume(percent / 100)
        end
    end)
end

return Setting