local gameScene = class("gameScene", cc.load("mvc").ModuleBase)
gameScene.RESOURCE_FILENAME = "game/WitchPoker/GameScene.lua"
local winLayer = require("logic.game.WitchPoker.winLayer")
local viewJump = require("logic.common.views.viewJump")
local pauseLayer = import(".pauseLayer")

local Shuffle = cc.load("tools").Shuffle
gameScene.behavior ={
    "logic.common.behavior.BtnBinder",
    "logic.common.behavior.TouchInterrupt",
    "logic.common.behavior.Listener"
}


--创建界面
function gameScene:onCreate()
    print("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=1")
    audio.playMusic("game/WitchPoker/sound/bgm.mp3",true)
    --背面容器
    self.backPanel = self.mView["backPanel"]
    --倒计时文本
    self.timeText = self.mView["timeText"]
    --星星
    self.star = self.mView["star"]
    --撤回按钮
    self.withdrawBtn = self.mView["withdrawBtn"]   
    --暂停按钮
    self.pauseBtn = self.mView["pauseBtn"]
    --分数文本
    self.score = self.mView["scoreText"]
    self.score:setString("0")
    --分数累加
    self.ScoreAdd = 0;
    --关卡文本
    self.levelText = self.mView["levelText"]
    local level  = global.saveTools.getData("nwpk_level")
    
    if level then
        self.levelText:setString(tostring(level))
    else
        self.levelText:setString("1")
        global.saveTools.saveData("nwpk_level",1)   
    end
    --时间文本
    self.timeText = self.mView["timeText"]
    self.timeText:setString("5:00")
    --光效
    self.flash = self.mView["flash"];
    self.flash:setLocalZOrder(100)
    self.flash:setVisible(false)

    --计数
    self.index = 52
    --牌堆索引
    self.cardindex = 24
    --牌容器
    self.itemPanel = nil
    --保存表
    self.saveTable = {}
    self.x = 0
    --公共值保存表
    self.commonValue = {}
    --撤回变量
    self.check = {};
    --最顶牌消除累计
    self.winAdd = 0
    --金字塔每张牌所对应的n值
    self.jztCardNum = {}
    --是否完
    self.over = false
    self.current = 1 
   
    --牌png-值对应表
    self.cardData = {
        1,2,3,4,5,6,7,8,9,10,11,12,13,1,2,3,4,5,6,7,8,9,10,11,12,13,1,2,3,4,5,6,7,8,9,10,11,12,13,1,2,3,4,5,6,7,8,9,10,11,12,13
    }
    self:initSound()
    self:initUI()
    self:timerDown(5,0)
    
    -------------------------------------全局事件监听-------------------------------------------
     ---重新开始
     global.event.on("AgainStart",function ()
        --清除定时器
        local scheduler = cc.Director:getInstance():getScheduler()
        if self.run_logic then
            scheduler:unscheduleScriptEntry(self.run_logic)
        end
            --定时器倒计时
            self:timerDown(5,0)
            self.score:setString("0")
            --self.backPanel:removeAllChildren()
            for i = 1, 24 do
                self.backPanel:removeChildByTag(i)
            end
            --分数累加
            self.ScoreAdd = 0;
            --最高层消除累计
            self.winAdd = 0
            for i = 1, 4 do
                
                local num = 0;
                if i == 4 then
                    num = 10 
                else
                    num = 3*i
                end
                for j = 1, num do
                    local card = self.mView[string.format( "Panel%d_%d",i,j)]
                    card:removeAllChildren()
                    --金字塔牌摆回原来的位置
                    card:setPosition(self.orginPos[i][j])
                    card:setLocalZOrder(0)
                end
            end
           
            for k, v in pairs(self.record) do
                v = nil
            end
            --牌堆索引
            self.cardindex = 24
            --关卡清零
            --self.current = 1 
            --是否完
            self.over = false
            --是否到牌底
            self.IsOpenCheck = false
            --撤回按钮可以点
            self.withdrawBtn:setEnabled(true)
            --初始化ui
            self:initUI();
            
             --撤回变量
            self.check = {};
    end,self)

    --返回登录场景
    global.event.on("LoginScene",function ()
        --清除定时器
        local scheduler = cc.Director:getInstance():getScheduler()
        if self.run_logic then
            scheduler:unscheduleScriptEntry(self.run_logic)
        end
        viewJump.gotoMainGame()
         
    end,self)

    --继续之前的定时器
    global.event.on("ResumeTime",function ()
        local str = self.timeText:getString()
        local nums = string.split(str, ":");
        local minute = tonumber(nums[1]);
        local second = tonumber(nums[2]);
        self:timerDown(minute,second)
      
    end,self)
    ---进入下一关
    global.event.on("NextLevel",function ()
        --清除定时器
        local scheduler = cc.Director:getInstance():getScheduler()
        if self.run_logic then
            scheduler:unscheduleScriptEntry(self.run_logic)
        end
        --最高层消除累计
        self.winAdd = 0
        self.withdrawBtn:setEnabled(true)
        
        
        for i = 1, 24 do
            self.backPanel:removeChildByTag(i)
        end
        

        for i = 1, 4 do
            
            local num = 0;
            if i == 4 then
                num = 10 
            else
                num = 3*i
            end
            for j = 1, num do
                local card = self.mView[string.format( "Panel%d_%d",i,j)]
                card:removeAllChildren()
                card:setPosition(self.orginPos[i][j])
                card:setLocalZOrder(0)
            end
        end

       

        for k, v in pairs(self.record) do
            v = nil
        end
        --牌堆索引
        self.cardindex = 24
        --关卡清零
        --self.current = 1 
        --是否完
        self.over = false
        --是否到牌底
        self.IsOpenCheck = false
        --撤回按钮可以点
        self.withdrawBtn:setEnabled(true)
        
         --撤回变量
        self.check = {};
        
        self.current = self.current + 1;
        global.saveTools.saveData("nwpk_level",self.current)
        self.levelText:setString(tostring(self.current))
        --定时器倒计时
        self:timerDown(5,0)
        --初始化ui
        self:initUI();
    end,self)
end

--按钮事件绑定
gameScene.btnBind = {
    withdrawBtn = "withdrawClick",
    againBtn = "againBtnClick",
    btn_close = "btn_closeClick"
}

function gameScene:againBtnClick()
    print("xxx")
    global.event.emit("AgainStart")
end

function gameScene:initSound()
    local effect = global.saveTools.getData("nwpk_effectPercent")
    local music = global.saveTools.getData("nwpk_musicPercent")
    local perEffect = 0.5
    local perMusic = 0.5
    if effect then
        perEffect = effect
    end
    if music then
        perMusic = music
    end
    global.utils.sound.setEffectVolume(perEffect) 
    global.utils.sound.setMusicVolume(perMusic)
end

function gameScene:onExit()
    local scheduler = cc.Director:getInstance():getScheduler()
    if self.run_logic then
        scheduler:unscheduleScriptEntry(self.run_logic)
    end
end

function gameScene:btn_closeClick()
    gameChoose.new():showWithScene()
end



--倒计时控制（5min）
function gameScene:timerDown(minute,second)
    local scheduler = cc.Director:getInstance():getScheduler()
    
    local function autoTimeUpdate()
        if self.IsOpenCheck and  (not self.over) then
            self:checkWin()
        end
        

        second = second - 1
       
        if second == -1 then
            minute = minute - 1;
            second = 59;
        end
        if minute == 0 and second == 0 then
            self:isWin(false)
        end
        self.timeText:setString(string.format("%02d:%02d",minute,second))
        if self.isFinish then
            if self.run_logic ~= nil then
                scheduler:unscheduleScriptEntry(self.run_logic)
                self.run_logic = nil
            end
        end 
    end  
    
    self.run_logic = scheduler:scheduleScriptFunc(autoTimeUpdate,1,false)
end

--撤回按钮事件
function gameScene:withdrawClick()
    print("你点击了撤回按钮")
    AudioEngine.playEffect("game/WitchPoker/sound/Button.mp3",false)
    --方案：对已经消除的，和移动的插入表中
    --检测变量
    for k, v in pairs(self.check) do
        print(k,v)
        for k, v in pairs(v) do
            print(k,v)
        end
    end
    --取出最后一步进行解析
    local lastAction = self.check[#self.check]
    if lastAction == nil then
        return
    end
    self.withdrawBtn:setEnabled(false)

    ----------------------------------------金字塔上的牌撤回------------------------------------
    if lastAction.tag == "j" then
        local j = lastAction.j
        local i = lastAction.i
        local pos = lastAction.pos
        local cardMap = {}  
        self.record.num = lastAction.lastData 
        local card = self.mView[string.format( "Panel%d_%d",i,j)]
        cardMap[i] = cardMap[i] or {}
        cardMap[i][j] = card 
        self.cardMap[i][j] = cardMap[i][j]
       
       
        card:runAction(cc.MoveTo:create(0.3,pos));
        local x,y = card:getPosition()
        local z = card:getLocalZOrder()
        --判断其上层的两张牌，让其显示背面
        if i == 4 then
            if j == 1 then
                self.cardMap[i-1][j]:setEnabled(false)
                for k, v in pairs(self.jztTable) do
                    --如果翻出来之后，再合回去之后将其从jztTable中删除
                    if v == self.jztCardNum[i-1][j] then
                        table.remove(self.jztTable,k)  
                    end
                end
                local face =  self.cardMap[i-1][j]:getChildByTag(1)
                local back =  self.cardMap[i-1][j]:getChildByTag(2)
                face:setVisible(false)
                back:setVisible(true)
            elseif j == 10 then
                self.cardMap[i-1][j-1]:setEnabled(false)
                for k, v in pairs(self.jztTable) do
                    if v == self.jztCardNum[i-1][j-1] then
                        table.remove(self.jztTable,k)  
                    end
                end
                local face =  self.cardMap[i-1][j-1]:getChildByTag(1)
                local back =  self.cardMap[i-1][j-1]:getChildByTag(2)
                face:setVisible(false)
                back:setVisible(true)

            elseif j == 2 or j == 3 or j == 4 or j == 5 or j ==6 or j == 7 or j == 8 or j == 9 then
                self.cardMap[i-1][j-1]:setEnabled(false)
                self.cardMap[i-1][j]:setEnabled(false)
                for k, v in pairs(self.jztTable) do
                    if v == self.jztCardNum[i-1][j-1] then
                        table.remove(self.jztTable,k)
                    end
                    if v == self.jztCardNum[i-1][j] then
                        table.remove(self.jztTable,k)
                    end
                end
                local face =  self.cardMap[i-1][j-1]:getChildByTag(1)
                local back =  self.cardMap[i-1][j-1]:getChildByTag(2)
                face:setVisible(false)
                back:setVisible(true)
                local face2 =  self.cardMap[i-1][j]:getChildByTag(1)
                local back2 =  self.cardMap[i-1][j]:getChildByTag(2)
                face2:setVisible(false)
                back2:setVisible(true)
            end
        elseif i == 3 then 
            
            if j ~=2 and j ~= 8 and j ~= 5 then
                if j % 2 == 0 then
                    --j 为偶数 
                    self.cardMap[i-1][3*j/2]:setEnabled(false)
                    for k, v in pairs(self.jztTable) do
                        if v == self.jztCardNum[i-1][3*j/2] then
                            table.remove(self.jztTable,k)
                        end
                    end
                    local face2 =  self.cardMap[i-1][3*j/2]:getChildByTag(1)
                    local back2 =  self.cardMap[i-1][3*j/2]:getChildByTag(2)
                    face2:setVisible(false)
                    back2:setVisible(true)
                else
                    --j 为奇数
                    self.cardMap[i-1][3*j/2-1/2]:setEnabled(false)
                    for k, v in pairs(self.jztTable) do
                        if v == self.jztCardNum[i-1][3*j/2-1/2] then
                            table.remove(self.jztTable,k)
                        end
                    end
                    local face2 =  self.cardMap[i-1][3*j/2-1/2]:getChildByTag(1)
                    local back2 =  self.cardMap[i-1][3*j/2-1/2]:getChildByTag(2)
                    face2:setVisible(false)
                    back2:setVisible(true)
                end
            else
                if j == 2 then
                    self.cardMap[i-1][j-1]:setEnabled(false)
                    self.cardMap[i-1][j]:setEnabled(false)
                    for k, v in pairs(self.jztTable) do
                        if v == self.jztCardNum[i-1][j-1] then
                            table.remove(self.jztTable,k)
                        end
                        if v == self.jztCardNum[i-1][j] then
                            table.remove(self.jztTable,k)
                        end
                    end
                    local face =  self.cardMap[i-1][j-1]:getChildByTag(1)
                    local back =  self.cardMap[i-1][j-1]:getChildByTag(2)
                    face:setVisible(false)
                    back:setVisible(true)
                    local face2 =  self.cardMap[i-1][j]:getChildByTag(1)
                    local back2 =  self.cardMap[i-1][j]:getChildByTag(2)
                    face2:setVisible(false)
                    back2:setVisible(true)
                elseif j == 5 then
                    self.cardMap[i-1][j-1]:setEnabled(false)
                    self.cardMap[i-1][j-2]:setEnabled(false)
                    for k, v in pairs(self.jztTable) do
                        if v == self.jztCardNum[i-1][j-1] then
                            table.remove(self.jztTable,k)
                        end
                        if v == self.jztCardNum[i-1][j-2] then
                            table.remove(self.jztTable,k)
                        end
                    end
                    local face =  self.cardMap[i-1][j-1]:getChildByTag(1)
                    local back =  self.cardMap[i-1][j-1]:getChildByTag(2)
                    face:setVisible(false)
                    back:setVisible(true)
                    local face2 =  self.cardMap[i-1][j-2]:getChildByTag(1)
                    local back2 =  self.cardMap[i-1][j-2]:getChildByTag(2)
                    face2:setVisible(false)
                    back2:setVisible(true)
                elseif j == 8 then
                    self.cardMap[i-1][j-3]:setEnabled(false)
                    self.cardMap[i-1][j-2]:setEnabled(false)
                    for k, v in pairs(self.jztTable) do
                        if v == self.jztCardNum[i-1][j-3] then
                            table.remove(self.jztTable,k)
                        end
                        if v == self.jztCardNum[i-1][j-2] then
                            table.remove(self.jztTable,k)
                        end
                    end
                    local face =  self.cardMap[i-1][j-3]:getChildByTag(1)
                    local back =  self.cardMap[i-1][j-3]:getChildByTag(2)
                    face:setVisible(false)
                    back:setVisible(true)
                    local face2 =  self.cardMap[i-1][j-2]:getChildByTag(1)
                    local back2 =  self.cardMap[i-1][j-2]:getChildByTag(2)
                    face2:setVisible(false)
                    back2:setVisible(true)
                end
            end
            
        elseif i == 2 then
            if j ==2 or j == 3 then
                self.cardMap[i-1][j-1]:setEnabled(false)
                for k, v in pairs(self.jztTable) do
                    --如果翻出来之后，再合回去之后将其从jztTable中删除
                    if v == self.jztCardNum[i-1][j-1] then
                        table.remove(self.jztTable,k)  
                    end
                end
                local face =  self.cardMap[i-1][j-1]:getChildByTag(1)
                local back =  self.cardMap[i-1][j-1]:getChildByTag(2)
                face:setVisible(false)
                back:setVisible(true)
            elseif j == 4 or j == 5 then
                self.cardMap[i-1][j-2]:setEnabled(false)
                for k, v in pairs(self.jztTable) do
                    --如果翻出来之后，再合回去之后将其从jztTable中删除
                    if v == self.jztCardNum[i-1][j-2] then
                        table.remove(self.jztTable,k)  
                    end
                end
                local face =  self.cardMap[i-1][j-2]:getChildByTag(1)
                local back =  self.cardMap[i-1][j-2]:getChildByTag(2)
                face:setVisible(false)
                back:setVisible(true)
            elseif j == 1 then
                self.cardMap[i-1][j]:setEnabled(false)
                for k, v in pairs(self.jztTable) do
                    --如果翻出来之后，再合回去之后将其从jztTable中删除
                    if v == self.jztCardNum[i-1][j] then
                        table.remove(self.jztTable,k)  
                    end
                end
                local face =  self.cardMap[i-1][j]:getChildByTag(1)
                local back =  self.cardMap[i-1][j]:getChildByTag(2)
                face:setVisible(false)
                back:setVisible(true)
            elseif j == 6 then
                self.cardMap[i-1][j-3]:setEnabled(false)
                for k, v in pairs(self.jztTable) do
                    --如果翻出来之后，再合回去之后将其从jztTable中删除
                    if v == self.jztCardNum[i-1][j-3] then
                        table.remove(self.jztTable,k)  
                    end
                end
                local face =  self.cardMap[i-1][j-3]:getChildByTag(1)
                local back =  self.cardMap[i-1][j-3]:getChildByTag(2)
                face:setVisible(false)
                back:setVisible(true)
            end
        end



        self.record.num = self.commonValue[#self.commonValue-1]
        print("当前的公共值是",self.commonValue[#self.commonValue-1])
        table.insert(self.commonValue,self.record.num )

        card:setLocalZOrder(24 - self.cardindex)
        card:addTouchEventListener(function(sender, eventType)
            if eventType == ccui.TouchEventType.ended then
                AudioEngine.playEffect("game/WitchPoker/sound/Button.mp3",false)
                self.flash:setPosition(x,y)
                self.flash:setVisible(true)
                --获取金字塔牌值
                local cardValue =  self.cardData[lastAction.Value]
                print("你点下的牌值是",cardValue)
                print("当前的公共值是",self.record.num)
                if self.record.num then
                    if self.record.num - cardValue == 1 or self.record.num - cardValue == -1 or self.record.num - cardValue == -12 or self.record.num - cardValue == 12 then
                        local delayFlash = cc.CallFunc:create(function ()
                            self.flash:setVisible(false)
                        end)
                        local fadein = cc.CallFunc:create(function ()
                            AudioEngine.playEffect("game/WitchPoker/sound/star3.mp3",false)
                            self.star:setPosition(x,y)
                            self.star:setVisible(true)
                            self.star:runAction(cc.FadeIn:create(0.1))
                        end)
                        
                        local star = cc.CallFunc:create(function ()
                           
                            self.star:runAction(cc.MoveTo:create(0.5,cc.p(230,675)))
                        end)
                        local hide = cc.CallFunc:create(function ()
                            self.star:runAction(cc.FadeOut:create(0.1))
                            self.ScoreAdd = self.ScoreAdd + 50
                            self.score:setString(tostring(self.ScoreAdd))
                           
                        end)
                        local delay = cc.DelayTime:create(0.5)
                        local delay2 = cc.DelayTime:create(0.2)
                        local move = cc.MoveTo:create(0.15,cc.p(495,88))
                        card:runAction(cc.Sequence:create(delay2,delayFlash,move,fadein,delay2,star,delay,hide))    
                        
                        card:setLocalZOrder(24 - self.cardindex)
                       
                       
                        print("金字塔牌的层级 ===",24 - self.cardindex)
                        local lastData =  self.record.num
                        self.record.num = cardValue
                        table.insert(self.commonValue,self.record.num)
                        print("当前的公共值是",self.record.num)
                        for k, v in pairs(self.jztTable) do
                            if v == self.n then
                                table.remove(self.jztTable,k)
                            end
                        end
                    

                        --判断其左边和右边是否存在
                        if ((not self.cardMap[i][j-1]) or  (not self.cardMap[i][j + 1])) then
                            if not self.cardMap[i][j-1] then
                                --左边那个没有了
                                if i == 4 then
                                    if self.cardMap[i-1][j-1] then
                                        self.cardMap[i-1][j-1]:setEnabled(true)
                                        local face =  self.cardMap[i-1][j-1]:getChildByTag(1)
                                        local back =  self.cardMap[i-1][j-1]:getChildByTag(2)
                                        face:setVisible(true)
                                        back:setVisible(false)
                                    end
                                elseif i == 3 then
                                    if j == 1 or j == 2 or j == 3  then
                                        if self.cardMap[i-1][j-1] then
                                            self.cardMap[i-1][j-1]:setEnabled(true)
                                            local face =  self.cardMap[i-1][j-1]:getChildByTag(1)
                                            local back =  self.cardMap[i-1][j-1]:getChildByTag(2)
                                            face:setVisible(true)
                                            back:setVisible(false)
                                        end
                                        --4 ,7 没有意义
                                    elseif j == 5 or j == 6 then
                                        if self.cardMap[i-1][j-2] then
                                            self.cardMap[i-1][j-2]:setEnabled(true)
                                            local face =  self.cardMap[i-1][j-2]:getChildByTag(1)
                                            local back =  self.cardMap[i-1][j-2]:getChildByTag(2)
                                            face:setVisible(true)
                                            back:setVisible(false)
                                        end
                                    elseif j == 8 or j == 9 then
                                        if self.cardMap[i-1][j-3] then
                                            self.cardMap[i-1][j-3]:setEnabled(true)
                                            local face =  self.cardMap[i-1][j-3]:getChildByTag(1)
                                            local back =  self.cardMap[i-1][j-3]:getChildByTag(2)
                                            face:setVisible(true)
                                            back:setVisible(false)
                                        end
                                    end
                                elseif i == 2 then
                                    if j  == 2  then
                                        if self.cardMap[i-1][j-1] then
                                            self.cardMap[i-1][j-1]:setEnabled(true)
                                            local face =  self.cardMap[i-1][j-1]:getChildByTag(1)
                                            local back =  self.cardMap[i-1][j-1]:getChildByTag(2)
                                            face:setVisible(true)
                                            back:setVisible(false)
                                        end
                                    elseif j == 4 then
                                        if self.cardMap[i-1][j-2] then
                                            self.cardMap[i-1][j-2]:setEnabled(true)
                                            local face =  self.cardMap[i-1][j-2]:getChildByTag(1)
                                            local back =  self.cardMap[i-1][j-2]:getChildByTag(2)
                                            face:setVisible(true)
                                            back:setVisible(false)
                                        end
                                    elseif j == 6 then
                                        if self.cardMap[i-1][j-3] then
                                            self.cardMap[i-1][j-3]:setEnabled(true)
                                            local face =  self.cardMap[i-1][j-3]:getChildByTag(1)
                                            local back =  self.cardMap[i-1][j-3]:getChildByTag(2)
                                            face:setVisible(true)
                                            back:setVisible(false)
                                        end
                                    end
                                end
                            end 

                            if not cardMap[i][j+1] then
                                --右边那个没有了
                                if i == 4 then
                                    if self.cardMap[i-1][j] then
                                        self.cardMap[i-1][j]:setEnabled(true)
                                        local face =  self.cardMap[i-1][j]:getChildByTag(1)
                                        local back =  self.cardMap[i-1][j]:getChildByTag(2)
                                        face:setVisible(true)
                                        back:setVisible(false)
                                    end
                                elseif i == 3 then
                                    if j == 1 or j ==2 then
                                        if self.cardMap[i-1][j] then
                                            self.cardMap[i-1][j]:setEnabled(true)
                                            local face =  self.cardMap[i-1][j]:getChildByTag(1)
                                            local back =  self.cardMap[i-1][j]:getChildByTag(2)
                                            face:setVisible(true)
                                            back:setVisible(false)
                                        end
                                    elseif j == 4 or j == 5 then
                                        if self.cardMap[i-1][j-1] then
                                            self.cardMap[i-1][j-1]:setEnabled(true)
                                            local face =  self.cardMap[i-1][j-1]:getChildByTag(1)
                                            local back =  self.cardMap[i-1][j-1]:getChildByTag(2)
                                            face:setVisible(true)
                                            back:setVisible(false)
                                        end
                                    elseif j == 7 or j == 8 then
                                        if self.cardMap[i-1][j-2] then
                                            self.cardMap[i-1][j-2]:setEnabled(true)
                                            local face =  self.cardMap[i-1][j-2]:getChildByTag(1)
                                            local back =  self.cardMap[i-1][j-2]:getChildByTag(2)
                                            face:setVisible(true)
                                            back:setVisible(false)
                                        end
                                    end
                                elseif i == 2 then
                                    if j == 1  then
                                        if cardMap[i-1][j] then
                                            cardMap[i-1][j]:setEnabled(true)
                                            local face =  self.cardMap[i-1][j]:getChildByTag(1)
                                            local back =  self.cardMap[i-1][j]:getChildByTag(2)
                                            face:setVisible(true)
                                            back:setVisible(false)
                                        end
                                    elseif j == 3 then
                                        if self.cardMap[i-1][j-1] then
                                            self.cardMap[i-1][j-1]:setEnabled(true)
                                            local face =  self.cardMap[i-1][j-1]:getChildByTag(1)
                                            local back =  self.cardMap[i-1][j-1]:getChildByTag(2)
                                            face:setVisible(true)
                                            back:setVisible(false)
                                        end
                                    elseif j == 5 then
                                        if self.cardMap[i-1][j-2] then
                                            self.cardMap[i-1][j-2]:setEnabled(true)
                                            local face =  self.cardMap[i-1][j-2]:getChildByTag(1)
                                            local back =  self.cardMap[i-1][j-2]:getChildByTag(2)
                                            face:setVisible(true)
                                            back:setVisible(false)
                                        end
                                    end
                                end
                            end  
                        end

                        --将牌值和位置进行记录，以便于撤回
                        local  tableJ = {}
                        tableJ.i = i
                        tableJ.j = j
                        tableJ.pos = cc.p(x,y)
                        tableJ.tag = "j"
                        tableJ.Value = self.n 
                        table.insert(self.check,tableJ)
                    end
                end
             end
        end)

       
    -------动画    
    elseif lastAction.tag == "a" then
        --左左牌堆那张
        if lastAction.type == "left" then
            local cardPanel_0 = self.backPanel:getChildByTag(lastAction.Value+1)
            local faceCard = cardPanel_0:getChildByTag(self.cardindex+1)
            faceCard:setVisible(false)
            local backCard = cardPanel_0:getChildByTag(self.cardindex+32)
            backCard:setVisible(true)
            backCard:runAction(cc.OrbitCamera:create(0.25/2, 1, 0, 0,0, 0, 0))
            cardPanel_0:setPosition(lastAction.pos1)
            cardPanel_0:setLocalZOrder(lastAction.Value+1)
        end
        self.record.num = self.commonValue[#self.commonValue-1]
        print("当前的公共值是",self.commonValue[#self.commonValue-1])
        table.insert(self.commonValue,self.record.num )
        
        
        
        self.cardindex = self.cardindex + 1
        
       

    end
         





end
--暂停按钮事件
function gameScene:onpauseBtnClick()
    print("你点击了暂停按钮")
    AudioEngine.playEffect("game/WitchPoker/sound/Button.mp3",false)
    --显示弹窗
     --清除定时器
    local scheduler = cc.Director:getInstance():getScheduler()
    if self.run_logic then
        scheduler:unscheduleScriptEntry(self.run_logic)
    end
   
    local pauseUI = nil
    if not pauseUI then
    pauseUI = pauseLayer:create()
    self:addChild(pauseUI,100)
    local size = pauseUI:getContentSize()
    local x,y = pauseUI:getPosition()
    end
  
  
end

function gameScene:grabscreen()
    self.ScoreAdd = math.modf( math.random( 500, 1500 ) / 50 ) * 50
    self.score:setString(tostring(self.ScoreAdd))
    local index = math.random( 1, 10 )
    self.levelText:setString(tostring(index))
    local iswin1 = false
    if index % 2 == 0 then
        iswin1 = true
    end
    local scheduler = cc.Director:getInstance():getScheduler()
    if self.run_logic then
        scheduler:unscheduleScriptEntry(self.run_logic)
    end
    self.timeText:setString(string.format("%02d:%02d",math.random( 0, 4 ), math.random( 0, 59 )))
    local CallFunc = cc.CallFunc:create(function ()
        local winUI = winLayer:create()
        self:addChild(winUI,100)
        local size = winUI:getContentSize()
        local x,y = winUI:getPosition()
        --显示输赢
        winUI:isShowWin(iswin1)
        if iswin1 then
            AudioEngine.playEffect("game/WitchPoker/sound/win.mp3",false)
            local score = cc.UserDefault:getInstance():getIntegerForKey("WitchPokerHightScore")
            if score <= self.ScoreAdd then
                score = self.ScoreAdd
                cc.UserDefault:getInstance():setIntegerForKey("WitchPokerHightScore", score)
            end
        else
            AudioEngine.playEffect("game/WitchPoker/sound/lose.mp3",false)
        end
    end)
    local delay = cc.DelayTime:create(3)
    self:runAction(cc.Sequence:create(delay,CallFunc))   
end

function gameScene:grabscreen1()
end

--是否赢
function gameScene:isWin(iswin)
    print("进入结算")
    --显示弹窗
        local scheduler = cc.Director:getInstance():getScheduler()
        if self.run_logic then
            scheduler:unscheduleScriptEntry(self.run_logic)
        end

        local winUI = winLayer:create()
        self:addChild(winUI,100)
        local size = winUI:getContentSize()
        local x,y = winUI:getPosition()
        --显示输赢
        winUI:isShowWin(iswin)
        if iswin then
            AudioEngine.playEffect("game/WitchPoker/sound/win.mp3",false)
            local score = cc.UserDefault:getInstance():getIntegerForKey("WitchPokerHightScore")
            if score <= self.ScoreAdd then
                score = self.ScoreAdd
                cc.UserDefault:getInstance():setIntegerForKey("WitchPokerHightScore", score)
            end
        else
            AudioEngine.playEffect("game/WitchPoker/sound/lose.mp3",false)
        end
 
end


function gameScene:initUI()
    --牌堆牌
    local otherTable = {}
    for i = 1, 52 do
        table.insert(otherTable,i)
    end

    --纪录表
    


    --金字塔存在的牌    
    local exitTable = {};
    local cardMap = {}  
    
    self.record = self.record or {}

    --洗牌器
    local shuffle = Shuffle.new()
    shuffle:initNumByRange(1, 52)
    local itr = shuffle:start()
    math.randomseed(os.time())
    self.cardMap = {}
    self.orginPos = {}
    self.jztTable = {}

    for i = 1, 4 do
        cardMap[i] = cardMap[i] or {}
        local num = 0;
        if i == 4 then
            num = 10 
        else
            num = 3*i
        end
        for j = 1, num do
           
            local card = self.mView[string.format( "Panel%d_%d",i,j)]
            local x,y = card:getPosition()
            local z = card:getLocalZOrder()
           
            local cardpos = {}
            cardpos[i] = cardpos[i] or {}
            cardpos[i][j] = cc.p(x,y)
         
            
            self.orginPos[i] = self.orginPos[i] or {}
            self.orginPos[i][j] = cardpos[i][j]
            

            cardMap[i][j] = card 

            self.cardMap[i] = self.cardMap[i] or {}
            self.cardMap[i][j] = cardMap[i][j]
           
            local n = itr.next()
            self.n = n
            if i<=3 then
                card:setEnabled(false)
            else
                table.insert(self.jztTable,n)
            end

            --对金字塔每个子容器进行牌赋值
            

            table.insert(exitTable,n)
            --金字塔中剩下的牌
           
            


            ---每一张牌对应的n
            local cardNum = {}
            cardNum[i] = cardNum[i] or {}
            cardNum[i][j] = n
         
            
            self.jztCardNum[i] = self.jztCardNum[i] or {}
            self.jztCardNum[i][j] = cardNum[i][j]

            



            --金字塔各个牌点击监听
            card:addTouchEventListener(function(sender, eventType)
                if eventType == ccui.TouchEventType.ended then
                    
                    --获取金字塔牌值
                    local cardValue = self.cardData[n]
                    print("你点下的牌值是",cardValue)
                    AudioEngine.playEffect("game/WitchPoker/sound/Button.mp3",false)
                    self.flash:setPosition(x,y)
                    if card:getPositionX() ~= x then
                        self.flash:setVisible(false)
                    else
                        self.flash:setVisible(true)
                    end

                    if self.record.num then
                        if self.record.num - cardValue == 1 or self.record.num - cardValue == -1 or self.record.num - cardValue == -12 or self.record.num - cardValue == 12 then
                            self.cardMap[i][j] = nil
                            cardMap[i][j] = nil
                            local delayFlash = cc.CallFunc:create(function ()
                                self.flash:setVisible(false)
                            end)
                            local fadein = cc.CallFunc:create(function ()
                                AudioEngine.playEffect("game/WitchPoker/sound/star3.mp3",false)
                                self.star:setPosition(x,y)
                                self.star:setVisible(true)
                                self.star:runAction(cc.FadeIn:create(0.1))
                            end)
                            
                            local star = cc.CallFunc:create(function ()
                                
                                self.star:runAction(cc.MoveTo:create(0.5,cc.p(230,675)))
                            end)
                            local hide = cc.CallFunc:create(function ()
                                self.star:runAction(cc.FadeOut:create(0.1))
                                self.ScoreAdd = self.ScoreAdd + 50
                                self.score:setString(tostring(self.ScoreAdd))
                               
                            end)
                            local delay = cc.DelayTime:create(0.5)
                            local delay2 = cc.DelayTime:create(0.2)
                            local move = cc.MoveTo:create(0.15,cc.p(495,88))
                            card:runAction(cc.Sequence:create(delay2,delayFlash,move,fadein,delay2,star,delay,hide))    
                            
                            card:setLocalZOrder(24 - self.cardindex)
                           
                           
                            print("金字塔牌的层级 ===",24 - self.cardindex)
                            local lastData =  self.record.num
                            self.record.num = cardValue
                            table.insert(self.commonValue,self.record.num)
                            print("当前的公共值是",self.record.num)
                            for k, v in pairs(self.jztTable) do
                                if v == n then
                                    table.remove(self.jztTable,k)
                                end
                            end
                            for k, v in pairs(self.jztTable) do
                                print("消除之后jzt存在的牌",k,v)
                            end
                            
                            

                            --判断其左边和右边是否存在
                            if ((not cardMap[i][j-1]) or  (not cardMap[i][j + 1])) then
                                if not cardMap[i][j-1] then
                                    --左边那个没有了
                                    if i == 4 then
                                        if cardMap[i-1][j-1] then
                                            cardMap[i-1][j-1]:setEnabled(true)
                                            table.insert(self.jztTable,self.jztCardNum[i-1][j-1])
                                            local face =  cardMap[i-1][j-1]:getChildByTag(1)
                                            local back =  cardMap[i-1][j-1]:getChildByTag(2)
                                            face:setVisible(true)
                                            back:setVisible(false)
                                        end
                                    elseif i == 3 then
                                        if j == 1 or j == 2 or j == 3  then
                                            if cardMap[i-1][j-1] then
                                                cardMap[i-1][j-1]:setEnabled(true)
                                                table.insert(self.jztTable,self.jztCardNum[i-1][j-1])
                                                local face =  cardMap[i-1][j-1]:getChildByTag(1)
                                                local back =  cardMap[i-1][j-1]:getChildByTag(2)
                                                face:setVisible(true)
                                                back:setVisible(false)
                                            end
                                            --4 ,7 没有意义
                                        elseif j == 5 or j == 6 then
                                            if cardMap[i-1][j-2] then
                                                cardMap[i-1][j-2]:setEnabled(true)
                                                table.insert(self.jztTable,self.jztCardNum[i-1][j-2])
                                                local face =  cardMap[i-1][j-2]:getChildByTag(1)
                                                local back =  cardMap[i-1][j-2]:getChildByTag(2)
                                                face:setVisible(true)
                                                back:setVisible(false)
                                            end
                                        elseif j == 8 or j == 9 then
                                            if cardMap[i-1][j-3] then
                                                cardMap[i-1][j-3]:setEnabled(true)
                                                table.insert(self.jztTable,self.jztCardNum[i-1][j-3])
                                                local face =  cardMap[i-1][j-3]:getChildByTag(1)
                                                local back =  cardMap[i-1][j-3]:getChildByTag(2)
                                                face:setVisible(true)
                                                back:setVisible(false)
                                            end
                                        end
                                    elseif i == 2 then
                                        if j  == 2  then
                                            if cardMap[i-1][j-1] then
                                                cardMap[i-1][j-1]:setEnabled(true)
                                                table.insert(self.jztTable,self.jztCardNum[i-1][j-1])
                                                local face =  cardMap[i-1][j-1]:getChildByTag(1)
                                                local back =  cardMap[i-1][j-1]:getChildByTag(2)
                                                face:setVisible(true)
                                                back:setVisible(false)
                                            end
                                        elseif j == 4 then
                                            if cardMap[i-1][j-2] then
                                                cardMap[i-1][j-2]:setEnabled(true)
                                                table.insert(self.jztTable,self.jztCardNum[i-1][j-2])
                                                local face =  cardMap[i-1][j-2]:getChildByTag(1)
                                                local back =  cardMap[i-1][j-2]:getChildByTag(2)
                                                face:setVisible(true)
                                                back:setVisible(false)
                                            end
                                        elseif j == 6 then
                                            if cardMap[i-1][j-3] then
                                                cardMap[i-1][j-3]:setEnabled(true)
                                                table.insert(self.jztTable,self.jztCardNum[i-1][j-3])
                                                local face =  cardMap[i-1][j-3]:getChildByTag(1)
                                                local back =  cardMap[i-1][j-3]:getChildByTag(2)
                                                face:setVisible(true)
                                                back:setVisible(false)
                                            end
                                        end
                                    end
                                end 

                                if not cardMap[i][j+1] then
                                    --右边那个没有了
                                    if i == 4 then
                                        if cardMap[i-1][j] then
                                            cardMap[i-1][j]:setEnabled(true)
                                            table.insert(self.jztTable,self.jztCardNum[i-1][j])
                                            local face =  cardMap[i-1][j]:getChildByTag(1)
                                            local back =  cardMap[i-1][j]:getChildByTag(2)
                                            face:setVisible(true)
                                            back:setVisible(false)
                                        end
                                    elseif i == 3 then
                                        if j == 1 or j ==2 then
                                            if cardMap[i-1][j] then
                                                cardMap[i-1][j]:setEnabled(true)
                                                table.insert(self.jztTable,self.jztCardNum[i-1][j])
                                                local face =  cardMap[i-1][j]:getChildByTag(1)
                                                local back =  cardMap[i-1][j]:getChildByTag(2)
                                                face:setVisible(true)
                                                back:setVisible(false)
                                            end
                                        elseif j == 4 or j == 5 then
                                            if cardMap[i-1][j-1] then
                                                cardMap[i-1][j-1]:setEnabled(true)
                                                table.insert(self.jztTable,self.jztCardNum[i-1][j-1])
                                                local face =  cardMap[i-1][j-1]:getChildByTag(1)
                                                local back =  cardMap[i-1][j-1]:getChildByTag(2)
                                                face:setVisible(true)
                                                back:setVisible(false)
                                            end
                                        elseif j == 7 or j == 8 then
                                            if cardMap[i-1][j-2] then
                                                cardMap[i-1][j-2]:setEnabled(true)
                                                table.insert(self.jztTable,self.jztCardNum[i-1][j-2])
                                                local face =  cardMap[i-1][j-2]:getChildByTag(1)
                                                local back =  cardMap[i-1][j-2]:getChildByTag(2)
                                                face:setVisible(true)
                                                back:setVisible(false)
                                            end
                                        end
                                    elseif i == 2 then
                                        if j == 1  then
                                            if cardMap[i-1][j] then
                                                cardMap[i-1][j]:setEnabled(true)
                                                table.insert(self.jztTable,self.jztCardNum[i-1][j])
                                                local face =  cardMap[i-1][j]:getChildByTag(1)
                                                local back =  cardMap[i-1][j]:getChildByTag(2)
                                                face:setVisible(true)
                                                back:setVisible(false)
                                            end
                                        elseif j == 3 then
                                            if cardMap[i-1][j-1] then
                                                cardMap[i-1][j-1]:setEnabled(true)
                                                table.insert(self.jztTable,self.jztCardNum[i-1][j-1])
                                                local face =  cardMap[i-1][j-1]:getChildByTag(1)
                                                local back =  cardMap[i-1][j-1]:getChildByTag(2)
                                                face:setVisible(true)
                                                back:setVisible(false)
                                            end
                                        elseif j == 5 then
                                            if cardMap[i-1][j-2] then
                                                cardMap[i-1][j-2]:setEnabled(true)
                                                table.insert(self.jztTable,self.jztCardNum[i-1][j-2])
                                                local face =  cardMap[i-1][j-2]:getChildByTag(1)
                                                local back =  cardMap[i-1][j-2]:getChildByTag(2)
                                                face:setVisible(true)
                                                back:setVisible(false)
                                            end
                                        end
                                    end
                                end
                                for k,v in pairs(self.jztTable) do
                                    print("翻牌之后的jzt",k,v)
                                end  
                            end

                            --如果他的牌显示出来就将其索引值加进去
                           
                            --将牌值和位置进行记录，以便于撤回
                            local  tableJ = {}
                            tableJ.i = i
                            tableJ.j = j
                            tableJ.pos = cc.p(x,y)
                            tableJ.tag = "j"
                            tableJ.Value = n 
                            tableJ.lastData  = lastData
                            table.insert(self.check,tableJ)
                            --判断是否消完
                            
                            if (i==1  and j==1) or (i==1 and j == 2) or (i == 1 and j == 3) then
                                self.winAdd = self.winAdd + 1
                                if self.winAdd == 3 then
                                    --显示下一关界面
                                    self:isWin(true)
                                end
                            end
                        end
                    end
                 end
            end)

           

            

            --除去场上存在的牌
                for k, v in pairs(otherTable) do
                    if n==v then
                        table.remove(otherTable,k)
                       -- print("otherTable的长度===",table.nums(otherTable))
                    end
                end

            ---正面金字塔牌     
            local spStr = string.format("game/WitchPoker/image/poker/Images_Cards_Card_2_%d.png",n);
            local faceCard =  cc.Sprite:create(spStr);
            faceCard:setScaleY(1.4)
            faceCard:setScaleX(1.21)
            faceCard:setAnchorPoint(0.5,0.5)
            local size = faceCard:getContentSize()
            local x,y = faceCard:getPosition()
            faceCard:setPosition(x+size.width/2+8,y+size.height/2+10)
            if i<=3 then
                faceCard:setVisible(false)
            end
            card:addChild(faceCard,1,1);
            
            

            local spStr = string.format("game/WitchPoker/image/poker/Images_Cards_Card_2_%d.png",56);
            local backCard =  cc.Sprite:create(spStr);
            backCard:setAnchorPoint(0.5,0.5)
            local size = backCard:getContentSize()
            local x,y = backCard:getPosition()
            backCard:setPosition(x+size.width/2,y+size.height/2)
            if i<=3 then
                backCard:setVisible(true)
            else
                backCard:setVisible(false)
            end
            card:addChild(backCard,1,2);

            
            




        end
    end

    for k, v in pairs(self.jztTable) do
            print("jzt上存在的牌",k,v)
    end

    self:backCard(otherTable);
end

--创建下面背面的牌堆的牌
function gameScene:backCard(data)
    

    --打乱牌堆
    local shuffle = Shuffle.new()
    shuffle:initNumByRange(1,24)
    local itr = shuffle:start()
    
    local otherTable = {}
    for i = 1, 24 do
        local item = itr.next()
        table.insert(otherTable,data[item])
    end
    self.saveTable = otherTable
    
    for k, v in pairs(otherTable) do
        print(k,v)
    end
    for i = 1, 24 do
        --创建一个容器
        
        local itemPanel = ccui.Layout:create();
        itemPanel:setAnchorPoint(cc.p(0.5,0.5))
        --print("牌堆中一共有%d,分别是%d",#otherTable,otherTable[i]);

        --创建背面
        local backCard =  cc.Sprite:create(string.format("game/WitchPoker/image/poker/Images_Cards_Card_2_%d.png",56));
        backCard:setAnchorPoint(cc.p(0.5,0.5))
        local size = backCard:getContentSize()
        itemPanel:setContentSize(size);
        itemPanel:setTouchEnabled(true);
        if  not self.backPanel then
            self.backPanel = self.mView["backPanel"]
        end
        self.backPanel:addChild(itemPanel,i,i)
        local x,y = itemPanel:getPosition()
        itemPanel:setPosition(x+size.width/2+2*i+20,y+size.height/2+20)
        local x,y = itemPanel:getPosition()
        --print("paijsfnsl === ",x,y)
        -- itemPanel:setBackGroundColorType(ccui.LayoutBackGroundColorType.solid) --设置颜色
        -- itemPanel:setBackGroundColor(cc.c3b(51, 51, 51))
        itemPanel:addChild(backCard,i,i+31);
        local x,y = backCard:getPosition()
        backCard:setPosition(x+size.width/2,y+size.height/2)

        --为了控制牌点击
        -- local label = ccui.Text:create()
        -- label:setFontSize(18)
        
        -- label:setString(tostring(otherTable[i]))
      
        -- itemPanel:addChild(label,1)
        -- label:setPosition(20,110)
       -- label:setVisible(false)
        



        --创建正面（点击牌翻转效果）
        
        local spStr = string.format("game/WitchPoker/image/poker/Images_Cards_Card_2_%d.png",otherTable[i]);
        local faceCard =  cc.Sprite:create(spStr);
        itemPanel:addChild(faceCard,i,i)

        faceCard:setVisible(false);
        
        local x1,y1 = backCard:getPosition()
        faceCard:setPosition(x1,y1)
        faceCard:setScaleY(1.4)
        faceCard:setScaleX(1.21)
        --通过获取每个itemPanel的位置来判断在牌堆上点击还是在出来之后的点击


        itemPanel:addTouchEventListener(function(sender, eventType)
            if eventType == ccui.TouchEventType.ended then
                --Music.playEffect("uiclick");
                print("牌堆点击");
                self:backClick(otherTable)
            end
        end)
    end
end

function gameScene:backClick(otherTable)
    AudioEngine.playEffect("game/WitchPoker/sound/fanpai.mp3",false)
    print("self.cardindex == ",self.cardindex)
    self.record.num = self.cardData[otherTable[self.cardindex]]
    table.insert(self.commonValue,self.record.num)
    
    print("当前的公共值是",self.record.num)
    local aniTime = 0.5
    if self.cardindex ~= 0 then
       
        local cardPanel = self.backPanel:getChildByTag(self.cardindex)
        
        local x = cardPanel:getPositionX()
        cardPanel:setEnabled(false)
        local faceCard = cardPanel:getChildByTag(self.cardindex)
        local backCard = cardPanel:getChildByTag(self.cardindex+31)
        
        --移动到固定坐标点
        --翻转
        local rotate1 =  cc.CallFunc:create(function(sender)
            backCard:setVisible(true)
            faceCard:setVisible(false)
            backCard:runAction(cc.OrbitCamera:create(aniTime/2, 1, 0, 0,90, 0, 0))
        end)

        -- local rotate3 =  cc.CallFunc:create(function(sender)
        --     backCard:setVisible(false)
        --     faceCard:setVisible(true)
        --     faceCard:runAction(cc.OrbitCamera:create(aniTime/2,1, 0, -90,90, 0, 0))
        -- end)

        local rotate2 = cc.CallFunc:create(function(sender)
            backCard:setVisible(false)
            faceCard:setVisible(true)
            
           
            
            cardPanel:runAction(cc.MoveTo:create(0.5,cc.p(495,84.5)));
            --cardPanel:setLocalZOrder(24-self.cardindex)
            
            --将牌值和位置及执行动画进行记录，以便于撤回
            local  tableA = {}
            tableA.pos = cc.p(495,84.5)
            tableA.pos1 = cc.p(x,84.5)
            tableA.Value = self.cardindex
            tableA.type = "left"
            tableA.tag = "a"
            table.insert(self.check,tableA)
        end)

        local zorder1 = cc.CallFunc:create(function (sender)
            cardPanel:setLocalZOrder(24-self.cardindex)
            print("牌堆牌的层级 ===",24 - self.cardindex)
           
        end)

        local zorder = cc.CallFunc:create(function (sender)
            self.backPanel:setLocalZOrder(24-self.cardindex)
            print("牌堆牌的层级 ===",24 - self.cardindex)
           
        end)
        local delay1 = cc.DelayTime:create(0.2)
        
        cardPanel:runAction(cc.Sequence:create(rotate1,delay1,rotate2,delay1,zorder1))    
        --cardPanel:runAction(cc.Sequence:create(rotate1,delay1,rotate3,delay1,rotate2))   
    end
    self.cardindex = self.cardindex -1
    if self.cardindex == 0 then
        self.IsOpenCheck = true
    end

end
function gameScene:checkWin()
    --显示重新开始按钮
    -- for i = 1, 4 do
    --     local num = 0;
    --     if i == 4 then
    --         num = 10 
    --     else
    --         num = 3*i
    --     end
    --     for j = 1, num do
    --             local card = self.mView[string.format( "Panel%d_%d",i,j)]
    --             if card:isEnabled() then
    --                table.insert(self.jztTable,self.jztCardNum[i][j]) 
    --             end
    --     end
    -- end

    for k,v in pairs(self.jztTable) do
        local cardValue = self.cardData[v]
        print("场上存在的牌值",cardValue)
       
        if  (self.record.num - cardValue == 1 or self.record.num - cardValue == -1 or self.record.num - cardValue == -12 or self.record.num - cardValue == 12) then
            print("继续消")
            return
        else
            if k == #self.jztTable then
                --显示输界面
                self:isWin(false)
                self.over = true
                return
            end
            
        end
    end
end


return gameScene
