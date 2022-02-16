local uiControl = class("uiControl", cc.load("mvc").BehaviorBase)
local Jiesuan = import("..jiesuan")

local CELL_MAX = 4
local actionTools = require("logic.common.tools.effectTools")

local IMG_PATH = "game/niuniutiaozhan/image/%s"
-- local CHOICE_PATH = "game/niuniutiaozhan/image/choice/%s"
-- local FOOD_PATH = "game/niuniutiaozhan/image/food/%s"

local roleDieRes = "game/landllord2.png"
local roleNormalRes = "game/landllord1.png"

local hammerRes = "game/hammer.png"
local hitEffRes = "game/effectHit.png"

local HEART_COUNT = 7

local function widgetloadTexture(widget_, texture_, t_type_)
    widget_:getChildByName("img"):loadTexture(texture_, t_type_)
    -- widget_:getChildByName("img"):ignoreContentAdaptWithSize(true)
end

local function getImageInPnl(pnl, index)
    local cellpnl = pnl:getChildByName(string.format("cell%d", index))
    if cellpnl then
        return cellpnl:getChildByName("tool"):getChildByName("img")
    else
        print("not find cellpnl "..index)
    end
end

function uiControl:onCreate()
    self._counter = 0
    self._score = 0
    self._time = 0

    local pnl = self.mView["contentpnl"]
    pnl:removeAllChildren()

    self.mView["contentpnl"]:addTouchEventListener(
        handler(self, self.touchListener)
    )

    local img_ready = self.mView["img_ready"]
    global.async.runInNextFrame(function ()
        img_ready:runAction(cc.Sequence:create(
            cc.CallFunc:create(function ()
                img_ready:setPositionX(-600) 
            end),
            cc.DelayTime:create(1),
            cc.EaseSineInOut:create(cc.MoveBy:create(0.5, cc.p(1000, 0))),
            cc.EaseSineInOut:create(cc.MoveBy:create(0.25, cc.p(-50, 0))),
            cc.DelayTime:create(0.5),
            cc.MoveBy:create(0.25, cc.p(1000, 0)),
            cc.CallFunc:create(function ()
                self:start() 
            end))
        )
    end)
end

function uiControl:roundStepReset()
    global.async.runInNextFrame(function ()
        self:startRound()
    end)
end

function uiControl:nextRound()
    print("uiControl:nextRound")
end

function uiControl:startRound()

end

function uiControl:start()
    print("uiControl:start")
    
    self._counter = 0 
    self._score = 0
    self._time = 0
    if not self._infall_handler then
        math.randomseed(os.time())
        self._infall_handler = cc.Director:getInstance():getScheduler():scheduleScriptFunc(handler(self, self.gameRun), 1, false)
    end
    -- self:startRound()
    global.async.runInNextFrame(function ()
        self:prepare()
    end)
end

function uiControl:onExit()
    self:stop()
end

local PROGRESS_MAX = 30
local EXTRA_TIME = 15
function uiControl:updateDataShow(time_num_)
    self.mView["datapnl"]:getChildByName("label_time"):setString(time_num_)
    self.mView["datapnl"]:getChildByName("label_score"):setString(self._score)
end

local GAME_WIDTH = 780
local GAME_HEIGHT = 720
local CELL_RADIUS = 150

local BASE_DIFF = 30

local function getPos(p)
    if not p then
        local p = {}
        p.x = math.floor(math.random(CELL_RADIUS , GAME_WIDTH - CELL_RADIUS))
        p.y = math.floor(math.random(CELL_RADIUS , GAME_HEIGHT - CELL_RADIUS))
        return p
    end
    local r = math.random(CELL_RADIUS + BASE_DIFF, 2 * CELL_RADIUS)

    local a = {{-90, 90}, {0, 180}, {90, 270}, {180, 360}}
    local i = 1
    local x, y
    repeat
        if i > #a then
            i = 1
        end
        
        local angt = a[i]
        local delta = math.random(angt[1], angt[2])
        delta = math.floor(delta)

        x = p.x + math.floor(r * math.cos(delta))
        y = p.y + math.floor(r * math.sin(delta))

    until ( ((x < (GAME_WIDTH - CELL_RADIUS)) and (x > CELL_RADIUS)) and ((y < (GAME_HEIGHT - CELL_RADIUS)) and (y > CELL_RADIUS)))

    local ret = { x = x, y = y}
    return ret
end

local function buildCell(cellmodel_)
    -- cellmodel_:getChildByName("img"):loadTexture("")
    cellmodel_:getChildByName("border"):runAction(cc.RepeatForever:create(
        cc.RotateBy:create(1, 360)
    ))
    return cellmodel_
end

-- local pointTbl = {}
local contentPnl = nil
function uiControl:updateGameShow(time_num_)
    if not contentPnl or tolua.isnull(contentPnl) then
        contentPnl = self.mView["gamepnl"]:getChildByName("contentpnl")
    end

    local children = contentPnl:getChildren()
    local p = nil

    if self:isEyeModel() then
        local cur_time = os.time()
        for i, v in ipairs(children) do
            if v.time then
                if v.time <= (cur_time - 2) then
                    v:removeFromParent()
                    break
                end
            end
        end

        children = contentPnl:getChildren()
        if #children ~= 0 then
            p = cc.p(children[#children]:getPosition())
        end

        local cell_model
        for i = #children + 1, CELL_MAX do
            p = getPos(p)

            local num = math.random(1, 600)
            if num < 100 then
                cell_model = buildCell(self.mView["unclickcell"]:clone())
                cell_model.die = true
                cell_model.time = os.time()
            else
                cell_model = buildCell(self.mView["cell"]:clone())
            end
            
            contentPnl:addChild(cell_model)    
            cell_model:setPosition(p)
        end
        return 
    end

    if #children <= CELL_MAX then
        if #children ~= 0 then
            p = cc.p(children[#children]:getPosition())
        end

        for i = #children + 1, CELL_MAX do
            p = getPos(p)
            local cell_model = buildCell(self.mView["cell"]:clone())
            contentPnl:addChild(cell_model)    
            cell_model:setPosition(p)
        end
    end
end

local pause = false
local record_curtime = 0
function uiControl:gameRun()
    if pause then
        return     
    end
    
    if (not self._dtime) or (self._dtime < 0) then
        record_curtime = os.time()
        -- if self:isBaseModel() then
        self._dtime = PROGRESS_MAX
        -- end

        if self:isShowTimeModel() then
            self._dtime = self._dtime + EXTRA_TIME
        end
    else
        local time = os.time()
        if record_curtime < time then
            self._dtime = self._dtime - (time - record_curtime)
            record_curtime = time

            if self._dtime == 0 then
                self:stop()
            end
        end
    end

    self:updateDataShow(self._dtime)

    if self:isEyeModel() then
        self:updateGameShow()
    end
end

function uiControl:onPauseGame()
    print("onSet===================== ")
    pause = true
end

function uiControl:onResumeGame()
    print("onSet===================== ")
    pause = false

    -- if self:isBaseModel() then
        record_curtime = os.time()
    -- end
end

function uiControl:updateScore()
    if self:isBaseModel() then
        -- self.mView["top1"]:getChildByName("score"):setString(self._score)
    else
        -- self.mView["top2"]:getChildByName("score"):setString(self._score)
    end
end

function uiControl:prepare()
    -- self:roundStart()
    global.async.runInNextFrame(function ()
        self:startRound()
    end)
end

function uiControl:stop()
    if self._infall_handler then
        cc.Director:getInstance():getScheduler():unscheduleScriptEntry(self._infall_handler)
        self._infall_handler = nil
    end
end

function uiControl:roundStart()
    print("uiControl:roundStart")
    global.async.runInNextFrame(function ()
        self:nextStep()    
    end)
end

function uiControl:roundStepNext()
    print("uiControl:roundStepNext")
    self:updateGameShow()
end

function uiControl:roundStepErr()
    print("uiControl:roundStepErr")
    if not contentPnl or tolua.isnull(contentPnl) then
        contentPnl = self.mView["gamepnl"]:getChildByName("contentpnl")
    end

    if not self:isEyeModel() then
        contentPnl:removeAllChildren()
    end
    self._score = math.max(0, self._score - 1)

    if self:isNomissModel() then
        self:stop()
    else
        global.async.runInNextFrame(function ()
            self:roundStepReset()
        end)
    end
end
function uiControl:roundStepEnd()
    print("uiControl:roundStepEnd")
end

function uiControl:gameOver()
    print("uiControl:gameOver")
end

function uiControl:reset()
    print("uiControl:reset")
end

function uiControl:touchListener(sender_, event_type_)
    -- print("touchListener === "..tostring(event_type_))
    if event_type_ == 2 then
        
        local pos = sender_:getTouchEndPosition()
        pos.x = math.floor(pos.x)
        pos.y = math.floor(pos.y)
        
        local pnl = self.mView["contentpnl"]
        local children = pnl:getChildren()
        for i, v in ipairs(children) do

            local rect = v:getBoundingBox()
            local p = pnl:convertToNodeSpace(pos)
            if cc.rectContainsPoint(rect, p) then
                if self:isEyeModel() then
                    if v.die then
                        v:removeFromParent()
                        self:errStep()
                        return
                    end
                end

                self._score = self._score + 1
                v:removeFromParent()
                self:nextStep()
                return 
            end
        end

        self:errStep()
    end
end

function uiControl:showJiesuanView(isWin)
    local view = Jiesuan.new(nil, nil, isWin)
    global.viewMgr.showView(view, true)
end

function uiControl:gameOver(isWin)
    local time = PROGRESS_MAX
    if self:isShowTimeModel() then
        time = PROGRESS_MAX + EXTRA_TIME
    end

    if self:isNomissModel() then
        time = PROGRESS_MAX - self._dtime
    end
    
    local data = {
       score = self._score,
       time = time
    }

    self:showJiesuanView(data)
end

return uiControl