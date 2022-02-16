local GameScene = class("GameScene", cc.load("mvc").ModuleBase)

GameScene.RESOURCE_FILENAME = "game/Spacels/GameScene.lua"

GameScene.behavior ={
    "logic.common.behavior.BtnBinder",
    "logic.common.behavior.TouchInterrupt",
    "logic.common.behavior.Listener",
}

GameScene.btnBind = {
    menu = "onMenu",
}

function GameScene:onCreate()
    self.levelnum = cc.UserDefault:getInstance():getIntegerForKey("Spacels.level")  --关卡数
    if not self.levelnum or (self.levelnum <= 0) or (self.levelnum >= 10) then
        self.levelnum = 1
    end
    self.level = {} --关卡
    self.star1 = {} --星星
    self.xu = {}  --滑块x轴坐标
    self.yu = {}  --滑块y轴坐标
    self.wan = {} --玩偶
    --捕获背景
    self.bg1 = self.mView['bg1']
    self.bg2 = self.mView['bg2']
    self.bg3 = self.mView['bg3']

    self.mView['menu']:setTitleColor({r = 0, g = 0, b = 0})
    --捕获点击容器
    self.chumo = self.mView['chumo']
    --显示关卡数
    
    self.levelWidget = cc.Label:createWithSystemFont(self.levelnum .. "/10", "Arial", 40)
        :move(display.cx , display.cy + 300 )
        :addTo(self)
    --捕获关卡层
    for i = 1 , 10 do
        self.level[i] = self.mView['level' .. i]
        self.levelWidget:setString(self.levelnum .. "/10")
        self.levelWidget:setColor({r = 0, g = 0, b = 0})
    end
    --玩偶
    for i = 1, 5 do
        self.wan[i] = self.mView['r' .. i]
    end
    --第六关
    self.star6 = self.mView['star6']
    self.star7 = self.mView['star7']
    self.star6:runAction(cc.RotateBy:create(1800,720000))
    self.star7:runAction(cc.RotateBy:create(1800,720000))
    
    --开始游戏
    self:onSquare()
end

function GameScene:getCurIndex()
    self._curindex = self._curindex or 1
    return self._curindex
end

function GameScene:getCurHero()
    return self.unit[self:getCurIndex()]
end

local function hitTest(wa_, wb_)
    local p = wa_:getParent():convertToNodeSpace(cc.p(wb_:getPosition()))
    -- dump(p)

    local size = wa_:getContentSize()
    local pos = cc.p(wa_:getPosition())

    return cc.rectContainsPoint(cc.rect(pos.x - size.width/2, pos.y - size.height/2, size.width, size.height), p)
end

function GameScene:getCurLevelPnl()
    self.levelnum = self.levelnum or 1
    local name = string.format( "level%d", self.levelnum)
    -- dump(name)
    return self.mView[name]
end

function GameScene:onHit()
    local index = self:getCurIndex()
    self:getCurHero():removeFromParent()
    if index > 0 and index <= 3 then
        self[string.format("onUnit%d", math.floor(index))](self)
    end
end

local nametbl = {
    "star6",
    "star7",
    "r1",
    "r2",
    "r3",
    "r4",
    "r5",
}
function GameScene:histTestObstacle()
    local pnl = self:getCurLevelPnl()
    local hero = self:getCurHero()
    for i, v in ipairs(pnl:getChildren()) do
        local name = v:getName()
        if not table.indexof(nametbl, name) and hitTest(v, hero) then
            self:onHit()
            return true
        end
    end
end

function GameScene:histTestStar()
    local index = self:getCurIndex()
    local star = self.star1[index]

    local hero = self:getCurHero()
    if star and hero then
        if hitTest(star, hero) then
            star:runAction(cc.MoveTo:create(0.5,cc.p(640,1000)))
            return true
        end
    end
end

function GameScene:onUpdatePosition()
    local index = self:getCurIndex()
    self.xu[index], self.yu[index] = self:getCurHero():getPosition()
end

--创建方块
function GameScene:onSquare()
    global.utils.sound.playBgMusic("game/Spacels/bgm.mp3")

    if self.levelnum == 1 then
        self.level[self.levelnum]:setVisible(true)
    end
    if self.levelnum > 1 and self.levelnum <= 10  then
        self.level[self.levelnum]:setVisible(true)
        self.level[self.levelnum - 1]:setVisible(false)
    end

    if self.a1 and not tolua.isnull(self.a1) then
        self.a1:removeFromParent()
    end
    self.a1 = display.newSprite("game/Spacels/image/a.png")
        :move(display.cx + 360 , display.cy + 140)
        :addTo(self) 

    if self.a2 and not tolua.isnull(self.a2) then
        self.a2:removeFromParent()
    end
    self.a2 = display.newSprite("game/Spacels/image/b.png")
        :move(display.cx - 180 , display.cy - 210)
        :addTo(self) 
    self.a1:setVisible(false)
    self.a2:setVisible(false)
    --设置背景
    self:onLevel()
    -- local x = {-665 , 660 , -665}
    local y = {140 , -100 , -340}
    local x1 = {400 , -400 , 400}
    self.unit = {}
    for i = 1 , 3 do
        if self.star1[i] and not tolua.isnull(self.star1[i]) then
            self.star1[i]:removeFromParent()
            self.star1[i] = nil
        end
        self.star1[i] = display.newSprite("game/Spacels/image/Maininterface/point.png")
        self.star1[i]:move(display.cx + x1[i]  , display.cy + y[i])
        self.star1[i]:addTo(self)      
        self.star1[i]:runAction(cc.RotateBy:create(1800,720000))  
    end
    self:onUnit1()
end

local interval_x_base = 5
local interval_x = interval_x_base

local interval_y_base = 0
local interval_y = 1
local interval_y_range = 100
local interval_y_maxY = 0
--方块1
function GameScene:onUnit1()
    self._curindex = 1

    interval_x = interval_x_base + self._curindex + self.levelnum
    if self.unit[1] and not tolua.isnull(self.unit[1]) then
        self.unit[1]:removeFromParent()
        self.unit[1] = nil
    end

    interval_y_base = display.cy + 140

    self.unit[1] = display.newSprite("game/Spacels/image/hero.png")
    self.unit[1]:move(display.cx - 665 , interval_y_base)
    self.unit[1]:addTo(self)   
    self.unit[1]:runAction(cc.MoveTo:create(3,cc.p(1320,500)))
    self:onChumo(1)
    self:scheduleUpdateWithPriorityLua(function(dt)
            -- self.unit[1]:setPositionX(self.unit[1]:getPositionX() + interval_x)

            -- if interval_add > 0 then
            --     interval_add = interval_add - interval_y

                -- local reach_y = self.unit[1]:getPositionY() + interval_y
                -- dump(reach_y)
                -- dump(interval_y_maxY)
                -- if reach_y > interval_y_maxY then
                --     reach_y = interval_y_maxY
                --     interval_y = 0 - interval_y
                -- elseif reach_y < interval_y_base then
                --     reach_y = interval_y_base 
                --     interval_y = 0
                -- end
                -- self.unit[1]:setPositionY(reach_y)
            -- end

            self:onUpdatePosition()
            --撞击星星
            if self.levelnum == 6 then
                self.a1:setVisible(true)
                self.a2:setVisible(true)
                if self.xu[1] >= 260 and self.xu[1] <= 270 and self.yu[1] <= 540 then
                    self.star6:runAction(cc.MoveTo:create(1,cc.p(640,800)))
                    self.a1:runAction(cc.MoveTo:create(0.5,cc.p(1000,440)))
                end
            end
            if self.levelnum == 7 then
                self.star6:setVisible(false)
                self.star7:setVisible(false)
            end

            self:histTestStar()
            self:histTestObstacle()

            if self.xu[1] >= 1310 then
                self:onUnit2()
            end
        end,1)
end
--方块2
function GameScene:onUnit2()
    self._curindex = 2
    interval_x = interval_x_base + self._curindex + self.levelnum

    if self.unit[2] and not tolua.isnull(self.unit[2]) then
        self.unit[2]:removeFromParent()
        self.unit[2] = nil
    end
    self.unit[2] = display.newSprite("game/Spacels/image/hero.png")
    self.unit[2]:move(display.cx + 665 , display.cy - 100 )
    self.unit[2]:addTo(self)     
    self.unit[2]:runAction(cc.MoveTo:create(3,cc.p(-50,260)))
    self:onChumo(2)
    self:scheduleUpdateWithPriorityLua(function(dt)
            -- self.unit[2]:setPositionX(self.unit[2]:getPositionX() - interval_x)
            self:onUpdatePosition()
            --撞击星星
            if self.levelnum == 6 then
                if  self.xu[2] >= 1000 and self.xu[2] <= 1020 and self.yu[2] <= 300 then
                    self.star7:runAction(cc.MoveTo:create(1,cc.p(640,800)))
                    self.a2:runAction(cc.MoveTo:create(0.5,cc.p(460,300)))
                end
            end

            self:histTestStar()
            self:histTestObstacle()
            if self.xu[2] <= -20 then
                self:onUnit3()
            end
        end,1)
end
--方块3
function GameScene:onUnit3()
    self._curindex = 3
    interval_x = interval_x_base + self._curindex + self.levelnum

    if self.unit[3] and not tolua.isnull(self.unit[3]) then
        self.unit[3]:removeFromParent()
        self.unit[3] = nil
    end
    self.unit[3] = display.newSprite("game/Spacels/image/hero.png")
    self.unit[3]:move(display.cx - 665 , display.cy - 340)
    self.unit[3]:addTo(self)
    self.unit[3]:runAction(cc.MoveTo:create(3,cc.p(1310,20)))
    self:onChumo(3)
    self:scheduleUpdateWithPriorityLua(function(dt)
        -- self.unit[3]:setPositionX(self.unit[3]:getPositionX() + interval_x)
        self:onUpdatePosition()

        --撞击星星
        self:histTestStar()
        self:histTestObstacle()

        if self.levelnum == 10 then
            local aaa = {160, 310 , 460 , 610 ,760}
            local bbb = {240, 390 , 540 , 690 ,840}
            if self.xu[3] >= aaa[1] and self.xu[3] <= bbb[1] and self.yu[3] <= 60 then
                self.wan[1]:runAction(cc.RotateBy:create(1,360))
                self.wan[1]:runAction(cc.MoveTo:create(1,cc.p(640,800)))
            end
            if self.xu[3] >= aaa[2] and self.xu[3] <= bbb[2] and self.yu[3] <= 60 then
                self.wan[2]:runAction(cc.RotateBy:create(1,360))
                self.wan[2]:runAction(cc.MoveTo:create(1,cc.p(640,800)))
            end
            if self.xu[3] >= aaa[3] and self.xu[3] <= bbb[3] and self.yu[3] <= 60 then
                self.wan[3]:runAction(cc.RotateBy:create(1,360))
                self.wan[3]:runAction(cc.MoveTo:create(1,cc.p(640,800)))
            end
            if self.xu[3] >= aaa[4] and self.xu[3] <= bbb[4] and self.yu[3] <= 60 then
                self.wan[4]:runAction(cc.RotateBy:create(1,360))
                self.wan[4]:runAction(cc.MoveTo:create(1,cc.p(640,800)))
            end
            if self.xu[3] >= aaa[5] and self.xu[3] <= bbb[5] and self.yu[3] <= 60 then
                self.wan[5]:runAction(cc.RotateBy:create(1,360))
                self.wan[5]:runAction(cc.MoveTo:create(1,cc.p(640,800)))
            end
            -- self:onC()
        end
        if self.xu[3] >= 1300 then
            self:onEnd() 
        end
    end,1)
end
--关卡结束
function GameScene:onEnd()
    if self.levelnum <= 10 then 
        self.levelnum = self.levelnum + 1
        cc.UserDefault:getInstance():setIntegerForKey("Spacels.level", self.levelnum)
        self.levelWidget:setString(self.levelnum .. "/10")
        for i = 1 , 3 do
            self.star1[i]:setVisible(false)
        end
        self:onSquare()
        print("self.levelnum(关卡数)= " .. self.levelnum)
    end
    if self.levelnum == 11 then
        local mainScene = require ("logic.game.Spacels.MainScene").new();
        mainScene:showWithScene() 
        print("返回主界面")
    end
end
--屏幕触摸事件
function GameScene:onChumo(x)
    self.chumo:setVisible(true)
    self.chumo:addTouchEventListener(function (sender,eventType)
        if  eventType == ccui.TouchEventType.ended then
            print("点击屏幕")
            self:getCurHero():runAction(cc.JumpBy:create(0.2,cc.p(1,0),140,1)) 
            self:getCurHero():runAction((cc.RotateBy:create(0.2,360)))

            -- interval_y = 3
            -- dump(self:getCurHero():getPositionY())
            -- interval_y_maxY = self:getCurHero():getPositionY() + interval_y_base
        end
    end) 
end
--返回按钮事件
function GameScene:onMenu()
    print("返回主界面")
    local mainScene = require ("logic.game.Spacels.MainScene").new();
    mainScene:showWithScene()
end
--创建背景
function GameScene:onLevel()
    local b1 = {1,6,6,9,13,12,13,15,16,18}
    local b2 = {2,5,8,8,11,11,14,17,17,20}
    local b3 = {1,4,7,10,12,13,15,16,18,19}
    for i = 1 , 10 do
        if self.levelnum <= 4 and i == self.levelnum then
            self.bg1:loadTexture(b1[i] .. ".png")
            self.bg2:loadTexture(b2[i] .. ".png")
            self.bg3:loadTexture(b3[i] .. ".png")
        end
        if self.levelnum > 4 and self.levelnum <= 10 and i == self.levelnum then
            self.bg1:loadTexture(b1[i] .. ".png")
            self.bg2:loadTexture(b2[i] .. ".png")
            self.bg3:loadTexture(b3[i] .. ".png")
        end
    end
end

return GameScene