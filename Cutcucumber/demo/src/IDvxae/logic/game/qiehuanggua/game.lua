local Main = class("Game", cc.load("mvc").ModuleBase)
local JieSuan = import(".jiesuan")
local setting = import(".setting")
Main.RESOURCE_FILENAME = "game/qiehuanggua/qiehuanggua.lua"
local MAX_LIFE = 3 
local actionTools = require("logic.common.tools.effectTools")

Main.behavior = {
    "logic.common.behavior.FontColorChange",
}

Main.changecolorfont = {
    btnPush = {},
}

function Main:onCreate()
    self.life = 3
    self.score = 0
    self.mView["template"]:setVisible(false)
    self:initHuadong()
    self:initAllHuanggua()
    self:onUpdate(handler(self, self.update))
    self:resetBall()
end

function Main:moveCard(node, startP, endP, time)
    return global.Promise.new(function(resolve, reject)
        local callbackEntry
        local recordTime = 0
        node:setPosition(startP)
        local function callback(dt)
            if tolua.isnull(node) then
                cc.Director:getInstance():getScheduler():unscheduleScriptEntry(callbackEntry)
                reject("Node removed!");
            end
            recordTime = recordTime + dt
        end
        callbackEntry = cc.Director:getInstance():getScheduler():scheduleScriptFunc(callback, 0, false)
    end)
end

function Main:rotateCard(node, rotateTime , maxRotateSpeed)
    return global.Promise.new(function(resolve, reject)
        local callbackEntry
        local recordTime = 0
        local rotateSpeed = 0
        local rotateValue = 0
        maxRotateSpeed = maxRotateSpeed or 1000
        local CHANGE_SPEED_TIME = 0.2
        local PI = 3.141592653
        local function callback(dt)
            if tolua.isnull(node) then
                cc.Director:getInstance():getScheduler():unscheduleScriptEntry(callbackEntry)
                reject("Node removed!");
            end
            recordTime = recordTime + dt
            if recordTime > rotateTime then
                cc.Director:getInstance():getScheduler():unscheduleScriptEntry(callbackEntry)
                resolve()
            elseif recordTime <= CHANGE_SPEED_TIME then
                rotateSpeed = maxRotateSpeed * math.sin(recordTime / CHANGE_SPEED_TIME * PI / 2)
            elseif recordTime >= rotateTime - CHANGE_SPEED_TIME then
                rotateSpeed = maxRotateSpeed * math.sin((rotateTime - recordTime) / CHANGE_SPEED_TIME * PI / 2)
            else
                rotateSpeed = maxRotateSpeed
            end
            rotateSpeed = maxRotateSpeed * math.sin(recordTime / rotateTime * PI)
            rotateValue = rotateValue + rotateSpeed * dt
            node:setRotation(rotateValue)
        end
        callbackEntry = cc.Director:getInstance():getScheduler():scheduleScriptFunc(callback, 0, false)
    end)
end

function Main:moveBall(dt)
    if not self.startMoveBall then return end
    local offset = 5
    local size = self.mView["huadong"]:getContentSize()
    local ballSize = self.mView["ball"]:getContentSize()
    local startP = ballSize.width / 2 + offset
    local endP = (size.width - ballSize.width / 2) - offset
    local px = self.mView["ball"]:getPositionX()
    px = px + self.curDir * self.ballSpeed * dt
    if self.curDir == 1 then
        if px >= endP then
            px = endP - (px - endP)
            self.curDir = -1
        end
    elseif self.curDir == -1 then
        if px <= startP then
            px = startP + (px - startP)
            self.curDir = 1
        end
    end
    self.mView["ball"]:setPositionX(px)
end

function Main:resetBall()
    local cardItem = self.mView["TemplateCard"]:clone()
    self.mView["point_0"]:addChild(cardItem)
    cardItem:setPosition(0,0)
    self.curCard = cardItem
    self.mView["txtScore"]:setString(self.score)
    if self.isCutAll then
        self:gameOver(true)
        return 
    end
    self.life = self.life - 1
    for i = 1, math.min(self.life, MAX_LIFE) do
        self.mView["life_" .. i]:setVisible(true)
    end
    for i = math.max(1, self.life + 1), MAX_LIFE do
        self.mView["life_" .. i]:setVisible(false)
    end
    if self.life < 0 then
        self:gameOver(false)
        return 
    end
    self.startMoveBall = true
    self.curDir = 1
    local offset = 5
    local size = self.mView["huadong"]:getContentSize()
    local ballSize = self.mView["ball"]:getContentSize()
    self.mView["ball"]:setPositionX(ballSize.width / 2 + offset)
end

function Main:gameOver(result)
    local score = cc.UserDefault:getInstance():getIntegerForKey("qiehuangguaScore")
    if score <= self.score then
        score = self.score
        cc.UserDefault:getInstance():setIntegerForKey("qiehuangguaScore", score)
    end
    local view = JieSuan.new(nil, nil, result)
    global.viewMgr.showView(view, true)
end

function Main:grabscreen()
    for _ , item in ipairs(self.huangguaList) do
        item.isCut = true
        item:getChildByName("hg"):setVisible(false)
        item:getChildByName("hg2"):setVisible(true)
        item:getChildByName("hg1"):setVisible(false)
    end
    for i = 1, MAX_LIFE do
        self.mView["life_" .. i]:setVisible(false)
    end
    self.score = math.random( 20 , 100 )
    local  result = false
    if self.score / 2 == 0 then
        result = true
    end
    self.mView["txtScore"]:setString(self.score)
    local score = global.saveTools.getData("qiehuangguaScore")
    if score <= self.score then
        score = self.score
        global.saveTools.saveData("qiehuangguaScore", score)
    end
    local view = JieSuan.new(nil, nil, result)
    global.viewMgr.showView(view, true)
end

function Main:initAllHuanggua()
    local offset = 88
    self.huangguaList = {}
    for i = 0, 9 do 
        local item = self.mView["TemplateHuangua"]:clone()
        item:setPosition(i * offset, 0 )
        item:getChildByName("hg2"):setPosition(item:getChildByName("hg"):getPositionX(), item:getChildByName("hg"):getPositionY() - item:getChildByName("hg2"):getContentSize().height)
        item:getChildByName("hg1"):setPosition(item:getChildByName("hg"):getPositionX(), item:getChildByName("hg"):getPositionY() - item:getChildByName("hg2"):getContentSize().height + 5)
        self.mView["container"]:addChild(item)
        item.isCut = false
        table.insert(self.huangguaList, item)
    end
end

function Main:onbtnPushClick()
    self:pushBall()
end

function Main:onbtnBackClick()
    global.viewJump.gotoQieHuangGua()
end

function Main:onbtnSetClick()
    local view = setting.new()
    global.viewMgr.showView(view, true)
end

function Main:pushBall()
    if not self.startMoveBall then return end
    self.startMoveBall = false
    local px = self.mView["ball"]:getPositionX()
    local power = self:checkPower(px)
    print("power:", power)
    self.score = self.score + power
    self:startPushCard():Then(function()
        self:resetBall()
    end)
end

function Main:floatEffect()

end

function Main:checkPower(px)
    local ballWidth = self.mView["ball"]:getContentSize().width / 2 - 5
    local typeRange = {1, 2, 2}
    
    for index , item in ipairs(self.huaKuaiList) do
        local x = item.data[2]
        if (x - item.data[3] / 2 < px - ballWidth and x + item.data[3] / 2 > px - ballWidth) or  (x - item.data[3] / 2 < px + ballWidth and x + item.data[3] / 2 > px + ballWidth)
            or (x - item.data[3] / 2 > px - ballWidth and x - item.data[3] / 2 < px + ballWidth) or (x + item.data[3] / 2 > px - ballWidth and x + item.data[3] / 2 < px + ballWidth) then
            math.randomseed(tostring(os.time()):reverse():sub(1, 7))
            -- 飘一个特效
            print(x, px, item.data[3], ballWidth, item:getPositionX())
            return math.random( item.data[4], item.data[5] )
        end
    end
    return 0
end

function Main:initHuadong()
    local level = 1
    local data = global.configLoader.load("game/qiehuanggua/data.csv", "Level")
    local cfg = data[level]
    self.ballSpeed = cfg.Speed
    self.targetScore = cfg.Target
    local pNode = self.mView["huakuaiContainer"]
    local list = global.utils.sortByKeys(cfg.HuaKuai, {5, 4})
    self.huaKuaiList = {}
    for _ , v in ipairs(list) do
        local item
        if v[1] == 1 then
            item = self.mView["TemplateRed"]:clone()
        else
            item = self.mView["TemplateBlue"]:clone()
        end
        pNode:addChild(item)
        item:setPosition(v[2], 0)
        local size = item:getContentSize()
        item:setContentSize(v[3], size.height)
        item.data = v
        table.insert(self.huaKuaiList, item)
    end
end

function Main:startPushCard()
    local cardItem = self.curCard
    local pathList = {}
    for i =0, 2 do
        table.insert(pathList, self.mView["point_" .. i])
    end
    local percent = self.score / self.targetScore
    local num = #self.huangguaList - math.floor(#self.huangguaList * percent)
    self.isCutAll = false
    if num < 1 then
        num = 1
        self.isCutAll = true
    end
    local cutPoint = self.huangguaList[num]:getChildByName("cutPoint")
    local wp = cutPoint:convertToWorldSpace(cc.p(0,0))
    if self.isCutAll then
        table.insert(pathList, cc.p(wp.x - 200, wp.y))
    else
        table.insert(pathList, cc.p(wp.x + 30, wp.y))
    end
    self.startCheckCard = true
    return actionTools.rotate3DTo(cardItem:getChildByName("cardWrap"), {x = 0, y = 0, z = 0}, {x = 90, y = -10, z = 0}):Then(function()
        local pro, time = actionTools.moveByPath(pathList, cardItem, 600)
        return self:rotateCard(cardItem:getChildByName("cardWrap"):getChildByName("cardImage"), time)
    end):Then(function()
        self.startCheckCard = nil
        return actionTools.runAction(cardItem, cc.FadeOut:create(1), cc.RemoveSelf:create())
    end)
end

function Main:update(dt)
    self:moveBall(dt)
    self:checkCut()
end

function Main:playCutAnim(item)
    item.isCut = true
    item:getChildByName("hg"):setVisible(false)
    item:getChildByName("hg2"):setVisible(true)
    item:getChildByName("hg1"):setVisible(true)
    item:getChildByName("hg1"):runAction(cc.Spawn:create({
        cc.RepeatForever:create(cc.RotateBy:create(0.1, 10)),
        cc.Sequence:create(cc.MoveBy:create(1, cc.p(0, -300)), cc.FadeOut:create(1), cc.RemoveSelf:create() )
    }))
    global.utils.sound.playSound("game/qiehuanggua/sound/kaca.mp3")
end

function Main:checkCut()
    if self.startCheckCard then
        local wp = self.curCard:convertToWorldSpace(cc.p(0,0))
        for _ , v in ipairs(self.huangguaList) do
            if not v.isCut then
                local p2 = v:convertToWorldSpace(cc.p(0,0))
                if wp.x < p2.x then
                    self:playCutAnim(v)
                end
            end
        end
    end
end


return Main