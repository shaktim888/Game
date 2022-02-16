local MainScene = class("MainScene", cc.load("mvc").ModuleBase)
MainScene.RESOURCE_FILENAME = "game/huangcheng/MainScene.lua"

local GameScene = require("logic.game.huangcheng.GameScene")
-- local RuleLayer = require("logic.game.huangcheng.RuleLayer")
MainScene.behavior ={
    "logic.common.behavior.BtnBinder",
    "logic.common.behavior.TouchInterrupt",
    "logic.common.behavior.Listener",
}

MainScene.btnBind = {
    start = "onStart",
}
local ziti = "game/huangcheng/image/nvpk.ttf"
function MainScene:onCreate()
    local Blood = "_Blood_"
    local a = 10
    self.level = 1
    self.score = 0
    cc.UserDefault:getInstance():setIntegerForKey("self.level",self.level)
    cc.UserDefault:getInstance():setIntegerForKey("self.score",self.score)
    self.Text1 = self.mView['Text_1']
    local shop = self.mView['Shop']
    if not global.saveTools.getData(Blood) then
        global.saveTools.saveData(Blood,10)
        cc.UserDefault:getInstance():setIntegerForKey("Blood",a)
    end
    -- if cc.UserDefault:getInstance():setIntegerForKey("Blood",a) then
    --     cc.UserDefault:getInstance():setIntegerForKey("Blood",a)
    -- end
    -- if c == 1 then
        -- cc.UserDefault:getInstance():setIntegerForKey("Blood",0)
    -- end
    self.b = cc.UserDefault:getInstance():getIntegerForKey("Blood")
    print("self.b = " .. self.b)

    require("logic.InnerGo.InnerGoEntry")(shop, function (info)
        if info and info.value then
            self.b = info.value + self.b 
            cc.UserDefault:getInstance():setIntegerForKey("Blood",self.b)
            print("self.b = " .. self.b)
        end
    end)
end

function MainScene:onStart()
    print(self.b)
    if self.b > 0 then
        print("开始游戏")
        CCDirector.sharedDirector():resume()
        GameScene.new():showWithScene()
    end
    if self.b <= 0 then
        local text = self.Text1:clone()
        text:addTo(self)
        text:runAction(cc.MoveTo:create(4,cc.p(640,1380)))
    end
    -- GameScene.new():showWithPhysicsScene()
end



return MainScene