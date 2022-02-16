local uiControl = class("uiControl", cc.load("mvc").BehaviorBase)
local Jiesuan = import("..jiesuan")

local actionTools = require("logic.common.tools.effectTools")
local CardType = {
    White = 1,
    Black = 2,
}
local SoundPath = "game/doushouqi/sound/"
local ImagePath = "game/doushouqi/image/"

local MAX_STEP = 20
local CardTypeFolder = {
    [1] = "blue/",
    [2] = "red/"
}

local MoveEffect = "fanpai.mp3"
local ChiEffect = "eat.mp3"

local CardValue = {
    [1] = {img = "0.png", sound = "laoshu.mp3",name = "zero"},
    [2] = {img = "1.png", sound = "mao.mp3",name = "first"},
    [3] = {img = "2.png", sound = "gou.mp3",name = "second"},
    [4] = {img = "3.png", sound = "lang.mp3",name = "third"},
    [5] = {img = "4.png", sound = "baozi.mp3",name = "fourth"},
    [6] = {img = "5.png", sound = "shizi.mp3",name = "fifth"},
    [7] = {img = "6.png", sound = "laohu.mp3",name = "sixth"},
    [8] = {img = "7.png", sound = "daxiang.mp3",name = "seventh"}
}
local CardMax = 8

local function getFullCards()
    local arr = {}
    for _ , v in pairs(CardType) do
        for num, v2 in pairs(CardValue) do
            table.insert(arr, {v, num, v2})
        end
    end
    return arr
end
local Width = 4
local Height = 4

local function getGridPos(i, j, offsetX, offsetY)
    return cc.p( offsetX * (i - 0.5), offsetY * (j - 0.5)) 
end

local function initCardItem(self, item, info)
    item.cardInfo = info
    item:getChildByName("icon"):loadTexture(ImagePath .. CardTypeFolder[info[1]] .. info[3].img)
    item:getChildByName("bg"):setVisible(true)
    item:getChildByName("icon"):setVisible(false)
    item:getChildByName("selected"):setVisible(false)
    item:getChildByName("name"):setVisible(false)
    item:getChildByName("name"):setString(info[3].name)
end

function uiControl:checkGameOver()
    local record = {length = 0}

    if self.round >= MAX_STEP then
        return { true }
    end
    local campMap = {}
    local lastCamp
    for i = 1, Width do
        for j = 1, Width do
            if self.map[i][j] then
                if not self.map[i][j].isOpen then
                    return { false }
                end
                lastCamp = self.map[i][j].cardInfo[1]

                campMap[lastCamp] = campMap[lastCamp] or { num = 0 }
                campMap[lastCamp].last = self.map[i][j].cardInfo[2]
                campMap[lastCamp].num = campMap[lastCamp].num + 1
                if not record[lastCamp] then
                    record[lastCamp] = true
                    record.length = record.length + 1
                end
                if record.length > 1 and campMap[lastCamp].num > 1 then
                    return { false }
                end
            end
        end
    end
    
    if record.length == 1 then
        return { true, lastCamp }
    end

    if record.length == 2 and campMap[CardType.Black].num == 1 and campMap[CardType.White].num == 1 then
        if campMap[self:getPlayerHandType()].last == campMap[self:getAIHandType()].last then
            return { true }
        end
        return { true, campMap[self:getPlayerHandType()].last > campMap[self:getAIHandType()].last and self:getPlayerHandType() or self:getAIHandType() }
    end
    if record.length == 0 then
        return { true }
    end
    return { false }
end

function uiControl:switch()
    self.round =  self.round + 1
    self.mView["Steps"]:setString(MAX_STEP - self.round)
end

function uiControl:onCreate()
    self.round = 0;

    self.PlayerRound = "Player"
    self.AIRound = "AI"
    self.mView["Steps"]:setString(MAX_STEP)
    self.operatorMap = { isOk = false }
    local template = self.mView["cardTemplate"]
    local shuffle = cc.load("tools").Shuffle.new()
    shuffle:initByArr(getFullCards())
    local itr = shuffle:start()
    self.map = {}
    for i = 1, Width do
        self.map[i] = self.map[i] or {}
        for j = 1, Height do
            local item = template:clone()
            local info = itr:next()
            print(info[1], info[2])
            self.map[i][j] = item
            item.i = i
            item.j = j
            item.isOpen = false
            local p = self.mView["Panel_" .. i .. "_" .. j]
            local pSize = p:getContentSize()
            item:setPosition(pSize.width / 2, pSize.height / 2)
            p:addChild(item)
            initCardItem(self, item, info)
            p:addTouchEventListener(function(sender,eventType)
                if 2 == eventType then
                    self:onClickItem(i, j)
                end
            end)
        end
    end
end

function uiControl:showJiesuanView(isWin, isDraw)
    local view = Jiesuan.new(nil, nil, isWin, isDraw)
    global.viewMgr.showView(view, true)
end

function uiControl:grabscreen()
    local view = Jiesuan.new(nil, nil, true, false)
    global.viewMgr.showView(view, true)
end



function uiControl:onClickItem(i, j)

end

function uiControl:whiteRound()
    self.operator = self.PlayerRound
    self.mView["OurRound"]:setVisible(true)
    self.mView["OtherRound"]:setVisible(false)
end

function uiControl:blackRound()
    self.operator = self.AIRound
    self.mView["OurRound"]:setVisible(false)
    self.mView["OtherRound"]:setVisible(true)
end

function uiControl:openCard(item)
    if item.isOpen then return end
    item.isOpen = true
    self.round = -1
    if not self.operatorMap.isOk then
        self.operatorMap.isOk = true
        self.operatorMap[self.operator] = item.cardInfo[1]
        if self.operator == self.PlayerRound then
            self.operatorMap[self.AIRound] = item.cardInfo[1] == CardType.Black and CardType.White or CardType.Black
        else
            self.operatorMap[self.PlayerRound] = item.cardInfo[1] == CardType.Black and CardType.White or CardType.Black
        end
    end
    actionTools.flopCard(item:getChildByName("bg"), item:getChildByName("icon"))
    item:getChildByName("name"):setVisible(true)
    global.utils.sound.playSound(SoundPath .. item.cardInfo[3].sound)
end

function uiControl:getPlayerHandType()
    return self.operatorMap[self.PlayerRound]
end

function uiControl:getAIHandType()
    return self.operatorMap[self.AIRound]
end

function uiControl:moveCard(item, ti, tj)
    if not item then return false end
    local oi = item.i
    local oj = item.j
    local tItem = self.map[ti][tj]
    if math.abs( ti - oi ) + math.abs( tj - oj ) == 1 and (not tItem or tItem.cardInfo[1] ~= item.cardInfo[1]) then
        local move = function()
            item.i = ti
            item.j = tj
            item:retain()
            item:removeFromParent()
            local p = self.mView["Panel_" .. ti .. "_" .. tj]
            p:addChild(item)
            item:release()
            self.map[oi][oj] = nil
            self.map[ti][tj] = item
        end
        if not tItem then
            move()
            global.utils.sound.playSound(SoundPath .. MoveEffect)
        else
            local isBig = (tItem.cardInfo[2] == CardMax and item.cardInfo[2] == 1) or (item.cardInfo[2] > tItem.cardInfo[2] and not (item.cardInfo[2] == CardMax and tItem.cardInfo[2] == 1))
            if isBig then
                tItem:removeFromParent()
                self.map[ti][tj] = nil
                move()
                self.round = -1
                global.utils.sound.playSound(SoundPath .. ChiEffect)
            elseif tItem.cardInfo[2] == item.cardInfo[2] then
                item:removeFromParent()
                tItem:removeFromParent()
                self.map[oi][oj] = nil
                self.map[ti][tj] = nil
                self.round = -1
                global.utils.sound.playSound(SoundPath .. ChiEffect)
            else
                item:removeFromParent()
                self.map[oi][oj] = nil
                self.round = -1
                global.utils.sound.playSound(SoundPath .. ChiEffect)
            end
        end
        return true
    else
        return false
    end
end

return uiControl