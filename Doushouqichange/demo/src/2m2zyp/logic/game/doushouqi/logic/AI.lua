local AI = class("AI", cc.load("mvc").BehaviorBase)

local function calcTypeScore(map, type)
    local score = 0
    local dir = { {1,0}, {0,1}, {-1,0}, {0,-1} }
    for i = 1, 4 do
        for j = 1 , 4 do
            local o = map[i][j]
            if o and o.isOpen then
                if o.cardInfo[1] == type then
                    local isDie = false
                    local aroundScore = 0
                    for _, v in ipairs(dir) do
                        if (i + v[1]) > 0 and (j + v[2]) > 0 and (i + v[1]) <= 4 and (j + v[2]) <= 4 then
                            local t = map[i + v[1]] [j + v[2]]
                            if t and t.isOpen and t.cardInfo[1] ~= o.cardInfo[1] then
                                local isBig = (t.cardInfo[2] == 8 and o.cardInfo[2] == 1) or (o.cardInfo[2] > t.cardInfo[2] and not (o.cardInfo[2] == 8 and t.cardInfo[2] == 1))
                                if isBig then
                                    aroundScore = aroundScore + 80 * t.cardInfo[2]
                                else
                                    isDie = true
                                end
                            end
                        end
                    end
                    if isDie then
                        score = score - 1000 * o.cardInfo[2]
                    else
                        score = score + 1000 * o.cardInfo[2]
                        score = score + aroundScore
                    end
                end
            end
        end
    end
    return score
end

local function calculateScore(map , score, handType, otherType)
    local score = score + calcTypeScore(map, handType) - calcTypeScore(map, otherType)
    return score
end

local function getUnOpenNum(map)
    local num = 0
    for i = 1, 4 do
        for j = 1 , 4 do
            local o = map[i][j]
            if o and not o.isOpen then
                num = num + 1
            end
        end
    end
    return num
end

local function selectToOpenCard(map)
    local arr = {}
    for i = 1, 4 do
        for j = 1 , 4 do
            local o = map[i][j]
            if o and not o.isOpen then
                table.insert(arr, {i, j})
            end
        end
    end
    local index = math.random( 1, #arr )
    return arr[index]
end

local function howToMove(orgMap, forceMove, handType, otherType)
    local map = {}
    for i = 1, 4 do
        map[i] = map[i] or {}
        for j = 1 , 4 do
            map[i][j] = orgMap[i][j]
        end
    end
    local dir = { {1,0}, {0,1}, {-1,0}, {0,-1} }
    local bestStep
    local bestScore = forceMove and -9999999999 or calculateScore(map, 0, handType, otherType)
    local minOtherScore = calcTypeScore(map, otherType)
    for i = 1, 4 do
        for j = 1 , 4 do
            local o = map[i][j]
            if o and o.isOpen and o.cardInfo[1] == handType then
                for _, v in ipairs(dir) do
                    if (i + v[1]) > 0 and (j + v[2]) > 0 and (i + v[1]) <= 4 and (j + v[2]) <= 4 then
                        local t = map[i + v[1]] [j + v[2]]
                        if t and t.isOpen and t.cardInfo[1] ~= handType then
                            local isBig = (t.cardInfo[2] == 8 and o.cardInfo[2] == 1) or (o.cardInfo[2] > t.cardInfo[2] and not (o.cardInfo[2] == 8 and t.cardInfo[2] == 1))
                            if isBig then
                                map[i][j] = nil
                                map[i + v[1]] [j + v[2]] = o
                                local score = 1200 * t.cardInfo[2]
                                score = calculateScore(map,score, handType, otherType)
                                if score > bestScore then
                                    bestStep = { i, j , i + v[1], j + v[2]}
                                    minOtherScore = calcTypeScore(map, otherType)
                                    bestScore = score
                                elseif score == bestScore then
                                    local afterScore = calcTypeScore(map, otherType)
                                    if minOtherScore > afterScore then
                                        bestStep = { i, j , i + v[1], j + v[2]}
                                        minOtherScore = afterScore
                                        bestScore = score
                                    end
                                end
                                map[i + v[1]] [j + v[2]] = t
                                map[i][j] = o
                            elseif o.cardInfo[2] == t.cardInfo[2] then
                                map[i][j] = nil
                                map[i + v[1]] [j + v[2]] = nil
                                local score = 0
                                score = calculateScore(map,score, handType, otherType)
                                if score > bestScore then
                                    bestStep = { i, j , i + v[1], j + v[2]}
                                    minOtherScore = calcTypeScore(map, otherType)
                                    bestScore = score
                                elseif score == bestScore then
                                    local afterScore = calcTypeScore(map, otherType)
                                    if minOtherScore > afterScore then
                                        bestStep = { i, j , i + v[1], j + v[2]}
                                        minOtherScore = afterScore
                                        bestScore = score
                                    end
                                end
                                map[i + v[1]] [j + v[2]] = t
                                map[i][j] = o
                            end
                        elseif not t then
                            local score = -100
                            map[i][j] = nil
                            map[i + v[1]] [j + v[2]] = o
                            score = calculateScore(map,score, handType, otherType)
                            if score > bestScore then
                                bestStep = { i, j , i + v[1], j + v[2]}
                                minOtherScore = calcTypeScore(map, otherType)
                                bestScore = score
                            elseif score == bestScore then
                                local afterScore = calcTypeScore(map, otherType)
                                if minOtherScore > afterScore then
                                    bestStep = { i, j , i + v[1], j + v[2]}
                                    minOtherScore = afterScore
                                    bestScore = score
                                end
                            end
                            map[i + v[1]] [j + v[2]] = t
                            map[i][j] = o
                        end
                    end
                end
            end
        end
    end
    return bestStep
end

function AI:blackRound()
    global.async.delay(1):Then(function()
        local emptyNum = getUnOpenNum(self.map)
        local forceMove = emptyNum == 0
        local step
        if self:getAIHandType() then
            step = howToMove(self.map , forceMove, self:getAIHandType(), self:getPlayerHandType())
        end
        if not step then
            local p = selectToOpenCard(self.map)
            if p then
                self:openCard(self.map[p[1]][p[2]])
            end
        else
            self:moveCard(self.map[step[1]][step[2]], step[3], step[4]) 
        end
        self:switch()
    end)
end

return AI
