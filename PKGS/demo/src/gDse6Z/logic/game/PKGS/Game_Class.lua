-- 经典模式 HP
-- 场景资源加载
local GameScene = class("GameScene", cc.load("mvc").ModuleBase)
-- local GameScene = class( "GameScene",function ()
--     return cc.Scene:createWithPhysics()
-- end)

GameScene.RESOURCE_FILENAME = "game/PKGS/Game.csb"

local PeachA     = require("logic.game.PKGS.PeachA")
local PauseLayer = require("logic.game.PKGS.Pause")
local OverLayer  = require("logic.game.PKGS.Over")

GameScene.behavior ={
    "logic.common.behavior.BtnBinder",
    "logic.common.behavior.TouchInterrupt",
    "logic.common.behavior.Listener",
}

-- Game infos
local maxHp     = 3
local nowHp     = 3
local maxTime   = 15
local lastTime  = 60
local yPos      = 1100 -- 红桃A出现时Y的坐标
local scorePos  = 100
local score     = 0
local size      = cc.Director:getInstance():getVisibleSize()
local xBound    = 20
local isPause   = false
local combos    = 0
local ctCombo   = 0

-- CONST
local TEXT_SCORE       = "Score:"
local TEXT_TIME        = "Time:"
local UPDATETIME       = 1    -- 每过1秒改变时间
local GOT_SCORE_WAIT_TIME = 1 --得分后等待时间
local GAME_OVER_TITLE  = "Game Over!"
local COMBO_COUNT      = 3

function GameScene:onCreate()
    print("你进入了游戏界面")
    -- 物件获取
    self.card      = self.mView["card"]
    self.hpBar     = self.mView["hpBar"]
    self.textTime  = self.mView["textTime"]
    self.textTime:setVisible(false)
    self.textScore = self.mView["textScore"]
    self.butPause  = self.mView["butPause"]

    -- Init
    --self:cardAnimInit(self.card)
    local mainLayer = cc.Layer:create()
    mainLayer:addTo(self)

    local cardPos    = self:convertToNodeSpace(cc.p(self.card:getPosition()))

    self:setHp(maxHp)
    self:setScore(0)
    -- self:timeCountDown(maxTime) -- 倒计时
    math.randomseed( os.time() )

    self.peachA = PeachA:new({
        root = self.root,
        widthBound = xBound,
        heightBound = yPos,
        layer = mainLayer,
        checkCard   = self.card,
        gameScene = self,
        })
    self.peachA:createPeachA()
    self.peachA:spawn()

    self.pauseLayer = PauseLayer:create():addTo(self)
    self.pauseLayer:init(self)
    self.pauseLayer:setVisible(false)

    self.overLayer = OverLayer:create():addTo(self)
    self.overLayer:init(self,GAME_OVER_TITLE)
    self.overLayer:setVisible(false)
    
end

GameScene.btnBind = {
    butPause = "onButPause",
    card     = "onCard",
}

function GameScene:onButPause()
    
    if(isPause) then
        CCDirector:getInstance():resume()
        isPause = false
    else
        CCDirector:getInstance():pause()
        isPause = true
        self.pauseLayer:setVisible(true)
    end
end

function GameScene:onCard()
    print("card")
end

-- 倒计时lastTime
function GameScene:timeCountDown(time)
    print("开始倒计时：" .. time .. "s")
    self:setTime(time)

    local timeDecline = CCCallFuncN:create(function()
        if(self.getTime()<=UPDATETIME)then
            -- 若时间到，则游戏结束
            self.textTime:stopAllActions()
            self:onGameOver()
        end
        self:setTime(self:getTime()-1)
    end)

    local blow = self:beatAnim(1.1,0.1)
    
    local delay = cc.DelayTime:create(UPDATETIME)
    self.textTime:stopAllActions()
    self.textTime:runAction(cc.RepeatForever:create(cc.Sequence:create(delay, cc.Spawn:create(blow,timeDecline))))
end

function GameScene:setHp(val)
    nowHp = val
    if(val == 0) then
        self:onGameOver()
    end
    self.hpBar:setPercent(nowHp*100/maxHp)
end

function GameScene:getHp()
    return nowHp
end


function GameScene:setScore(val)
    score = val
    self.textScore:setString(TEXT_SCORE .. val)
    self.textScore:runAction(self:beatAnim(1.1,0.1))
end

function GameScene:getScore()
    return score
end

function GameScene:setTime(val)
    lastTime = val
    self.textTime:setString(TEXT_TIME .. val)
end

function GameScene:getTime()
    return lastTime
end

-- 跳动动画
function GameScene:beatAnim(size,time)
    local blowUp    = cc.ScaleBy:create(time,size)
    local blowDown  = blowUp:reverse()
    local blow      = cc.Sequence:create(blowUp,blowDown)
    return blow
end

function GameScene:gotoScoreField(score)
    if(score == 0) then
        ctCombo = 0
    else
        ctCombo = ctCombo + 1
        if(ctCombo >= COMBO_COUNT)then
            ctCombo = 0
            combos = combos + 1
            score = score + 1
        end
    end

    local action = CCCallFuncN:create(function ()
    self.peachA:setVisible(false)
    self:setScore(self:getScore()+score)
    audio.playSound(_Sound.addScore,false)
    end)
    local delay = cc.DelayTime:create(GOT_SCORE_WAIT_TIME)
    local replay = CCCallFuncN:create(function ()
        self.peachA:spawn()
    end)
    if(score == 0)then
        self.peachA:setAnim(cc.Sequence:create( delay,replay))
    else
        self.peachA:setAnim(cc.Sequence:create( cc.MoveTo:create(1,cc.p(size.width/2,scorePos)),action,delay,replay))
    end
end 

-- 游戏结束事件
function GameScene:onGameOver()
    print("GameOver")
    CCDirector:getInstance():pause() --游戏暂停
    self:saveData()
    self.peachA:setControlable(false)
    self.overLayer:setVisible(true)
    self.overLayer:onUpdate()

end

function GameScene:onReplay()
    print("Replay")
    self.peachA:spawn()
    self.peachA:setVisible(true)
    self:setHp(maxHp)
    self:setScore(0)
    self:timeCountDown(maxTime) -- 倒计时
    combos    = 0
    ctCombo   = 0
end

function GameScene:OnButBaseClick(but,callback)
    if but:getActionByTag(1) == nil then
        audio.playSound(_Sound.addScore,false)
        local blowUp   = cc.ScaleBy:create(0.3,1.3)
        local blowDown = blowUp:reverse()
        local cb       = cc.CallFunc:create(callback)
        local but_anim = cc.Sequence:create(blowUp,blowDown,cb)
        but_anim:setTag(1)
        but:runAction(but_anim)
    end
 end

 function GameScene:saveData()
    local ud = cc.UserDefault:getInstance()
    local sc = self:getScore()
    for i = 1,3,1 do
        if (sc > ud:getIntegerForKey("highScore" .. tostring(i) ))then
            local tmp = ud:getIntegerForKey("highScore" .. tostring(i) )
            ud:setIntegerForKey("highScore" .. tostring(i) , sc)
            sc = tmp
        end
    end
    
    sc = combos
    for i = 1,3,1 do
        if (sc > ud:getIntegerForKey("highCombo" .. tostring(i) ))then
            local tmp = ud:getIntegerForKey("highCombo" .. tostring(i) )
            ud:setIntegerForKey("highCombo" .. tostring(i) , sc)
            sc = tmp
        end
    end
 end

return GameScene 
