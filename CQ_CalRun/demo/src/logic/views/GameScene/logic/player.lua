local player = class("player", cc.load("mvc").BehaviorBase)
local enable = true

function player:onCreate()
    self._score_num = 0
    self._time_num = 90
    self._percent_num = 0
    self._time_preadd_num = 0
end

function player:choiceClickCallback(sender_, index_)
    global.utils.sound.playSound("game/cattleRun/sound/click.mp3", false)
    local material_data = sender_.__material_data
    local target_data = self:getMaterialData()
    if not target_data or not material_data then
        dump(target_data)
        dump(material_data)
        return 
    end
    if material_data.img == target_data.img then 
        self:playerChoiceValid()
    else
        self:errStep()
    end
end

function player:getScore()
    return self._score_num
end

function player:getTimeNum()
    self._time_num = self._time_num - 1 
    if self._time_preadd_num > 0 then
        self._time_num = self._time_num + self._time_preadd_num
        self._time_preadd_num = 0
    end
    return self._time_num
end

function player:getFoodPercent()
    return self._percent_num
end

local tbl = {15,28,39,48,56,63,70,75,80,85,90}
local index = 1
function player:addScoreAndTime(score_)
    print("addScoreAndTime ====================== "..self._score_num)
    self._score_num = self._score_num + score_
    if self._score_num > tbl[index] then
        self:speedUp()
        index = index + 1
    end
end

function player:roundStepErr()
    self._time_num = self._time_num - 5
end

function player:updateTimeAndScore_()
    local time = self:getTimeNum()
    self:updateTimeAndScore(time, self:getScore())
    if time <= 0 then
        --self:gameOver()
    end
end

function player:updateTimeAndScore(time_, score_)
    
end

function player:gameOver()
    index = 1
end

return player