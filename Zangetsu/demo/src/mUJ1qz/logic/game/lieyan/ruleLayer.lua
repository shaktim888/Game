local RuleLayer = class("RuleLayer", cc.load("mvc").ModuleBase)

local image = {
    zhezhao = "game/lieyan/image/zhezhao.png",
    bgimage = "game/lieyan/image/bg.png",
    back1   = "game/lieyan/button/back_1.png",
    back2   = "game/lieyan/button/back_2.png",
    ziti    = "game/lieyan/image/nvpk.ttf",
   
}

local coor = {
    backx = display.right - 200,
    backy = display.top - 100,
}

function RuleLayer:onCreate()
    local bg = cc.Sprite:create(image.bgimage)
        bg:setPosition(display.center)
        bg:addTo(self)

    local zhezhao = cc.Sprite:create(image.zhezhao)
        zhezhao:setPosition(display.center)
        zhezhao:addTo(self)

    local backButton = cc.MenuItemImage:create(image.back1,image.back2)
        :onClicked(function()
            CCDirector.sharedDirector():resume()
            require("logic.game.lieyan.mainScene").new():showWithScene()
        end)

    cc.Menu:create(backButton)
        :setPosition(coor.backx,coor.backy)
        -- :setPosition(display.center)
        :addTo(self)
    
    local rule = cc.Label:createWithTTF("游戏中你化身为一个勇士,勇闯龙洞。点击屏幕",image.ziti,50)
        :setColor(ccc3(255,255,255))
        :setPosition(display.cx,display.cy+50)
        :addTo(self)

    local rule1 = cc.Label:createWithTTF("人物向上跳动，松开则向下，顺利通过各个障碍",image.ziti,50)
        :setColor(ccc3(255,255,255))
        :setPosition(display.cx,display.cy)
        :addTo(self)

    local rule1 = cc.Label:createWithTTF("获取更高的分数",image.ziti,50)
        :setColor(ccc3(255,255,255))
        :setPosition(display.cx,display.cy-50)
        :addTo(self)
end

function RuleLayer:gotoMain()
    CCDirector.sharedDirector():resume()
    require("logic.game.lieyan.mainScene").new():showWithScene()
end

return RuleLayer