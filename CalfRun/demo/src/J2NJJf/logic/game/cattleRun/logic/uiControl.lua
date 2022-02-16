local uiControl = class("uiControl", cc.load("mvc").BehaviorBase)
local Jiesuan = import("..jiesuan")
-- local LevelFinish = import("..levelFinish")


-- uiControl.behavior = {
--     "logic.common.behavior.LongClick",
-- }

local actionTools = require("logic.common.tools.effectTools")

local IMG_PATH = "game/cattleRun/image/%s"
local CHOICE_PATH = "game/cattleRun/image/choice/%s"
local FOOD_PATH = "game/cattleRun/image/food/%s"

local SNACK_BG = string.format(IMG_PATH, "snackborder.png")

local fall_t = 2

local function widgetloadTexture(widget_, texture_, t_type_)
    widget_:getChildByName("img"):loadTexture(texture_, t_type_)
    -- widget_:getChildByName("img"):ignoreContentAdaptWithSize(true)
end

local function getMaterialRange(stage_)
    --{{habor_min, habor_max}, {snack_min, snack_max}}
    local material_num = 4 + stage_ - 1
    local fall_material = 4 + stage_
    return {material_num, fall_material}
end

--[[
    支持扩展为 单个关卡 制作几个汉堡的情况
]]
local function foodTemplate()
    return clone({
        {
            name = "汉堡",
            material_l = {
                {img = "habordown.png", food_y = 3},
                {img = "haborup.png", food_y = 45},
            }
        }
        -- {
        --     name = "", 
        --     material_l = {}
        -- },
        -- {
        --     name = "", 
        --     material_l = {}
        -- }
    })
end

-- local function produceFoodlist(foodlist_)
--     local habor = foodlist_[1]
--     local num = math.random(3, 10)
-- end

local SNACK_NAME_LIST = {"可乐","薯条","冰淇淋","牛奶"}
local SNACK_MATERIAL_LIST = {
    {img = "chips1.png", food_y = 30} ,
    {img = "chips1.png",food_y = 30},
    {img = "haborup.png",food_y = 30},
    {img = "haborup.png",food_y = 30},
}

local HABOR_MATERIAL_LIST = {    
    {img = "baconic.png", food_y = 3},
    {img = "haborup.png", food_y = 3},
    {img = "baconic.png", food_y = 3},
    {img = "haborup.png", food_y = 3},
    {img = "haborup.png", food_y = 3},
    {img = "baconic.png", food_y = 3},
    {img = "haborup.png", food_y = 3},
    {img = "haborup.png", food_y = 3},
    
    {img = "baconic.png", food_y = 3},
    {img = "chips1.png", food_y = 3},
    {img = "haborup.png", food_y = 40}
}

local pos_origin_x = 186
function uiControl:onCreate()

    -- self.mView["matriallist"]:getInnerContainer():setTouchEnabled(false)
    self._stage = 1
    --[[
        -- 不需要这么复杂 
        local foodlist = getFoodlist()
        local shuffle = cc.load("tools").Shuffle.new()
        shuffle:initByArr(foodlist)
        local iter = shuffle:start()
    ]]

    local foodlist = {
        {},{},{},{},{},{},{},{},{}
    }

    local foodnum  = 5  --math.random(5, 30)
    for i = 1, foodnum do
        foodlist[i] = foodTemplate()
    end

    for i = foodnum + 1, #foodlist do
        foodlist[i] = nil
    end

    -- dump(foodlist)
    -- produceFoodlist(foodlist)
    
    local material_list = clone(HABOR_MATERIAL_LIST)

    -- 移除 汉堡的上下 避免被随机到
    material_list[#material_list] = nil
    material_list[#material_list] = nil

    local co = coroutine.create(function ()
        for i = 1, foodnum do
            math.randomseed(tostring(os.time()):reverse():sub(1, 7))
            local m = getMaterialRange(i)

            local habor_num = m[1]
            local food = foodlist[i]
            for j = 1, habor_num do
                table.insert(food[1].material_l, 2, material_list[math.random(1, habor_num)])
            end

            for j = habor_num + 1, #food do
                food[j] = nil
            end

            print("foodlist ==== "..tostring(i))
            coroutine.yield(foodlist[i])
        end
    end)

    local iter = {
        next = function() 
            local ok, food = coroutine.resume(co)
            print(ok, food)
            if ok then 
                return food
            end
        end,
    }

    self._gameconf = {
        count = #foodlist,
        percent = 0,
        iter = iter
    }

    self.mView["touchpnl"]:addTouchEventListener(
        handler(self, self.touchListener)
    )

    local fallpnl = self.mView["fallpnl"]
    if fallpnl then
        pos_origin_x = fallpnl:getPositionX()
    end
end

function uiControl:getNextFood()
    self._gameconf.percent = self._gameconf.percent + 1
    return self._gameconf.iter.next()
end

local function initItem(item_, item_conf_)
    widgetloadTexture(item_, string.format(CHOICE_PATH, item_conf_.img), ccui.TextureResType.localType)
end

function uiControl:initlist()
    local fallpnl = self.mView["fallpnl"]
    for i = 1, 5 do
        local pnl = fallpnl:getChildByName(string.format("pnl%d",i ))
        if pnl then
            pnl:removeAllChildren()
        end
    end
end

function uiControl:pauseList()
    local fallpnl = self.mView["fallpnl"]
    for i = 1, 5 do
        local pnl = fallpnl:getChildByName(string.format("pnl%d",i ))
        if pnl then
            -- pnl:stopAllActions()
            local children = pnl:getChildren()
            for i, v in ipairs(children) do
                v:stopAllActions()
            end
        end
    end
end

local tbl_index_seed = 0

local function getRandomIndexTbl(stage_)
    

    math.randomseed(tostring(os.time()):reverse():sub(1,7))

    local range = (stage_ == 1) and 1 or 2
    local count = math.random( 1, range )

    -- print("count = "..count)
    -- local fall_index_tbl = {0,0,0,0,0}

    -- if #fall_index_tbl < count then
        -- local tbl1 = {1,2,3,4,5}
        -- local tbl2 = {5,4,3,2,1}

        -- local tbl = (tbl_index_seed % 2 == 0) and tbl1 or tbl2
        -- tbl_index_seed = tbl_index_seed + 1
        -- if tbl_index_seed > 100 then
        --     tbl_index_seed = 0
        -- end

        -- local open_index = stage_ + 1
        -- for i, v in ipairs(tbl) do
        --     if v <= open_index then
        --         fall_index_tbl[i] = v
        --     end
        -- end

        -- dump(fall_index_tbl)
        local fall_index_tbl = {1,2,3}

        for i = #fall_index_tbl, 1, -1 do
            if (fall_index_tbl[i] == 0) or (fall_index_tbl[i] == nil) then
                table.remove(fall_index_tbl, i)
            end
        end
    -- end
    
    -- dump(count)
    -- dump(fall_index_tbl)

    -- 预制table数量
    local l = {0,0,0}
    for i = 1, count do
        -- dump(fall_index_tbl)
        
        local index = math.random(1, #fall_index_tbl)
        l[i] = table.remove(fall_index_tbl, index)      
        -- dump(l, i)
        math.randomseed( tostring(l[i] + os.time()) )  
    end

    -- dump(l)

    for i = count+1, #l do
        l[i] = nil
    end
    return l
end

function uiControl:runFallAction(pnl_, widget_)

    -- print(" ====== runFallAction === "..os.time())

    local size = pnl_:getContentSize()

    local w_size = widget_:getContentSize()
    pnl_:addChild(widget_)

    widget_:setPosition(cc.p(size.width/2 - w_size.width/2, size.height))
    widget_:runAction(
        cc.Sequence:create(
            cc.MoveBy:create(
                fall_t,
                cc.p(0, -(size.height + w_size.height/2))
            ),
            cc.CallFunc:create(
                function ()
                    self:checkFallMaterialValid(widget_)
                end
            )
            -- cc.RemoveSelf:create()
        )
    )
end

function uiControl:getNextMaterial()
    math.randomseed(tostring(os.time()):reverse():sub(1,7))
    if not self._material_falllist or (#(self._material_falllist) == 0) then
        self._material_falllist = {}

        local material_tbl = clone(HABOR_MATERIAL_LIST)
        local snack_tbl = clone(SNACK_MATERIAL_LIST)
    
        local count = #HABOR_MATERIAL_LIST
        local l = self._material_falllist
        for i = 1, count do
            l[i] = table.remove(material_tbl, math.random(1, #material_tbl))
        end
        
        for i = 1 + count, count + #snack_tbl do
            l[i] = table.remove(snack_tbl, math.random(1, #snack_tbl))
        end
        count = count + #SNACK_MATERIAL_LIST
    end
    return table.remove(self._material_falllist, math.random(1, #self._material_falllist))
end

function uiControl:addScoreAndTime(score_)
    
    self.mView["score_num"]:setString(self._score_num)
end

function uiControl:speedUp()
    print("speedUp =========== "..fall_t)
    fall_t = fall_t - 0.2
end

function uiControl:startFall()
    -- fall_t = fall_t - 0.2
    if not self._in_fall then
        self._in_fall = true
        -- print("startFall ======="..os.time())
        self._infall_handler = cc.Director:getInstance():getScheduler():scheduleScriptFunc(handler(self, self.fall), 0.8, false)
    end

    self.__cur_plateindex = 2
    -- self:setPlatePos(1)
end

function uiControl:stopFall()
    -- print("stopFall ======="..os.time())

    self._in_fall = false
    if self._infall_handler then

        -- self:initlist()
        self:pauseList()
        
        cc.Director:getInstance():getScheduler():unscheduleScriptEntry(self._infall_handler)
        self._infall_handler = nil
    end
end

function uiControl:checkFallMaterialValid(item_)
    local index = item_.__pnl_index
    if (index == self.__cur_plateindex) then

        self:stopFall()
        -- local callback = function ()
            self:gameOver()
        -- end
        
        
        return 
    else
        item_:runAction(cc.RemoveSelf:create())
        self:addScoreAndTime(1)
        return 
    end

    if index == self.__cur_plateindex then

        local material_conf = item_.__material_data
        local target_conf = self:getMaterialData()

        if material_conf and target_conf then
            -- print(material_conf.img.." checkFallMaterialValid == "..tostring(target_conf.img))

            if material_conf.img == target_conf.img then
                local item = ccui.ImageView:create()
                item:loadTexture(string.format(FOOD_PATH, material_conf.img), ccui.TextureResType.localType)
                self.mView["plate"]:add(item)

                self.mView["plate"].food_y = self.mView["plate"].food_y or 50
                self.mView["plate"].food_y = self.mView["plate"].food_y + material_conf.food_y
                item:setPosition(cc.p(self.mView["plate"]:getContentSize().width/2, self.mView["plate"].food_y))

                -- print(self._stage.." ===valid == "..tostring(#self._foodconf))
                -- 分两种情况  一种是汉堡或者小吃制作结束 或者是一份订单制作结束    
                local conf = self._foodconf[1]
                if #conf.material_l == self._material_index then
                    -- if self._stage < #self._foodconf then
                    --     self:nextPlate()
                    -- else
                    --     self:endRoundStep()
                    -- end

                    local function nextStage()
                        self:endRoundStep()
                    end
                
                    self:stopFall()
                
                    local view = LevelFinish.new(nil, nil, 1, nil, nextStage, self._stage)
                    global.viewMgr.showView(view, true)
                else
                    self:nextStep()
                end
            else
                self:errStep()
            end
        else
            dump(material_conf)
            dump(target_conf)
        end
    else
        -- print(tostring(self.__cur_plateindex).." checkFallMaterialValid == "..tostring(index))
    end
end

function uiControl:fall()
    if not self or not self.mView or not self._in_fall then
        self:stopFall()
        return 
    end

    -- print("fall ======="..os.time())
    local food_in_stage = {}
    local num_l = getRandomIndexTbl(self._stage)
    table.sort(num_l)

    local fallpnl = self.mView["fallpnl"]
    -- local index = 1

    -- dump(num_l)
    local template = self.mView["choice_item"]
    -- for i = 1, 5 do
    for i, v in ipairs(num_l) do
        local pnl = fallpnl:getChildByName(string.format( "pnl%d", v))
        if pnl then
            local item = template:clone()
            local item_conf = self:getNextMaterial()
            widgetloadTexture(item, string.format(CHOICE_PATH, item_conf.img), ccui.TextureResType.localType)
            item:getChildByName("img"):setScale(1.5)
            item.__material_data = item_conf
            item.__pnl_index = v
            self:runFallAction(pnl, item)
            -- index = index + 1
        end
    end
end

function uiControl:updateOpenPnl()
    local index = self._stage
    local max_pnl_num = 5
    local open_count = max_pnl_num - index - 1

    local fallpnl = self.mView["fallpnl"]
    local fadepnl = fallpnl:getChildByName("fadepnl")
    if index > 3 then
        fadepnl:setVisible(false)
        return 
    else
        -- fadepnl:setVisible(true)
        fadepnl:setVisible(false)
    end

    -- for i = 1, max_pnl_num do
    --     if i == index + 2 then
    --         local pnl = fallpnl:getChildByName(string.format( "pnl%d", i))        
    --         if pnl then
    --             local width = (pnl:getContentSize().width + 12) * open_count 
    --             -- if fadepnl then
    --             fadepnl:setContentSize(cc.size(width,fadepnl:getContentSize().height))
    --             fadepnl:setPositionX(pnl:getPositionX())
    --             break
    --             -- end
    --         end
    --     end
    -- end
end

local function fourDiscardFiveup(number_)
    local int_v = math.floor( number_ )
    local float_v = (number_ - int_v)
    -- dump(float_v)
    local value = math.floor(float_v * 10)
    -- dump(value)
    return (value > 4) and (int_v + 1) or int_v
end


function uiControl:touchListener(sender_, event_type_)
    if event_type_ == 2 then
        local pos = sender_:getTouchEndPosition()

        dump(pos)
        local index = math.ceil((pos.x - pos_origin_x) / 288) 
        dump(index)
        self:setPlatePos(index)
    end
end

function uiControl:setPlatePos(index_)
    local plate = self.mView["plate"]

    -- if index_ > (self._stage + 1) then
    --     print("setPlatePos === stage is not open "..tostring(index_))
    --     return 
    -- end

    -- if (index_ == 1) or (index_ == 5) then
    --     return 
    -- end

    if self.__cur_plateindex == index_ then
        return 
    end

    plate:stopAllActions()

    local pnl = self.mView[string.format("pnl%d", index_)]
    if pnl then
        -- plate:setPositionX(pnl:getPositionX() + 64 + 105)
        plate:runAction(cc.MoveTo:create(
            0.4,
            cc.p(pos_origin_x + pnl:getPositionX() + 144, plate:getPositionY())
        ))

        self.__cur_plateindex = index_
    end
end

function uiControl:roundPrepare()

    -- do return end 
    
    local conf = self:nextCookRound()

    local function callback()
        -- self:resetMateriallist()
        -- self:showMateriallist()
        
        global.async.delay(0.2):Then(function()
            self:startRound()
        end)
    end

    -- dump(conf)
    if not conf then
        print("uiControl:roundPrepare() no conf! ")
        return 
    end

    callback()
    -- local view = LevelFinish.new(nil, nil, nil, conf[1], callback, self._stage)
    -- global.viewMgr.showView(view, true)
end

function uiControl:roundStart()
    -- print("uiControl:roundStart() ===="..os.time())
    self:stopFall()
    self:startFall()

    -- global.async.delay(0.2):Then(function()
    --     self:stepRound()
    -- end)
    -- 清理plate 的 list
end

function uiControl:getOpenRange()
    local range = self._stage
end

-- function uiControl:getScore()
-- end

-- function uiControl:getTimeNum()
-- end

-- function uiControl:updateTimeAndScore()
--     -- print("uiControl:updateTimeAndScore  "..time_)
--     if not self.mView then
--         if self._time_handler then
--             cc.Director:getInstance():getScheduler():unscheduleScriptEntry(self._time_handler)
--             self._time_handler = nil
--         end
--         return 
--     end

--     local pnl = self.mView["scorepnl"]

--     local time_ = self:getTimeNum()
--     local score_ = self:getScore()

--     if not pnl.widget_timenum then
--         pnl.widget_timenum = pnl:getChildByName("timenum")
--     end
--     pnl.widget_timenum:setString(math.max(0, time_))

--     if not pnl.widget_scorenum then
--         pnl.widget_scorenum = pnl:getChildByName("scorenum")
--     end
--     pnl.widget_scorenum:setString(math.max(0, score_))

--     if not pnl.widget_percentnum then
--         pnl.widget_percentnum = pnl:getChildByName("percentnum")
--     end
--     pnl.widget_percentnum:setString(string.format("%s/%s", self._gameconf.percent or 0, self._gameconf.count))

--     if time_ <= 0 then
--         self:stop()
--     end
-- end

-- function uiControl:playerChoiceValid()
--     local conf = self._foodconf[self._stage]
--     print(#conf.material_l.." uiControl:playerChoiceValid() ===="..self._material_index)

--     local material_conf = self:getMaterialData()
--     local tbl = self:getSortChildrenByPosX()
--     for i, v in ipairs(tbl) do
--         if i == self._stage then
--             local item = ccui.ImageView:create()
--             item:loadTexture(string.format(FOOD_PATH, material_conf.img), ccui.TextureResType.localType)
--             v:getChildByName("list"):add(item)

--             v.food_y = v.food_y or 50
--             v.food_y = v.food_y + material_conf.food_y
--             item:setPosition(cc.p(50, v.food_y))
--         end
--     end
    
--     -- 分两种情况  一种是汉堡或者小吃制作结束 或者是一份订单制作结束    
--     if #conf.material_l == self._material_index then
--         -- 加分操作
--         self:addScoreAndTime(self._material_index)

--         if self._stage < #self._foodconf then
--             self:nextPlate()
--         else
--             self:endRoundStep()
--         end
--     else
--         self:nextStep()
--     end
-- end

-- function uiControl:addScoreAndTime()
    
-- end

function uiControl:roundStepNext()
    -- print("uiControl:roundStepNext() ==== "..self._stage)

    self:recordCurMaterial()
    self._material_index = self._material_index + 1
    -- self:materialPointMove2Next()       
    
    -- self:refreshChoicelist()
end

function uiControl:roundStepErr()
    print("uiControl:roundStepErr() ====")

    -- self:resetFoodPoint()
    self:resetMaterialPoint()
    self:resetMateriallist()
    

    -- 清理plate 的 list
    self.mView["plate"]:removeAllChildren()
    self.mView["plate"].food_y = nil

    self:gameFailed()

    local view = LevelFinish.new(nil, nil, 2, nil, function ()
        global.async.delay(0.2):Then(function()
            self:roundStepReset()
            self:showMateriallist()
        end)
    end, self._stage)
    global.viewMgr.showView(view, true)
end

function uiControl:gameFailed()
    -- print("uiControl:gameFailed() ====")

    self:stopFall()

    local fallpnl = self.mView["fallpnl"]
    for i = 1, 5 do
        local pnl = fallpnl:getChildByName(string.format( "pnl%d", i))
        if pnl then
            for k, v in pairs(pnl:getChildren() or {}) do
                v:stopAllActions()
            end
        end
    end
end

function uiControl:nextRound()
    -- self:stopFall()
    -- self:startFall()
    -- self:start()
end

function uiControl:roundStepEnd()
    -- print("uiControl:roundStepEnd() ====")

    self.mView["plate"]:removeAllChildren()
    self.mView["plate"].food_y = nil

    -- 开始按钮显示 
    -- self.mView["btnStart"]:setVisible(true)  

    global.async.delay(0.2):Then(function()
        self:nextRound()
    end)
end

function uiControl:getMaterialData()

    -- print("uiControl:getMaterialData() ====")

    local conf = self._foodconf[1]
    local material = conf.material_l[self._material_index]

    -- dump(material)
    return material
end

-- function uiControl:sortChildrenByPosX()
--     --[[
--         妈蛋 这样排序排不了。。。
--     ]]

--     table.sort(self.mView["foodlist"]:getChildren(), function (a, b)
--         -- print(a:getPositionX() .." === "..b:getPositionX())
--         -- print(a:getName() .." === "..b:getName())
--         return a:getPositionX() < b:getPositionX()
--     end)
-- end

-- function uiControl:getSortChildrenByPosX()
--     local tbl = {}
--     for i, v in ipairs(self.mView["foodlist"]:getChildren()) do
--         tbl[i] = v
--     end

--     table.sort(tbl, function (a, b)
--         return a:getPositionX() < b:getPositionX()
--     end)
--     return tbl
-- end

function uiControl:resetFoodPoint()
    self._stage = 1
end

function uiControl:resetMaterialPoint()
    self._material_index = 1
end

function uiControl:resetMateriallist()
    local container = self.mView["matriallist"]:getInnerContainer()
    container:setPositionX(0)
    -- self.mView["arr"]:runAction(cc.MoveBy:create(0.5, cc.p(-105 * 2,0)))
    -- self.mView["arr"]:setPositionX(370)

    local index = 0
    local tmp_conf

    for i = 1, #self._foodconf do
        tmp_conf = self._foodconf[i]
        for k, v in pairs(tmp_conf.material_l) do
           index = index + 1

            if self._material_index == index then
                local item = self.mView["matriallist"]:getItem(index - 1)
                if item then
                    item:getChildByName("duigou"):setVisible(false)
                end
            end
        end
    end
end

function uiControl:recordCurMaterial()
    local tmp_conf
    local index = 0
    for i = 1, #self._foodconf do

        tmp_conf = self._foodconf[i]
        for k, v in pairs(tmp_conf.material_l) do
           index = index + 1

            if self._material_index == index then
                local item = self.mView["matriallist"]:getItem(index - 1)
                if item then
                    item:getChildByName("duigou"):setVisible(true)
                end
            end
        end
    end
end

function uiControl:materialPointMove2Next()
    -- food_index > 1 的时候 总共的material_index 肯定会>3 因为第一个汉堡的 materiallist 都超过3了
    if (self._stage == 1 and self._material_index > 3) or (self._stage > 1) then 
        -- local container = self.mView["matriallist"]:getInnerContainer()
        -- container:runAction(cc.MoveBy:create(0.5, cc.p(-100, 0)))

    else
        -- self.mView["arr"]:runAction(cc.MoveBy:create(0.5, cc.p(100,0)))
    end     
end

function uiControl:clearAllMaterial()
    
end

function uiControl:nextPlate()
    -- self:resetMaterialPoint()
    -- self:showMateriallist(true)
    -- self:recordCurMaterial()

    do return end
    -- self:materialPointMove2Next()
end

function uiControl:nextPlatePoint()
    self._stage = self._stage or 1
    self._stage = self._stage + 1
end

function uiControl:nextCookRound()
    -- print("nextCookRound====== ")

    local conf = self:getNextFood()
    if not conf then
        print("nextCookRound have no food!")
        self:gameOver()
        return 
    end

    -- 有这个玩意 就要进一级
    if self._foodconf then
        self:nextPlatePoint()
    end

    self:updateOpenPnl()

    self._foodconf = conf
    return conf
end

function uiControl:showMateriallist(next_plate_)
    do 
        self.mView["matriallist"]:setVisible(false)
        return 
    end

    self.mView["matriallist"]:removeAllItems()

    local conf = self._foodconf[1]
    assert(conf and conf.material_l, "err!!!   material_list not found!")

    -- print("conf.name == "..tostring(conf.name))
    self.mView["item"]:setRotationSkewY(0)

    local tmp_conf
    for i = 1, #self._foodconf do
        tmp_conf = self._foodconf[i]
        
        for k, v in pairs(tmp_conf.material_l) do
            local template = self.mView["item"]:clone()
            initItem(template, v)
    
            self.mView["matriallist"]:pushBackCustomItem(template)
            template:getChildByName("duigou"):setVisible(false)
        end
    end
    
    local function endcb()
    end

    local ActionCreater = require("logic.common.tools.ActionCreator")
    ActionCreater.listSideInShakeAction(self.mView["matriallist"], SCROLLVIEW_DIR_VERTICAL, endcb)

    self._material_index = 1
end

function uiControl:choiceClickCallback(sender_, index_)
    -- print(" == choiceClickCallback === index_ = "..tostring(index_))
end

function uiControl:showResult()
    
end

function uiControl:showJiesuanView(isWin)
    local view = Jiesuan.new(nil, nil, isWin)
    global.viewMgr.showView(view, true)
end

function uiControl:onClickItem(i, j)

end

function uiControl:stop()
    if self._time_handler then
        cc.Director:getInstance():getScheduler():unscheduleScriptEntry(self._time_handler)
        self._time_handler = nil
    end
end

local cattleRun_HISTORY_KEY = "cattleRun_HISTORY_KEY"
function uiControl:gameOver(isWin)
    fall_t = 2

    local data = {
       
    }
    self:showJiesuanView(data)
end

return uiControl