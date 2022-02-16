local GameData =  class("GameData")

GameData.State = {
	Open = 1,
	Closed = 2
}

local user_default = cc.UserDefault:getInstance()

--[[
	玩家信息存储key值
	{
		name:"玩家名",
		sex:"1,2",
		headImage:"头像图片路径"
	}
--]]
GameData.PLAYER_INFO_SAVE_TO_LOCAL = "ADD_HEAD_TO_LOCAL_OF_KEY_NAME_AND_HEAD_1111313132"


--获取货币值
function GameData.getCoin()
	return user_default:getIntegerForKey("Coin", 0)
end

--设置货币值
function GameData.setCoin(num)
	audio.playSound("sound/coin.mp3", false)
	user_default:setIntegerForKey("Coin",num)
end


--设置关卡值
function GameData.setLevel(num)
	user_default:setIntegerForKey("Level",num)
end

--获取关卡值
function GameData.getLevel()
	return user_default:getIntegerForKey("Level",1)
end

--设置当前防御塔的索引
function GameData.setTowerIndex(num)
	user_default:setIntegerForKey("Tower",num)
end

--获取当前防御塔的索引
function GameData.getTowerIndex()
	return user_default:getIntegerForKey("Tower",1)
end

--播放背景音乐
function GameData:playBgMusic()
	if GameData.isMusicOpen() ==  GameData.State.Open then
		audio.playMusic("dynamic/common/sound/game.mp3",true)
	end	
end

--停止背景音乐
function GameData:stopPlayBgMusic()
	audio.stopMusic(false)
end

-- 按钮点击播放的音效
function GameData:playVoice()
	if GameData.isVoiceOpen() ==  GameData.State.Open then
		audio.playSound("dynamic/common/sound/button.mp3", false)
	end	
end

--获取当前音乐状态 1开 0关
function GameData.isMusicOpen()
	return user_default:getIntegerForKey("MusicState", 1)
end

--获取当前音乐状态
function GameData.setMusicState(state)
	user_default:setIntegerForKey("MusicState", state)
end

--获取当前音效状态 1开 0关
function GameData.isVoiceOpen()
	return user_default:getIntegerForKey("VoiceState", 1)
end

--设置音效状态
function GameData.setVoiceState(state)
	user_default:setIntegerForKey("VoiceState", state)
end

-- 获取音量大小 1最大 0最小
function GameData.getMusicVolume()
	return user_default:getFloatForKey("MusicVolume",1.0)
end

--保存音乐大小
function GameData.saveMusicVolume(musicVolume)
	user_default:setFloatForKey("MusicVolume", musicVolume)
	
end

-- 获取音效大小 1最大 0最小
function GameData.getEffectVolume()
	return user_default:getFloatForKey("EffectVolume",1.0)
end

--保存音效大小 
function GameData.saveEffectVolume(effectVolume)
	user_default:setFloatForKey("EffectVolume", effectVolume)
end

return GameData