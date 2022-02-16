local LevelScene = class("LevelScene", cc.load("mvc").ModuleBase)

LevelScene.RESOURCE_FILENAME = "game/Spacels/LevelScene.lua"

LevelScene.behavior ={
    "logic.common.behavior.BtnBinder",
    "logic.common.behavior.TouchInterrupt",
    "logic.common.behavior.Listener",
}
--按钮触发事件
LevelScene.btnBind = {
    back = "onBack",
}

function LevelScene:onCreate()
    self.a = cc.UserDefault:getInstance():getIntegerForKey("self.a")
    --创建关卡按钮
    local xz = {-400,-200,0,200,400,-400,-200,0,200,400}
    local yz = {50,50,50,50,50,-50,-50,-50,-50,-50}
    self.button = {}
    for i = 1 , 10 do
        --设置按钮
        self.button[i] = ccui.Button:create()
            :move(display.cx + xz[i] ,display.cy + yz[i])
            :addTo(self)
        self.button[i]:loadTextureNormal("game/Spacels/image/exit_about.png",0)
        self.button[i]:loadTexturePressed("game/Spacels/image/exit_about.png",0)

        --关卡数字 
        cc.Label:createWithSystemFont(i,"Arial",40)
            :move(display.cx + xz[i] + 20 , display.cy + yz[i])
            :addTo(self)

        --小星星旋转
        local star = cc.Sprite:create("game/Spacels/image/Maininterface/point.png")
            :move(display.cx + xz[i] - 20 ,display.cy + yz[i])
            :addTo(self)
            :runAction(cc.RotateBy:create(1800,360000))

        --按钮事件
        self.button[i]:addTouchEventListener(function(sender,eventType)
            if(2 == eventType) then
                self.a = i
                cc.UserDefault:getInstance():setIntegerForKey("self.a", self.a)
                local gameScene = require ("logic.game.Spacels.GameScene").new();
                gameScene:showWithScene()
                print("跳到第" .. i .. "关")
            end
        end)
    end
end
--返回按钮事件
function LevelScene:onBack()
    print("返回主界面")
    local mainScene = require ("logic.game.Spacels.MainScene").new();
    mainScene:showWithScene()
end

return LevelScene