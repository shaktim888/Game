local GuardCastle = class("GuardCastle", cc.load("mvc").ModuleBase)
GuardCastle.RESOURCE_FILENAME = "game/GuardCastle/Game.csb"
local cfg = require("logic.game.GuardCastle.cfg.cfg")

GuardCastle.behavior ={
    "logic.common.behavior.BtnBinder",
    "logic.common.behavior.FontColorChange",
    "logic.common.behavior.MusicIsOpen"
}
GuardCastle.changecolorfont = {
    timeText = {},
    title = {},
    scoreText = {}
}
local MusicBtnImagePath = "game/GuardCastle/images/hall/"

GuardCastle.music_is_open = {
    musicBtn = {
        open  = MusicBtnImagePath.."but_on.png",
        close = MusicBtnImagePath.."but_off.png",
        bgm = cfg.Sound.bgm
    }
}


local WinMsg = require("logic.game.GuardCastle.WinMsg")
local Pause = require("logic.game.GuardCastle.Pause")
local Rule = require("logic.game.GuardCastle.Rule")

local Arrow = require("logic.game.GuardCastle.Arrow")
local Monster = require("logic.game.GuardCastle.Monster")

local _oMonster
local _oArrow
local _iScore 
local _aSaveInfo
local _iTimeInterval
local _iMonsterId
local _iArrowId
local _iCountdown
local _iStateMsg
local _bPlayerAttack 
local _bBigKill
local _iCoolingTime
local _iCoolingTimeTotal
local _bControllCoolingTime
local _iCastleHP
local _iMonsterAttackSpeed

function GuardCastle:onCreate(sex)
    self:initGameInfo(sex)
    self:onUpdate(handler(self, self.update))   
end 

function GuardCastle:onbtnBackClick()
    global.viewJump.gotofishJump()

end

function GuardCastle:onbtnKill2Click()
    
    local show = cc.Show:create()
    local fadeIn = cc.FadeIn:create(0.3)
    local fadeOut = cc.FadeOut:create(0.3)
    local seq = cc.Sequence:create(show,fadeIn, fadeOut)
    self.mView["shade"]:runAction(seq)
    self.mView["shade"]:setLocalZOrder(1000)
    -- self.mView["shade"]:runAction(seq)
end

function GuardCastle:onbtnRuleClick()
    local view = Rule.new()
    global.viewMgr.showView(view, true)
end

function GuardCastle:initGameInfo()
    
    _iStateMsg = cfg.STATE.STATE_PLAY
    _iScore = 0
    _iTimeInterval = 0
    _bPlayerAttack = false
    _iMonsterId = 0
    _iArrowId = 0
    _iCoolingTime = 0
    _iCoolingTimeTotal = cfg.COOLINGTIME
    _oMonster = {}
    _oArrow = {}
    _bBigKill = false
    _bControllCoolingTime = false
    _iCountdown = cfg.GAME_TIME
    _iCastleHP = cfg.Castle.HP
    _iMonsterAttackSpeed = 0
    self:initPlayerInfo()
    self:setTime(_iCountdown)
    local sex = global.saveTools.getData(cfg.SEX_SAVE_TO_LOCAL)
   
    self:playerAttack()
    self.mView["coolingTimeText"]:setVisible(false)
    
    self.mView["hp"]:setPercent(100)
    self.mView["scoreText"]:setString("X 0")
    self.mView["smoke"]:setVisible(false)
end

function GuardCastle:removeArrowID(id)
    _oArrow[id] = nil
end

function GuardCastle:initPlayerInfo()
    local  _aSaveInfo = global.saveTools.getData(cfg.PLAYER_INFO_SAVE_TO_LOCAL) or {}
    if _aSaveInfo.sex and _aSaveInfo.name then
        self.mView["headImage"]:loadTexture(cfg._sImagePath_.."select/head_".._aSaveInfo.sex..".png")
        self.mView["playerName"]:setString(_aSaveInfo.name)
    end
end

function GuardCastle:playerAttack()
   local function onTouchBegan(touch, event)
        return true
   end
   local function onTouchEnded(touch,event)
        local location = touch:getLocation()
        self:spawnArrow(cfg.Arrow[1],location)
   end
   local listener = cc.EventListenerTouchOneByOne:create()
   listener:registerScriptHandler(onTouchBegan, cc.Handler.EVENT_TOUCH_BEGAN)
   listener:registerScriptHandler(onTouchEnded, cc.Handler.EVENT_TOUCH_ENDED)
   local eventDispatcher = self:getEventDispatcher()
   eventDispatcher:addEventListenerWithSceneGraphPriority(listener, self)
end

function GuardCastle:setTime(time)
    self.mView["timeText"]:setString(cfg.TEXT_TIME..time)
end

function GuardCastle:update(dt)
    if  _iStateMsg == cfg.STATE.STATE_PLAY then
        self:checkHurt()
        self:checkArrowRectCastle(dt)
        if _bBigKill then
            self:spawnBigKill()
        end
        if _bControllCoolingTime then
            self:setCoolingTime(dt)
        end
        _iTimeInterval =  _iTimeInterval + dt
        if _iTimeInterval > cfg.MonsterSpawnSpeed then
            self:spawnMonster()
            self:checkMonsterPos()
            self:updateMonsterArrow()
            _iTimeInterval = 0
            _iCountdown = _iCountdown -1
            if _iCountdown == 0 then
                self:over(true)
            end
            self:setTime(_iCountdown)
        end
    end
end

function GuardCastle:checkMonsterPos()
    for i,v in pairs(_oMonster) do
        local x,y = v:getPosition()
        if (x > 0 and x < cfg.CANVAS_WIDTH) then
            self:spawnArrow(cfg.Arrow[3],{x = x, y =y})
        end
    end
end

function GuardCastle:updateMonsterArrow()
    for i,v in pairs(_oMonster) do
        if v._aInfo.id ~= 1 and v._bStartArchery then
            v:arrowAttack(v._aInfo.id)           
        end
    end
end

function GuardCastle:spawnMonster()
    _iMonsterId = _iMonsterId + 1
    local randId
    if math.random() < 0.9 then
        randId = math.random(1,2)
    else
        randId = 3
    end
    local monsterPath = "game/GuardCastle/images/game/monster_"
    local obj = cc.Sprite:create(monsterPath..randId..".png")
    -- obj:setScale(0.5)
    _oMonster[_iMonsterId] = Monster:create(cfg.MONSTER[randId],obj,_iMonsterId,self)
end

function GuardCastle:spawnArrow(info,targetPoint)
    _iArrowId = _iArrowId + 1
    local arrowPath = "game/GuardCastle/images/game/arrow_"
    local id = info.id
    if (info.id == 3 or info.id == 4 ) then
        id = 1
    end
    local obj = cc.Sprite:create(arrowPath..id..".png")

    -- local quad = cc.ParticleSystemQuad:create("game/GuardCastle/images/game/pao.plist")
    -- obj:setScale(0.5)
    -- quad:setRotation(-90)
    -- obj:addChild(quad)
    _oArrow[_iArrowId] = Arrow:create(info,obj,_iArrowId,targetPoint,self)
end

 --炮台对怪的伤害
function GuardCastle:checkHurt()
    -- if #_oArrow == 0 or #_oMonster == 0  then return end
    for i,v in pairs(_oMonster) do
        for j,n in pairs(_oArrow) do
            if v and n and n._bStartMove then
                if n._aInfo.id ~= 2 then
                    -- print("正在检测",v._iID)
                    local monsterRect = v._oMonster:getBoundingBox()
                    local arrowRect = n._oContainer:getBoundingBox()
                    if cc.rectIntersectsRect(monsterRect, arrowRect)then
                        self:removeChild(n._oContainer)
                        _oArrow[j] = nil
                        v._iHP = v._iHP - 1
                        if (v._iHP <= 0) then
                            AudioEngine.playEffect(cfg.Sound.enemydamage,false)
                            self:removeChild(v._oMonster)
                            _oMonster[i] = nil
                            self:addScore()
                            -- print("移除",v._iID)
                            break
                        end
                    end
                end
            end
        end
    end
end

--怪对炮台的伤害检测
function GuardCastle:checkArrowRectCastle(dt)
    local castleRect = self.mView["castle"]:getBoundingBox()
    for i,v in pairs(_oArrow) do
         if v._aInfo.id == 2 and v._bStartMove then
             local x,y = v._oContainer:getPosition()
             if cc.rectContainsPoint(castleRect, cc.p(x,y)) and (not v._bInvalid) then
                v:stopMoveAction()
                AudioEngine.playEffect(cfg.Sound.castledamage,false)

                global.async.delay(2):Then(function()
                    self:removeChild(v._oContainer)
                    _oArrow[i] = nil
                    
                end)
                self:minusCastleHp()
             end
         end
    end
    for i,v in pairs(_oMonster) do
        if v._oMonster and v._aInfo.id == 1 then
            _iMonsterAttackSpeed = _iMonsterAttackSpeed + dt 
            if _iMonsterAttackSpeed > 1 then
                AudioEngine.playEffect(cfg.Sound.attackSword,false)
                _iMonsterAttackSpeed = 0 
                self:minusCastleHp()
            end
        end
    end
end

function GuardCastle:spawnBigKill()

    local LorR = math.random(1,2)
    local x = math.random(cfg.BigKillRange.x[LorR][1],cfg.BigKillRange.x[LorR][2])
    local y = math.random(cfg.BigKillRange.y[1],cfg.BigKillRange.y[2])
    self:spawnArrow(cfg.Arrow[4],{x = x, y =y})
    global.async.delay(cfg.BigKillTime):Then(function()
        _bBigKill = false
    end)
end

function GuardCastle:setCoolingTime(dt)
    _iCoolingTime = _iCoolingTime + dt
    if _iCoolingTime > 1 then
        _iCoolingTime = 0
        _iCoolingTimeTotal = _iCoolingTimeTotal - 1
        if not self.mView["coolingTimeText"]:isVisible() then
            self.mView["coolingTimeText"]:setVisible(true)
        end
        self.mView["coolingTimeText"]:setString(tostring(_iCoolingTimeTotal))
        if (_iCoolingTimeTotal == 0) then
            _bControllCoolingTime = false
            _iCoolingTimeTotal = cfg.COOLINGTIME
            self.mView["coolingTimeText"]:setVisible(false)
            self.mView["btnKill"]:setEnabled(true)
        end
    end
end

function GuardCastle:over(isSuccess)
    _iStateMsg = cfg.STATE.STATE_OVER
    AudioEngine.playEffect(cfg.Sound.game_over,false)
    local text = cfg.TEXT_GAME_OVER
    if isSuccess then
        text = cfg.TEXT_SUCCESS
    end
    local view = WinMsg.new(nil,nil,text,cfg.MSG.FAIL)
    global.viewMgr.showView(view, true)

end

function GuardCastle:onbtnPauseClick()
    AudioEngine.playEffect(cfg.Sound.click,false)
    local callback = function()
        _iStateMsg = cfg.STATE.STATE_PLAY
    end 
    local view = Pause.new(nil,nil,callback)
    global.viewMgr.showView(view, true)
    _iStateMsg = cfg.STATE.STATE_PAUSE
end

function GuardCastle:grabExitTest()
    global.viewJump.gotofishJump()
end

function GuardCastle:onbtnKillClick()
    AudioEngine.playEffect(cfg.Sound.bigSkill,false)
    self.mView["btnKill"]:setEnabled(false)
    _bBigKill = true
    _bControllCoolingTime = true
end

function GuardCastle:minusCastleHp()
    _iCastleHP = _iCastleHP - cfg.EachArrowHurt
    if (_iCastleHP < cfg.Castle.HP/2) then
        self.mView["smoke"]:setVisible(true)
    end
    if (_iCastleHP <= 0 ) then
       self:over(false)
    end
    self.mView["hp"]:setPercent(_iCastleHP)
end

function GuardCastle:addScore()
    _iScore = _iScore + 1
    self.mView["scoreText"]:setString("X "..tostring(_iScore))
end

return GuardCastle
