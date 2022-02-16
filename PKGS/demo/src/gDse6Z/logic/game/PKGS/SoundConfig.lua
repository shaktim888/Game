-- local SoundConfig = class("SoundConfig")

local soundPath = "game/PKGS/sound/"
local Sound = {
    bgm = soundPath.."bgm1.m4a",
    bgm2 = soundPath.."bgm2.m4a",
    click = soundPath.."click.m4a",
    pass = soundPath.."next.mp3",
    fail = soundPath.."over.m4a",
    over = soundPath.."over.m4a",
    addScore = soundPath.."but_se.mp3"
}  

cc.exports._Sound = Sound


