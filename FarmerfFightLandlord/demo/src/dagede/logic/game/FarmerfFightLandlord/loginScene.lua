local LoginScene = class("LoginScene", cc.load("mvc").ModuleBase)
LoginScene.RESOURCE_FILENAME = "game/FarmerfFightLandlord/LoginScene.lua"
print("你进入了登录界面")
local gameScene = require("logic.game.FarmerfFightLandlord.gameScene")
local ruleLayer = require("logic.game.FarmerfFightLandlord.ruleLayer")
local shopLayer = require("logic.game.FarmerfFightLandlord.shopLayer")

LoginScene.behavior ={
    "logic.common.behavior.BtnBinder",
    "logic.common.behavior.TouchInterrupt",
    "logic.common.behavior.Listener",
    "logic.common.behavior.FontColorChange",
}

LoginScene.changecolorfont = {
   
}

--按钮事件监听
LoginScene.btnBind = {
    startBtn = "startClick",
    ruleBtn = "ruleClick",
    shopBtn = "shopClick",
}

function LoginScene:onCreate()
    --播放背景音乐
    audio.playMusic("game/FarmerfFightLandlord/sound/bgm.mp3",true)
    CCDirector.sharedDirector():resume()
    self.mView["pk"]:ignoreContentAdaptWithSize(true)

end

--开始按钮点击事件
function LoginScene:startClick()
    print("你点击了开始按钮");
    AudioEngine.playEffect("game/FarmerfFightLandlord/sound/Button.mp3",false)
    local UIgameScene = gameScene:create()
    UIgameScene:showWithScene()
end

--规则按钮点击事件
function  LoginScene:ruleClick()
    AudioEngine.playEffect("game/FarmerfFightLandlord/sound/Button.mp3",false)
    print("你点击了规则按钮");
    local rule = ruleLayer:create()
    self:addChild(rule)
    local size = rule:getContentSize()
    rule:setPosition(display.cx-size.width/2, display.cy-size.height/2)
end

--商城按钮点击事件
function  LoginScene:shopClick()
    AudioEngine.playEffect("game/FarmerfFightLandlord/sound/Button.mp3",false)
    print("你点击了商城按钮");
    local shop = shopLayer.new(nil,nil,function ()
        local goldnumber = global.saveTools.getData("goldNumber")
        if goldnumber == nil then
            goldnumber = 0
        end
        self.mView["goldNumber"]:setString(goldnumber)
        print("拥有金币数："..goldnumber)
    end, self)
    self:addChild(shop)
    local size = shop:getContentSize()
    shop:setPosition(display.cx-size.width/2, display.cy-size.height/2)
end

--退出按钮点击事件
function  LoginScene:quitClick()
    AudioEngine.playEffect("game/FarmerfFightLandlord/sound/Button.mp3",false)
    print("你点击了退出按钮");
    os.exit()
end

return LoginScene
