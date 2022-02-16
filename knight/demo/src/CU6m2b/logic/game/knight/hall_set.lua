local settingLayer = class("settingLayer",cc.load("mvc").ModuleBase)
settingLayer.RESOURCE_FILENAME = "game/knight/hall_set.lua"
settingLayer.behavior ={
    "logic.common.behavior.ClickToClose",
}

function settingLayer:onCreate()
    self.topPanel_ = self.mView["TopPanel"]
    self.sliderEffect_ = self.topPanel_:seekByName("sliderEffect");
    self.sliderNum_ = self.topPanel_:seekByName("sliderNum");
    self:isRecord()
    self:initSlider()
end

function settingLayer:isRecord()
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

function settingLayer:initSlider()
    --音效滑动条
	self.sliderEffect_:addEventListener(function(sender,eventType)
		if eventType == ccui.SliderEventType.percentChanged then
            local volume = self.sliderEffect_:getPercent() / self.sliderEffect_:getMaxPercent();
            global.saveTools.saveData("knight_effectPercent", volume)
            global.utils.sound.setEffectVolume(volume)
        end
	end)
    self.sliderEffect_:setPercent(global.utils.sound.getEffectVolume() * 100)

	--音量滑动条
	
	self.sliderNum_:addEventListener(function (sender,eventType )
		if eventType == ccui.SliderEventType.percentChanged then
            local volume = self.sliderNum_:getPercent() / self.sliderNum_:getMaxPercent(); 
            global.saveTools.saveData("knight_musicPercent", volume)
            global.utils.sound.setMusicVolume(volume)
		end
    end)
    self.sliderNum_:setPercent( global.utils.sound.getMusicVolume() * 100)
end

return settingLayer
