local GameScene = class("GameScene", cc.load("mvc").ModuleBase)
GameScene.RESOURCE_FILENAME = "game/sharkfish/GameScene.lua"
GameScene.behavior ={
    "logic.common.behavior.BtnBinder",
    "logic.common.behavior.TouchInterrupt",
    "logic.common.behavior.Listener",
}
GameScene.btnBind = {
    control = "onControl",
    clear = "onClear",
}


function GameScene:onCreate()
    self.fish_flow   = 3.5                           --小鱼游过屏幕需要的时间
    self.ProduceFish = 12                            --产生鱼的参数
    self.decline     = 13                            --鲨鱼下降的速度
    self.shayuyouyi  = 13                            --鲨鱼右移的速度
    self.mobile      = 10                            --渔网移动的速度
    self.grade       = 0                             --得分
    self.shanchu     = 0                             --可清除网的次数
    self.time        = 2.5                           --渔网产生的时间间隔
    self.youwang     = false                         --判断是否产生了渔网
    self.frequency   = self.mView['frequency']       --可清除网次数显示
    self.control     = self.mView['control']         --跳跃按钮
    self.clear       = self.mView['clear']           --删除网格按钮
    self.score       = self.mView['score']           --得分显示
    self.sharkfish   = self.mView['sharkfish']       --鲨鱼
    self.ceng        = self.mView['Panel_1']
    self.hight = cc.UserDefault:getInstance():getIntegerForKey("self.hight")
    self._yupnl      = ccui.Layout:create()          --创建一个鱼的容器
    self._yupnl:setPosition(0.0000, 0.0000)
    self._yupnl:setSize({width = 1280.0000, height = 720.0000})
    self.ceng:addChild(self._yupnl)
    self.sharkfish:setPosition(100,display.cy)
    math.randomseed(os.time())                       --随机数因子
    self:onUpdate(handler(self,self.update))
    self:onFishingNet()

    local fontChangeArr = {
        self.score
    }
    local function getRgb()
        local r = math.random(1,255)
        local g = math.random(1,255)
        local b = math.random(1,255)
        return cc.c3b(r,g,b)
    end
    local fontcolor = getRgb()
    for key, v in pairs(fontChangeArr or {}) do
        local widget = v
        if widget and widget.setTextColor and type(widget.setTextColor) == "function" then
            widget:setTextColor(fontcolor)
        elseif widget and widget.setTitleColor and type(widget.setTitleColor) == "function"  then
            widget:setTitleColor(fontcolor)
        end
    end
end

function GameScene:update(dt)
    self:onFish(dt)              --生成鱼
    self:onSharkFish(dt)         --鲨鱼游动
    self:onPeng(dt)              --鲨鱼和小鱼碰撞
    self:onWang(dt)              --网移动
end

--鲨鱼的移动
function GameScene:onSharkFish(dt)
    self.sharkfishSize = self.sharkfish:getContentSize() --获取鲨鱼的范围
    self.sharkfish_x , self.sharkfish_y = self.sharkfish:getPosition()
    if (self.sharkfish_y  < display.top) and (self.sharkfish_y - self.sharkfishSize.height >= display.bottom) then
        self.control:setEnabled(true)
        self.sharkfish:runAction(cc.MoveBy:create(dt,cc.p(display.bottom,-self.sharkfishSize.height/self.decline)))     --鱼下降
    end
    if (self.sharkfish_x + self.sharkfishSize.width < display.right) and (self.sharkfish_x - self.sharkfishSize.width/2 > display.left) then
        self.Go = self.sharkfish:runAction(cc.MoveBy:create(dt,cc.p(self.sharkfishSize.width/self.shayuyouyi,display.bottom)))       --鱼往前走
    end
    if self.sharkfish_y + self.sharkfishSize.height*2> display.top then
        self.control:setEnabled(false)
    end
end

--生成小鱼
function GameScene:onFish(dt)
    local a = math.random(100,1000)
    local b = math.random(1,6)               --生成的鱼标号
    
    self.fish_y = math.random(200,600)       -- 生成鱼的纵坐标
    self.fish_x = display.right
    if a % self.ProduceFish == 0 then
        self.fish = cc.Sprite:create("game/sharkfish/image/yu_"..b..".png")           --生成鱼精灵
        self.fishSize = self.fish:getContentSize() 
        self.fish:setPosition(display.right + self.fish_y,self.fish_y)       
        self.fish:addTo(self._yupnl ,0)
        self.fish:runAction(cc.MoveTo:create(self.fish_flow,cc.p( 0 - self.fishSize.width/2 ,self.fish_y)))
    end
end

--生成鱼网
function GameScene:onFishingNet()
    local wang_y = math.random(-100 , 250)
    global.countDown.createTimer("time", self.time )
    local node = cc.Node:create()
    node:addTo(self)
    performWithDelay(node,function()
        -- self.wang1 = self.mView['wang1']
        self.wang1 = cc.Sprite:create("game/sharkfish/image/shangwang.png")
        self.wang1:addTo(self.ceng)
        self.wang1:setPosition(1330,wang_y + self.sharkfishSize.height * 2 + 500)
        -- self.wang2 = self.mView['wang2']
        self.wang2 = cc.Sprite:create("game/sharkfish/image/xiawang.png")
        self.wang2:addTo(self.ceng)
        self.wang2:setPosition(1330,wang_y)
        self.youwang = true
        -- node:removeFromParent()
        -- node = nil
        self:onFishingNet()
        end,self.time)
end

--鱼游动
function GameScene:onSwim(dt)
    self.fish_x = self.fish_x - self.fish_flow * dt
    self.fish_y = self.fish_y
    self.fish:setPosition(self.fish_x ,self.fish_y)
end
function GameScene:onControl()
    self.sharkfish:runAction(cc.JumpBy:create(0.5,cc.p(0,self.sharkfishSize.height*2),self.sharkfishSize.height,1))
end

--鲨鱼和网的碰撞
function GameScene:onWang(dt)
   if self.youwang then
    self.wang1Size = self.wang1:getContentSize()
    self.wang2Size = self.wang2:getContentSize()
    local wang1Box = self.wang1:getBoundingBox()
    local wang2Box = self.wang2:getBoundingBox()
    self.wang1:runAction(cc.MoveBy:create(dt,cc.p(-self.wang1Size.width/self.mobile,0)))
    self.wang2:runAction(cc.MoveBy:create(dt,cc.p(-self.wang2Size.width/self.mobile,0)))
    local sharkfish_x ,sharkfish_y = self.sharkfish:getPosition()
    local wang_x , wang_y = self.wang1:getPosition()
    local sharkPos = {x = sharkfish_x + self.sharkfishSize.width/2, y = sharkfish_y}
    if (cc.rectContainsPoint(wang1Box,sharkPos)) or (cc.rectContainsPoint(wang2Box,sharkPos))then
        self.sharkfish:stopAction(self.Go)
        self.sharkfish:setPosition(wang_x - self.wang1Size.width/2 - self.sharkfishSize.width/2 , sharkfish_y)
        self.sharkfish:runAction(cc.MoveBy:create(dt,cc.p(-self.wang2Size.width/self.mobile,0)))
    end
    if sharkfish_x + self.sharkfishSize.width/2 < display.left then
        print("游戏结束")
        local jiesuan = require("logic.game.sharkfish.JieSuanLayer").new()
        jiesuan:addTo(self)
        AudioEngine.stopMusic()
        CCDirector.sharedDirector():pause()
    end
   end
end

function GameScene:gotoResult()
    local jiesuan = require("logic.game.sharkfish.JieSuanLayer").new()
    jiesuan:addTo(self)
end

--鲨鱼和小鱼的碰撞
function GameScene:onPeng(dt)
    local shark = self.sharkfish:getBoundingBox()    --获取鲨鱼范围
    local small = self._yupnl:getChildren()          --小鱼
    for i, v in ipairs(small) do                     --对容器内的小鱼进行遍历
        local smallPos_x , smallPos_y = v:getPosition()            --获取小鱼的坐标
        local smallSize = v:getContentSize()
        local smallPos  = {x = smallPos_x , y = smallPos_y} 
        if (cc.rectContainsPoint(shark,smallPos)) then
            cc.SimpleAudioEngine:getInstance():playEffect("game/sharkfish/image/hitsmallfish.mp3")
            v:removeFromParent()
            v = nil
            self.grade = self.grade + 1
            self.score:setString(self.grade)
            cc.UserDefault:getInstance():setIntegerForKey("self.grade",self.grade)
            if self.grade > self.hight then
                self.hight = self.grade
                cc.UserDefault:getInstance():setIntegerForKey("self.hight",self.hight)
            end
            if self.grade % 10 == 0 then
                self.shanchu = self.shanchu + 1
                self.frequency:setString(self.shanchu)
            end     
        end
    end
end

--删除鱼网
function GameScene:onClear()  
    if self.shanchu > 0 then
        self.youwang = false
        self.shanchu = self.shanchu - 1 
        self.frequency:setString(self.shanchu)
        self.wang1:removeFromParent()
        self.wang1 = nil
        self.wang2:removeFromParent()
        self.wang2 = nil
        -- self:onFishingNet()
    end
end

return GameScene
