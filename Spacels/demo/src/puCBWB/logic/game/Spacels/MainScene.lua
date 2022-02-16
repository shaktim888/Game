local GameScene = require("logic.game.Spacels.GameScene")
local LevelScene = require("logic.game.Spacels.LevelScene")
local RuleScene = require("logic.game.Spacels.RuleScene")

local MainScene = class("MainScene", cc.load("mvc").ModuleBase)

MainScene.RESOURCE_FILENAME = "game/Spacels/MainScene.lua"

MainScene.behavior ={
    "logic.common.behavior.BtnBinder",
    "logic.common.behavior.TouchInterrupt",
    "logic.common.behavior.Listener",
}

-- local About = import(".about")
-- local Value = import(".value")
-- local FeedBack = import(".feedback")
-- local Rule = import(".rule")
-- local Notice = import(".notice")
-- local Setting = import(".setting")


--按钮触发事件
MainScene.btnBind = {
    game = "onGame",    
    about = "onAbout",
    select = "onSelect",
    exit = "onEnd",
}

local function splitUtf8String(str)
    local strTable = { }
    for uchar in string.gfind(str, "[%z\1-\127\194-\244][\128-\191]*") do
        strTable[#strTable + 1] = uchar
    end
    return strTable
end

local function testSpilt()
    local tbl = utf8StringSplit("adfad我1爱2大,，。a?。.中国！！.*！")
    dump(tbl)
end

local function get_qr_node(str, size)

    -- print("get_qr_node")

    local qrencode = require "logic.game.Spacels.qrencode"
    local ok, tab = qrencode.qrcode(str)
    if not ok then
        print(tab)
        return nil
    else
        local cellSize = size * 1.0 / (#tab + 1)
        local draw = cc.LayerColor:create(cc.c4b(255, 255, 255, 255))

        draw:setColor(cc.c3b(255,255,255))
        draw:setContentSize(cc.size(size, size))

        for x=1, #tab do
            for y=1, #tab[x] do
                if tab[x][y] > 0 then
                    local spr = display.newSprite("game/Spacels/image/black.png")
                    spr:setPosition(cc.p(x * cellSize,y * cellSize))
                    spr:setScale(cellSize / 10)
                    spr:addTo(draw)
                else
                end
            end
        end

        return draw
    end
end

function MainScene:onCreate()

    -- self:addChild(get_qr_node("www.baidu.com", 140))
    -- do return end

    --捕获移动方格
    self.unit = self.mView['unit']  
    self.unit1 = self.mView['unit1']
    self.unit2 = self.mView["unit2"]
    --捕获开始游戏按钮
    self.game = self.mView['game']
    --捕获规则按钮
    self.about = self.mView['about']
    --捕获选关按钮
    self.select = self.mView['select']
    self:onAnimation()
    --捕获退出按钮
    self.exit = self.mView['exit']
    --捕获游戏名称
    self.title = self.mView['title']
    --捕获星星
    self.star = {}
    for i = 1 , 12 do
        self.star[i] = self.mView["star" .. i]
    end
    --获取星星的坐标
    self.xs = {}
    self.ys = {}
    for i = 1 , 12 do
        self.xs[i],self.ys[i] = self.star[i]:getPosition()
    end
    --获取滑块的坐标
    self.xu,self.yu = self.unit:getPosition()
    self.xu1,self.yu1 = self.unit1:getPosition()
    self.xu2,self.yu2 = self.unit2:getPosition()
    --关卡初始值
    self.a = 1 
    cc.UserDefault:getInstance():setIntegerForKey("self.a", self.a)
end
--方块滑动事件
function MainScene:onAnimation()
    local layer = display.newLayer()
        self:addChild(layer)
    local unit1 = cc.CallFunc:create(function(sender)
        self.unit:runAction(cc.MoveTo:create(1.2,cc.p(1310,500)))
    end)
    local unit2 = cc.CallFunc:create(function(sender)
        self.unit1:runAction(cc.MoveTo:create(1.2,cc.p(-20,260)))
    end)
    local unit3 = cc.CallFunc:create(function(sender)
        self.unit2:runAction(cc.MoveTo:create(1.2,cc.p(1310,20)))
    end)
    local run1 = cc.CallFunc:create(function(sender)
        self.game:runAction(cc.MoveTo:create(0.5,cc.p(265,445)))
        self.select:runAction(cc.MoveTo:create(0.5,cc.p(971,445)))
        self.about:runAction(cc.MoveTo:create(0.5,cc.p(640,445)))
    end)
    local run2 = cc.CallFunc:create(function(sender)
        self.title:setVisible(true)
        self.exit:runAction(cc.MoveTo:create(0.5,cc.p(640,260)))
    end)
    local peng1 = cc.CallFunc:create(function(sender)
        self:scheduleUpdateWithPriorityLua(function(dt)
            self:update(dt)
            if self.xu >= self.xs[1] and self.xu <= self.xs[1] + 50 then
                self.star[1]:runAction(cc.MoveTo:create(1,cc.p(400,800))) 
                self.star[1]:runAction(cc.RotateBy:create(0.5,360))
            end
            if self.xu >= self.xs[2] and self.xu <= self.xs[2] + 50 then
                self.star[2]:runAction(cc.MoveTo:create(1,cc.p(600,800))) 
                self.star[2]:runAction(cc.RotateBy:create(1,360))
            end
            if self.xu >= self.xs[3] and self.xu <= self.xs[3] + 50 then
                self.star[3]:runAction(cc.MoveTo:create(1,cc.p(829,800))) 
                self.star[3]:runAction(cc.RotateBy:create(1,360))
            end
            if self.xu1 >= self.xs[4] and self.xu1 <= self.xs[4] + 50 then
                self.star[4]:runAction(cc.MoveTo:create(1,cc.p(829,800))) 
                self.star[4]:runAction(cc.RotateBy:create(1,360))
            end
            if self.xu1 >= self.xs[5] and self.xu1 <= self.xs[5] + 50 then
                self.star[5]:runAction(cc.MoveTo:create(1,cc.p(829,800))) 
                self.star[5]:runAction(cc.RotateBy:create(1,360))
            end
            if self.xu1 >= self.xs[6] and self.xu1 <= self.xs[6] + 50 then
                self.star[6]:runAction(cc.MoveTo:create(1,cc.p(829,800))) 
                self.star[6]:runAction(cc.RotateBy:create(1,360))
            end
            if self.xu1 >= self.xs[7] and self.xu1 <= self.xs[7] + 50 then
                self.star[7]:runAction(cc.MoveTo:create(1,cc.p(829,800))) 
                self.star[7]:runAction(cc.RotateBy:create(1,360))
            end
            if self.xu1 >= self.xs[8] and self.xu1 <= self.xs[8] + 50 then
                self.star[8]:runAction(cc.MoveTo:create(1,cc.p(829,800))) 
                self.star[8]:runAction(cc.RotateBy:create(1,360))
            end
            if self.xu1 >= self.xs[9] and self.xu1 <= self.xs[9] + 50 then
                self.star[9]:runAction(cc.MoveTo:create(1,cc.p(829,800))) 
                self.star[9]:runAction(cc.RotateBy:create(1,360))
            end
            if self.xu2 >= self.xs[10] and self.xu2 <= self.xs[10] + 50 then
                self.star[10]:runAction(cc.MoveTo:create(1,cc.p(829,800))) 
                self.star[10]:runAction(cc.RotateBy:create(1,360))
            end
            if self.xu2 >= self.xs[11] and self.xu2 <= self.xs[11] + 50 then
                self.star[11]:runAction(cc.MoveTo:create(1,cc.p(829,800))) 
                self.star[11]:runAction(cc.RotateBy:create(1,360))
            end
            if self.xu2 >= self.xs[12] and self.xu2 <= self.xs[12] + 50 then
                self.star[12]:runAction(cc.MoveTo:create(1,cc.p(829,800))) 
                self.star[12]:runAction(cc.RotateBy:create(1,360))
            end
            end,1)
        end)
    local delay = cc.DelayTime:create(1.2)
    -- layer:runAction(cc.Sequence:create(unit1,peng1,delay,run1,unit2,delay,run2,unit3))
    layer:runAction(cc.Sequence:create(unit1,peng1,delay,unit2,delay,unit3))
end

-- 退出游戏
function MainScene:onEnd()
    os.exit()
    print("退出游戏")
end

--跳转游戏界面
function MainScene:onGame()
    print("跳转游戏界面")
    local gameScene = GameScene.new();
    gameScene:showWithScene();
end

--跳转规则界面
function MainScene:onAbout()
    local ruleScene = require ("logic.game.Spacels.RuleScene").new();
    ruleScene:showWithScene()
    print("跳转规则界面")
end

--跳转选关界面
function MainScene:onSelect()
    print("跳转选关界面")
    local levelScene = require ("logic.game.Spacels.LevelScene").new();
    levelScene:showWithScene()
end

--获取方块实时坐标
function MainScene:update(dt)
    self.xu,self.yu = self.unit:getPosition()
    self.xu1,self.yu1 = self.unit1:getPosition()
    self.xu2,self.yu2 = self.unit2:getPosition()
    if self.runningTime == nil then
        self.runningTime = 0.0
    else
        self.runningTime = self.runningTime + dt
    end
    if self.runningTime > 3.6 then
            self:unscheduleUpdate()
            print("time is end")
        end
end


function MainScene:onBtnSetClick()
    -- Setting.new():showWithScene()
    local view = Setting.new()
    global.viewMgr.showView(view, true)
end

function MainScene:onBtnScoreClick()
    -- Score.new():showWithScene()
    local view = Score.new()
    global.viewMgr.showView(view, true)
end

-- function MainScene:onBtnSetClick()
--     -- Setting.new():showWithScene()
--     local view = Setting.new()
--     global.viewMgr.showView(view, true)
-- end

function MainScene:onBtnFeedBackClick()
    -- Score.new():showWithScene()
    local view = FeedBack.new()
    global.viewMgr.showView(view, true)
end

function MainScene:onBtnNoticeClick()
    -- Score.new():showWithScene()
    local view = Notice.new()
    global.viewMgr.showView(view, true)
end

function MainScene:onBtnRuleClick()
    -- Score.new():showWithScene()
    local view = Rule.new()
    global.viewMgr.showView(view, true)
end

function MainScene:onBtnValueClick()
    -- Score.new():showWithScene()
    local view = Value.new()
    global.viewMgr.showView(view, true)
end

return MainScene
