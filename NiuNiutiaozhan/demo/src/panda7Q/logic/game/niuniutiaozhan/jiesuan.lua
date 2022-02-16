local Jiesuan = class("Jiesuan", cc.load("mvc").ModuleBase)

Jiesuan.RESOURCE_FILENAME = "game/niuniutiaozhan/balance.lua"

Jiesuan.behavior = {
    "logic.common.behavior.BlackHover",
    "logic.common.behavior.TouchInterrupt",
}

local HEIGHT_SCORE_SAVE_KEY = "_HEIGHT_SCORE_SAVE_KEY_"

function Jiesuan:onCreate(data_)
    dump(data_)

    if global.isGrabScreenMode == 1 then
        data_.score = math.random(30,80)
        data_.time = math.random(5,25)
    end

    self.mView["label_score"]:setString(data_.score)
    local score = global.saveTools.getData(HEIGHT_SCORE_SAVE_KEY)
    if data_.score > score then
        global.saveTools.saveData(HEIGHT_SCORE_SAVE_KEY,data_.score)
    end

    --  保留3位小数
    local hit = math.floor((data_.score/data_.time) * 1000)/1000
    local hit_str = tostring(hit)
    local dot_pos = string.find(hit_str, "%.")
    if not dot_pos or (dot_pos > #hit_str - 3) then
        local index = 0
        if dot_pos then
            index = #hit_str - dot_pos
        else
            hit_str = hit_str .. "."
        end

        for i = index + 1, 3 do
            hit_str = hit_str .. "0"
        end
    end

    self.mView["label_hit"]:setString(hit_str)
end

function Jiesuan:onRestart()
    local niuniutiaozhan =require("logic.game.niuniutiaozhan.niuniutiaozhan")
    niuniutiaozhan.new():showWithScene()
end

function Jiesuan:onBackHome()
    global.viewJump.gotoniuniutiaozhan()
end

return Jiesuan  