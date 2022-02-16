local stateControl = class("stateControl", cc.load("mvc").BehaviorBase)
local state = cc.load("state").state
local cfg = require("logic.views.GameScene.cfg.cfg")

function stateControl:initState()
    local GameMessage =
    {
        Start   = "Start",      -- 开始
        Win     = "Win",        -- 胜利
        Fail    = "Fail",       -- 失败
        Reset   = "Reset",      -- 重置

        Player   = "Player",      --玩家先手
        AI   = "AI",      --AI先手
        Switch  = "Switch",     -- 切换对手
    }
    self.GameMessage = GameMessage
    local on = function(e)
        return function(message, instance)
            return message == e
        end
    end
    self.stateMachine = state.StateMachine.new("DSQ_State")
    local initial = state.PseudoState.new("初始化", self.stateMachine, state.PseudoStateKind.Initial)
    local waiting = state.State.new("等待" , self.stateMachine)
    local playing = state.State.new("游戏中", self.stateMachine)
    local settled = state.State.new("结算", self.stateMachine)

    local initialP = state.PseudoState.new("已开局", playing, state.PseudoStateKind.Initial)
    local select = state.State.new("选择开局", playing)
    local playerRound = state.State.new("玩家回合", playing)
    local AIRound = state.State.new("AI回合", playing)

    initial:to(waiting)
    waiting:to(playing):when(on(GameMessage.Start))
    playing:to(settled):when(on(GameMessage.Fail))
    playing:to(settled):when(on(GameMessage.Win))
    playing:to(waiting):when(on(GameMessage.Reset))
    settled:to(waiting):when(on(GameMessage.Reset))

    initialP:to(select)
    select:to(playerRound):when(on(GameMessage.Player))
    select:to(AIRound):when(on(GameMessage.AI))
    playerRound:to(AIRound):when(on(GameMessage.Switch))
    AIRound:to(playerRound):when(on(GameMessage.Switch))
    settled:to(AIRound):when(on(GameMessage.Switch)) ---广告复活

    
    settled:entry(handler(self, self.gameOver))
    waiting:entry(handler(self, self.reset))
    playerRound:entry(handler(self, self.playerRound))
    AIRound:entry(handler(self, self.AIRound))

    self.stateInstance = state.StateMachineInstance.new("dsqGame")
    state.initialise(self.stateMachine, self.stateInstance)
end

function stateControl:sendMessage(message)
    state.evaluate(self.stateMachine, self.stateInstance, message)
end

function stateControl:switch()
    local result = self:checkGameOver()
    if result == cfg.MSG.FAIl then
        self:sendMessage(self.GameMessage.Fail)
        self:lose()
        self.round = "fail"
    elseif result == cfg.MSG.NEXT_LEVEL then
        self:nextLevel()
        self.round = "next_level"
    elseif result == cfg.MSG.WIN then
        self:sendMessage(self.GameMessage.Win)
    else 
        self:sendMessage(self.GameMessage.Switch)
    end 
    
end

function stateControl:start()
    self:sendMessage(self.GameMessage.Start)
    self:sendMessage(self.GameMessage.AI)
    self.bStartGame = true
end

function stateControl:onCreate()
    self:initState()
    self:start()
end

function stateControl:gameOver()
    
end

function stateControl:reset()
    
end

function stateControl:playerRound()
    
end

function stateControl:AIRound()
    
end

function stateControl:lose() 
    AudioEngine.playEffect(cfg.Sound.game_over,false)
    local localSave = global.saveTools.getData(cfg.LocalSave)
    localSave.level = self._iLevel
    global.saveTools.saveData(cfg.LocalSave, localSave)
    local function adSuccess()
        self.roleMap[self.iPlayerIDx]:getChildByName("hp"):setPercent(100)
        self.roleMap[self.iPlayerIDx].HP = self.s_aLevelsDiagram[self._iLevel].player_hp
        self:sendMessage(self.GameMessage.Switch)
        local over = self:getChildByName("over")
        over:removeFromParent(true)
    end
    local over = require("logic.views.GameOver.Enter").new(nil,nil,adSuccess)
    self:addChild(over)
    over:setName("over")
end

function stateControl:nextLevel()
    print("nextLevel")
    -- local text = cfg.TEXT_NEXT_LEVEL
    -- local view = WinMsg.new(nil,nil,text,cfg.MSG.NEXT_LEVEL)
    -- global.viewMgr.showView(view, true)
    AudioEngine.playEffect(cfg.Sound.game_over,false)
    local localSave = global.saveTools.getData(cfg.LocalSave)
    localSave.level = self._iLevel + 1
    global.saveTools.saveData(cfg.LocalSave, localSave)
    global.viewController.gotoView("game")
end

return stateControl
