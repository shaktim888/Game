local gameScene = class("gameScene", cc.load("mvc").ModuleBase)
gameScene.RESOURCE_FILENAME = "game/MountaintopJumps/GameScene.lua"
local viewJump = require("logic.common.views.viewJump")
local winLayer = require("logic.game.MountaintopJumps.winLayer")
local terrainClass = require("logic.game.MountaintopJumps.terrain")
local newTerrain = terrainClass.new()
local peopleClass = require("logic.game.MountaintopJumps.people")
local newPeople = peopleClass.new()
local Shuffle = cc.load("tools").Shuffle
local time = 1

gameScene.behavior = {
    "logic.common.behavior.BtnBinder",
    "logic.common.behavior.TouchInterrupt",
    "logic.common.behavior.Listener",
}

--创建界面
function gameScene:onCreate(score)
    --播放背景音乐
    audio.playMusic("game/MountaintopJumps/sound/bgm.mp3",true)
    self.mapPoolTable = {}                                                                  --地图存表
    self.maxTerrainNumber = 7                                                               --地图一行最大个数
    self.middleTerrainNumber = math.ceil(self.maxTerrainNumber / 2)                       --地图一行中间个数
    self.maxTerrainRow = 18                                                                 --地图最大行
    self.terrainWidth = 70                                                                  --地图块宽度
    self.terrainHeight = 60                                                                 --地图块高度
    self.terrainUpOffsetHeight = 60                                                         --地图块高度
    self.allScore = score and score or 0                                                    --人物获得的分数
    self.potionScore = 5                                                                    --药水的分数
    self.people = nil                                                                       --人物在地图表中的i坐标位置
    self.peopleI = 1                                                                        --人物在地图表中的i坐标位置
    self.peopleJ = math.random(1, self.maxTerrainNumber)                                    --人物在地图表中的j坐标位置
    self.newRobotJumpTime = 0                                                               --机器人跳跃时间控制
    self.robotTabel = {}                                                                    --机器人跳跃时间间隔
    self.maxRobotNumber = 5                                                                 --生成机器人的数量

    self:generateMap()
    self.people = newPeople:createPeople(self.mapPoolTable[self.peopleI][self.peopleJ])
    self:generateRobot()
    self.mView["scoreLabel"]:setString("分数：" .. self.allScore)
    self.mView["peoplePool"]:addChild(self.people)
    self.mView["btn_back"]:addTouchEventListener(function(sender, state)
        self:unscheduleUpdate()
        local LoginScene = require("logic.game.MountaintopJumps.LoginScene")
        local UIgameScene = LoginScene.new()
        UIgameScene:showWithScene()
    end)
    
    
    -- self.people:setPosition(self.mapPoolTable[self.peopleI][self.peopleJ]:getPositionX(), self.mapPoolTable[self.peopleI][self.peopleJ]:getPositionY() + newPeople.peopleOffsetY)
    self:buildPath(self.peopleI, self.peopleJ)
    self.touchStatus = 0                                                        --点击屏幕左右状态 0 没有点击，-1 左，1 右
    self:registeredClickEvent()
    -- 开启update
    self:onUpdate(handler(self,self.update))
    --是不是截图运行
    if global.isGrabScreenMode == 1 then
    else
    end
end

--注册点击事件
function gameScene:registeredClickEvent()
    -- 触摸开始
    local function onTouchBegan(touch, event)
        if self.people.JumpLock == true or self.peopleI == self.maxTerrainRow then
            return 
        end
        -- 获取点击位置
        local location = touch:getLocation()
        --print(location.x  ..  "  " .. location.y)
        if location.x > display.cx then
            self.touchStatus = 1
        elseif location.x < display.cx then
            self.touchStatus = -1
        elseif location.x == display.cx then
            self.touchStatus = 0
            return true
        end
        self:jumpProcessEvent()
        --print("self.touchStatus：" .. self.touchStatus)
        return true
    end
    -- 触摸移动
    local function onTouchMoved(touch, event)
           --print("触摸移动：" .. self.touchStatus)
        return true
    end
    -- 触摸结束
    local function onTouchEnded(touch, event)
        --print("触摸结束：" .. self.touchStatus)
        self.touchStatus = 0
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
    self.newRobotJumpTime = self.newRobotJumpTime + dt
    if self.newRobotJumpTime >= newPeople.peopleJumpTimeInterval + newPeople.peopleJumpTime then
        time = 0
        for i = 1, self.maxRobotNumber do
            time = time + 1
            local jumpBool = math.random(0, 100) % 2 == 0 and false or true
            if jumpBool then
                local jumpDirection = math.random(0, 100) % 4
                local nextPoint = {}
                if jumpDirection == 0 then      --下左
                    nextPoint = self:judgingLeftJump(self.robotTabel[i].i, self.robotTabel[i].j)
                elseif jumpDirection == 1 then  --下右
                    nextPoint = self:judgingRightJump(self.robotTabel[i].i, self.robotTabel[i].j)
                elseif jumpDirection == 2 then  --上左
                    nextPoint = self:judgingReverseLeftJump(self.robotTabel[i].i, self.robotTabel[i].j)
                elseif jumpDirection == 3 then  --上右
                    nextPoint = self:judgingReverseRightJump(self.robotTabel[i].i, self.robotTabel[i].j)
                end
                print(time)
                print(nextPoint[1])
                print(nextPoint[2])
                print(#nextPoint)


                if #nextPoint == 2 then
                    if nextPoint[1] and nextPoint[2] and self.mapPoolTable[nextPoint[1]][nextPoint[2]] 
                    and self.mapPoolTable[nextPoint[1]][nextPoint[2]].type < newTerrain.TerrainTypre.Tree then
                        local event = function ()
                            self.robotTabel[i].i = nextPoint[1]
                            self.robotTabel[i].j = nextPoint[2]
                            self:detectionCollision({self.robotTabel[i]})
                        end
                        newPeople:peopleJump(self.robotTabel[i], self.mapPoolTable[nextPoint[1]][nextPoint[2]], event)
                    end
                end
            end
        end
        self.newRobotJumpTime = self.newRobotJumpTime - (newPeople.peopleJumpTimeInterval + newPeople.peopleJumpTime)
    end
end

--生成地图
function gameScene:generateMap()
    local terrainHorizontal = 1                                                 --生成地图时的地图块所在的行数
    local terrainX = 0                                                          --生成地图时的X坐标
    local terrainY = 0                                                          --生成地图时的Y坐标
    local newTerrainNumber = 0                                                  --生成地图块时这一行的个数
    for terrainHorizontal = 1, self.maxTerrainRow do
        if self.mapPoolTable[terrainHorizontal] == nil then
            self.mapPoolTable[terrainHorizontal] = {}
        end
        local terrainNumber = terrainHorizontal % 2 == 1 and self.maxTerrainNumber or self.maxTerrainNumber - 1
        terrainY = (self.maxTerrainRow - terrainHorizontal + 1 ) * self.terrainHeight + self.terrainUpOffsetHeight
        for terrainVertical = 1, terrainNumber do
            local terrain = nil
            if terrainHorizontal == self.peopleI and terrainVertical == self.peopleJ then
                terrain = newTerrain:createTerrain(terrainHorizontal == self.maxTerrainRow, math.random(newTerrain.TerrainTypre.Lawn, newTerrain.TerrainTypre.Land)) 
            else
                terrain = newTerrain:createTerrain(terrainHorizontal == self.maxTerrainRow) 
            end
            self.mView["mapPool"]:addChild(terrain)
            if terrainHorizontal % 2 == 1 then
                newTerrainNumber = terrainVertical % self.maxTerrainNumber == 0 and self.maxTerrainNumber or terrainVertical % self.maxTerrainNumber
                terrainX = display.width / 2 + (newTerrainNumber - self.middleTerrainNumber) * self.terrainWidth
            else
                newTerrainNumber = terrainVertical % (self.maxTerrainNumber - 1) == 0 and (self.maxTerrainNumber - 1) or terrainVertical % (self.maxTerrainNumber - 1)
                terrainX = display.width / 2 + (newTerrainNumber - self.middleTerrainNumber + 0.5) * self.terrainWidth
            end
            table.insert(self.mapPoolTable[terrainHorizontal], terrain)
            terrain:setPosition(terrainX, terrainY)
        end
    end
end

--生成机器人
function gameScene:generateRobot()
    for index = 1, self.maxRobotNumber do
        local i = math.random(5,  self.maxTerrainRow - 1)
        local maxTerrainNumber = i % 2 == 1 and self.maxTerrainNumber or self.maxTerrainNumber - 1
        local j = math.random(1,  maxTerrainNumber)
        newTerrain:replaceTerrain(self.mapPoolTable[i][j], math.random(newTerrain.TerrainTypre.Lawn,  newTerrain.TerrainTypre.Land))
        local robot = newPeople:createRobot(self.mapPoolTable[i][j])
        robot.i = i
        robot.j = j
        table.insert(self.robotTabel, robot)
        self.mView["peoplePool"]:addChild(robot)
    end
end

--点击跳跃后的处理事件
function gameScene:jumpProcessEvent()
    local nextPoint = {}
    if self.touchStatus == -1 then
        nextPoint = self:judgingLeftJump(self.peopleI, self.peopleJ)
    elseif self.touchStatus == 1 then
        nextPoint = self:judgingRightJump(self.peopleI, self.peopleJ)
    end
    if #nextPoint == 0  or self.mapPoolTable[nextPoint[1]][nextPoint[2]].type >= newTerrain.TerrainTypre.Tree then
        --print("人物位置在最左或最右或者前方有障碍物，不能跳")
        return
    end
    local event = function ()
        self.peopleI = nextPoint[1]
        self.peopleJ = nextPoint[2]
        if self.peopleI == self.maxTerrainRow then
            --print("开始下一局游戏")
            local UIgameScene = gameScene.new(nil,nil,self.allScore)
            UIgameScene:showWithScene()
        end
        if self.mapPoolTable[self.peopleI][self.peopleJ].type == newTerrain.TerrainTypre.Stab then
            self:gameOver()
            --print("下一格是地刺人物死亡")
            return
        elseif self.mapPoolTable[self.peopleI][self.peopleJ].type == newTerrain.TerrainTypre.Potion then
            --print("下一格是药水人物加分")
            self.allScore = self.allScore + self.potionScore
            self.mView["scoreLabel"]:setString("分数：" .. self.allScore)
            newTerrain:replaceTerrain(self.mapPoolTable[self.peopleI][self.peopleJ], newTerrain.TerrainTypre.Lawn)
        end
        local nowLeftPoint = self:judgingLeftJump(self.peopleI, self.peopleJ)
        local nowRightPoint = self:judgingRightJump(self.peopleI, self.peopleJ)
        if (#nowLeftPoint == 0 and self.mapPoolTable[nowRightPoint[1]][nowRightPoint[2]].type >= newTerrain.TerrainTypre.Tree)
            or (#nowRightPoint == 0 and self.mapPoolTable[nowLeftPoint[1]][nowLeftPoint[2]].type >= newTerrain.TerrainTypre.Tree)
            or (#nowLeftPoint ~= 0 and #nowRightPoint ~= 0 
            and self.mapPoolTable[nowRightPoint[1]][nowRightPoint[2]].type >= newTerrain.TerrainTypre.Tree 
            and self.mapPoolTable[nowLeftPoint[1]][nowLeftPoint[2]].type >= newTerrain.TerrainTypre.Tree)
        then
            self:gameOver()
            --print("下一格死路人物死亡")
        end
        self:detectionCollision(self.robotTabel)
    end
    newPeople:peopleJump(self.people, self.mapPoolTable[nextPoint[1]][nextPoint[2]], event)
end

--生成一条必定可跳跃至终点的线路
function gameScene:buildPath(i, j)
    if i == self.maxTerrainRow -1 then
        return
    end
    local buildRandom = math.random(0, 100) % 2
    local replaceTerrain = function (k,l)
        --print(11111111111)
        local index = math.random(0, 100) % 2
        newTerrain:replaceTerrain(self.mapPoolTable[k][l], index)
        self:buildPath(k,l)
    end
    local nextPoint = {}
    if buildRandom == 0 then
        nextPoint = self:judgingLeftJump(i, j)
        if #nextPoint == 0 then
            nextPoint = self:judgingRightJump(i, j)
        end
    elseif buildRandom == 1 then
        nextPoint = self:judgingRightJump(i, j)
        if #nextPoint == 0 then
            nextPoint = self:judgingLeftJump(i, j)
        end
    end
    --print(nextPoint[1], nextPoint[2])
    --print(self.mapPoolTable[nextPoint[1]][nextPoint[2]].type)
    if self.mapPoolTable[nextPoint[1]][nextPoint[2]].type >= newTerrain.TerrainTypre.Stab then
        replaceTerrain(nextPoint[1], nextPoint[2])
    else
        self:buildPath(nextPoint[1], nextPoint[2])
        -- replaceTerrain(nextPoint[1], nextPoint[2])
    end
end

--判断人物是否可以左跳跃，返回一个坐标数组
function gameScene:judgingLeftJump(i, j)
    if i == self.maxTerrainRow then
        return {}
    end
    local nextI = i + 1
    local nextJ = 0
    local singleOrDouble = nextI % 2 == 1
    if not singleOrDouble and j == 1 then
        print("位置在最左，不能在左")
        return {}
    end
    if singleOrDouble then
        nextJ = j
    else
        nextJ = j - 1
    end
    return {nextI, nextJ}
end

--判断人物是否可以反向左跳跃，返回一个坐标数组
function gameScene:judgingReverseLeftJump(i, j)
    if i == 1 then
        return {}
    end
    local nextI = i - 1
    local nextJ = 0
    local singleOrDouble = nextI % 2 == 1
    if not singleOrDouble and j == 1 then
        --print("位置在最左，不能在左")
        return {}
    end
    if singleOrDouble then
        nextJ = j
    else
        nextJ = j - 1
    end

    return {nextI, nextJ}
end

--判断人物是否可以右跳跃，返回一个坐标数组
function gameScene:judgingRightJump(i, j)
    if i == self.maxTerrainRow then
        return {}
    end
    local nextI = i + 1
    local nextJ = 0
    local singleOrDouble = nextI % 2 == 1
    if not singleOrDouble and j == self.maxTerrainNumber then
        --print("位置在最右，不能在右")
        return {}
    end
    if singleOrDouble then
        nextJ = j + 1
    else
        nextJ = j
    end
    return {nextI, nextJ}
end

--判断人物是否可以右跳跃，返回一个坐标数组
function gameScene:judgingReverseRightJump(i, j)
    if i == 1 then
        return {}
    end
    local nextI = i - 1
    local nextJ = 0
    local singleOrDouble = nextI % 2 == 1
    if not singleOrDouble and j == self.maxTerrainNumber then
        --print("位置在最右，不能在右")
        return {}
    end
    if singleOrDouble then
        nextJ = j + 1
    else
        nextJ = j
    end
    return {nextI, nextJ}
end

--游戏结束
function gameScene:gameOver()
    --print("进入结算")
    --显示弹窗
    self:unscheduleUpdate()
    AudioEngine.playEffect("game/MountaintopJumps/sound/win.mp3", false)
    global.saveTools.saveData("scoreNumber", self.allScore)
    local winUI = winLayer.create()
    self:addChild(winUI,999)
    local size = winUI:getContentSize()
    winUI:setPosition(display.cx-size.width/2, display.cy-size.height/2)
    CCDirector.sharedDirector():pause()
end

--创建矩形
function gameScene:toConvertToWorldSpace(aim) 
    if not aim then
        return 
    end
    local x = aim:getPositionX()
    local y = aim:getPositionY()
    local size = 1 
    local pos = aim:getParent():convertToWorldSpace(cc.p(x,y))
    local rect = cc.rect(pos.x , pos.y , size, size)
    return rect
end

--检测碰撞
function gameScene:detectionCollision(robot)
    local peopleRect = self:toConvertToWorldSpace(self.people)
    for i = 1, #robot do
        local robotRect = self:toConvertToWorldSpace(robot[i])
        if cc.rectIntersectsRect(peopleRect, robotRect) then
            self:gameOver()
            --print("机器人碰到人了")
        else
            --print("没碰撞了")
        end
    end
end

--游戏场景截图结束后截结算场景
function gameScene:grabscreen()
    self:gameOver()
end

return gameScene
