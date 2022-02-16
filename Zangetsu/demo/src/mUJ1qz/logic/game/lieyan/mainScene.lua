local MainScene = class("MainScene", cc.load("mvc").ModuleBase)
-- MainScene.RESOURCE_FILENAME = "game/tiger/MainScene.lua"

local GameScene = require("logic.game.lieyan.gameScene")
local RuleLayer = require("logic.game.lieyan.ruleLayer")

function MainScene:onCreate()
    --图片
    local image = {
        start1  = "game/lieyan/button/start_1.png",
        start2  = "game/lieyan/button/start_2.png",
        rule1   = "game/lieyan/button/rule_1.png",
        rule2   = "game/lieyan/button/rule_2.png",
        bgimage = "game/lieyan/image/bg.png",
        renwu   = "game/lieyan/image/renwu.png",
        yinyue  = "game/lieyan/image/250.mp3",
    }
    --坐标
    local coor = {
        startx = display.cx - 200,
        starty = display.cy - 150,
        rulex  = display.cx + 200,
        ruley  = display.cy - 150,
        renwux = display.cx,
        renwuy = display.cy + 50,

    }
    
    --创建背景图片
    local bg = cc.Sprite:create(image.bgimage)
        bg:setPosition(display.center)
        bg:addTo(self)
   --人物
   local ren = cc.Sprite:create(image.renwu)
        ren:setPosition(coor.renwux,coor.renwuy)
        ren:addTo(self)
        local action1 = ren:runAction(cc.MoveBy:create(0.3,cc.p(0,50)))
        local action2 = ren:runAction(cc.MoveBy:create(0.3,cc.p(0,-50)))
        local delay = cc.DelayTime:create(0.01)
        ren:runAction(cc.RepeatForever:create(cc.Sequence:create(action1,delay,action2,delay)))


    --开始按钮
    local startButton = cc.MenuItemImage:create(image.start1,image.start2)
        :onClicked(function()
            print("点击了开始按钮")
            CCDirector.sharedDirector():resume()
            GameScene.new():showWithScene()
        end)
    cc.Menu:create(startButton)
         :move(coor.startx,coor.starty)
         :addTo(self,1)
    
    --规则按钮
    local ruleButton = cc.MenuItemImage:create(image.rule1,image.rule2)
        :onClicked(function()
            print("点击了规则按钮")
            CCDirector.sharedDirector():resume()
            RuleLayer.new():showWithScene()
        end)
    cc.Menu:create(ruleButton)
        :move(coor.rulex,coor.ruley)
        :addTo(self,1)

    cc.SimpleAudioEngine:getInstance():playMusic(image.yinyue, true)
end

function MainScene:onRuleClick()
    RuleLayer.new():showWithScene()
end

function MainScene:onStartClick()
    CCDirector.sharedDirector():resume()
    GameScene.new():showWithScene()
end

return MainScene
