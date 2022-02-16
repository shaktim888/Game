local gameScene = class("gameScene", cc.load("mvc").ModuleBase)
gameScene.RESOURCE_FILENAME = "game/DiamondMemory/GameScene.lua"
print("你进入了游戏场景")

local winLayer = require("logic.game.DiamondMemory.winLayer")
local viewJump = require("logic.common.views.viewJump")
local Shuffle = cc.load("tools").Shuffle
gameScene.behavior ={
    "logic.common.behavior.BtnBinder",
    "logic.common.behavior.TouchInterrupt",
    "logic.common.behavior.Listener"
}


local function addButtonElasticEffect(node,callback,scaleX,scaleY)
    if not scaleX then 
        scaleX = 1;
        scaleY = 1;
    end
    if not scaleY then
        scaleY = scaleX;
    end
    node:setEnabled(false);
    node:setScaleX(1*scaleX);
    node:setScaleY(1*scaleY);
    transition.execute(node, cc.ScaleTo:create(0.15, 0.8*scaleX,0.8*scaleY), {
        onComplete = function()
            transition.execute(node, cc.ScaleTo:create(0.15, 1*scaleX,1*scaleY), {
                onComplete = function()
                    node:setEnabled(true);
                    if callback then callback();end
                end
            });
        end
    });
end

cc.exports.addButtonElasticEffect = addButtonElasticEffect;
--创建界面
function gameScene:onCreate()



    --------界面类-------------
    self.backPanel = self.mView["backPanel"]
    self.levelText = self.mView["levelText"]
    self.levelText:setString("1")
    ---------数据类-------------
    --血量计数
    self.bloodNUM = 4
    --关卡计数
    self.levelNUM = 1
    --点击正确的次数
    self.ClickNUM = 0
    --提高牌的数量 
    self.cardNUM = 3
    
    self:init(3)    
    -------------------------------------全局事件监听-------------------------------------------
     ---重新开始 
    global.event.on("AgainStart",function ()
        --血量恢复
        for i = 1, 3 do
            local blood  = self.mView[string.format("blood%d",i)]
            blood:setVisible(true)
        end
        ---------------------从第一关开始--------------
        --血量计数
        self.bloodNUM = 4
        --关卡计数
        self.levelNUM = 1
        --点击正确的次数
        self.ClickNUM = 0
        --提高牌的数量 
        self.cardNUM = 3
        self.levelText:setString("1")
        self.backPanel:removeAllChildren(true)
        self:init(3)    

    end,self)

    --返回登录场景
    global.event.on("LoginScene",function ()
        viewJump.gotoMainGame()
    end,self)
 

end

function gameScene:oncloseBtnClick()
    global.viewJump.gotoMainGame()
end
--结算
function gameScene:isWin(level)
    print("进入结算")
    AudioEngine.playEffect("game/DiamondMemory/sound/win.wav",false)
    --显示弹窗
    
    local winUI = winLayer:create()
    self:addChild(winUI,100)
    local x,y = winUI:getPosition()
    winUI:setPosition(x,y+500)
    local move = cc.MoveTo:create(0.2, cc.p(x,y))
    winUI:runAction(move)
    --关卡
    winUI:addData(level)
   
end

--创建方块层
function gameScene:init(num)
    ---从上飞下动画执行
    local x,y = self.backPanel:getPosition()
    self.backPanel:setPosition(x,y+500)
    self.backPanel:runAction(cc.MoveTo:create(0.5, cc.p(x,y)))
    --随机显示
    local randomShow = {}

    --洗牌器
    local shuffle = Shuffle.new()
    shuffle:initNumByRange(1, num*num)
    local itr = shuffle:start()
    math.randomseed(os.time())

    for i = 1,self.cardNUM do
        --一到九随机产生3个正面可以显示 
        print("显示多少张",self.cardNUM)       
        local n = itr.next()
        table.insert(randomShow,n)
    end
    local index = 0
    
    for i = 1, num do
        for j = 1, num do

            --可点击容器
            local card = ccui.Layout:create();
            --card:setEnabled(false)
            index = index+1
            card:setAnchorPoint(cc.p(0.5,0.5))
            
            --为了获取每个金字塔的尺寸
            local backCard =  cc.Sprite:create(string.format("game/DiamondMemory/ui/%d_1.png",num));
            local size = backCard:getContentSize()
            card:setContentSize(size);
            --card:setTouchEnabled(true);
            self.backPanel:addChild(card,1,index)
            local size = self.backPanel:getContentSize()
            --分为3个难度，放置的位置不同
            if self.levelNUM < 6 and self.levelNUM > -1 then
                card:setPosition(size.width/2+180*(j-1)-160,size.height-180*(i-1)-220)
            elseif self.levelNUM < 21 and self.levelNUM > 5 then
                card:setPosition(size.width/2+140*(j-1)-190,size.height-140*(i-1)-190)
            elseif self.levelNUM < 31 and self.levelNUM > 19 then
                card:setPosition(size.width/2+110*(j-1)-200,size.height-110*(i-1)-180)
            end
            


            ---正面    
           
            local spStr = string.format("game/DiamondMemory/ui/%d_2.png",num);
            
            local faceCard =  cc.Sprite:create(spStr);
            faceCard:setAnchorPoint(0.5,0.5)
            local size = faceCard:getContentSize()
            local x,y = faceCard:getPosition()
            faceCard:setPosition(x+size.width/2,y+size.height/2)
            card:addChild(faceCard,1,1);
            faceCard:setVisible(false)

            --背面
            
            local spStr = string.format("game/DiamondMemory/ui/%d_1.png",num);
            local backCard =  cc.Sprite:create(spStr);
            backCard:setAnchorPoint(0.5,0.5)
            local size = backCard:getContentSize()
            local x,y = backCard:getPosition()
            backCard:setPosition(x+size.width/2,y+size.height/2)
            card:addChild(backCard,1,2);
            backCard:setVisible(true)

            ---对号
            local spStr = string.format("game/DiamondMemory/ui/%d_3.png",num);
            local trueIcon =  cc.Sprite:create(spStr);
            trueIcon:setAnchorPoint(0.5,0.5)
            local size = trueIcon:getContentSize()
            local x,y = trueIcon:getPosition()
            card:addChild(trueIcon,1,3);
            trueIcon:setPosition(x+size.width/2,y+size.height/2)
            trueIcon:setVisible(false)

            ---错误提示
            local spStr = string.format("game/DiamondMemory/ui/%d_4.png",num);
            local falseIcon =  cc.Sprite:create(spStr);
            falseIcon:setAnchorPoint(0.5,0.5)
            local size = falseIcon:getContentSize()
            local x,y = falseIcon:getPosition()
            card:addChild(falseIcon,1,4);
            falseIcon:setPosition(x+size.width/2,y+size.height/2)
            falseIcon:setVisible(false)
           
           
           
            for k,v in pairs(randomShow) do
                ---延迟1s之后，显示正面缩小->放大,之后背面缩小放大-》回到原来的界面
                if v == index then
                    print("v===",v)
                    local faceshow = cc.CallFunc:create(function()
                        local show = cc.CallFunc:create(function()
                            faceCard:setVisible(true)
                            backCard:setVisible(false)
                        end)
                        local scale1 = cc.CallFunc:create(function()
                            faceCard:setScale(0.95)
                        end)
                        local scale2 = cc.CallFunc:create(function()
                            faceCard:setScale(1)
                        end)
                        local delay_0 = cc.DelayTime:create(0.2)
                        self:runAction(cc.Sequence:create(show,delay_0,scale1,delay_0,scale2))
                    end)

                    local backshow = cc.CallFunc:create(function()

                        local show = cc.CallFunc:create(function()
                            faceCard:setVisible(false)
                            backCard:setVisible(true)
                        end)
                        local scale1 = cc.CallFunc:create(function()
                            backCard:setScale(0.95)
                        end)
                        local scale2 = cc.CallFunc:create(function()
                            backCard:setScale(1)
                        end)
                        local delay_1 = cc.DelayTime:create(0.2)
                        self:runAction(cc.Sequence:create(show,delay_1,scale1,delay_1,scale2))
                    end)
                    local delay1 = cc.DelayTime:create(0.6)
                    local complete = cc.CallFunc:create(function()
                        if k == table.nums(randomShow) then
                            ----执行完动画才让点
                            for m=1,num*num do
                                local cardPanel = self.backPanel:getChildByTag(m)
                                cardPanel:setTouchEnabled(true);
                            end
                        end
                    end)
                    local delay2 = cc.DelayTime:create(1)
                    self:runAction(cc.Sequence:create(delay2,faceshow,delay1,backshow,delay2,complete))
                end
            end
           

             --各个牌点击监听
             card:addTouchEventListener(function(sender, eventType)
                if eventType == ccui.TouchEventType.ended then
                    addButtonElasticEffect(card,function()
                        for k,v in pairs(randomShow) do
                            --获取card的tag值
                            local tag = card:getTag()
                            if v == tag then
                                print("点击正确")
                                AudioEngine.playEffect("game/DiamondMemory/sound/clicktrue.mp3",false)
                                self:createStar(card:getPosition())
                                self.ClickNUM = self.ClickNUM + 1
                                
                                local show = cc.CallFunc:create(function()
                                    --显示对号
                                    trueIcon:setVisible(true)
                                    backCard:setVisible(false)
                                    card:setEnabled(false)
                                end)
                                local next = cc.CallFunc:create(function()
                                    if self.ClickNUM == self.cardNUM then
                                        ---如果点击完所有正确的，进入下一关
                                        local touchEnd = cc.CallFunc:create(function()
                                            for m=1,num*num do
                                                local cardPanel = self.backPanel:getChildByTag(m)
                                                cardPanel:setTouchEnabled(false);
                                            end
                                        end)
                                        local enterNext = cc.CallFunc:create(handler(self,self.nextLevel))
                                        local delay5 = cc.DelayTime:create(0.8)
                                        self:runAction(cc.Sequence:create(touchEnd,delay5,enterNext))
                                    end 
                                end)
                                local delay = cc.DelayTime:create(0.1)
                                self:runAction(cc.Sequence:create(show,delay,next))
                                return
                            else 
                                if k == table.nums(randomShow) then
                                    print("点击错误")
                                    AudioEngine.playEffect("game/DiamondMemory/sound/clickfalse.mp3",false)
                                    ---出现错误背景，然后牌打乱，掉入谷底
                                    local show = cc.CallFunc:create(function()
                                        local show1 = cc.CallFunc:create(function()
                                            falseIcon:setVisible(true)
                                             ----执行完动画才让点
                                            for m=1,num*num do
                                                local cardPanel = self.backPanel:getChildByTag(m)
                                                cardPanel:setTouchEnabled(false);
                                            end
                                        end)

                                        local hide2 = cc.CallFunc:create(function()
                                            falseIcon:setVisible(false)
                                        end)
                                        local delay = cc.DelayTime:create(0.3)
                                        self:runAction(cc.Sequence:create(show1,delay,hide2))
                                        
                                    end)

                                    local disrupt = cc.CallFunc:create(function()
                                        for t=1,num*num do
                                            if t<num*num/2 then
                                                local cardPanel = self.backPanel:getChildByTag(t)
                                                local x,y = cardPanel:getPosition()
                                               
                                                local move1 = cc.MoveBy:create(0.1, cc.p(300,0))
                                                local move2 =  cc.MoveBy:create(0.1, cc.p(0,20))
                                                local move3 = cc.MoveBy:create(0.1, cc.p(0,-800))
                                                local delay = cc.DelayTime:create(0.1)
                                                cardPanel:runAction(cc.Sequence:create(move1,move2,move3))
                                            else
                                                local cardPanel = self.backPanel:getChildByTag(t)
                                                local x,y = cardPanel:getPosition()
                                                local move1 = cc.MoveBy:create(0.2, cc.p(-300,0))
                                                local move2 = cc.MoveBy:create(0.2, cc.p(0,20))
                                                local move3 = cc.MoveBy:create(0.1, cc.p(0,-800))
                                                local delay = cc.DelayTime:create(0.1)
                                                cardPanel:runAction(cc.Sequence:create(move1,move2,move3))
                                            end
                                        end
                                    end)

                                    local blood = cc.CallFunc:create(function()
                                       --掉血（血掉完会自己结算）,进入下一关
                                        self:blood()
                                    end)
                                    local delay = cc.DelayTime:create(1)
                                    self:runAction(cc.Sequence:create(show,delay,disrupt,delay,blood))
                                end
                            end
                        end
                    end)
                    

                end
            end)
            
        end
    end    
end



function gameScene:createStar(pos)
    -- local rand = math.random(3,5)
    -- for i = 1, rand do
    --     local star = cc.Sprite:create("game/DiamondMemory/ui/star.png")
    --     star:setPosition(pos)
    --     local move = cc.MoveBy:create(0.2, cc.p(math.random(1,10),math.random(1,10)))
    --     local 
    --     star:runAction()
    -- end

end
---掉血函数（执行一次掉一点血）
function gameScene:blood()
    print("掉血")
    self.bloodNUM = self.bloodNUM - 1
    print("当前血量",self.bloodNUM)
    if self.bloodNUM == 1 then
        --显示结算(先掉血，再显示结算)
        local lostblood  = cc.CallFunc:create(function()
            local blood  = self.mView[string.format("blood%d",self.bloodNUM)]
            blood:setVisible(false)
        end)
        local win = cc.CallFunc:create(function()
            self:isWin(self.levelNUM)
        end)
        local delay = cc.DelayTime:create(0.5)
        self:runAction(cc.Sequence:create(lostblood,delay,win))
    else
        local blood  = self.mView[string.format("blood%d",self.bloodNUM)]
        if blood then
            blood:setVisible(false)
            self:nextLevel()
        end
        
    end
    
end
function gameScene:nextLevel()
    print("进入下一关")
    ---点击重新清零
    self.ClickNUM = 0
    AudioEngine.playEffect("game/DiamondMemory/sound/currentWin.wav",false)
    self.levelNUM = self.levelNUM + 1
    self.levelText:setString(tostring(self.levelNUM))
    self.backPanel:removeAllChildren(true)
    print("self.levelNum",self.levelNUM)
   
    if self.levelNUM < 6 and self.levelNUM > -1 then
        if self.levelNUM < 3 then
            self.cardNUM = 3
        else
            self.cardNUM = 4
        end
        self:init(3) 
    elseif self.levelNUM < 21 and self.levelNUM > 5 then
        if self.levelNUM < 11 then
            self.cardNUM = 5
        elseif  self.levelNUM > 10 and self.levelNUM < 16 then
            self.cardNUM = 6
        elseif  self.levelNUM > 15 and self.levelNUM < 21 then
            self.cardNUM = 7
        end
        self:init(4)
    elseif self.levelNUM < 31 and self.levelNUM > 19 then
        if self.levelNUM < 26 then
            self.cardNUM = 8
        elseif  self.levelNUM > 25 and self.levelNUM < 28 then
            self.cardNUM = 9
        elseif  self.levelNUM > 27 and self.levelNUM < 31 then  
            self.cardNUM = 10  
        end
        self:init(5)
    end

end




return gameScene
