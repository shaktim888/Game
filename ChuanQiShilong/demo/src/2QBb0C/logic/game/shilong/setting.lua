
local Setting = class("Setting", cc.load("mvc").ModuleBase)

Setting.RESOURCE_FILENAME = "game/shilong/setting.lua"

Setting.groupMap = {
    {"BtnSure", "BtnCancel"},
}

Setting.behavior = {
    "logic.common.behavior.WidgetRandomGroup",
    "logic.common.behavior.BlackHover",
    "logic.common.behavior.ClickToClose",
    "logic.common.behavior.FontColorChange",
}

Setting.changecolorfont = {
    Text_2= {},
    Text_2_0 = {}
}
function Setting:onCreate()
    self:initSound()
    --音效滑动条
	self.mView["loadSound"]:addEventListener(function(sender,eventType)
		if eventType == ccui.SliderEventType.percentChanged then
            local percent = "Percent " .. (self.mView["loadSound"]:getPercent() / self.mView["loadSound"]:getMaxPercent() * 100);
            if DEBUG > 0 then print("mView[loadSound] percent = %d",percent);end
            local volume = self.mView["loadSound"]:getPercent() / self.mView["loadSound"]:getMaxPercent();
            global.saveTools.saveData("shilong_effectPercent", volume)
            global.utils.sound.setEffectVolume(volume)
        end
	end)
    self.mView["loadSound"]:setPercent( global.utils.sound.getEffectVolume() * 100)

	--音量滑动条
	self.mView["loadMusic"]:addEventListener(function (sender,eventType )
		if eventType == ccui.SliderEventType.percentChanged then
			local percent = "Percent"..(self.mView["loadMusic"]:getPercent()/self.mView["loadMusic"]:getMaxPercent()*100);
			if DEBUG > 0 then print("mView[loadMusic] percent = %d",percent);end
            local volume = self.mView["loadMusic"]:getPercent() / self.mView["loadMusic"]:getMaxPercent();
            global.saveTools.saveData("shilong_musicPercent",volume)
            global.utils.sound.setMusicVolume(volume)
		end
    end)
    self.mView["loadMusic"]:setPercent( global.utils.sound.getMusicVolume() * 100)

end
function Setting:initSound()
    local effect = global.saveTools.getData("shilong_effectPercent")
    local music = global.saveTools.getData("shilong_musicPercent")
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



function Setting:onBtnCloseClick(sender_)
    global.viewMgr.removeView(self, true)
end


return Setting




-- local Setting = class("Setting", cc.load("mvc").ModuleBase)

-- Setting.RESOURCE_FILENAME = "game/shilong/setting.lua"

-- Setting.groupMap = {
--     {"BtnSure", "BtnCancel"},
-- }

-- Setting.behavior = {
--     "logic.common.behavior.WidgetRandomGroup",
--     "logic.common.behavior.BlackHover",
--     "logic.common.behavior.ClickToClose",
-- }

-- local soundPercent = 0
-- local musicPercent = 0

-- local HISTORY_SAVE_KEY = "__HY_SHILONG_MUSIC_LOCAL_SAVE_KEY__"
-- local saveData = nil
-- local function readSaveData()
--     if not saveData then
--         saveData = global.saveTools.getData(HISTORY_SAVE_KEY)
--     end
--     return saveData
-- end

-- local function saveDataToFile(key_)
--     global.saveTools.saveData(key_ or HISTORY_SAVE_KEY, saveData)
-- end


-- local loadOriginX = 0
-- local loadLength = 0

-- local function setLoadPosX(load_, percent_)
--     local percent = percent_ /100
--     load_:setPositionX(percent * loadLength + loadOriginX)
-- end

-- function Setting:onCreate()
--     readSaveData()
--     if not saveData then
--         saveData = {}
--     end

--     local bgVolume = global.utils.sound.getMusicVolume()
--     local soundVolume = global.utils.sound.getEffectVolume()

--     bgVolume = saveData["musicVolume"] or bgVolume * 100
--     soundVolume = saveData["soundVolume"] or soundVolume * 100

--     soundPercent = math.floor( soundVolume )
--     musicPercent = math.floor( bgVolume )
--     self.mView["loadMusic"]:setPercent(musicPercent)
--     self.mView["loadSound"]:setPercent(soundPercent)

--     loadLength = self.mView["loadSound"]:getContentSize().width

--     setLoadPosX(self.mView["loadMusic"], bgVolume)
--     setLoadPosX(self.mView["loadSound"], soundVolume)
-- end

-- function Setting:onBtnSureClick(sender_, eventtype_)

--     saveData["soundVolume"] = soundPercent 
--     saveData["musicVolume"] = musicPercent 
--     saveDataToFile()

--     global.utils.sound.setMusicVolume( musicPercent/100 ) 
--     global.utils.sound.setEffectVolume( soundPercent/100 ) 

--     global.viewMgr.removeView(self, true)
-- end

-- function Setting:onBtnCancelClick(sender_, eventtype_)
--     global.viewMgr.removeView(self, true)
-- end

-- function Setting:onTouchMusic(sender_, eventtype_)
--     -- dump(sender_)
--     -- dump(eventtype_)
--     if eventtype_ == 1 then
--         local p = cc.p(sender_:getTouchMovePosition())
--         -- dump(p)

--         local pnl = self.mView["pnl1"]

--         local x = pnl:convertToNodeSpace(p).x
--         local origin_x = loadOriginX -- self.mView["loadSound"]:getPositionX()

--         x = (x > origin_x) and x or origin_x

--         local len = loadLength + origin_x
--         x = (x > len) and len or x
--         self.mView["loadMusic"]:setPositionX(x)

--         x = x - origin_x
--         len = len - origin_x

--         local percent = math.floor(x/len * 100)
--         -- dump(percent)
--         self.mView["loadMusic"]:setPercent(math.floor( percent ))
--         musicPercent = percent
--     end
-- end

-- function Setting:onTouchSound(sender_, eventtype_)
--     -- dump(sender_)
--     -- dump(eventtype_)
--     if eventtype_ == 1 then
--         local p = cc.p(sender_:getTouchMovePosition())
--         -- dump(p)

--         local pnl = self.mView["pnl2"]

--         local x = pnl:convertToNodeSpace(p).x
--         local origin_x = loadOriginX -- self.mView["loadSound"]:getPositionX()

--         x = (x > origin_x) and x or origin_x

--         local len = loadLength + origin_x
--         x = (x > len) and len or x
--         -- origin_x = origin_x + x
--         self.mView["loadSound"]:setPositionX(x)

--         x = x - origin_x
--         len = len - origin_x
--         local percent = math.floor(x/len * 100)
--         dump(percent)
--         self.mView["loadSound"]:setPercent(percent)
--         soundPercent = percent
--     end
-- end

-- function Setting:onBtnCloseClick(sender_)
--     global.viewMgr.removeView(self, true)
-- end

-- return Setting