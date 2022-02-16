local JiesuanLayer = class("JiesuanLayer", cc.load("mvc").ModuleBase)
JiesuanLayer.RESOURCE_FILENAME = "game/shilong/JiesuanLayer.lua"
JiesuanLayer.behavior ={
    "logic.common.behavior.BtnBinder",
    "logic.common.behavior.TouchInterrupt",
    "logic.common.behavior.Listener",
    "logic.common.behavior.FontColorChange",
}

JiesuanLayer.changecolorfont = {
    replay= {},
    home = {}
}

JiesuanLayer.btnBind = {
    replay = "onReplay",
    home = "onHome",
}

function JiesuanLayer:onCreate()
    self.Kill = self.mView['kill']
    self.Score = self.mView['score']
    self.Hightscore = self.mView['hightscore']
    local kill = cc.UserDefault:getInstance():getIntegerForKey("shilong.kill")
    local score = cc.UserDefault:getInstance():getIntegerForKey("shilong.fen")
    local hightscore = cc.UserDefault:getInstance():getIntegerForKey("shilong.hightscore")
    self.Kill:setString(kill)
    self.Kill:setVisible(false)
    self.Score:setString(score)
    self.Hightscore:setString(hightscore)
    if hightscore < score then
        hightscore = score 
        cc.UserDefault:getInstance():setIntegerForKey("shilong.hightscore", score)
    end
    self.game = cc.UserDefault:getInstance():getIntegerForKey("game")
    self.shengming = 3   --生命
    cc.UserDefault:getInstance():setIntegerForKey("shilong.shengming",self.shengming)
    self.fen = 0   -- 分数
    cc.UserDefault:getInstance():setIntegerForKey("shilong.fen",self.fen)
end

function JiesuanLayer:onReplay()
    if self.game == 1 then
        print("返回经典模式")
        require("logic.game.shilong.ClassicScene").new():showWithScene()
    end
    if self.game == 2 then
        print("返回计时模式")
        require("logic.game.shilong.SurvivalScene").new():showWithScene()
    end
end

function JiesuanLayer:onHome()
    require("logic.game.shilong.MainScene").new():showWithScene()
end

return JiesuanLayer