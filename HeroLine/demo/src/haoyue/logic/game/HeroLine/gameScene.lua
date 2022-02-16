local gameScene = class("gameScene", cc.load("mvc").ModuleBase)
gameScene.RESOURCE_FILENAME = "game/HeroLine/GameScene.lua"
local viewJump = require("logic.common.views.viewJump")
local winLayer = require("logic.game.HeroLine.winLayer")
local animationClass = require("logic.game.HeroLine.animation")
local newAnimation = animationClass.new()
local peopleClass = require("logic.game.HeroLine.people")
local newPeople = peopleClass.new()
local Shuffle = cc.load("tools").Shuffle

gameScene.behavior = {
    "logic.common.behavior.BtnBinder",
    "logic.common.behavior.TouchInterrupt",
    "logic.common.behavior.Listener",
}

--按钮事件监听
gameScene.btnBind = {
    returnBtn = "returnClick"
}

local score = { 10, 20, 50 }                                                                  --一次性消除多个人物时一个人物可以获得的分数

--创建界面
function gameScene:onCreate(score)
    --播放背景音乐
    audio.playMusic("game/HeroLine/sound/bgm.mp3",true)
    self.peoplePoolTable = {}                                                                  --人物存表
    self.maxPeopleRow = 9                                                                      --人物列表最大行
    self.maxPeopleColumn = 5                                                                   --人物列表最大列
    self.peopleSelectedTable = {}                                                              --人物选中
    self.linePoolTable = {}                                                                    --线存表
    self.allScore = 0                                                                          --分数
    self.peopleSelectedlength = 0                                                              --可消除人物的总数
    self.score = 0                                                                             --消除一个人物可获得的分数
    self.gameTime = 60                                                                         --游戏时间60S
    self.gameRemainingTime = self.gameTime                                                     --游戏剩余时间
    self.newGameTime = 0                                                                       --游戏时间
    self.gameGrade = 1                                                                         --游戏等级
    self.scoreIncreaseUnit = 1000                                                              --游戏分数增加单位
    self.scoreLoadingBar = self.mView["scoreLoadingBar"]                                       --分数等级进度条
    self.scoreLoadingBar:setPercent(0)
    self.timeLoadingBar = self.mView["timeLoadingBar"]                                         --时间进度条
    self.timeLoadingBar:setPercent(100)
    self:registeredClickEvent()
    self:generatePeople()
    -- -- 开启update
    self:onUpdate(handler(self,self.update))
    -- --是不是截图运行
    -- if global.isGrabScreenMode == 1 then
    -- else
    -- end
end

--注册点击事件
function gameScene:registeredClickEvent()
    -- 触摸开始
    local function onTouchBegan(touch, event)
        -- 获取点击位置
        local location = touch:getLocation()
        self:judgeSelected(location)
        return true
    end
    -- 触摸移动
    local function onTouchMoved(touch, event)
        -- 获取滑动位置
        local location = touch:getLocation()
        self:judgeSelected(location)
        return true
    end
    -- 触摸结束
    local function onTouchEnded(touch, event)
        -- -- 获取结束位置
        local location = touch:getLocation()
        self:judgeSelected(location)
        self:satisfyElimination()
        return true
    end
    local listener = cc.EventListenerTouchOneByOne:create()
    -- 注册两个回调监听方法
    listener:registerScriptHandler(onTouchBegan,cc.Handler.EVENT_TOUCH_BEGAN )
    listener:registerScriptHandler(onTouchMoved,cc.Handler.EVENT_TOUCH_MOVED )
    listener:registerScriptHandler(onTouchEnded,cc.Handler.EVENT_TOUCH_ENDED )
    -- 事件派发器
    local eventDispatcher = self:getEventDispatcher()
    -- 绑定触摸事件到层当中
    eventDispatcher:addEventListenerWithSceneGraphPriority(listener, self)
end

function gameScene:update(dt)
    self.newGameTime = self.newGameTime + dt
    if self.newGameTime >= 1 then
        self.newGameTime = self.newGameTime - 1
        self.gameRemainingTime = self.gameRemainingTime - self.gameGrade
        if self.gameRemainingTime < 0  then
            self.gameRemainingTime = 0 
        end
        self.timeLoadingBar:setPercent(self.gameRemainingTime / self.gameTime * 100)
        if self.gameRemainingTime <= 0 then
            self:gameOver()
        end
    end
end

--生成人物
function gameScene:generatePeople()
    for i = 1, self.maxPeopleRow do
        if self.peoplePoolTable[i] == nil then
            self.peoplePoolTable[i] = {}
        end
        for j = 1, self.maxPeopleColumn do
            local people = newPeople:createPeople(i, j)
            self.mView["peoplePool"]:addChild(people)
            table.insert(self.peoplePoolTable[i], people)
        end
    end
end

--检测是否鼠标是否碰到人物
function gameScene:judgeSelected(point)
    for i = 1, #self.peoplePoolTable do
        for j = 1, #self.peoplePoolTable[i] do
            if self.peoplePoolTable[i][j].selectedStatus == false and newPeople:judgeSelected(self.peoplePoolTable[i][j], point) then
                local length = #self.peopleSelectedTable
                if length > 0 and self.peoplePoolTable[i][j].type == self.peopleSelectedTable[length].type then
                    if (self.peoplePoolTable[i][j].j == self.peopleSelectedTable[length].j + 1 and self.peoplePoolTable[i][j].i == self.peopleSelectedTable[length].i) or --上
                       (self.peoplePoolTable[i][j].j == self.peopleSelectedTable[length].j - 1 and self.peoplePoolTable[i][j].i == self.peopleSelectedTable[length].i) or --下
                       (self.peoplePoolTable[i][j].j == self.peopleSelectedTable[length].j and self.peoplePoolTable[i][j].i == self.peopleSelectedTable[length].i + 1) or --右
                       (self.peoplePoolTable[i][j].j == self.peopleSelectedTable[length].j and self.peoplePoolTable[i][j].i == self.peopleSelectedTable[length].i - 1) or --左
                       (self.peoplePoolTable[i][j].j == self.peopleSelectedTable[length].j - 1 and self.peoplePoolTable[i][j].i == self.peopleSelectedTable[length].i - 1) or --下左
                       (self.peoplePoolTable[i][j].j == self.peopleSelectedTable[length].j + 1 and self.peoplePoolTable[i][j].i == self.peopleSelectedTable[length].i - 1) or --上左
                       (self.peoplePoolTable[i][j].j == self.peopleSelectedTable[length].j - 1 and self.peoplePoolTable[i][j].i == self.peopleSelectedTable[length].i + 1) or --下右
                       (self.peoplePoolTable[i][j].j == self.peopleSelectedTable[length].j + 1 and self.peoplePoolTable[i][j].i == self.peopleSelectedTable[length].i + 1)    --上右
                    then
                        self.peoplePoolTable[i][j].selectedStatus = true
                        local width = math.sqrt(math.pow((self.peoplePoolTable[i][j]:getPositionY() - self.peopleSelectedTable[length].y), 2) + math.pow((self.peoplePoolTable[i][j]:getPositionX() - self.peopleSelectedTable[length].x), 2))
                        local line = ccui.ImageView:create()
                        line:loadTexture("game/HeroLine/image/line.png", 0)
                        line:ignoreContentAdaptWithSize(false);
                        line:setContentSize(cc.size(width, 12))
                        line:setAnchorPoint(0.0000, 0.0000)
                        line:setPosition(self.peopleSelectedTable[length].x, self.peopleSelectedTable[length].y)
                        local angle = math.atan2(-1 * (self.peoplePoolTable[i][j]:getPositionY() - self.peopleSelectedTable[length].y), self.peoplePoolTable[i][j]:getPositionX() - self.peopleSelectedTable[length].x) * 180 / math.pi
                        line:setRotation(angle)
                        self.mView["linePool"]:addChild(line)
                        table.insert(self.linePoolTable, line)
                        table.insert(self.peopleSelectedTable, self.peoplePoolTable[i][j])
                    else
                        
                    end
                elseif length == 0 then
                    self.peoplePoolTable[i][j].selectedStatus = true
                    table.insert(self.peopleSelectedTable, self.peoplePoolTable[i][j])
                end
            end
        end
    end
end

--松开鼠标时检测选中的人数是否满足消除条件
function gameScene:satisfyElimination()
    if #self.peopleSelectedTable >= 3 then
        print("满足消除条件")
        self.peopleSelectedlength = #self.peopleSelectedTable
        for i = 1, #self.peopleSelectedTable do
            for index = 1, #self.peoplePoolTable[self.peopleSelectedTable[i].i] do
                if self.peoplePoolTable[self.peopleSelectedTable[i].i][index].j == self.peopleSelectedTable[i].j then
                    table.remove(self.peoplePoolTable[self.peopleSelectedTable[i].i], index)
                    break
                end
            end
            local scoreLabel = newAnimation:createAnimation(cc.p(self.peopleSelectedTable[i].x, self.peopleSelectedTable[i].y))
            self.mView["peoplePool"]:addChild(scoreLabel)
            self.peopleSelectedTable[i]:removeFromParent()
        end
        for i = 1, #self.linePoolTable do
            self.linePoolTable[i]:removeFromParent()
        end
        self:eliminationEvent()
        self.linePoolTable = {}
        self.peopleSelectedTable = {}
    else
        for i = 1, #self.linePoolTable do
            self.linePoolTable[i]:removeFromParent()
        end
        for j = 1, #self.peopleSelectedTable do
            self.peopleSelectedTable[j].selectedStatus = false
        end
        self.linePoolTable = {}
        self.peopleSelectedTable = {}
        self.peopleSelectedlength = 0
        print("不满足消除条件")
    end
end

--人物消除时的特效以及新人物的添加
function gameScene:eliminationEvent()
    for i = 1, self.maxPeopleRow do
        for j = 1, self.maxPeopleColumn do
            if self.peoplePoolTable[i][j] == nil then
                local people = newPeople:createNewPeople(i, j)
                self.mView["peoplePool"]:addChild(people)
                table.insert(self.peoplePoolTable[i], people)
            else
                if self.peoplePoolTable[i][j].j ~= j then
                    newPeople:moveDownAnimation(self.peoplePoolTable[i][j], j)
                    self.peoplePoolTable[i][j].j = j
                end
            end
        end
    end
    --增加分数
    if self.peopleSelectedlength < 5 and self.peopleSelectedlength >= 3 then
        self.score = score[1]
    elseif self.peopleSelectedlength < 7 and self.peopleSelectedlength >= 5 then
        self.score = score[2]
    elseif self.peopleSelectedlength >= 7 then
        self.score = score[3]
    end
    if self.peopleSelectedlength >= 5 then
        self.gameRemainingTime = self.gameRemainingTime + self.peopleSelectedlength * self.gameGrade
    end
    if self.gameRemainingTime > self.gameTime then
        self.gameRemainingTime = self.gameTime
    end
    self.allScore = self.allScore + self.peopleSelectedlength * self.score
    self.mView["scoreLabel"]:setString("分数："..self.allScore)
    local all = 0
    for i = 1, self.gameGrade do
        all = all + i
    end
    if self.allScore >= all * self.scoreIncreaseUnit then
        self.gameGrade = self.gameGrade + 1
    end
    if self.gameGrade == 1 then
        self.scoreLoadingBar:setPercent(self.allScore / self.scoreIncreaseUnit * 100)
    else
        local index = 0
        for i = 1, self.gameGrade do
            if i == self.gameGrade then
                break
            end
            index = index + i
        end
        self.scoreLoadingBar:setPercent((self.allScore - index  * self.scoreIncreaseUnit) / (self.gameGrade * self.scoreIncreaseUnit) * 100)
    end
    self.mView["gameGradeLabel"]:setString(self.gameGrade)
    self.peopleSelectedlength = 0
end

--返回大厅
function gameScene:returnClick()
    print("你点击了返回按钮");
    AudioEngine.playEffect("game/HeroLine/sound/Button.mp3",false)
    require("logic.common.launcher.game"):create():run("game.HeroLine.loginScene")
end

--游戏结束
function gameScene:gameOver()
    print("进入结算")
    --显示弹窗
    AudioEngine.playEffect("game/HeroLine/sound/win.mp3", false)
    global.saveTools.saveData("scoreNumber", self.allScore)
    local winUI = winLayer.create()
    self:addChild(winUI,999)
    local size = winUI:getContentSize()
    winUI:setPosition(display.cx-size.width/2, display.cy-size.height/2)
    CCDirector.sharedDirector():pause()
end

return gameScene
