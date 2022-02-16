local FruitTurn = class("FruitTurn", cc.load("mvc").ModuleBase)
FruitTurn.RESOURCE_FILENAME = "game/FruitTurn/Game.csb"
FruitTurn.behavior ={
    "logic.common.behavior.FontColorChange",
}

FruitTurn.changecolorfont = {
    timeText = {},
    title = {}
}

local cfg = require("logic.views.GameScene.cfg.cfg")
-- local WinMsg = require("logic.game.FruitTurn.WinMsg")
-- local Pause = require("logic.game.FruitTurn.Pause")

local _sImagePath = "game/FruitTurn/images/game/"
local BlickActTag = 20000
local _iScore 
local _aSaveInfo
local _iSelect
local _iRandIdx
local _iTimeInterval
local _aGame 
local _iFruitId
local _iFrontIdx 
local _iCountdown
local _iStateMsg
local level
local _iSuccessTimes
function FruitTurn:onCreate()
    level = global.saveTools.getData(cfg.FruitTurn_SAVE) or 1
    self:initGameInfo(level)
    self:onUpdate(handler(self, self.update))   

end 

function FruitTurn:initGameInfo(idx)
    _iScore = global.saveTools.getData(cfg.FruitTurn_SAVE_SCORE) or 0
    self.mView["scoreText"]:setString(_iScore)
    _iStateMsg = cfg.STATE.STATE_INIT
    _iTimeInterval = 0
    _aGame = cfg.LevelInfo[idx]
    _iFruitId = 0
    _iFrontIdx = nil
    _iCountdown = _aGame.Time
    _iSuccessTimes = 0
    self:setTime(_iCountdown)
    
    self:initFruitInfo()
    -- self:initSound(_aSaveInfo.isOpenMusic)
    -- _aSaveInfo.idx = idx
    -- global.saveTools.saveData(cfg.FruitTurn_SAVE, _aSaveInfo)

    local addComponentConfig = {
        self,
        self.mView["headPanel"],
        self.mView["scoreText"]
    }
    local panel_top_btn = require("logic/viewController/componentController").new(addComponentConfig)
end

function FruitTurn:initFruitInfo()
    self.fruitMap = {}
    local fruitData = {}
    for m = 1,_aGame.Num*_aGame.Num/2 do
        for n =1,2 do
            table.insert(fruitData, m)
        end
    end

    local function shuffle(tbl)
        local n = #tbl
        for i = 1, n do
            local j = math.random(i, n)
            if j > i then
                tbl[i], tbl[j] = tbl[j], tbl[i]
            end
        end
    end
    math.randomseed(tostring(os.time()):reverse():sub(1, 6))
    shuffle(fruitData)
    for i = 1,_aGame.Num do
        for j = 1,_aGame.Num do
            _iFruitId = _iFruitId + 1
            
            local fruit = self.mView['template']:clone()
            
            local idx = fruitData[_iFruitId]
            print(_iFruitId)
            print(idx)
            fruit:getChildByName("fruit"):loadTexture(_sImagePath.."fruit/"..idx..".png", 0)
            local blink = cc.Blink:create(6, 3)
            local bVisible = cc.CallFunc:create(function()
                fruit:getChildByName("back"):setVisible(true)
                if (_iStateMsg == cfg.STATE.STATE_INIT) then
                    _iStateMsg = cfg.STATE.STATE_PLAY
                end
            end)
            local seq = cc.Sequence:create(blink,bVisible)
            fruit:getChildByName("back"):runAction(seq)
            fruit.id = _iFruitId
            fruit.idx = idx
            fruit:setScale(_aGame.Scale)
            self.fruitMap[_iFruitId] = fruit
            self.mView["GamePanel"]:addChild(fruit)
            fruit:setPosition(_aGame.StartPos.x + _aGame.Space.width * (j-1), _aGame.StartPos.y - _aGame.Space.height * (i-1))
            fruit:getChildByName("click"):addTouchEventListener(function(sender,type)
                if type == 2 and _iStateMsg == cfg.STATE.STATE_PLAY then
                    self:fruitBtnSelectClick(sender)
                end
            end)
        end
    end
end


function FruitTurn:guideAction()
   
end

function FruitTurn:removeGuideAction()
    _bFirst = false
    self.mView['tap']:stopActionByTag(BlickActTag)
    self.mView['tap']:setVisible(false)

end

function FruitTurn:fruitBtnSelectClick(child)
    AudioEngine.playEffect(cfg.Sound.click,false)
    local obj = child:getParent()
   
    obj:getChildByName("back"):setVisible(false)
    
    if  _iFrontIdx == nil then
        _iFrontIdx = {idx = obj.idx ,id = obj.id}
    else
        if _iFrontIdx.idx ~= obj.idx then
            performWithDelay(self, function()
                self.fruitMap[_iFrontIdx.id]:getChildByName("back"):setVisible(true)
                obj:getChildByName("back"):setVisible(true)
                _iFrontIdx = nil
            end, 0.2)
           
        else
            _iSuccessTimes = _iSuccessTimes + 1 

            obj:getChildByName("click"):setEnabled(false)
            self.fruitMap[_iFrontIdx.id]:getChildByName("click"):setEnabled(false)
            _iFrontIdx = nil
            _iScore = _iScore + 1
            global.saveTools.saveData(cfg.FruitTurn_SAVE_SCORE, _iScore)
            self.mView["scoreText"]:setString(_iScore)
            if _iSuccessTimes == _aGame.Num * _aGame.Num/2  then
                self:checkState(1)
            end
        end
       
    end
end

function FruitTurn:setTime(time)
    self.mView["timeText"]:setString(cfg.TEXT_TIME..time)
end

function FruitTurn:update(dt)
    if  _iStateMsg == cfg.STATE.STATE_PLAY then
        _iTimeInterval =  _iTimeInterval + dt
        if _iTimeInterval > 1 then
            _iTimeInterval = 0
            _iCountdown = _iCountdown -1
            if _iCountdown == 0 then
                self:over()
            end
            self:setTime(_iCountdown)
        end 
    end
end

function FruitTurn:over()
    _iStateMsg = cfg.STATE.STATE_OVER
    AudioEngine.playEffect(cfg.Sound.game_over,false)
    -- local text = cfg.TEXT_GAME_OVER
    -- local view = WinMsg.new(nil,nil,text,cfg.MSG.FAIL)
    -- global.viewMgr.showView(view, true)
   self:checkState(2)
end

function FruitTurn:checkState(res)
    local ScorePanel = self.mView["ScorePanel"]
    local txt_congratulations = self.mView["txt_congratulations"]
    local btn_reset = self.mView["btn_reset"]
    local btn_next = self.mView["btn_next"]

    ScorePanel:setVisible(true)
    if res == 1 then 
        txt_congratulations:setString(" 皇城烽火  勇者屠龙!")
        level = level + 1;
        if level > 3 then
            level  = 3
        end
        global.saveTools.saveData(cfg.FruitTurn_SAVE, level)
        btn_reset:setVisible(false)
        btn_next:setVisible(true)   
    else
        txt_congratulations:setString("兵家常事 重新来过 !")
        btn_reset:setVisible(true)
        btn_next:setVisible(false)   
    end
end


function FruitTurn:onbtn_nextClick()
    local adSuccess = function()
        global.viewController.gotoView("game")
    end
    local type = display.width < display.height and 2 or 0
    local params = {
        adType = type,
        callback = adSuccess
    }
    if device.platform == "mac" then
        global.viewMgr.showTips("广告测试中...", 1)
        global.async.delay(1.2):Then(function()
            adSuccess()
        end)
    else
        local ok, ret = LuaObjcBridge.callStaticMethod("RootViewController", "podAds", params)
    end
end

function FruitTurn:onbtn_resetClick()
    global.viewController.gotoView("game")
end

function FruitTurn:onbtn_leaveClick()
    global.viewController.gotoView("start")
end

function FruitTurn:grabExitTest()
    global.viewJump.gotofishJump()
end


return FruitTurn
