local stateControl = class("stateControl", cc.load("mvc").BehaviorBase)

local state = cc.load("state").state

function stateControl:initState()
    local GameMessage =
    {
        Start   = "Start",      -- 开始
        Win     = "Win",        -- 胜利
        Fail    = "Fail",       -- 失败
        Reset   = "Reset",      -- 重置

        White   = "White",      -- 白方先手
        Black   = "Black",      -- 黑方先手
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
    local whiteRound = state.State.new("白回合", playing)
    local blackRound = state.State.new("黑回合", playing)

    initial:to(waiting)
    waiting:to(playing):when(on(GameMessage.Start))
    playing:to(settled):when(on(GameMessage.Fail))
    playing:to(settled):when(on(GameMessage.Win))
    playing:to(waiting):when(on(GameMessage.Reset))
    settled:to(waiting):when(on(GameMessage.Reset))

    initialP:to(select)
    select:to(whiteRound):when(on(GameMessage.White))
    select:to(blackRound):when(on(GameMessage.Black))
    whiteRound:to(blackRound):when(on(GameMessage.Switch))
    blackRound:to(whiteRound):when(on(GameMessage.Switch))

    settled:entry(handler(self, self.gameOver))
    waiting:entry(handler(self, self.reset))
    whiteRound:entry(handler(self, self.whiteRound))
    blackRound:entry(handler(self, self.blackRound))

    self.stateInstance = state.StateMachineInstance.new("dsqGame")
    state.initialise(self.stateMachine, self.stateInstance)
end

function stateControl:sendMessage(message)
    state.evaluate(self.stateMachine, self.stateInstance, message)
end

function stateControl:switch()
    local result = self:checkGameOver()
    
    if result[1] then
        if not result[2] then
            self:showJiesuanView(true, true)
        else
            if result[2] == self:getPlayerHandType() then
                self:sendMessage(self.GameMessage.Win)
                self:showJiesuanView(true)
            else
                self:sendMessage(self.GameMessage.Fail)
                self:showJiesuanView(false)
            end
        end
    else
        self:sendMessage(self.GameMessage.Switch)
    end
end

function stateControl:start()
    self:sendMessage(self.GameMessage.Start)
    self:sendMessage(self.GameMessage.White)
end

function stateControl:onCreate()
    self:initState()
    self:start()
end

function stateControl:gameOver()
    
end

function stateControl:reset()
    
end

function stateControl:whiteRound()
    
end

function stateControl:blackRound()
    
end

return stateControl
