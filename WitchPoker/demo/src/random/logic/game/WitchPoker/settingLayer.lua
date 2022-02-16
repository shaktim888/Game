local settingLayer = class("settingLayer",cc.load("mvc").ModuleBase)
settingLayer.RESOURCE_FILENAME = "game/WitchPoker/SettingLayer.lua"

settingLayer.behavior ={
    "logic.common.behavior.BtnBinder",
    "logic.common.behavior.TouchInterrupt",
    "logic.common.behavior.Listener",
}
function settingLayer:onCreate()
    self:initSound()
    self.closeBtn = self.mView["closeBtn"]
    self.topPanel_ = self.mView["TopPanel"]
    --音效滑动条
	self.sliderEffect_ = self.topPanel_:getChildByName("sliderEffect");
	self.sliderEffect_:addEventListener(function(sender,eventType)
		if eventType == ccui.SliderEventType.percentChanged then
            local percent = "Percent " .. (self.sliderEffect_:getPercent() / self.sliderEffect_:getMaxPercent() * 100);
            if DEBUG > 0 then print("sliderEffect_ percent = %d",percent);end
            local volume = self.sliderEffect_:getPercent() / self.sliderEffect_:getMaxPercent();
            global.saveTools.saveData("nwpk_effectPercent", volume)
            global.utils.sound.setEffectVolume(volume)
        end
	end)
    self.sliderEffect_:setPercent( global.utils.sound.getEffectVolume() * 100)

	--音量滑动条
	self.sliderNum_ = self.topPanel_:getChildByName("sliderNum");
	self.sliderNum_:addEventListener(function (sender,eventType )
		if eventType == ccui.SliderEventType.percentChanged then
			local percent = "Percent"..(self.sliderNum_:getPercent()/self.sliderNum_:getMaxPercent()*100);
			if DEBUG > 0 then print("sliderNum_ percent = %d",percent);end
            local volume = self.sliderNum_:getPercent() / self.sliderNum_:getMaxPercent();
            global.saveTools.saveData("nwpk_musicPercent",volume)
            global.utils.sound.setMusicVolume(volume)
		end
    end)
    self.sliderNum_:setPercent( global.utils.sound.getMusicVolume() * 100)

end
function settingLayer:initSound()
    local effect = global.saveTools.getData("nwpk_effectPercent")
    local music = global.saveTools.getData("nwpk_musicPercent")
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


settingLayer.btnBind = {
    closeBtn ="closeClick"
}

function settingLayer:closeClick()
    print("点击了关闭按钮")
    AudioEngine.playEffect ("game/WitchPoker/sound/Button.wav",false)
    self:setVisible(false)
end


return settingLayer
