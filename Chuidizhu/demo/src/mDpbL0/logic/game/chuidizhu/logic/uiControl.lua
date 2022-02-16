local uiControl = class("uiControl", cc.load("mvc").BehaviorBase)
local Jiesuan = import("..jiesuan")

-- uiControl.behavior = {
--     "logic.common.behavior.LongClick",
-- }

local CELL_MAX = 8
local actionTools = require("logic.common.tools.effectTools")

local IMG_PATH = "game/chuidizhu/image/%s"
-- local CHOICE_PATH = "game/chuidizhu/image/choice/%s"
-- local FOOD_PATH = "game/chuidizhu/image/food/%s"

local roleDieRes = "game/landllord2.png"
local roleNormalRes = "game/landllord1.png"

local hammerRes = "game/hammer.png"
local hitEffRes = "game/effectHit.png"

local HEART_COUNT = 7
-- local SNACK_BG = string.format(IMG_PATH, "snackborder.png")

-- local fall_t = 2

local function widgetloadTexture(widget_, texture_, t_type_)
    widget_:getChildByName("img"):loadTexture(texture_, t_type_)
    -- widget_:getChildByName("img"):ignoreContentAdaptWithSize(true)
end

local function roleNormal(img_)
    img_:loadTexture(string.format(IMG_PATH, roleNormalRes))
end

local function roleDie(img_)
    img_:loadTexture(string.format(IMG_PATH, roleDieRes))
end

local function getImageInPnl(pnl, index)
    local cellpnl = pnl:getChildByName(string.format("cell%d", index))
    if cellpnl then
        return cellpnl:getChildByName("tool"):getChildByName("img")
    else
        print("not find cellpnl "..index)
    end
end

local upactionisrun = 0
local function runUpActionByTarget(img, callback)
    -- img:stopAllActions()

    local size = img:getContentSize()
    img:setPositionY(0 - size.height/2)
    img:setVisible(true)

    print("size.height = "..size.height)

    img.__isup = true
    img.__ishit = nil

    local t = math.random(4,10)
    local dt = math.random(3,8)

    local dt1 = math.random(1,5)

    img:runAction(cc.Sequence:create(
        cc.DelayTime:create(dt1/10),    
        cc.MoveBy:create(t/10, cc.p(0, size.height - 35)), 
        cc.DelayTime:create(dt/10),
        cc.CallFunc:create(function ()
            img.__isup = nil
            print("y == "..img:getPositionY())
            upactionisrun = upactionisrun - 1

            if img.__ishit then
                print("====被击中了=============== "..tostring(img.__ishit))
            else
                print("====没有被击中=============== "..tostring(img.__ishit))
                -- 失败或者扣分或者咋地了
                -- self:errStep()
                
            end
            callback(img.__ishit)

            img:setVisible(false)
        end)
        )
    )
end

local function getHammer()
    local uri = string.format(IMG_PATH, hammerRes)
    print(uri)
    local img = ccui.ImageView:create(uri)    
    return img
end

local function getHitEff()
    local uri = string.format(IMG_PATH, hitEffRes)
    local img = ccui.ImageView:create(uri)    
    return img
end

local function getHammerAction(parentNode, ishit, pos)

    local img = getHammer()
    parentNode:addChild(img)
    -- img:setPosition(cc.p(display.cx, display.cy))
    img:setLocalZOrder(10)
    img:setPosition(pos)
    img:setRotation(75)

    if ishit then
        img:runAction(
            cc.Sequence:create(
                cc.EaseSineInOut:create(cc.RotateBy:create(0.05, -65)),
                cc.CallFunc:create(function ()
                    local effimg = getHitEff()
                    parentNode:addChild(effimg)
                    effimg:setPosition(150, 200)
                    effimg:runAction(cc.Sequence:create(
                        cc.FadeOut:create(0.5),
                        cc.RemoveSelf:create()
                    ))

                    roleDie(parentNode:getChildByName("tool"):getChildByName("img"))
                end),
                cc.RotateBy:create(0.05, 15),
                cc.DelayTime:create(1),
                cc.RemoveSelf:create()
            )
        )
    else
        img:runAction(
            cc.Sequence:create(
                cc.EaseSineInOut:create(cc.RotateBy:create(0.05, -65)),
                -- cc.CallFunc:create(function ()
                --     local effimg = getHitEff()
                --     parentNode:addChild(effimg)
                --     effimg:setPosition(150, 200)
                -- end),
                cc.RotateBy:create(0.05, 15),
                cc.DelayTime:create(1),
                cc.RemoveSelf:create()
            )
        )
    end
end

function uiControl:onCreate()
    upactionisrun = 0

    self._counter = 0
    self._score = 0

    local pnl = self.mView["pnl"]
    for i = 1, CELL_MAX do
        local img = getImageInPnl(pnl,i)
        if img then
            img:setVisible(false)
        else
            print("img 没找到===============")
        end
    end

    self.mView["touchpnl"]:addTouchEventListener(
        handler(self, self.touchListener)
    )

    global.async.runInNextFrame(function ()
        if self:isLifeModel() then
            print("isLifeModel == true")
            self.mView["top1"]:setVisible(true)
            self.mView["top2"]:setVisible(false)
        else
            print("isLifeModel == false")
            self.mView["top1"]:setVisible(false)
            self.mView["top2"]:setVisible(true)
        end
    end)
end


function uiControl:roundStepReset()
end

function uiControl:nextRound()
    print("uiControl:nextRound")
end

local function getIndexs()
    local a = math.random(1,1000)
    local c = a % 2 + 1

    local r1 = a % CELL_MAX + 1
    if (c == 1) then
        return r1
    end

    local r2 = math.random(1,1000) % CELL_MAX + 1
    if (r1 == r2) then
        return r1
    end
    return r1, r2
end
function uiControl:startRound()
    -- 8个洞中找出一个 或者两个

end

function uiControl:start()
    print("uiControl:start")
    -- self:prepare()
    -- self.scheduler = cc.Director:getInstance():getScheduler():scheduleScriptFunc(handler(self, self.gameRun))
    
    self._counter = 0 
    self._score = 0
    if not self._infall_handler then
        self._infall_handler = cc.Director:getInstance():getScheduler():scheduleScriptFunc(handler(self, self.gameRun), 0.8, false)
    end
end

function uiControl:onExit()
    self:stop()
end

local PROGRESS_MAX = 90
function uiControl:updateProgress(progress_num_)
    local progress_num = math.max(0, PROGRESS_MAX - progress_num_) 

    local progress_bar = self.mView["top1"]:getChildByName("progress")
    if progress_bar then
        local percent = math.floor(progress_num/PROGRESS_MAX * 100)
        progress_bar:setPercent(percent)
    end
end

local pause = false

local record_curtime = 0
function uiControl:gameRun()
    if pause then
        return     
    end

    if self:isLifeModel() then
        if (not self._dtime) or (self._dtime < 0) then
            record_curtime = os.time()
            self._dtime = PROGRESS_MAX
            self:updateProgress(PROGRESS_MAX)
        else
            local time = os.time()
            if record_curtime < time then
                self._dtime = self._dtime - (time - record_curtime)
                record_curtime = time
                self:updateProgress(self._dtime)

                if self._dtime == 0 then
                    self:stop()
                end
            end
        end
    end

    --  一个定时器控制  可能导致 游戏暂停但是 其他东西也暂停了  需要做到异步控制 所以用了这个开关
    upactionisrun = upactionisrun or 0
    if upactionisrun > 0 then
        return 
    end

    self:onShow()
end

function uiControl:onPauseGame()
    print("onSet===================== ")
    pause = true
end

function uiControl:onResumeGame()
    print("onSet===================== ")
    pause = false

    if self:isLifeModel() then
        record_curtime = os.time()
    end
end

local function runUpAction(pnl, index, callback)
    print(pnl, index)

    if index then
        local img = getImageInPnl(pnl, index)
        if img then
            roleNormal(img)
            runUpActionByTarget(img, callback)
            upactionisrun = upactionisrun + 1
        else
            print("not find img ")
        end
    end
end
function uiControl:onShow()
    local index1, index2 = getIndexs()
    local pnl = self.mView["pnl"]

    local function callback(tag)
        print("callback ============ "..tostring(tag))
        if not tag then
            self._counter = self._counter + 1
            self:roundStepErr()
        else
            self._score = self._score + 1
            self:updateScore()
        end
    end

    runUpAction(pnl, index1, callback)
    runUpAction(pnl, index2, callback)
end

function uiControl:updateScore()
    print("updateScore============== "..tostring(self._score))
    if self:isLifeModel() then
        self.mView["top1"]:getChildByName("score"):setString(self._score)
    else
        self.mView["top2"]:getChildByName("score"):setString(self._score)
    end
end

function uiControl:onHammer()
    
end

function uiControl:prepare()
end

function uiControl:stop()
    if self._infall_handler then
        cc.Director:getInstance():getScheduler():unscheduleScriptEntry(self._infall_handler)
        self._infall_handler = nil
    end

    -- self:gameOver()
end

function uiControl:roundStart()
    print("uiControl:roundStart")
end

function uiControl:roundStepNext()
    print("uiControl:roundStepNext")
end

function uiControl:roundStepErr()
    print("uiControl:roundStepErr")

    if not self:isLifeModel() then
        local index = HEART_COUNT - self._counter + 1
        print( " === index ===== "..tostring(index))
        -- 减少♥️
        local heartlist = self.mView["top2"]:getChildByName("list")
        for i = 1, HEART_COUNT do
            heartlist:getChildByName("heart"..i):setVisible(i < index)
        end

        if self._counter > HEART_COUNT then
            -- self:gameOver()
            self:stop()
        end
    else
        -- 算死了
        -- self:gameOver()
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

-- t] -     "y"      = 321.0705871582
-- [LUA-print] - }
-- [LUA-print] ASSERT FAILED ON LUA EXECUTE: Invalid name
-- stack traceback:
-- 	[string "src/haoyue/logic/game/chuidizhu/logic/uiControl.lua"]:262: in function <[string "src/haoyue/logic/game/chuidizhu/logic/uiControl.lua"]:244>
-- 	[string "src/haoyue/packages/mvc/ModuleBase.lua"]:347: in function <[string "src/haoyue/packages/mvc/ModuleBase.lua"]:342>
-- [LUA-print] y == 77.5

function uiControl:touchListener(sender_, event_type_)
    if event_type_ == 2 then
        local pos = sender_:getTouchEndPosition()
        local pnl = self.mView["pnl"]
        for i = CELL_MAX, 1, -1 do
            local cellp = pnl:getChildByName("cell"..i)
            local rect = cellp:getBoundingBox()
            local p = pnl:convertToNodeSpace(pos)

            if cc.rectContainsPoint(rect, p) then

                local img = cellp:getChildByName("tool"):getChildByName("img")
                local ishit = false
                if (img and img.__isup) then
                    ishit = true

                    -- self._counter = self._counter + 1
                end
                img.__ishit = ishit

                getHammerAction(cellp, ishit, cc.p(200, 250))
                break
            end
        end
    end
end

function uiControl:showJiesuanView(isWin)
    local view = Jiesuan.new(nil, nil, isWin)
    global.viewMgr.showView(view, true)
end


local chuidizhu_HISTORY_KEY = "chuidizhu_HISTORY_KEY"
function uiControl:gameOver(isWin)
    -- fall_t = 2

    local data = {
       score = self._score
    }
    self:showJiesuanView(data)
end

return uiControl