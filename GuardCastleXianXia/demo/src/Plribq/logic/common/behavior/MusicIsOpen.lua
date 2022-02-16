local MusicIsOpen = class("MusicIsOpen", cc.load("mvc").BehaviorBase)
local MUSIC_IS_OPEN_SAVE_LOCAL = "MUSIC_IS_OPEN_SAVE_LOCAL_bb"

function MusicIsOpen:onCreate()
	local widget
	dump(self.music_is_open)
	for key, v in pairs(self.music_is_open or {}) do
		widget = self.mView[key]
		local info = global.saveTools.getData(MUSIC_IS_OPEN_SAVE_LOCAL)
		if not info then
			info = {
				isOpenMusic =  true
			}
			global.saveTools.saveData(MUSIC_IS_OPEN_SAVE_LOCAL, info)
		end
		self.isOpenMusic = info.isOpenMusic
		self:initSound(self.isOpenMusic,widget,v)
	end
end

function MusicIsOpen:initSound(isOpen,node,res) 
    if not isOpen then
        node:loadTextureNormal(res.close,0)
        global.utils.sound.isStopSound = true
        audio.stopMusic()
    else
        node:loadTextureNormal(res.open,0)
        AudioEngine.setMusicVolume(1)
        global.utils.sound.isStopSound = false
        audio.playMusic(res.bgm,true)
	end

	node:addTouchEventListener(function(sender,eventType)
		if (eventType == 2) then
			if self.isOpenMusic then
				node:loadTextureNormal(res.close,0)
				self.isOpenMusic = false
				global.utils.sound.isStopSound = true
				audio.stopMusic()
			else
				node:loadTextureNormal(res.open,0)
				self.isOpenMusic = true
				AudioEngine.setMusicVolume(1)
				global.utils.sound.isStopSound = false
				audio.playMusic(res.bgm,true)
			end
			local info = global.saveTools.getData(MUSIC_IS_OPEN_SAVE_LOCAL)
			info.isOpenMusic = self.isOpenMusic
			global.saveTools.saveData(MUSIC_IS_OPEN_SAVE_LOCAL, info)
		end
		
	end)
	
end

return MusicIsOpen