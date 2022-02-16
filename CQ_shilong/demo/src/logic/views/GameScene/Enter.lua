local ClassicScene = class("ClassicScene", cc.load("mvc").ModuleBase)
local Cfg = require("logic.views.GameScene.Cfg")
ClassicScene.RESOURCE_FILENAME = "game/shilong/ClassicScene.lua"

ClassicScene.behavior ={
    "logic.common.behavior.BtnBinder",
    "logic.common.behavior.TouchInterrupt",
    "logic.common.behavior.Listener",
}

local LongPath = "game/shilong/image/"
local BossPath = "game/shilong/boss/"
local SoundPath = "game/shilong/sound/"
local music = {
    "boss.mp3",
    "fei.mp3",
    "long.mp3"
}
local long = {
    "long1.png",
    "long2.png",
    "long3.png",
}
local boss = {
    "boss1.png",
    "boss2.png",
    "boss3.png",
    "boss4.png",
    "boss5.png",
}

function ClassicScene:onCreate()
    self:initHPAndMPAni()
    self.HpOriginSize = self.mView["ClipHP"]:getContentSize()
    math.randomseed(os.time()) --随机数因子

    --[[新加技能参数说明：
        技能 1 ：开启 ，功能：保护一条命
        技能2 - 4：暂时不开启，后续继续加 
    ]]
    --[[
        技能控制表初始化
        isOpen 是否开启技能
        isCoolingFinish 是否冷却完成
        condition 开启条件
        cb 回调
    ]]
    
    local addComponentConfig = {
        self,
        self.mView["headPanel"],
        self.mView["fenshu"]
    }
    local panel_top_btn = require("logic/viewController/componentController").new(addComponentConfig)

    self.skillTbl = {
        [1] = { isOpen = false, isCoolingFinish = true , condition = 0 ,cb = handler(self, self.playProtectHPAni)},
        [2] = { isOpen = false, isCoolingFinish = true , condition = 0 },
        [3] = { isOpen = false, isCoolingFinish = true , condition = 20000},
        [4] = { isOpen = false, isCoolingFinish = true , condition = 50000},
    }
    self:initSkill()

    self.isOpenSkill1 = false     -- 技能1 是否开启
    self.isOpenSkill2 = false    -- 技能2 是否开启
    self.isGameOver = false  --是否游戏结束
    self.zs_sx = 0
    self.zs_sy = 0

    --战士
    local  _aSaveInfo = global.saveTools.getData(global.viewData.PLAYER_INFO_SAVE_TO_LOCAL) or {}
    local job = _aSaveInfo.job
    local sex = _aSaveInfo.sex
    self.mView['zhanshi']:loadTexture("select/job/huoban_"..job.."_"..sex..".png")
    

    self.mView['zhanshi']:ignoreContentAdaptWithSize(true)
    local roleSize = self.mView["zhanshi"]:getContentSize()
    self.mView['zhanshi']:setSize(roleSize.width/2.5,roleSize.height/2.5)
    self.mView['zhanshi']:ignoreContentAdaptWithSize(false)


    self.zhanshi = self.mView['zhanshi']:clone()
    self.zhanshi:setPosition(cc.p(360, 420))
    self:addChild(self.zhanshi)
    self.zhanshi.isDie = false


    local game = 1
    cc.UserDefault:getInstance():setIntegerForKey("game",game)
   
    -- 龙币
    self.longbi =  self.mView['longbi']

    --boss
    self.boss = self.mView['boss']
    --分数
    self.fenshu = self.mView['fenshu']
    --获取战士的初始坐标
    self.zs_X , self.zs_Y = self.zhanshi:getPosition()
    --获取战士的size
    self.zsSize = self.zhanshi:getBoundingBox()
    -- self.zsSize = self.zhanshi:getContentSize()
    --定义参数
    self.tiao = true -- 触摸是否触发
    --创建龙层
    self._long = ccui.Layout:create()
    self._long:setPosition(0,0)
    self._long:setSize({width = 720, height = 1280})
    self._long:addTo(self)
    --碰撞判断
    self.shang = true
    self.xia = true
    self.zuo = true
    self.you = true
    -- self.bian = true
    --得分
    self.fen = cc.UserDefault:getInstance():getIntegerForKey("shilong.fen")
    self.fenshu:setString(self.fen)
    self.hightscore = cc.UserDefault:getInstance():getIntegerForKey("shilong.hightscore")
    --生命值
    self.shengming =  Cfg.TOTAL_HP
    
    --Boss的生命值
    self.a = 0  -- 等于5时出现Boss
    self.B_xue = 5
    self.b_pan = false
    self.kill = cc.UserDefault:getInstance():getIntegerForKey("shilong.kill")
    -- 龙币
    self.LB = cc.UserDefault:getInstance():getIntegerForKey("shilong.LB")
    self.longbi:setString( "x " .. self.LB)
    --战士跳高
    self:onChumo()
    self.jiesuan = true

    self.totalHP = 10


    self:onUpdate(handler(self,self.update))
end

function ClassicScene:update(dt)
    if not self.isGameOver then
        self:onLong(dt)       -- 龙的产生
        self:Coordinate(dt)   -- 实时获取战士的坐标
        self:LongBian(dt)     -- 判断龙和战士是否相撞
        self:onBoss(dt)    -- 打Boss
    end
end


function ClassicScene:initSkill()
    for i = 1, 4 do
        self.mView["btnSkill"..i]:addTouchEventListener(function(sender,eventType)  
            if eventType == 2 then
                if self.skillTbl[i].condition <= self.fen then
                    if not self.skillTbl[i].isCoolingFinish then return end
                    self.skillTbl[i].isCoolingFinish = false
                    self.skillTbl[i].isOpen = true
                    local callback = cc.CallFunc:create(function()
                        self.skillTbl[i].isCoolingFinish = true
                    end)
                    self:addCoolingComponent(sender,callback)
                    if self.skillTbl[i].cb then
                        self.skillTbl[i].cb()
                    end
                else
                    local str = string.format(Cfg.OPEN_CONDITION,self.skillTbl[i].condition)
                    global.viewMgr.showTips(str)
                end
            end
        end)     
    end

end

function ClassicScene:onChumo()
    local function onTouchBegan(touch,event)
        if self.tiao then
            self.tiao = false      --触摸屏幕，战士跳了一次后禁止
            self.shang = true  
            self.xia = true     
            self.zuo = true
            self.you = true  
            self.zhanshi:stopAllActions()
            self:onTiao()
            return true
        end
    end
    local function onTouchMoved(touch,event)
    end
    local function onTouchEnded(touch,event)
    end
    local listener = cc.EventListenerTouchOneByOne:create()  --创建一个单点事件监听
    listener:setSwallowTouches(false)  --是否向下传递
    listener:registerScriptHandler(onTouchBegan,cc.Handler.EVENT_TOUCH_BEGAN )
    listener:registerScriptHandler(onTouchMoved,cc.Handler.EVENT_TOUCH_MOVED )
    listener:registerScriptHandler(onTouchEnded,cc.Handler.EVENT_TOUCH_ENDED )
    local eventDispatcher = self:getEventDispatcher() 
    eventDispatcher:addEventListenerWithSceneGraphPriority(listener,self) --分发监听事件
end

function ClassicScene:onTiao()
    local action = cc.Sequence:create( { cc.JumpTo:create(1,cc.p(self.zs_X,self.zs_Y),self.zsSize.height * 2, 1),
    cc.CallFunc:create(function()
        self.tiao = true
    end)})
    action:setTag(999)
    self.zhanshi:stopActionByTag(999)
    self.zhanshi:runAction(action)
end

--龙的产生
function ClassicScene:onLong(dt) 
    local cs = math.random(1,1000)    --生成一个随机数
    self.spriteY = math.random(500,900)   --龙产生的Y轴坐标
    -- self.spriteY = math.random(500,600)
    local miao = math.random(2,5)          --龙移动的时间
    if cs % 80 == 0 then  --产生龙的条件
        local i = math.random(1,3)
        self.sprite1 = cc.Sprite:create(BossPath .. long[i])   --创建精灵
        self.sprite1:setScale(0.3)
        self.sprite1Size = self.sprite1:getContentSize() 
        -- self.long = long[i] 
        if miao % 2 == 0 then
            self.sprite1:move( display.width + self.sprite1Size.width/2,self.spriteY)
            self.sprite1:addTo(self._long )
            self.sprite1:runAction(cc.MoveTo:create(miao,cc.p( 0 - self.sprite1Size.width/2 ,self.spriteY)))
        end
        if miao % 2 ~= 0 then
            self.sprite1:move( 0 - self.sprite1Size.width/2,self.spriteY)
            self.sprite1:addTo(self._long )
            self.sprite1:setFlippedX(true)
            self.sprite1:runAction(cc.MoveTo:create(miao,cc.p( display.width + self.sprite1Size.width/2 ,self.spriteY)))
        end
    end
end

function ClassicScene:Coordinate(dt)
    if self.zhanshi then
        self.zs_sx , self.zs_sy = self.zhanshi:getPosition()
        if self.skillTbl[2].isOpen then
            local clone = self.zhanshi:clone()
            -- clone:setColor(cc.c3b(0, 0, 0))
            self.mView["obj"]:addChild(clone,1,Cfg.OBJ_Smear_Tag+20000)
            local x, y = self.zhanshi:getPosition()
            clone:setPosition(x,y)
            local delete = cc.CallFunc:create(function()
                clone:removeFromParent(true)
            end)
            
            local hide = cc.Sequence:create(cc.FadeOut:create(0.3),delete)
            clone:runAction(hide)  
        end
    end
end

function ClassicScene:LongBian(dt)
    if  self.jiesuan and not self.zhanshi.isDie then
        local point_Ztop = {x = self.zs_sx , y = self.zs_sy + self.zsSize.height} -- 战士上顶点
        local point_Zdown = {x = self.zs_sx , y = self.zs_sy} --战士下顶点
        local long_tbl = self._long:getChildren()     -- 

        for i , v in ipairs(long_tbl)do
            local rect_L = v:getBoundingBox()           --获取龙的范围
            local rect_Zs = self.zhanshi:getBoundingBox()
            local long_x , long_y = v:getPosition()
            local point_Lzuo = { x = long_x - rect_L.width / 2 , y = long_y} 
            local point_Lyou = { x = long_x + rect_L.width / 2 , y = long_y}
            if (cc.rectContainsPoint(rect_L,point_Ztop)) then --判断战士的上顶点是否在龙的范围内
                if self.shang then
                    -- self.bian = false
                    self.shang = false
                    self:onShang(v)
                end
            elseif (cc.rectContainsPoint(rect_L,point_Zdown)) then   -- 判断战士的下定点是否在龙的范围内
                if self.xia then
                    -- self.bian = false
                    self.xia = false
                    self.tiao = true  -- 触摸屏幕有效
                    self.shang = true
                    self:onXia(v)
                end
            elseif (cc.rectContainsPoint(rect_Zs, point_Lzuo)) then
                if self.zuo then
                    -- self.bian = false
                    self.zuo = false
                    self.you = false
                    self.shang = false
                    self.xia = false
                    self.tiao = true
                    self:onZuo(v)
                end
            elseif (cc.rectContainsPoint(rect_Zs, point_Lyou)) then
                if self.you then
                    -- self.bian = false
                    self.zuo = false
                    self.you = false
                    self.shang = false
                    self.xia = false
                    self.tiao = true
                    self:onYou(v)
                end
            end
        end
    end
end

function ClassicScene:onShang(v)
    print("shangshang")
    local fangxiang = math.random(1,2)
    local run1 = cc.CallFunc:create(function()
        v:stopAllActions()
        -- v:removeFromParent(true)
    end)
    local run2 = cc.CallFunc:create(function()
        global.utils.sound.playSound(SoundPath .. music[3], false)
        self.zhanshi:stopActionByTag(999)
        local action = cc.Sequence:create({ cc.MoveTo:create(0.2,cc.p(self.zs_X , self.zs_Y )), cc.CallFunc:create(function()
            self.tiao = true
            -- self.bian = true
        end) } )
        action:setTag(999)
        self.zhanshi:runAction(action)
        v:runAction(cc.RotateBy:create(0.5,360))
        v:runAction(cc.ScaleTo:create(0.5,0.1))
        if fangxiang == 1 then
            v:runAction(cc.JumpBy:create(1,cc.p(display.width,display.height/2),display.height/4 , 1))
        end
        if fangxiang == 2 then
            v:runAction(cc.JumpBy:create(1,cc.p(-display.width,display.height/2),display.height/4 , 1))
        end
        self:onFen()
    end)
    local run3 = cc.CallFunc:create(function()
        v:removeFromParent()
        v = nil
    end)
    local delay = cc.DelayTime:create(0.5)
    self.zhanshi:runAction(cc.Sequence:create(run1 , run2 , delay , run3 ))
end

function ClassicScene:onXia(v)
    print("xiaxia")
    local run1 = cc.CallFunc:create(function()
        v:stopAllActions()
        -- v:removeFromParent(true)
    end)
    local run2 = cc.CallFunc:create(function()
        global.utils.sound.playSound(SoundPath .. music[3], false)
        self.zhanshi:stopActionByTag(999)
        local action = cc.Sequence:create({cc.JumpTo:create(0.6 , cc.p(self.zs_X,self.zs_Y) , self.zsSize.height  , 1), cc.CallFunc:create(function()
            self.tiao = true
        end) } )
        action:setTag(999)
        self.zhanshi:runAction(action)
        v:runAction(cc.ScaleTo:create(0.1,0.5))
        v:runAction(cc.FadeOut:create(0.5))
        v:runAction(cc.RotateBy:create(0.5,360))
        v:runAction(cc.MoveTo:create(0.5 ,cc.p (self.zs_X,0)))
        self:onFen()
    end)
    local run3 = cc.CallFunc:create(function()
        self.xia = true
        -- self.bian = true
    end)
    local run4 = cc.CallFunc:create(function()
        -- v:removeFromParent()
        -- v = nil
    end)
    local delay = cc.DelayTime:create(0.5)
    self.zhanshi:runAction(cc.Sequence:create(run1 , run2 , run3 , delay ,run4))
end

function ClassicScene:onZuo(v)
    print("zuozuo")
    local run1 = cc.CallFunc:create(function()
        global.utils.sound.playSound(SoundPath .. music[2], false)
        -- v:stopAllActions()
        self.zhanshi:stopActionByTag(999)
        self.zhanshi:runAction(cc.ScaleTo:create(0.2,0.5))
        self.zhanshi:runAction(cc.RotateBy:create(1,720))
        local front_zhanshi = self.zhanshi
        self.zhanshi.isDie = true
        -- front_zhanshi:setVisible(false)
        local seq = cc.Sequence:create(
            cc.JumpBy:create(1, cc.p( - display.width , display.cy / 4) , display.cx / 4, 1),
            cc.CallFunc:create(function()
                front_zhanshi:setVisible(false)
            end)
        )
        self.zhanshi:runAction(seq)
        self:onShengming()
    end)
    local run2 = cc.CallFunc:create(function()
      
    end)
    local delay = cc.DelayTime:create(1)
    self.zhanshi:runAction(cc.Sequence:create(run1, delay, run2))
end

function ClassicScene:onYou(v)
    print("youyou")
    local run1 = cc.CallFunc:create(function()
        audio.playSound(SoundPath .. music[2], false)
        -- v:stopAllActions()
        self.zhanshi:stopActionByTag(999)
        self.zhanshi:runAction(cc.ScaleTo:create(0.2,0.5))
        self.zhanshi:runAction(cc.RotateBy:create(1,720))
        local front_zhanshi = self.zhanshi
        self.zhanshi.isDie = true

        local seq = cc.Sequence:create(
            cc.JumpBy:create(1, cc.p(  display.width , display.cy / 4) , display.cx / 4, 1),
            cc.CallFunc:create(function()
                front_zhanshi:setVisible(false)
            end)
        )
        self.zhanshi:runAction(seq)
        self:onShengming()
    end)
    local run2 = cc.CallFunc:create(function()
        
      
    end)
    local delay = cc.DelayTime:create(1)
    self.zhanshi:runAction(cc.Sequence:create(run1, delay,run2))
end

function ClassicScene:onBoss(dt)   
    if self.b_pan then
        local point_Ztop = {x = self.zs_sx , y = self.zs_sy + self.zsSize.height / 2} -- 战士上顶点
        local Boss_Size = self.boss:getBoundingBox()
        if (cc.rectContainsPoint(Boss_Size,point_Ztop)) then
        global.utils.sound.playSound(SoundPath .. music[1], false)
            self.b_pan = false
            print("打Boss")
            self.B_xue = self.B_xue - 1
            self.LB = self.LB + 1
            self.longbi:setString( "x " .. self.LB)
            cc.UserDefault:getInstance():setIntegerForKey("shilong.LB", self.LB)
            self.zhanshi:stopActionByTag(999)
            local action = cc.Sequence:create({ cc.MoveTo:create(0.2,cc.p(self.zs_X , self.zs_Y )), cc.CallFunc:create(function()
                self.tiao = true
                self.b_pan = true
            end) } )
            action:setTag(999)
            self.zhanshi:runAction(action)
            if self.B_xue == 0 then
                self.a = 0
                self.kill = self.kill + 1
                cc.UserDefault:getInstance():getIntegerForKey("shilong.kill",self.kill)
                self.boss:setVisible(false)
            end
        end
    end
end


function ClassicScene:onFen()
    self.fen = self.fen + 1
    self.a = self.a + 1
    if self.hightscore < self.fen then
        self.hightscore = self.fen 
        cc.UserDefault:getInstance():setIntegerForKey("shilong.hightscore",self.hightscore)
    end
    if self.a == 5 then
        self.b_pan = true
        local i = math.random(1,5)
        self.boss:loadTexture("game/shilong/boss/boss"..i ..".png",0)
        self.boss:ignoreContentAdaptWithSize(true)
        self.boss:setVisible(true)
    end
    if self.a < 5 then
        self.boss:setVisible(false)
    end
    self.fenshu:setString(self.fen)
    cc.UserDefault:getInstance():setIntegerForKey("shilong.fen",self.fen)
end

function ClassicScene:onShengming()
    if self.skillTbl[1].isOpen then
        self.skillTbl[1].isOpen  = false
        local fadeout = cc.FadeOut:create(0.3)
        local ani = self.zhanshi:getChildByName(Cfg.SKILL_PROTECT)
        ani:stopActionByTag(Cfg.SKILL1_ANI_TAG)
    else
        --掉血
        self.shengming = self.shengming - 1
        local Size = self.mView["ClipHP"]:getContentSize()
        local minusSize = {
            width = Size.width, 
            height = Size.height - (Cfg.TOTAL_HP-self.shengming)/Cfg.TOTAL_HP * Size.height
        }
        self.mView["ClipHP"]:setSize(minusSize)
    end

    if self.shengming > 0 then
        global.async.delay(1):Then(function()
            self.zhanshi:setVisible(false)
            self.zhanshi = self.mView['zhanshi']:clone()
            self.zhanshi:setPosition(cc.p(360, 420))
            self:addChild(self.zhanshi)
            self.zhanshi.isDie = false
        end)
    else 
        self.jiesuan = false
        self.zuo = false
        self.you = false
        -- local run1 = cc.CallFunc:create(function()
            
        -- end)
        -- local delay = cc.DelayTime:create(2)
        -- self.zhanshi:runAction(cc.Sequence:create(delay, run1))
        
        self.isGameOver = true
        local function adSuccess()
            self.isGameOver = false
            local over = self:getChildByName("over")
            over:removeFromParent(true)
            self.shengming = Cfg.TOTAL_HP
            self.mView["ClipHP"]:setSize(self.HpOriginSize)
            self.zhanshi:setVisible(false)
            self.zhanshi = self.mView['zhanshi']:clone()
            self.zhanshi:setPosition(cc.p(360, 420))
            self:addChild(self.zhanshi)
            self.zhanshi.isDie = false
            self.jiesuan = true
            self.zuo = true
            self.you = true
        end
        print("进入结算 ====== ")
        local over = require("logic.views.GameOver.Enter").new(nil,nil,adSuccess)
        self:addChild(over)
        over:setName("over")
    end
  
end

function ClassicScene:initHPAndMPAni()
    self:runAction(self.__csbAnimation)
    self.__csbAnimation:gotoFrameAndPlay(0, 40, true);
    -- self.mView["btnSkill2"]:setEnabled(false)
    -- self.mView["btnSkill3"]:setEnabled(false)
    -- self.mView["btnSkill4"]:setEnabled(false)
end

--[[
    技能1 播放保护动画
]]
function ClassicScene:playProtectHPAni()
    local Circle_sp = cc.Sprite:create(string.format("game/shilong/skillAni/10%d.png", 1))
    local roleSize = Circle_sp:getContentSize()
    Circle_sp:setPosition(cc.p(roleSize.width/2, 0))
    Circle_sp:setAnchorPoint(cc.p(0.5,0))
    Circle_sp:setScale(1.5, 1.5)
    Circle_sp:setName(Cfg.SKILL_PROTECT)
    self.zhanshi:addChild(Circle_sp, 3)

    local animation = cc.Animation:create()
    for i = 1, 8 do
        local framename = string.format("game/shilong/skillAni/10%d.png", i)
        animation:addSpriteFrameWithFile(framename)
    end
    animation:setDelayPerUnit(0.1) --设置两个帧播放时间
    animation:setRestoreOriginalFrame(true) --动画执行后还原初始状态
    local action = cc.Animate:create(animation)
    action:setTag(Cfg.SKILL1_ANI_TAG)
    Circle_sp:runAction(cc.RepeatForever:create(action))
end

 --[[
     添加技能冷却组件
 ]]
function ClassicScene:addCoolingComponent(node,callback)
    local coolingSprite = cc.Sprite:create("game/shilong/skill/cooling.png")
    local progressHP = cc.ProgressTimer:create(coolingSprite)
    progressHP:setType(cc.PROGRESS_TIMER_TYPE_RADIAL)
    progressHP:setAnchorPoint(cc.p(0,0))
    progressHP:setPosition(cc.p(0, 0))
    local isFinish = cc.CallFunc:create(function()
        self.isCoolingFinish = true
    end)
    local from = cc.ProgressFromTo:create(30, 100, 0)
    local seq = cc.Sequence:create(from,callback)
    progressHP:runAction(seq)
    -- progressHP:setMidpoint(cc.p(0.73, 0))
    -- progressHP:setReverseDirection(false)
    -- progressHP:setBarChangeRate(cc.p(0,1))
    node:addChild(progressHP, 3)
end

return ClassicScene