
local gameScene = class("gameScene", cc.load("mvc").ModuleBase)
gameScene.RESOURCE_FILENAME = "game/FishFor14/GameScene.lua"
print("你进入了游戏场景")
local pauseLayer = require("logic.game.FishFor14.pauseLayer")
local winLayer = require("logic.game.FishFor14.winLayer")
local tipLayer = require("logic.game.FishFor14.tipLayer")
local viewJump = require("logic.common.views.viewJump")
local Shuffle = cc.load("tools").Shuffle
gameScene.behavior ={
    "logic.common.behavior.BtnBinder",
    "logic.common.behavior.TouchInterrupt",
    "logic.common.behavior.Listener"
}
--创建界面
function gameScene:onCreate()

    audio.playMusic("game/FishFor14/sound/bgm.mp3")
    ----------------------界面类------------------------
    --暂停按钮
    self.pauseBtn = self.mView["closeBtn"]
    --牌容器
    self.cardPilePanel = self.mView["cardPilePanel"]

    --光效
    self.flash = self.mView["flash"];
    self.flash:setLocalZOrder(100)
    self.flash:setVisible(false)
    --光效2 
    self.flash2 = self.mView["flash2"];
    self.flash2:setLocalZOrder(100)
    self.flash2:setVisible(false)


    --黑红梅方四个文本(1为方，2为梅花，3红，4为黑桃)
    self.Text1 = self.mView["Text1"]
    self.Text2 = self.mView["Text2"]
    self.Text3 = self.mView["Text3"]
    self.Text4 = self.mView["Text4"]
    --钓鱼按钮
    self.fishBtn = self.mView["fishBtn"]
    --弃牌按钮
    self.abandonBtn = self.mView["abandonBtn"]
    --分数
    self.scoreText = self.mView["scoreText"]
    self.musicBtn = self.mView["musicBtn"]
    self.musicCloseBtn = self.mView["musicCloseBtn"]



    ---------------------数据类 -----------------------
    --牌png-值对应表
    self.cardData = {
        1,2,3,4,5,6,7,8,9,10,11,12,13,1,2,3,4,5,6,7,8,9,10,11,12,13,1,2,3,4,5,6,7,8,9,10,11,12,13,1,2,3,4,5,6,7,8,9,10,11,12,13
    }
    --牌png-花色对照表(1为方，2为梅花，3红，4为黑桃)
    self.colorData = {
        1,1,1,1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2,3,3,3,3,3,3,3,3,3,3,3,3,3,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4
    }
    ---分数花色计算
    self.scoreColor = {
        2,3,4,5
    }
    --补牌起始数
    self.draw = 45
    --牌
    self.card = {}
    --判断其是否点过牌(点过牌才可以弃牌)
    self.isClick = false 
    ---上面牌数值表（已经显示的）
    self.topCardData = {}
    ---下面牌数值表 （已经显示的）
    self.bottomCardData = {}
    ---分数累计值
    self.addScore = 0
    
    --牌堆牌
    self.otherTable = {}
    --是否结束
    self.over = false
    
   
    self:initUI();
    self:scheduler()
    self:isRecord()
      
    -------------------全局事件监听--------------------
    ---重新开始
    global.event.on("AgainStart",function ()

        --补牌起始数
        self.draw = 45
        --牌
        self.card = {}
        --判断其是否点过牌(点过牌才可以弃牌)
        self.isClick = false 
        ---上面牌数值表（已经显示的）
        self.topCardData = {}
        ---下面牌数值表 （已经显示的）
        self.bottomCardData = {}
        ---分数累计值
        self.addScore = 0
        self.scoreText:setString(tostring(self.addScore))
        self.Text1:setString("0")
        self.Text2:setString("0")
        self.Text3:setString("0")
        self.Text4:setString("0")
        --牌堆牌
        self.otherTable = {}
        --是否结束
        self.over = false
        self.cardPilePanel:removeAllChildren(true)
      
        self:initUI();   
        self:scheduler(); 
    end,self)

    --返回登录场景
    global.event.on("LoginScene",function ()
        viewJump.gotoMainGame()
    end,self)
end

--按钮事件绑定
gameScene.btnBind = {
    closeBtn = "pauseBtnClick",
    fishBtn = "fishBtnClick",
    abandonBtn = "abandonBtnClick",
    musicBtn = "musicBtnClick",
    musicCloseBtn = "musicCloseClick"
}

function gameScene:isRecord()
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
    if perEffect == 0 then
        self.musicCloseBtn:setVisible(true)
        self.musicBtn:setVisible(false)
    else
        self.musicCloseBtn:setVisible(false)
        self.musicBtn:setVisible(true)
    end
end

function gameScene:fishBtnClick()
   
if self.record.num and self.flash:isVisible() and self.flash2:isVisible() then
    if self.record.num + self.current.num == 14  then
                            
        AudioEngine.playEffect("game/FishFor14/sound/Button.wav",false)
        print("匹配")

        --消除(动画旋转再缩小再消除)
        
        self.record.node:runAction(cc.RotateBy:create(0.3,360))
        transition.execute(self.record.node, cc.ScaleTo:create(0.3, 0.001), {
            onComplete = function()
                
                self.record.node:removeFromParent()
               
                for k, v in pairs(self.topCardData) do
                    if v == self.record.i then
                        table.remove(self.topCardData, k)
                    end
                end

                for k, v in pairs(self.bottomCardData) do
                    if v == self.record.i then
                        table.remove(self.bottomCardData, k)
                    end
                end
                
                --进行从牌堆补牌
                self.draw  =  self.draw - 1

                local cardPanel = self.cardPilePanel:getChildByTag(self.draw)
                if cardPanel then
                    local move = cc.CallFunc:create(function(sender)
                        cardPanel:runAction(cc.MoveTo:create(0.25,self.record.pos))
                        ---如果其飞到上面，插入表
                        if self.record.pos.y == 475 then
                            table.insert(self.topCardData,self.draw)
                        else
                            table.insert(self.bottomCardData,self.draw)
                        end
    
                    end) 
    
                    local show = cc.CallFunc:create(function(sender)
                        local faceCard = cardPanel:getChildByTag(1)
                        faceCard:setVisible(true)
                        local backCard = cardPanel:getChildByTag(2)
                        backCard:setVisible(false)
                    end)
    
                    print("执行下方发牌动画")
                    local delay = cc.DelayTime:create(1)
                    self:runAction(cc.Sequence:create(move,delay,show))
    
    
                    --花色加1/分数加(黑5，红4，梅3，方2)
                    local colorText = self.mView[string.format("Text%d",self.record.color)]
                    local numStr = colorText:getString()
                    colorText:setString(tostring(tonumber(numStr)+1))
                    self.addScore = self.addScore + self.scoreColor[self.record.color]
                    print("11addScore ===",self.addScore)
                    self.scoreText:setString(tostring(self.addScore))
                else
                     ---说明牌堆没有牌了，并进行判定，上方牌和下方牌加起来不等14，则为输
                    print("牌堆没有牌了")
                end
                
            end
            });    

        self.current.node:runAction(cc.RotateBy:create(0.3,360))
        transition.execute(self.current.node, cc.ScaleTo:create(0.2, 0.001), {
            onComplete = function()
                self.current.node:removeFromParent()

                for k, v in pairs(self.topCardData) do
                    if v == self.current.i  then
                        table.remove(self.topCardData, k)
                    end
                end
                for k, v in pairs(self.bottomCardData) do
                    if v == self.current.i  then
                        table.remove(self.bottomCardData, k)
                    end
                end

                --进行从牌堆补牌
                self.draw = self.draw -1
                local cardPanel = self.cardPilePanel:getChildByTag(self.draw)
                if cardPanel then
                    local move = cc.CallFunc:create(function(sender)
                        cardPanel:runAction(cc.MoveTo:create(0.25,self.current.pos))
                        ---如果其飞到上面，插入表
                        if self.current.pos.y == 475 then
                            table.insert(self.topCardData,self.draw)
                        else
                            table.insert(self.bottomCardData,self.draw)
                        end
                    end) 

                    local show = cc.CallFunc:create(function(sender)
                        local faceCard = cardPanel:getChildByTag(1)
                        faceCard:setVisible(true)
                        local backCard = cardPanel:getChildByTag(2)
                        backCard:setVisible(false)
                    end)

                    print("执行下方发牌动画")
                    local delay = cc.DelayTime:create(1)
                    self:runAction(cc.Sequence:create(move,delay,show))


                
                    --花色加1
                    local colorText = self.mView[string.format("Text%d",self.current.color)]
                    local numStr = colorText:getString()
                    colorText:setString(tostring(tonumber(numStr)+1))
                    self.addScore = self.addScore + self.scoreColor[self.current.color]
                    print("11addScore ===",self.addScore)
                    self.scoreText:setString(tostring(self.addScore))
                else
                    ---说明牌堆没有牌了，并进行判定，上方牌和下方牌加起来不等14，则为输
                    
                    print("牌堆没有牌了")
                   
                end
                
            end
        });


        AudioEngine.playEffect("game/FishFor14/sound/kouxue.wav",false)

        self.flash:setVisible(false)
        self.flash2:setVisible(false)
    else
        AudioEngine.playEffect("game/FishFor14/sound/miss.mp3",false)
        print("不匹配")
        self.flash:setVisible(false)
        self.flash2:setVisible(false)
    end
else
    AudioEngine.playEffect("game/FishFor14/sound/miss.mp3",false)
    print("error")
    self.flash:setVisible(false)
    self.flash2:setVisible(false)
end

end
function gameScene:abandonBtnClick()
    print("你点击了放弃")
    AudioEngine.playEffect("game/FishFor14/sound/Button.wav",false)

    local recordIsBottom = function()
         ----说明下面牌是self.record.node
         local curCardClear = cc.CallFunc:create(function()
            self.record.node:runAction(cc.RotateBy:create(0.3,360))
            transition.execute( self.record.node, cc.ScaleTo:create(0.2, 0.001), {
                onComplete = function()
                    self.record.node:removeFromParent()
                    for k, v in pairs(self.bottomCardData) do
                        if v == self.bottomi then
                            table.remove(self.bottomCardData, k)
                        end
                    end
                    
                    --进行从牌堆补牌
                    self.draw = self.draw -1
                    local cardPanel = self.cardPilePanel:getChildByTag(self.draw)
                    if cardPanel then
                        local move = cc.CallFunc:create(function(sender)
                            cardPanel:runAction(cc.MoveTo:create(0.25,cc.p(self.record.pos.x,self.record.pos.y)))
                            table.insert(self.bottomCardData,self.draw)
                            dump(self.bottomCardData)
                        end) 
        
                        local show = cc.CallFunc:create(function(sender)
                            local faceCard = cardPanel:getChildByTag(1)
                            faceCard:setVisible(true)
                            local backCard = cardPanel:getChildByTag(2)
                            backCard:setVisible(false)
                        end)
                        print("执行下方发牌动画")
                        local delay = cc.DelayTime:create(1)
                        self:runAction(cc.Sequence:create(move,delay,show))
                        print(self.bottomCardData)
                        self.isClick = false
                        self.flash:setVisible(false)
                        self.flash2:setVisible(true)
                    else
                        ---说明牌堆没有牌了，并进行判定，上方牌和下方牌加起来不等14，则为输
                        print("没有牌了")
                        AudioEngine.playEffect("game/FishFor14/sound/miss.wav",false)
                    end
                    
                end
            });
        end)

        ---------------------------------消除上面四张随机一张--------------------------------------
        local randTopFourClear = cc.CallFunc:create(function()
            
            local shuffle = Shuffle.new()
            shuffle:initNumByRange(1, 4)
            local itr = shuffle:start()
            math.randomseed(os.time())
            local n = itr.next()
        
            print("上方选中的那张牌",self.topCardData[n],n)
            self.card[self.topCardData[n]]:runAction(cc.RotateBy:create(0.3,360))
            local x1,y1 = self.card[self.topCardData[n]]:getPosition()
            transition.execute(self.card[self.topCardData[n]], cc.ScaleTo:create(0.2, 0.001), {
                onComplete = function()
                    self.card[self.topCardData[n]]:removeFromParent()

                    for k, v in pairs(self.topCardData) do
                        if v == self.topCardData[n] then
                            table.remove(self.topCardData, k)
                            
                        end
                    end
                    
                    --进行从牌堆补牌
                    self.draw = self.draw -1
                    local cardPanel = self.cardPilePanel:getChildByTag(self.draw)
                    if cardPanel then
                        print("self.draw==",self.draw)
                        local move = cc.CallFunc:create(function(sender)
                        cardPanel:runAction(cc.MoveTo:create(0.25,cc.p(x1,y1)))
                            if y1 == 475 then
                                table.insert(self.topCardData,self.draw)
                                dump(self.topCardData)
                            end
                        end) 

                        
                        local show = cc.CallFunc:create(function(sender)
                            local faceCard = cardPanel:getChildByTag(1)
                            faceCard:setVisible(true)
                            local backCard = cardPanel:getChildByTag(2)
                            backCard:setVisible(false)
                        end)
                        print("执行发牌动画")
                        local delay = cc.DelayTime:create(0.5)
                        self:runAction(cc.Sequence:create(move,delay,show))
                        self.isClick = false
                        self.flash2:setVisible(false)
                    else
                        ---说明牌堆没有牌了，并进行判定，上方牌和下方牌加起来不等14，则为输

                      print("没有牌了")
                    end
                    
                end
            });
        end)
        local delay = cc.DelayTime:create(0.5)
        self:runAction(cc.Sequence:create(curCardClear,delay,randTopFourClear))
    end


    ------判断其点过牌----------
    if self.isClick and self.flash2:isVisible() then
        -------消除下方点中的那张牌-----------
        if self.record.pos.y == 195 and  self.current.pos == nil then
            recordIsBottom()
            return
        end
        if  self.current.pos.y and self.record.pos.y then
            if self.current.pos.y > self.record.pos.y then
                recordIsBottom()
            else
                ---self.current.node 是那个下面的
                ----说明下面牌是self.record.node
                local curCardClear = cc.CallFunc:create(function()
                    self.current.node:runAction(cc.RotateBy:create(0.3,360))
                    transition.execute( self.current.node, cc.ScaleTo:create(0.2, 0.001), {
                        onComplete = function()
                            self.current.node:removeFromParent()
                            for k, v in pairs(self.bottomCardData) do 
                                if v == self.i then
                                    table.remove(self.bottomCardData, k)
                                end
                            end
                            print("self.bottomCard",self.bottomCardData)
                            --进行从牌堆补牌
                            self.draw = self.draw -1
                            local cardPanel = self.cardPilePanel:getChildByTag(self.draw)
                            if cardPanel then
                                local move = cc.CallFunc:create(function(sender)
                                    cardPanel:runAction(cc.MoveTo:create(0.25,cc.p(self.current.pos.x,self.current.pos.y)))
                                    table.insert(self.bottomCardData,self.draw)
                                end) 
                
                                local show = cc.CallFunc:create(function(sender)
                                    local faceCard = cardPanel:getChildByTag(1)
                                    faceCard:setVisible(true)
                                    local backCard = cardPanel:getChildByTag(2)
                                    backCard:setVisible(false)
                                end)
                                print("执行下方发牌动画")
                                local delay = cc.DelayTime:create(1)
                                self:runAction(cc.Sequence:create(move,delay,show))
                                print(self.bottomCardData)
                                self.isClick = false
                                self.flash:setVisible(false)
                                self.flash2:setVisible(true)
                            else
                                ---说明牌堆没有牌了，并进行判定，上方牌和下方牌加起来不等14，则为输
                                print("没有牌了")
                                AudioEngine.playEffect("game/FishFor14/sound/miss.wav",false)
                            end
                            
                        end
                    });
                end)
        
                ---------------------------------消除上面四张随机一张--------------------------------------
                local randTopFourClear = cc.CallFunc:create(function()
                    
                    local shuffle = Shuffle.new()
                    shuffle:initNumByRange(1, 4)
                    local itr = shuffle:start()
                    math.randomseed(os.time())
                    local n = itr.next()
                
                    print("上方选中的那张牌",self.topCardData[n],n)
                    self.card[self.topCardData[n]]:runAction(cc.RotateBy:create(0.3,360))
                    local x1,y1 = self.card[self.topCardData[n]]:getPosition()
                    transition.execute(self.card[self.topCardData[n]], cc.ScaleTo:create(0.2, 0.001), {
                        onComplete = function()
                            self.card[self.topCardData[n]]:removeFromParent()
                            for k, v in pairs(self.topCardData) do
                                if v == self.topCardData[n] then
                                    table.remove(self.topCardData, k)
                                end
                            end
                            
                            --进行从牌堆补牌
                            self.draw = self.draw -1
                            local cardPanel = self.cardPilePanel:getChildByTag(self.draw)
                            if cardPanel then
                                print("self.draw==",self.draw)
                                local move = cc.CallFunc:create(function(sender)
                                cardPanel:runAction(cc.MoveTo:create(0.25,cc.p(x1,y1)))
                                    if y1 == 475 then
                                        table.insert(self.topCardData,self.draw)
                                    end
                                end) 
        
                                local show = cc.CallFunc:create(function(sender)
                                    local faceCard = cardPanel:getChildByTag(1)
                                    faceCard:setVisible(true)
                                    local backCard = cardPanel:getChildByTag(2)
                                    backCard:setVisible(false)
                                end)
                                print("执行发牌动画")
                                local delay = cc.DelayTime:create(0.5)
                                self:runAction(cc.Sequence:create(move,delay,show))
                                self.isClick = false
                                self.flash2:setVisible(false)
                            else
                                ---说明牌堆没有牌了，并进行判定，上方牌和下方牌加起来不等14，则为输
        
                              print("没有牌了")
                            end
                            
                        end
                    });
                end)
                local delay = cc.DelayTime:create(0.5)
                self:runAction(cc.Sequence:create(curCardClear,delay,randTopFourClear))
            end
        else
            self:tipWindow()
        end
    else
        self:tipWindow()
    end
end






--暂停按钮事件
function gameScene:pauseBtnClick()
    print("你点击了暂停按钮")
    AudioEngine.playEffect("game/FishFor14/sound/Button.wav",false)
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

--结算界面
function gameScene:isWin()
    print("进入结算")
    --显示弹窗
   
    local winUI = winLayer:create()
    self:addChild(winUI,100)
    local size = winUI:getContentSize()
    local x,y = winUI:getPosition()
    --显示输赢
    
    winUI:setData(tonumber(self.addScore))
    AudioEngine.playEffect("game/FishFor14/sound/win.wav",false)
end

---友情弹窗
function gameScene:tipWindow()
   
    --显示弹窗
    local tipUI = tipLayer:create()
    self:addChild(tipUI,100)
    local size = tipUI:getContentSize()
    local x,y = tipUI:getPosition()

    --显示输赢
    tipUI:setPosition(x,y+500)
    local hide = cc.CallFunc:create(function(sender)
        tipUI:removeFromParent()
    end)
    local delay= cc.DelayTime:create(1)
    local move = cc.MoveTo:create(0.3, cc.p(x,y))
    tipUI:runAction(cc.Sequence:create(move,delay,hide))
    AudioEngine.playEffect("game/FishFor14/sound/win.wav",false)
end

function gameScene:initUI()
    
    --记录1
    self.record = self.record or {}
    --记录2
    self.current = self.current or {}

    --洗牌器
    local shuffle = Shuffle.new()
    shuffle:initNumByRange(1, 52)
    local itr = shuffle:start()
    math.randomseed(os.time())

    for i = 1, 52 do
       
        --用代码创建金字塔
            
            self.card[i] = ccui.Layout:create();
            
            self.card[i]:setAnchorPoint(cc.p(0.5,0.5))
           
            
            --为了获取每个金字塔的尺寸
            local backCard =  cc.Sprite:create(string.format("game/FishFor14/ui2/Images_Cards_Card_2_%d.png",56));
            local size = backCard:getContentSize()
            





            --金字塔每个子容器属性
            self.card[i]:setContentSize(size);
            self.card[i]:setTouchEnabled(true);
            self.cardPilePanel:addChild(self.card[i],i,i)
            local size = self.cardPilePanel:getContentSize()
            self.card[i]:setPosition(size.width/2,size.height-1*(i-1)-220)
            local x1,y1 = self.card[i]:getPosition()
            self.card[i]:setLocalZOrder(i)


            ---背面
            backCard:setAnchorPoint(0.5,0.5)
            local size = backCard:getContentSize()
            local x,y = backCard:getPosition()
            backCard:setPosition(x+size.width/2,y+size.height/2)
            self.card[i]:addChild(backCard,i,2);



           

            ---正面
            local n = itr.next()
            table.insert(self.otherTable,n)
            cc.SpriteFrameCache:getInstance():addSpriteFrames("game/FishFor14/ui.plist");
            local spStr = string.format("game/FishFor14/poker/Images_Cards_Card_1_%d.png",n);
            local faceCard =  cc.Sprite:create(spStr);
            faceCard:setAnchorPoint(0.5,0.5)
            
            
            local x,y = backCard:getPosition()
            ----将牌放大到指定尺寸
            faceCard:setScale(1.23, 1.35)
            faceCard:setPosition(x,y)
            self.card[i]:addChild(faceCard,i,1);
            faceCard:setVisible(false)
            
            
        -----------------------------------------------牌点击---------------------------------------------
        self.card[i]:addTouchEventListener(function(sender, eventType)
                if eventType == ccui.TouchEventType.ended then
                    AudioEngine.playEffect("game/FishFor14/sound/Button.wav",false)
                    --获取牌值
                    self.cardValue = self.cardData[n]
                    --获取花色
                    self.curColor = self.colorData[n]
                    print("你点下的牌值是",self.cardValue)

                    
                    self.i = i
                    self.curx,self.cury = self.card[i]:getPosition()
                    if self.cury == 475 then
                        self.flash:setPosition(self.curx,self.cury)
                        self.flash:setVisible(true)

                    else
                        self.bottomi = i
                        self.flash2:setPosition(self.curx,self.cury)
                        self.flash2:setVisible(true)
                    end
                    print("self.i==================================================",self.i)
                    self.isClick = true
                    


                
                    if self.record.num then
                        ---一侧
                        print("self.record.pos.cury===,cury==,self.crruent.pos.cury===",self.record.pos.y,self.cury)
                        if self.record.pos.y == self.cury  then
                            self.record.num = self.cardValue
                            self.record.color = self.colorData[n]
                            self.record.node = self.card[i]
                            self.record.pos = cc.p(self.curx,self.cury)
                            self.record.i = self.i
                        else
                            ---另一侧的
                            if self.current.num then
                                if self.current.pos.y == self.cury  then
                                    self.current.num = self.cardValue
                                    self.current.color = self.colorData[n]
                                    self.current.node = self.card[i]
                                    self.current.pos = cc.p(self.curx,self.cury)
                                    self.current.i = self.i
                                end
                            else
                                self.current.num = self.cardValue
                                self.current.node = self.card[i]
                                self.current.color = self.colorData[n]
                                self.current.pos = cc.p(self.curx,self.cury)
                                self.current.i = self.i
                            end
                        end
                    else
                        self.record.num = self.cardValue
                        self.record.node = self.card[i]
                        self.record.color = self.colorData[n]
                        self.record.pos = cc.p(self.curx,self.cury)
                        self.record.i = self.i
                    end
                   
                end
                    
            end)
        -----------------------------------------------牌点击---------------------------------------------
        if i == 52 then
            ---发牌
            local delay = cc.DelayTime:create(0.5)
            local dealCard = cc.CallFunc:create(function(sender)
                self:dealCardFun()
            end)
            self:runAction(cc.Sequence:create(delay,dealCard))
        end
    end
end

---发牌
function gameScene:dealCardFun()
    
    --下面的牌
    local bottomCard = cc.CallFunc:create(function(sender)
        for i=1,4 do
            local cardPanel = self.cardPilePanel:getChildByTag(53-i)
            local move = cc.CallFunc:create(function(sender)
                cardPanel:runAction(cc.MoveTo:create(0.25, cc.p(200+187*(i-1),195)))
            end)
            local show = cc.CallFunc:create(function(sender)
                local faceCard = cardPanel:getChildByTag(1)
                faceCard:setVisible(true)
                local backCard = cardPanel:getChildByTag(2)
                backCard:setVisible(false)
            end)
            print("执行下方发牌动画")
            local delay = cc.DelayTime:create(1)
            self:runAction(cc.Sequence:create(move,delay,show))
            table.insert(self.bottomCardData,53-i)
        end
    end)

    local topCard = cc.CallFunc:create(function(sender)
        for i=1,4 do
            local x = 0
            if i == 3 or i == 4 then
                x = 330+180*(i-1)
            else
                x = 130+185*(i-1)
            end
            local cardPanel = self.cardPilePanel:getChildByTag(49-i)
            local move = cc.CallFunc:create(function(sender)
                cardPanel:runAction(cc.MoveTo:create(0.25, cc.p(x,475)))
            end)
            local show = cc.CallFunc:create(function(sender)
                local faceCard = cardPanel:getChildByTag(1)
                faceCard:setVisible(true)
                local backCard = cardPanel:getChildByTag(2)
                backCard:setVisible(false)
            end)
            print("执行上方发牌动画")
            local delay = cc.DelayTime:create(1)
            self:runAction(cc.Sequence:create(move,delay,show))
            table.insert(self.topCardData,49-i)
        end
    end)

    local delay = cc.DelayTime:create(0.5)
    self:runAction(cc.Sequence:create(bottomCard,delay,topCard))
end

function gameScene:overGame()
    for k, topV in pairs(self.bottomCardData) do
        for k1, bottomV in pairs(self.topCardData) do
            print(self.cardData[self.otherTable[topV]],self.cardData[self.otherTable[bottomV]])
            if self.cardData[self.otherTable[topV]] + self.cardData[self.otherTable[bottomV]] == 14 then
                print("继续消")
                return 
            else 
                if k == table.nums(self.bottomCardData) and k1 == table.nums(self.topCardData) then
                    print("失败")
                    self:isWin()
                    self.over = true
                    return
                end
            end
        end
    end
end
function gameScene:scheduler()
    local scheduler = cc.Director:getInstance():getScheduler()
    local function autoTimeUpdate()
        if self.draw <= 1 then
            self:overGame()
            if self.over == true then
                local scheduler = cc.Director:getInstance():getScheduler()
                if self.run_logic then
                    scheduler:unscheduleScriptEntry(self.run_logic)
                end

            end
        end
    end  
    
    self.run_logic = scheduler:scheduleScriptFunc(autoTimeUpdate,0.5,false) 
end

function  gameScene:musicBtnClick()
    AudioEngine.playEffect("game/FishFor14/sound/Button.wav",false)
    self.musicCloseBtn:setVisible(true)
    self.musicBtn:setVisible(false)
     --暂停所有音效的播放
    AudioEngine.setEffectsVolume(0.01)
    global.utils.sound.setMusicVolume(0)   
    global.saveTools.saveData("nwpk_effectPercent", 0)   
    global.saveTools.saveData("nwpk_musicPercent", 0)              
end

function  gameScene:musicCloseClick()
    AudioEngine.playEffect("game/FishFor14/sound/Button.wav",false)
    self.musicCloseBtn:setVisible(false)
    self.musicBtn:setVisible(true)
    AudioEngine.setEffectsVolume(1)
    global.utils.sound.setMusicVolume(1)  
    global.saveTools.saveData("nwpk_musicPercent", 1)   
    global.saveTools.saveData("nwpk_effectPercent", 1)                                  
end

return gameScene
