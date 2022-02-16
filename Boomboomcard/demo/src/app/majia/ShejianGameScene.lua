local ShejianGameScene = class("ShejianGameScene", function()
    return cc.Layer:create()
end)
--debug为true时为明牌，为false时暗牌，暗牌为游戏正常玩法
local debug = false; 
local musicSwitch = true;
local level = 1;
local scheduler

--三个人的牌
local personCards = {};
--自己的牌
local selfCards = {};
--小猪的牌
local pigCards = {};
--小狗的牌
local dogCards = {};

local StartPanel = nil;
local GamePanel = nil;
local ScorePanel = nil;
local HelpPanel = nil;
local ExitPanel = nil;

--GamePanel
local node_effect
local sp_pig
local sp_dog
local node_pig_cards
local node_dog_cards
local node_self_cards
local img_luckHand
local btn_shuffle
local btn_start_bg
local txt_level

local txt_congratulations

function ShejianGameScene:create()
    local layer = ShejianGameScene.new()
    layer:init()
    return layer
end

function ShejianGameScene:ctor()
    math.randomseed(os.time())
end

local eventExecuter = require("packages.eventExecuter.EventExecuter"):create()

function ShejianGameScene:registerPnl(panel)
    if not eventExecuter:hasEvents() then
        return 
    end
    local param = {
        name = panel:getName(),
        timename = "enterTransitionFinish",
        target = panel
    }
    local func = panel.setVisible
    panel.setVisible = function (node_self, flag)
        if flag then
            if panel:getName()  == "GamePanel" then
                level = math.random(1,5)
                self:grabsGamePanel()
                local isVis = false
                local rang = math.random(1,100)
                if math.fmod(rang,2) == 0 then
                    isVis = true
                end
                img_luckHand:setVisible(isVis)
            end
        end
        param.timename = flag and "enterTransitionFinish" or "exit"
        eventExecuter:timeEvent(param)
        func(node_self, flag)
    end
end

function ShejianGameScene:grabsGamePanel()
    self:startGame()
end

function ShejianGameScene:onExit()
	if self._update then
		scheduler = cc.Director:getInstance():getScheduler()
		scheduler:unscheduleScriptEntry(self._update)
		self._update = nil
	end
	cc.SimpleAudioEngine:getInstance():stopMusic()
end

function ShejianGameScene:init()
    self.loadNode = cc.CSLoader:createNode("majia/ShejianGameLayer.csb")
    self.loadNode:setContentSize(cc.size(display.size.height, display.size.width))
    ccui.Helper:doLayout(self.loadNode)
    self:addChild(self.loadNode, 0)
    musicSwitch = cc.UserDefault:getInstance():getBoolForKey("musicSwitch",true);
    self:playMusic("majia/sound/bg.mp3");
    local offsetX = (display.width-1136)/2
    self.loadNode:setPositionX(offsetX)
	StartPanel = self.loadNode:getChildByName("StartPanel")
	GamePanel = self.loadNode:getChildByName("GamePanel")
	HelpPanel = self.loadNode:getChildByName("HelpPanel")
	ScorePanel = self.loadNode:getChildByName("ScorePanel")
    ExitPanel = self.loadNode:getChildByName("ExitPanel")

    self:registerPnl(StartPanel)
    self:registerPnl(GamePanel)
    self:registerPnl(ScorePanel)
    self:registerPnl(HelpPanel)
    self:registerPnl(ExitPanel)
 
	StartPanel:setVisible(true)
	GamePanel:setVisible(false)
	HelpPanel:setVisible(false)
	ScorePanel:setVisible(false)
    ExitPanel:setVisible(false)

    self:initStartPanel()
    self:initGamePanel()
    self:initExitPanel()
    self:initScorePanel()
    self:initMouseListen();
 
end

function ShejianGameScene:initStartPanel()
    local role = StartPanel:getChildByName("role");
    role:ignoreContentAdaptWithSize(true)
    local btn_sound = StartPanel:getChildByName("btn_sound");
    if musicSwitch then
        btn_sound:loadTexture("majia/img/A/music.png");
    else
        btn_sound:loadTexture("majia/img/A/musicoff.png");
    end
    btn_sound:onClick(function ()
        musicSwitch = not musicSwitch;
        cc.UserDefault:getInstance():setBoolForKey("musicSwitch",musicSwitch);
        if musicSwitch then
            btn_sound:loadTexture("majia/img/A/music.png");
            self:playMusic("majia/sound/bg.mp3");
        else
            STOP_MUSIC();
            btn_sound:loadTexture("majia/img/A/musicoff.png");
        end
        
    end);
    local btn_help = StartPanel:getChildByName("btn_help")
    if btn_help then
		btn_help:onClick(function( ... )
			HelpPanel:setVisible(true);
		end)
    end

    btn_help:ignoreContentAdaptWithSize(true)
    btn_sound:ignoreContentAdaptWithSize(true)
    local helpCloseBtn = HelpPanel:getChildByName("btn_close")  
	if helpCloseBtn then
		helpCloseBtn:onClick(function( ... )
			HelpPanel:setVisible(false);
		end)
    end
    
    local btn_play = StartPanel:getChildByName("btn_play")
    --开始游戏监听
	if btn_play then
		btn_play:onClick(function( ... )
            StartPanel:setVisible(false);
            GamePanel:setVisible(true);
            self:startGame();
		end)
	end
end

function ShejianGameScene:initGamePanel()
    node_effect = GamePanel:getChildByName("node_effect");
    sp_pig = GamePanel:getChildByName("sp_pig");
    sp_dog = GamePanel:getChildByName("sp_dog");
    node_pig_cards = GamePanel:getChildByName("node_pig_cards");
    node_dog_cards = GamePanel:getChildByName("node_dog_cards");
    node_self_cards = GamePanel:getChildByName("node_self_cards");
    img_luckHand = GamePanel:getChildByName("img_luckHand");
    img_luckHand:loadTexture("majia/img/select1.png");
    img_luckHand:setTouchEnabled(true);
    btn_shuffle = GamePanel:getChildByName("btn_shuffle");
    btn_shuffle:onClick(function (...)
        if personCards and personCards[1] and #personCards[1] ~= 0 then
            for i = 1,#personCards[1] do
                r = math.random(1,#personCards[1]);
                personCards[1][i],personCards[1][r] = personCards[1][r],personCards[1][i];
            end
            self:refreshSelfCards(personCards[1]);
        end
    end);

    btn_start_bg = GamePanel:getChildByName("bg");
    local returnButton = GamePanel:getChildByName("btn_return");
    if returnButton then
		returnButton:onClick(function( ... )
            ExitPanel:setVisible(true);
		end)
	end

    img_luckHand:onClick(function ()
        print("click luckHand!");
        img_luckHand:runAction(cc.Sequence:create(cc.DelayTime:create(1),cc.FadeOut:create(0.5)));
        if self.selectHandlers then 
		    cc.Director:getInstance():getScheduler():unscheduleScriptEntry(self.selectHandlers)
		    self.selectHandlers = nil;
	    end
        self.turnNO = img_luckHand:getTag();
        --测试
        utils:delayInvoke("start",1.5,function ()
            self:processDraw();
        end);
    end);
end

function ShejianGameScene:initExitPanel()
    local btn_exit = ExitPanel:getChildByName("btn_exit");
    local btn_cancel = ExitPanel:getChildByName("btn_cancel");
    btn_exit:onClick(function (...)
        self:clearData();
        ExitPanel:setVisible(false);
        GamePanel:setVisible(false);
        StartPanel:setVisible(true);

    end);
    btn_cancel:onClick(function (...)
        ExitPanel:setVisible(false);
    end)
end

function ShejianGameScene:initScorePanel()
    txt_congratulations = ScorePanel:getChildByName("txt_congratulations");
    local btn_reset = ScorePanel:getChildByName("btn_reset");
    if btn_reset then
		btn_reset:onClick(function( ... )
		    ScorePanel:setVisible(false);
            self:clearData();
            self:startGame();
		end)
	end
    local btn_leave = ScorePanel:getChildByName("btn_leave");
    if btn_leave then
		btn_leave:onClick(function( ... )
		    ScorePanel:setVisible(false)
            GamePanel:setVisible(false);
            StartPanel:setVisible(true);
            self:clearData();
		end)
	end
end

function ShejianGameScene:initMouseListen()
    local clickIndex = -1;
    local function onTouch(eventType, x, y)
        if eventType == "began" then
            self.mouseX = x;
            self.mouseY = y;
            return true;
        elseif eventType == "moved" then
            self.mouseX = x;
            self.mouseY = y;
        elseif eventType == "ended" then
            if self.selectIndex ~= nil then
                btn_shuffle:setTouchEnabled(false);
                self:getACardFromDog(self.selectIndex);
                self:scaleDogCards(0.5);
                if self:isGameOver(3,personCards[3]) then
                    ScorePanel:setVisible(true);
                else
                    if not self:checkDestroy(1) then
                        self:turnNext();
                    else
                        self:playSound("majia/sound/match.mp3");
                    end
                end
                self.mouseX = nil;
                self.mouseY = nil;
                self.selectIndex = nil;
                if self.checkHandlers then 
		            cc.Director:getInstance():getScheduler():unscheduleScriptEntry(self.checkHandlers)
		            self.checkHandlers = nil;
	            end
            end           
        end
    end
    self:setTouchEnabled(true)
    self:registerScriptTouchHandler(onTouch)
end

--开始游戏
function ShejianGameScene:startGame()
    self:shuffleCards(self:getNumberByLevel(level));
    self:showSelfCards();
    self:showPigCards();
    self:showDogCards();
    self:showLuckyHand();
end

function ShejianGameScene:getNumberByLevel(level)
    local number = 
    {
        [1] = 5;
        [2] = 5;
        [3] = 7;
        [4] = 7;
        [5] = 9;
    };
    return number[level];
end

 --洗牌,得到三家的牌,number为每个人的牌数
function ShejianGameScene:shuffleCards(number)
    local cards = {1,2,3,4,5,6,7,8,9,10,11,12,13};
    for i=1 ,#cards do
        local r = math.random(1,#cards);
        cards[i],cards[r] = cards[r],cards[i];
    end
    local pairsNumber = (number * 3 - 1)/2;
    personCards = {};
    personCards[1] = {};
    personCards[2] = {};
    personCards[3] = {};

    local t = {};
    t[1] = 0
    for i = 1, pairsNumber do
        t[2 + 2*(i-1)] = cards[i];
        t[2 + 2*(i-1) + 1] = cards[i];
    end
    dump(t,"三个人的最开始的牌");
    local tpersonCards = {};
    tpersonCards[1] = {};
    tpersonCards[2] = {};
    tpersonCards[3] = {};

    local x = 1;
    while x < number * 3 do
        tpersonCards[1][#tpersonCards[1] + 1] = t[x];
        x = x + 1;
        tpersonCards[2][#tpersonCards[2] + 1] = t[x];
        x = x + 1;
        tpersonCards[3][#tpersonCards[3] + 1] = t[x];
        x = x + 1;
    end
    local r = math.random(0,2);
    if r == 0 then
        personCards[1] = tpersonCards[1];
        personCards[2] = tpersonCards[2];
        personCards[3] = tpersonCards[3];
    elseif r == 1 then
        personCards[1] = tpersonCards[2];
        personCards[2] = tpersonCards[3];
        personCards[3] = tpersonCards[1];
    elseif r == 2 then
        personCards[1] = tpersonCards[3];
        personCards[2] = tpersonCards[1];
        personCards[3] = tpersonCards[2];
    end

    for i = 1,number do
        local r = math.random(1,number);
        personCards[1][r],personCards[1][i] = personCards[1][i],personCards[1][r];
    end
    dump(personCards[1],"自己的牌");
    for i = 1,number do
        local r = math.random(1,number);
        personCards[2][r],personCards[2][i] = personCards[2][i],personCards[2][r];
    end
    dump(personCards[2],"小猪的牌");
    for i = 1,number do
        local r = math.random(1,number);
        personCards[3][r],personCards[3][i] = personCards[3][i],personCards[3][r];
    end
    dump(personCards[3],"小狗的牌");
   
end

--获得自己/小猪/小狗的牌,自己为1，小猪为2，小狗为3
function ShejianGameScene:getCards(index)
    local cards = {};
    for i = 1,3 do
        cards[i] = {};
        for j = 1, self:getNumberByLevel(level) do
            cards[i][j] = personCards[i][j];
        end
    end
    return cards[index];
end

 --根据牌的张数获得初始旋转角度
function ShejianGameScene:getRotationByCardsNumber(number)
    return -math.floor(number/2) * 20 - 45;
end

--获得一张牌的纹理
function ShejianGameScene:getTexture(value)
    return "majia/img/card/card_"..value..".png";
end

--创建一张牌
function ShejianGameScene:createCard(value)
    local card = ccui.ImageView:create(self:getTexture(value));
    card:setTag(value);
    return card;    
end

--显示自己的牌
function ShejianGameScene:showSelfCards()
    local cards = self:getCards(1);
    self:refreshSelfCards(cards);
end

--刷新自己的牌
function ShejianGameScene:refreshSelfCards(cards)
    selfCards = {};
    node_self_cards:removeAllChildren();
    for i= 1,#cards do
        selfCards[#selfCards + 1] = self:createCard(cards[i]);
        selfCards[#selfCards]:setPosition(cc.p(80 + (i-1)*80,100));
        selfCards[#selfCards]:setZOrder(100 - i);
        node_self_cards:addChild(selfCards[#selfCards]);
    end
end

--显示小猪的牌
function ShejianGameScene:showPigCards()
    local cards = self:getCards(2);
    self:refreshPigCards(cards);
end

--刷新小猪的牌
function ShejianGameScene:refreshPigCards(cards)
    pigCards = {};
    node_pig_cards:removeAllChildren();
    local degree = self:getRotationByCardsNumber(#cards);
    for i= 1,#cards do
        pigCards[#pigCards + 1] = self:createCard(cards[i]);
        pigCards[#pigCards]:setPosition(cc.p(270,220));
        pigCards[#pigCards]:setScale(0.5);
        pigCards[#pigCards]:setAnchorPoint(cc.p(0,0));
        pigCards[#pigCards]:setRotation(degree + (i-1) * 20);
        node_pig_cards:addChild(pigCards[#pigCards]);
        if not debug then
            pigCards[#pigCards]:loadTexture("majia/img/card/card_100.png");
        end
    end
end

--显示小狗的牌
function ShejianGameScene:showDogCards()
    local cards = self:getCards(3);
    self:refreshDogCards(cards);
end

--刷新小狗的牌
function ShejianGameScene:refreshDogCards(cards)
    dogCards = {};
    node_dog_cards:removeAllChildren();
    local degree = self:getRotationByCardsNumber(#cards);
    for i= 1,#cards do
        dogCards[#dogCards + 1] = self:createCard(cards[i]);
        local selectMask = ccui.ImageView:create("majia/img/card/card_200.png");
        selectMask:setPosition(cc.p(dogCards[#dogCards]:getContentSize().width/2,dogCards[#dogCards]:getContentSize().height/2));
        selectMask:setName("selectMask");
        selectMask:setVisible(false);
        dogCards[#dogCards]:addChild(selectMask);
        dogCards[#dogCards]:setPosition(cc.p(945,220));
        dogCards[#dogCards]:setScale(0.5);
        dogCards[#dogCards]:setAnchorPoint(cc.p(0,0));
        dogCards[#dogCards]:setRotation(degree + (i-1) * 20);
        node_dog_cards:addChild(dogCards[#dogCards]);
        if not debug then
            dogCards[#dogCards]:loadTexture("majia/img/card/card_100.png");
        end
    end
end

--轮到下一个
function ShejianGameScene:turnNext()
    self.turnNO = self.turnNO + 1;
    if self.turnNO == 4 then
         self.turnNO = 1;
    end
    self:processDraw();
end

--检测消除
function ShejianGameScene:checkDestroy(index)
    local index1,index2 = self:getDestroyIndex(index);
    
    if index1 == nil or index2 == nil then
        return false;
    end
    local cards = personCards[index];
    if index == 1 then --自己
        local i = 0;
        local function getRgb()
            local r = math.random(0,255)
            local g = math.random(0,255)
            local b = math.random(0,255)
            return cc.c3b(r,g,b)
        end
        local cl = getRgb()
        node_self_cards:runAction(cc.RepeatForever:create(cc.Sequence:create(cc.CallFunc:create(function ()
            selfCards[index2]:runAction(cc.TintBy:create(0.1,cl.r,cl.g,cl.b));
            selfCards[index1]:runAction(cc.TintBy:create(0.1,cl.r,cl.g,cl.b));
        end),cc.DelayTime:create(0.11),cc.CallFunc:create(function ()
            selfCards[index2]:runAction(cc.TintBy:create(0.1,cl.r,cl.g,cl.b));
            selfCards[index1]:runAction(cc.TintBy:create(0.1,cl.r,cl.g,cl.b));
        end),cc.DelayTime:create(0.11),cc.CallFunc:create(function ()
            i = i + 1;
            if i == 5 then
                node_self_cards:stopAllActions();
            end
        end))));
        utils:delayInvoke("removeself",1.5,function ()
            selfCards[index2]:stopAllActions();
            selfCards[index1]:stopAllActions();
            self:removeACard(1,index2);
            self:removeACard(1,index1);
            self:refreshSelfCards(cards);
            self:processGameOver(1,cards);
        end);

    elseif index == 2 then -- 小猪
        self:removeACard(2,index2);
        self:removeACard(2,index1);
        self:refreshPigCards(cards);
        utils:delayInvoke("turn",1,function()
            self:processGameOver(2,cards);
        end);
    elseif index == 3 then --小狗
        self:removeACard(3,index2);
        self:removeACard(3,index1);
        self:refreshDogCards(cards);
        utils:delayInvoke("turn",1,function()
            self:processGameOver(3,cards);
        end);
    end
    return true;
end

--处理游戏结束
function ShejianGameScene:processGameOver(tag,cards)
    local flag = self:isGameOver(tag,cards);
    if flag then
        ScorePanel:setVisible(true);
    else
        self:turnNext();
    end
end

--检测游戏是否结束
function ShejianGameScene:isGameOver(tag,cards)
    if #cards ~= 0 then
        return false;
    else
        if tag == 1 then
            txt_congratulations:setString("Congratulations !");
            level = level + 1;
            if level > 5 then
                level = 5;
            end
            self:playSound("majia/sound/pass.mp3");
            return 1;
        else
            txt_congratulations:setString("You failed !");
            self:playSound("majia/sound/fail.mp3");
            return 0;
        end
    end
end

--清理游戏数据
function ShejianGameScene:clearData()
    personCards[1] = {};
    personCards[2] = {};
    personCards[3] = {};
    node_self_cards:removeAllChildren();
    node_pig_cards:removeAllChildren();
    node_dog_cards:removeAllChildren();
    selfCards = {};
    pigCards = {};
    dogCards = {};
    btn_shuffle:setTouchEnabled(true);
    btn_shuffle:loadTextures("majia/img/btn_shuffle.png","","");
end

--获得消除的的两张牌的索引
function ShejianGameScene:getDestroyIndex(index)
    local cards = personCards[index];
    local valuelist = {};
    for i=1,#cards do
        if valuelist[cards[i]] == nil then
            valuelist[cards[i]] = {};
            valuelist[cards[i]][#valuelist[cards[i]] + 1] = i;
        else
            valuelist[cards[i]][#valuelist[cards[i]] + 1] = i;
            if #valuelist[cards[i]] == 2 then
                print("牌值为"..cards[i].."的两个索引分别为"..valuelist[cards[i]][1].."和"..valuelist[cards[i]][2]);
                return valuelist[cards[i]][1],valuelist[cards[i]][2];
            end
        end
    end
    return nil;
end

--从小狗哪里获得一张牌
function ShejianGameScene:getACardFromDog(index)
    self:addACard(1,dogCards[index]:getTag());
    local tag = dogCards[index]:getTag();
    self:removeACard(3,index);
    self:refreshSelfCards(personCards[1]);
    self:refreshDogCards(personCards[3]);
end

--删除一张牌
function ShejianGameScene:removeACard(tag,index)
    local cards = personCards[tag];
    local removeIndex = index;
    table.remove(cards,index);
end

--增加一张牌
function ShejianGameScene:addACard(tag,value)
    local cards = personCards[tag];
    cards[#cards + 1] = value;
end

--获得点击了第几张牌
function ShejianGameScene:getClickCardIndex(x,y)
    local tx = x - (display.width - 1136)/2;
    if 13 <= tx and  tx <= 187 then
        for i = 5,1,-1 do
            if cc.rectContainsPoint(cards[i]:getBoundingBox(),cc.p(tx,y)) then
                print("i = "..i);
                return i;
            end
        end
    end
    return -1;
end

--获得鼠标弹起时在中间哪张牌上
function ShejianGameScene:getClickUpCardIndex(x,y)
    local tx = x - (display.width - 1136)/2;
    for i = 1,9 do
        if cc.rectContainsPoint(imgpos[i]:getBoundingBox(),cc.p(tx,y)) and imgpos[i]:getTag() == 0 then
            print("i = "..i);
            return i;
        end
    end
    return -1;
end

--处理抽牌
function ShejianGameScene:processDraw()
    if self:isGameOver(1,personCards[1]) then
        return;
    end
    if self:isGameOver(2,personCards[2]) then
        return;
    end
    if self:isGameOver(3,personCards[3]) then
        return;
    end
    if self.turnNO == 1 then --轮到自己抽牌
        self:scaleDogCards(1); --放大小狗的牌
        self:processSelfDraw();
    elseif self.turnNO == 2 then  --轮到小猪抽牌
        btn_shuffle:setTouchEnabled(false);
        btn_shuffle:loadTextures("majia/img/btn_shuffle1.png","","");
        self:processPigDraw();
    elseif self.turnNO == 3 then --轮到小狗抽牌
        self:processDogDraw();
    end
end

--处理放大小狗的牌
function ShejianGameScene:scaleDogCards(scale)
    for i = 1, #dogCards do
        dogCards[i]:setScale(scale);
    end
end

--处理自己抽牌
function ShejianGameScene:processSelfDraw()
    self:openCheck();
end

--处理小猪抽牌
function ShejianGameScene:processPigDraw()
    local drawStep = {};

    drawStep[1] = math.random(1,#personCards[1]);
    drawStep[2] = math.random(1,#personCards[1]);
    drawStep[3] = math.random(1,#personCards[1]);
    local tag = selfCards[drawStep[3]]:getTag();
    utils:delayInvoke("pigdraw",1,function ()
        local tpigPaw = ccui.ImageView:create("majia/img/pigpaw.png");
        node_self_cards:addChild(tpigPaw,200);
    
        tpigPaw:runAction(cc.Sequence:create(cc.CallFunc:create(function ()
            tpigPaw:setPosition(cc.p(selfCards[drawStep[1]]:getPositionX()+20,selfCards[drawStep[1]]:getPositionY() + selfCards[drawStep[1]]:getContentSize().height/2));
            self:setCardColor(drawStep[1]);
        end),cc.DelayTime:create(0.5),cc.CallFunc:create(function ()
            tpigPaw:setPosition(cc.p(selfCards[drawStep[2]]:getPositionX()+20,selfCards[drawStep[2]]:getPositionY() + selfCards[drawStep[2]]:getContentSize().height/2));
            self:setCardColor(drawStep[2]);
        end),cc.DelayTime:create(0.5),cc.CallFunc:create(function ()
            tpigPaw:setPosition(cc.p(selfCards[drawStep[3]]:getPositionX()+20,selfCards[drawStep[3]]:getPositionY() + selfCards[drawStep[3]]:getContentSize().height/2));
            self:setCardColor(drawStep[3]);
        end),cc.DelayTime:create(0.5),cc.CallFunc:create(function ()
            self:addACard(2,selfCards[drawStep[3]]:getTag());
            self:removeACard(1,drawStep[3]);
            self:refreshSelfCards(personCards[1]);
            if self:isGameOver(1,personCards[1]) then
                ScorePanel:setVisible(true);
                return;
            end
            local img = ccui.ImageView:create("majia/img/pigget.png");
            --img:setPosition(cc.p(selfCards[1]:getPositionX() + (drawStep[3] - 1) * 80,selfCards[1]:getPositionY()+55));
            img:setPosition(cc.p(20+ (drawStep[3] - 1) * 80,100+55));
            node_self_cards:addChild(img,20);
            img:runAction(cc.Sequence:create(cc.MoveTo:create(0.2,cc.p(270,350)),cc.CallFunc:create(function ()
                img:removeFromParent();
                self:refreshPigCards(personCards[2]);

                if self:checkDestroy(2) then
                    local img_throw = ccui.ImageView:create("majia/img/pigthrow.png");
                    img_throw:setPosition(cc.p(270,350));
                    node_self_cards:addChild(img_throw,20);
                    img_throw:runAction(cc.Sequence:create(cc.EaseIn:create(cc.MoveBy:create(0.5,cc.p(200,-200)),20),cc.RemoveSelf:create()));
                    
                else
                    if tag == 0 then
                        self:playSound("majia/sound/ghost.mp3");
                    else
                        self:playSound("majia/sound/nomatch.mp3");
                    end
                    
                end
                utils:delayInvoke("turn",1.5,function()
                    self:processGameOver(2,personCards[2]);
                    btn_shuffle:setTouchEnabled(true);
                    btn_shuffle:loadTextures("majia/img/btn_shuffle.png","","");
                end);
            end)));
        end)));
    end);
end

--处理颜色
function ShejianGameScene:setCardColor(index)
    local function getRgb()
        local r = math.random(0,255)
        local g = math.random(0,255)
        local b = math.random(0,255)
        return cc.c3b(r,g,b)
    end
    for i = 1,#selfCards do
        if  i == index then
            selfCards[i]:setColor(getRgb());
        else
            selfCards[i]:setColor(cc.c3b(255,255,255));
        end
    end

end

--处理小狗抽牌
function ShejianGameScene:processDogDraw()
    local r = math.random(1,#pigCards);
    local value = pigCards[r]:getTag();
    self:removeACard(2,r);
    self:refreshPigCards(personCards[2]);
     if self:isGameOver(2,personCards[2]) then
         ScorePanel:setVisible(true);
         return;
     end
    local img = ccui.ImageView:create("majia/img/dogdraw.png");
    node_dog_cards:addChild(img,20);
    img:setPosition(cc.p(300,350));
    img:runAction(cc.Sequence:create(cc.MoveTo:create(0.5,cc.p(900,350)),cc.CallFunc:create(function ()
        img:removeFromParent();
        self:addACard(3,value);
        self:refreshDogCards(personCards[3]);
        if self:checkDestroy(3) then
            local img_dogthrow = ccui.ImageView:create("majia/img/dogthrow.png");
            img_dogthrow:setPosition(cc.p(900,350));
            node_dog_cards:addChild(img_dogthrow,20);
            img_dogthrow:runAction(cc.Sequence:create(cc.EaseIn:create(cc.MoveBy:create(0.5,cc.p(-200,-200)),20),cc.RemoveSelf:create()));
        else
            if value == 0 then
                self:playSound("majia/sound/ghost.mp3");
               
            else
                self:playSound("majia/sound/nomatch.mp3");
            end
        end
        --这里要对小狗的手牌进行一次洗牌
        for i=1,#personCards[3] do
            local r = math.random(1,#personCards[3]);
            personCards[3][i],personCards[3][r] = personCards[3][r],personCards[3][i];    
        end
        self:refreshDogCards(personCards[3]);

        utils:delayInvoke("turn",1.5,function()
            self:processGameOver(3,personCards[3]);
        end);

    end)));
    utils:delayInvoke("changeDir",0.25,function ()
        img:setScaleX(-1);
    end);
end

--打开鼠标检测
function ShejianGameScene:openCheck()
    if self.checkHandlers then 
		cc.Director:getInstance():getScheduler():unscheduleScriptEntry(self.checkHandlers)
		self.checkHandlers = nil;
	end
    self.checkHandlers = cc.Director:getInstance():getScheduler():scheduleScriptFunc(function()
        if self.mouseX and self.mouseY then
            local x = self.mouseX ;
            local y = self.mouseY;
            self.selectIndex = nil;
            if x == nil or y == nil then
                return;
            end
            for i = #dogCards,1,-1 do
                local pos = dogCards[i]:convertToNodeSpace(cc.p(x,y));
                print("鼠标再第"..i.."张牌中的节点坐标为("..pos.x..","..pos.y..")")
                if  0 <= pos.x and pos.x <= 148   and 0 <= pos.y and pos.y <= 196  then
                    print("in card"..i.."中!");
                    self.selectIndex = i;
                    for j= 1 ,#dogCards do
                        if j == i then
                            dogCards[j]:getChildByName("selectMask"):setVisible(true);
                        else
                            dogCards[j]:getChildByName("selectMask"):setVisible(false);
                        end
                    end
                    break;
                end
            end
        end
	end, 1/10,false);
end

--开始选择谁先抽
function ShejianGameScene:showLuckyHand()
    img_luckHand:setOpacity(255);
    img_luckHand:setVisible(true);
    local i = 0;
    if self.selectHandlers then 
		cc.Director:getInstance():getScheduler():unscheduleScriptEntry(self.selectHandlers)
		self.selectHandlers = nil;
	end
    self.selectHandlers = cc.Director:getInstance():getScheduler():scheduleScriptFunc(function()
        i = i + 1;
        if i >3 then
            i = 1;
        end
        img_luckHand:loadTexture("majia/img/select"..i..".png");
        img_luckHand:setTag(i);
	end, 1/10,false);
end

--播放音效
function ShejianGameScene:playSound(path)
    PLAY_SOUND(path);
end

--播放背景音乐
function ShejianGameScene:playMusic(path)
    if musicSwitch then
        PLAY_MUSIC(path);
    end
end

cc.exports.ShejianGameScene = ShejianGameScene;
return ShejianGameScene
