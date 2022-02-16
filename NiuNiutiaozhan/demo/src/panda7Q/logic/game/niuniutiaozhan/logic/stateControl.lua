local stateControl = class("stateControl", cc.load("mvc").BehaviorBase)

local state = cc.load("state").state

function stateControl:initState()
    local GameMessage =     {
        Start = "Start", -- 开始
        Balance    = "Balance", -- 结算分数
        Reset = "Reset", -- 重置

        RoundPrepare = "RoundPrepare",
        RoundStart = "RoundStart",
        -- RoundStep = "RoundStep",
        RoundStepErr = "RoundStepErr",
        RoundNextStep = "RoundNextStep",
        RoundStepEnd = "RoundStepEnd",
        RoundStepReset = "RoundStepReset",
        RoundStepRestart = "RoundStepRestart",
    }
    self.GameMessage = GameMessage
    local on = function(e)
        return function(message, instance)
            return message == e
        end
    end

    self.stateMachine = state.StateMachine.new("niuniutiaozhan_State")
    local initial = state.PseudoState.new("初始化", self.stateMachine, state.PseudoStateKind.Initial)
    local waiting = state.State.new("等待", self.stateMachine)
    local playing = state.State.new("游戏中", self.stateMachine)
    local pause = state.State.new("暂停", self.stateMachine)
    local settled = state.State.new("结算", self.stateMachine)

    local initialP = state.PseudoState.new("已开局", playing, state.PseudoStateKind.Initial)
    local select = state.State.new("选择开局", playing)
    local stepstart = state.State.new("回合开始", playing)
    local step = state.State.new("回合进行", playing)
    local errstep = state.State.new("回合错误", playing)
    local stepend = state.State.new("回合完成", playing)

    initial:to(waiting)
    waiting:to(playing):when(on(GameMessage.Start))
    playing:to(settled):when(on(GameMessage.Balance))
    playing:to(waiting):when(on(GameMessage.Reset))
    settled:to(waiting):when(on(GameMessage.Reset))

    initialP:to(select):when(on(GameMessage.RoundPrepare))
    select:to(stepstart):when(on(GameMessage.RoundStart))

    stepstart:to(step):when(on(GameMessage.RoundNextStep))
    step:to(step):when(on(GameMessage.RoundNextStep))
    
    step:to(errstep):when(on(GameMessage.RoundStepErr))
    stepstart:to(errstep):when(on(GameMessage.RoundStepErr))

    step:to(stepend):when(on(GameMessage.RoundStepEnd))
    -- 重新开始
    errstep:to(stepstart):when(on(GameMessage.RoundStepReset))
    stepend:to(select):when(on(GameMessage.RoundStepRestart))
    -- stepend:to(select):when(on(GameMessage.RoundStart))

    -- 开局
    settled:entry(handler(self, self.gameOver))
    waiting:entry(handler(self, self.reset))

    select:entry(handler(self, self.roundPrepare))
    stepstart:entry(handler(self, self.roundStart))
    step:entry(handler(self, self.roundStepNext))
    errstep:entry(handler(self, self.roundStepErr))
    stepend:entry(handler(self, self.roundStepEnd))

    self.stateInstance = state.StateMachineInstance.new("niuniutiaozhanGame")
    state.initialise(self.stateMachine, self.stateInstance)
end

function stateControl:sendMessage(message)
    state.evaluate(self.stateMachine, self.stateInstance, message)
end

-- function stateControl:stepRound()
--     self:sendMessage(self.GameMessage.RoundStep)
-- end

function stateControl:roundPrepare()
    print("stateControl:roundPrepare")
end

function stateControl:nextStep()
    self:sendMessage(self.GameMessage.RoundNextStep)
end

function stateControl:errStep()
    self:sendMessage(self.GameMessage.RoundStepErr)
end

function stateControl:endRoundStep()
    self:sendMessage(self.GameMessage.RoundStepEnd)
end

function stateControl:roundStepReset()
    self:sendMessage(self.GameMessage.RoundStepReset)
end

function stateControl:nextRound()
    print("stateControl:nextRound")
    self:sendMessage(self.GameMessage.RoundStepRestart)
end

function stateControl:startRound()
    self:sendMessage(self.GameMessage.RoundStart)
end

function stateControl:start()
    print("stateControl:start")
    self:sendMessage(self.GameMessage.Start)
    -- self:prepare()
end

function stateControl:prepare()
    self:sendMessage(self.GameMessage.RoundPrepare)
end

function stateControl:stop()
    self:sendMessage(self.GameMessage.Balance)
end

function stateControl:onCreate()
    print("stateControl:onCreate")
    self:initState()
end

function stateControl:roundStart()
    print("stateControl:roundStart")
    
end

function stateControl:roundStepNext()
    print("stateControl:roundStepNext")
end

function stateControl:roundStepErr()
    print("stateControl:roundStepErr")
end
function stateControl:roundStepEnd()
    print("stateControl:roundStepEnd")
end

function stateControl:gameOver()
    print("stateControl:gameOver")
end

function stateControl:reset()
    print("stateControl:reset")
end

-- function stateControl:whiteRound()
--     print("stateControl:whiteRound")
-- end

-- function stateControl:blackRound()
--     print("stateControl:blackRound")
-- end

return stateControl