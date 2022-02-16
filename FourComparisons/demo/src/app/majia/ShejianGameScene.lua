local ShejianGameScene = class("ShejianGameScene", function()
    return cc.Layer:create()
end)

--游戏层
local StartPanel
local SelectPanel
local GamePanel
local ScorePanel
local HelpPanel
local LevelPanel
local DailyBounsPanel
local UpgradePanel

local musicSwitch = true
local soundSwitch = true

--签到奖励金钱
local signGold ={
    [1] = 1000;
    [2] = 1000;
    [3] = 1500;
    [4] = 1500;
    [5] = 2000;
    [6] = 2000;
    [7] = 3000;
}
local signFlag = {}
local sign_value = {}
local btn_sign

--帮助界面
local helpstep
local btn_help_pre
local btn_help_next
local help_cards = {}
local help_pos = {}

--帮助页面卡片的位置
local helpCardsPos ={
    [1] = {x = 100, y = 440};
    [2] = {x = 100, y = 360};
    [3] = {x = 100, y = 280};
    [4] = {x = 100, y = 200};
    [5] = {x = 100, y = 120};
    [6] = {x = 1036, y = 440};
    [7] = {x = 1036, y = 360};
    [8] = {x = 1036, y = 280};
    [9] = {x = 1036, y = 200};
    [10] = {x = 1036, y = 120};
}
--帮助页面每个步骤出战的两张牌
local helpFightCards ={
    [1] = { myCardIndex = 5, enemyCardIndex = 10 ,toPos = 8,tipY = 560, str = "6 > 1 ,You won and changed the enemy's card color!"};
    [2] = { myCardIndex = 4, enemyCardIndex = 9 ,toPos = 2, tipY = 80, str = "5 > 4 ,You won and changed the enemy's card color!"};
    [3] = { myCardIndex = 3, enemyCardIndex = 8 ,toPos = 6, tipY = 80, str = "6 > 1 ,You won and changed the enemy's card color!"};
    [4] = { myCardIndex = 2, enemyCardIndex = 7 ,toPos = 4, tipY = 80, str = "5 > 3 ,You won and changed the enemy's card color!"};
}

--upgrade
local txt_upgrade_gold = {}
local imgs_upgrade_mask = {}
local imgs_upgrade_selectbg = {}
local btns_upgrade = {}
local cardNeedGold ={
    [1] = 10000,
    [2] = 20000,
    [3] = 30000,
    [4] = 40000,
    [5] = 50000,
}
local selectupIndex

local cardConfig ={
 [1] = {up = 1, down = 2, left = 2, right = 3, },
 [2] = {up = 3, down = 3, left = 3, right = 2, },
 [3] = {up = 3, down = 3, left = 3, right = 3, },
 [4] = {up = 3, down = 5, left = 4, right = 3, },
 [5] = {up = 4, down = 4, left = 5, right = 3, },
 [6] = {up = 1, down = 6, left = 5, right = 8, },
 [7] = {up = 10, down = 1, left = 5, right = 4, },
 [8] = {up = 3, down = 4, left = 10, right = 6, },
 [9] = {up = 6, down = 5, left = 10, right = 6, },
 [10] = {up = 10, down = 10, left = 10, right = 10, },
};

--等级界面
local modelType ={}
modelType.EASY = 1
modelType.NORMAL = 2
modelType.DIFFCULT = 3
local btns_level = {}
local max_level
local level

--选择界面
local btn_resCards = {}
local btn_selectCards = {}
local myHeroesIndex = {}
local enemyCardIndexes = {}
local luckyFlag

--游戏界面
local ENEMY = 0
local SELF = 1
local DRAW = 2
local node_img
local imgpos = {}
local cards = {}
local startCardsPos = {}
local game_txt_tip
local btn_game_return
local levelConfig = 
{
    [1] = {[1] = 2,    [2] = 3,    [3] = 1,    [4] = 5,    [5] = 4},
    [2] = {[1] = 1,    [2] = 2,    [3] = 3,    [4] = 4,    [5] = 5},
    [3] = {[1] = 5,    [2] = 4,    [3] = 3,    [4] = 1,    [5] = 2},
    [4] = {[1] = 2,    [2] = 3,    [3] = 1,    [4] = 5,    [5] = 6},
    [5] = {[1] = 6,    [2] = 2,    [3] = 3,    [4] = 4,    [5] = 5},
    [6] = {[1] = 2,    [2] = 3,    [3] = 6,    [4] = 5,    [5] = 6},
    [7] = {[1] = 6,    [2] = 5,    [3] = 1,    [4] = 4,    [5] = 3},
    [8] = {[1] = 4,    [2] = 2,    [3] = 1,    [4] = 3,    [5] = 6},
    [9] = {[1] = 2,    [2] = 3,    [3] = 1,    [4] = 4,    [5] = 6},
    [10] = {[1] = 3,    [2] = 1,    [3] = 2,    [4] = 4,    [5] = 5},
    [11] = {[1] = 4,    [2] = 2,    [3] = 1,    [4] = 6,    [5] = 5},
    [12] = {[1] = 1,    [2] = 2,    [3] = 4,    [4] = 5,    [5] = 6},
    [13] = {[1] = 1,    [2] = 2,    [3] = 3,    [4] = 5,    [5] = 6},
    [14] = {[1] = 1,    [2] = 3,    [3] = 4,    [4] = 5,    [5] = 6},
    [15] = {[1] = 2,    [2] = 3,    [3] = 4,    [4] = 5,    [5] = 6},
    [16] = {[1] = 1,    [2] = 2,    [3] = 8,    [4] = 6,    [5] = 7},
    [17] = {[1] = 1,    [2] =2 ,    [3] = 3,    [4] = 6,    [5] = 7},
    [18] = {[1] = 1,    [2] = 3,    [3] = 5,    [4] = 6,    [5] = 7},
    [19] = {[1] = 1,    [2] = 4,    [3] = 5,    [4] = 6,    [5] = 7},
    [20] = {[1] = 2,    [2] = 4,    [3] = 5,    [4] = 6,    [5] = 7},
    [21] = {[1] = 3,    [2] = 4,    [3] = 5,    [4] = 6,    [5] = 7},
    [22] = {[1] = 1,    [2] = 2,    [3] = 3,    [4] = 7,    [5] = 8},
    [23] = {[1] = 1,    [2] = 3,    [3] = 5,    [4] = 7,    [5] = 8},
    [24] = {[1] = 2,    [2] = 4,    [3] = 6,    [4] = 7,    [5] = 8},
    [25] = {[1] = 1,    [2] = 5,    [3] = 6,    [4] = 7,    [5] = 8},
    [26] = {[1] = 2,    [2] = 5,    [3] = 6,    [4] = 7,    [5] = 8},
    [27] = {[1] = 3,    [2] = 5,    [3] = 6,    [4] = 7,    [5] = 8},
    [28] = {[1] = 4,    [2] = 5,    [3] = 6,    [4] = 7,    [5] = 8},
    [29] = {[1] = 4,    [2] = 5,    [3] = 7,    [4] = 9,    [5] = 10},
    [30] = {[1] = 3,    [2] = 5,    [3] = 6,    [4] = 9,    [5] = 10},
    [31] = {[1] = 1,    [2] = 5,    [3] = 8,    [4] = 9,    [5] = 10},
    [32] = {[1] = 1,    [2] = 3,    [3] = 5,    [4] = 9,    [5] = 10},
    [33] = {[1] = 2,    [2] = 4,    [3] = 6,    [4] = 9,    [5] = 10},
    [34] = {[1] = 1,    [2] = 4,    [3] = 6,    [4] = 8,    [5] = 10},
    [35] = {[1] = 2,    [2] = 3,    [3] = 5,    [4] = 8,    [5] = 10},
    [36] = {[1] = 2,    [2] = 4,    [3] = 6,    [4] = 8,    [5] = 10},
    [37] = {[1] = 1,    [2] = 3,    [3] = 5,    [4] = 8,    [5] = 10},
    [38] = {[1] = 1,    [2] = 2,    [3] = 3,    [4] = 8,    [5] = 10},
    [39] = {[1] = 2,    [2] = 3,    [3] = 4,    [4] = 8,    [5] = 10},
    [40] = {[1] = 3,    [2] = 4,    [3] = 5,    [4] = 8,    [5] = 10},
    [41] = {[1] = 4,    [2] = 5,    [3] = 6,    [4] = 8,    [5] = 10},
    [42] = {[1] = 5,    [2] = 6,    [3] = 7,    [4] = 8,    [5] = 10},
    [43] = {[1] = 1,    [2] = 2,    [3] = 3,    [4] = 9,    [5] = 10},
    [44] = {[1] = 4,    [2] = 5,    [3] = 6,    [4] = 9,    [5] = 10},
    [45] = {[1] = 6,    [2] = 7,    [3] = 8,    [4] = 9,    [5] = 10},
}

--结算界面
local score_gold_txt
local txt_congratulations
local btn_reset
local btn_next
local btn_leave

local local_bit = require "app.utils.local_bit"

function ShejianGameScene:getClassName()
    return "ShejianGameScene"
end

function ShejianGameScene:ctor()
    math.randomseed(os.time())
end

function ShejianGameScene:create()
    local layer = ShejianGameScene.new()
    layer:init()
    return layer
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
            if panel:getName()  == "StartPanel" then
                self:grabsStartPanel()
            elseif panel:getName()  == "SelectPanel" then
                self:grabsSelectPanel()
            elseif panel:getName()  == "GamePanel" then
                self:grabsGamePanel()
            end
        end
        param.timename = flag and "enterTransitionFinish" or "exit"
        eventExecuter:timeEvent(param)
        func(node_self, flag)
    end
end

function ShejianGameScene:grabsStartPanel()
    local goldbg = StartPanel:getChildByName("goldbg")
    local gold_text = goldbg:getChildByName("gold_text")
    gold_text:setString(""..math.random(1000,10000))
end

function ShejianGameScene:grabsSelectPanel()
    self:initSelectPanel()
end

function ShejianGameScene:grabsGamePanel()
    
    for i = 1,5 do
        local cardtag = math.random(1,10)
        myHeroesIndex[i] = cardtag
    end
    local level = math.random(1,45)
    for i = 6,10 do
        myHeroesIndex[i] = levelConfig[level][i-5];
    end
    for i = 1,10 do
        cards[i]:setTag(myHeroesIndex[i])
        print(myHeroesIndex[i])
    end
    for i = 1,10 do
        cards[i]:setPosition(cc.p(startCardsPos[i].x,startCardsPos[i].y));
        if cards[i]:getChildByName("bg") == nil then
            local btn_bluebg = ccui.ImageView:create("majia/img/helpPanel/bluebgbig.png");
            local btn_redbg = ccui.ImageView:create("majia/img/helpPanel/redbgbig.png");
            local bg = nil;
            if i <= 5 then
                bg = btn_bluebg;
            else
                bg = btn_redbg;
            end
            bg:setPosition(cc.p(174/2,210/2));
            bg:setName("bg");
            cards[i]:addChild(bg,-1);
        else
            local bg = cards[i]:getChildByName("bg");
            if i <= 5 then
                bg:loadTexture("majia/img/helpPanel/bluebgbig.png");
            else
                bg:loadTexture("majia/img/helpPanel/redbgbig.png");
            end
        end
        self:refreshCard(i,cards[i]:getTag());
    end
end

function ShejianGameScene:init()
    self.loadNode = cc.CSLoader:createNode("majia/ShejianGameLayer.csb")
    self.loadNode:setContentSize(cc.size(display.size.height, display.size.width))
    ccui.Helper:doLayout(self.loadNode)
    self:addChild(self.loadNode, 0)
    local offsetX = (display.width-1136)/2
    self.loadNode:setPositionX(offsetX)

    StartPanel = self.loadNode:getChildByName("StartPanel")
    SelectPanel = self.loadNode:getChildByName("SelectPanel")
    GamePanel = self.loadNode:getChildByName("GamePanel")
    ScorePanel = self.loadNode:getChildByName("ScorePanel")
    HelpPanel = self.loadNode:getChildByName("HelpPanel")
    LevelPanel = self.loadNode:getChildByName("LevelPanel")
    DailyBounsPanel = self.loadNode:getChildByName("DailyBounsPanel")
    UpgradePanel = self.loadNode:getChildByName("UpgradePanel")

    self:registerPnl(StartPanel)
    self:registerPnl(SelectPanel)
    self:registerPnl(GamePanel)
    self:registerPnl(ScorePanel)
    self:registerPnl(HelpPanel)
    self:registerPnl(LevelPanel)
    self:registerPnl(DailyBounsPanel)
    self:registerPnl(UpgradePanel)

    self:refreshGold()
    self:initStartPanel()
    self:initHelpPanel()
    self:initGamePanel()
    self:initScorePanel()

    StartPanel:setVisible(true)
    SelectPanel:setVisible(false)
    GamePanel:setVisible(false)
    ScorePanel:setVisible(false)
    HelpPanel:setVisible(false)
    LevelPanel:setVisible(false)
    DailyBounsPanel:setVisible(false)
    UpgradePanel:setVisible(false)
    
    max_level = self:getMaxLevel()
    self.model = modelType.EASY
    self:initMouseListen()

end

function ShejianGameScene:initGamePanel()
    node_img = GamePanel:getChildByName("node_img")
    for i = 1,9 do
        imgpos[i] = node_img:getChildByName("img_pos"..i)
    end
    for i = 1,10 do
        cards[i] = node_img:getChildByName("img_"..i)
        startCardsPos[i] = {}
        startCardsPos[i].x = cards[i]:getPositionX()
        startCardsPos[i].y = cards[i]:getPositionY()
        local txt_up =  cards[i]:getChildByName("txt_up")
        local txt_left = cards[i]:getChildByName("txt_left")
        local txt_right = cards[i]:getChildByName("txt_right")
        local txt_down = cards[i]:getChildByName("txt_down")
        local color = {}
        if i < 6 then
            color = {r = 14, g = 131, b = 240}
        else
            color = {r = 225, g = 48, b = 0}
        end
        cards[i]:getChildByName("txt_up"):setTextColor(color)
        cards[i]:getChildByName("txt_left"):setTextColor(color)
        cards[i]:getChildByName("txt_right"):setTextColor(color)
        cards[i]:getChildByName("txt_down"):setTextColor(color)
    end
    btn_game_return = GamePanel:getChildByName("btn_return")
    btn_game_return:onClick(function (...)
        GamePanel:setVisible(false)
        SelectPanel:setVisible(true)
        self:showSelectPanelHeroes()
    end)
    local btn_close = GamePanel:getChildByName("close")   
    if btn_close then
        btn_close:onClick(function(...)
            GamePanel:setVisible(false)
            StartPanel:setVisible(true)
        end)
    end
    game_txt_tip = GamePanel:getChildByName("txt_tip")
end

function ShejianGameScene:initScorePanel()
    score_gold_txt = ScorePanel:getChildByName("gold_txt")
    txt_congratulations = ScorePanel:getChildByName("txt_congratulations")
    local btn_close = ScorePanel:getChildByName("btn_close")
    btn_reset = ScorePanel:getChildByName("btn_reset")
    btn_next = ScorePanel:getChildByName("btn_next")
    btn_leave = ScorePanel:getChildByName("btn_leave")
    if btn_close then
        btn_close:onClick(function(...)
            ScorePanel:setVisible(false)
            GamePanel:setVisible(false);
            if level <= 15 then
                self.model = modelType.EASY;
            elseif level <= 30 then
                self.model = modelType.NORMAL;
            elseif level <= 45 then
                self.model = modelType.DIFFCULT;
            end
            self:initLevelPanel()
            LevelPanel:setVisible(true);
        end)
    end

    if btn_reset then
        btn_reset:onClick(function( ... )
            ScorePanel:setVisible(false);
            GamePanel:setVisible(false);
            SelectPanel:setVisible(true);
            self:showSelectPanelHeroes();
        end)
    end

    if btn_next then
        btn_next:onClick(function( ... )
            ScorePanel:setVisible(false);
            GamePanel:setVisible(false);
            SelectPanel:setVisible(true);
            self:showSelectPanelHeroes();
        end)
    end
    
    if btn_leave then
        btn_leave:onClick(function( ... )
            ScorePanel:setVisible(false)
            GamePanel:setVisible(false);
            StartPanel:setVisible(true);
        end)
    end

    -- local textArray = {}
    -- local text_reset = btn_reset:getChildByName("text_reset")
    -- local text_next = btn_next:getChildByName("text_next")
    -- local text_leave = btn_leave:getChildByName("text_leave")
    -- table.insert(textArray,score_gold_txt)
    -- table.insert(textArray,text_reset)
    -- table.insert(textArray,text_next)
    -- table.insert(textArray,text_leave)
    -- self:fontColorRoodom(textArray)
end

function ShejianGameScene:initStartPanel()
    --人不变
    local role =  StartPanel:getChildByName("role")
    role:ignoreContentAdaptWithSize(true)
    role:setPositionY(-100)
    --音乐开关
    local btn_sound = StartPanel:getChildByName("btn_sound")
    musicSwitch = cc.UserDefault:getInstance():getBoolForKey("musicSwitch",true)
    if musicSwitch then
        btn_sound:loadTexture("majia/img/startPanel/music.png")
        PLAY_MUSIC("majia/sound/bg.mp3")
    else
        btn_sound:loadTexture("majia/img/startPanel/musicoff.png")
    end
    btn_sound:onClick(function ()
        musicSwitch = not musicSwitch
        cc.UserDefault:getInstance():setBoolForKey("musicSwitch",musicSwitch)
        if musicSwitch then
            btn_sound:loadTexture("majia/img/startPanel/music.png")
            PLAY_MUSIC("majia/sound/bg.mp3")
        else
            STOP_MUSIC()
            btn_sound:loadTexture("majia/img/startPanel/musicoff.png")
        end
    end)

    --签到
    local btn_showSign = StartPanel:getChildByName("btn_showSign")
    if btn_showSign then
        btn_showSign:onClick(function(...)
            self:initDailyBounsPanel()
        end)
    end

    --帮助
    local startHelpBtn = StartPanel:getChildByName("btn_help")
    if startHelpBtn then
        startHelpBtn:onClick(function(...)
            HelpPanel:setVisible(true)
            helpstep = 1
            self:showHelpStep()
        end)
    end
    --upgrade
    local btn_upgrade = StartPanel:getChildByName("btn_upgrade")
    btn_upgrade:onClick(function (...)
        UpgradePanel:setVisible(true)
        self:initUpgradePanel()
    end)
    --LevelPanel
    local btn_easy = StartPanel:getChildByName("btn_easy");
    local btn_normal = StartPanel:getChildByName("btn_normal");
    local btn_diffcult = StartPanel:getChildByName("btn_difficult");
    btn_easy:onClick(function (...)
        LevelPanel:setVisible(true)
        StartPanel:setVisible(false)
        self.model = modelType.EASY
        self:initLevelPanel()
    end)
    btn_normal:onClick(function (...)
        LevelPanel:setVisible(true)
        StartPanel:setVisible(false)
        self.model = modelType.NORMAL
        self:initLevelPanel()
    end)
    btn_diffcult:onClick(function (...)
        LevelPanel:setVisible(true)
        StartPanel:setVisible(false)
        self.model = modelType.DIFFCULT
        self:initLevelPanel()
    end)

    --字体颜色随机
    local textArray = {}
    local goldbg = StartPanel:getChildByName("goldbg")
    local gold_text = goldbg:getChildByName("gold_text")
    local daily_text = btn_showSign:getChildByName("Daily_text")
    local help_text = startHelpBtn:getChildByName("help_text")
    local card_text = btn_upgrade:getChildByName("card_text")
    local easy_text = btn_easy:getChildByName("easy_text")
    local normal_text = btn_normal:getChildByName("normal_text")
    local difficult_text = btn_diffcult:getChildByName("difficult_text")
    table.insert(textArray,daily_text)
    table.insert(textArray,help_text)
    table.insert(textArray,card_text)
    table.insert(textArray,easy_text)
    table.insert(textArray,normal_text)
    table.insert(textArray,difficult_text)
    table.insert(textArray,gold_text)
    self:fontColorRoodom(textArray)
end

function ShejianGameScene:initLevelPanel()
    local level_bg = LevelPanel:getChildByName("bg")
    local btn_return = LevelPanel:getChildByName("btn_return")
    if self.model == modelType.EASY then
        -- level_bg:loadTexture("majia/img/LevelPanel/bglevel1.png")
    elseif self.model == modelType.NORMAL then
        -- level_bg:loadTexture("majia/img/LevelPanel/bglevel2.png")
    elseif self.model == modelType.DIFFCULT then
        -- level_bg:loadTexture("majia/img/LevelPanel/bglevel3.png")
    end

    local btn_return = LevelPanel:getChildByName("btn_return");
    btn_return:onClick(function ()
        LevelPanel:setVisible(false);
        StartPanel:setVisible(true);
    end);

    for i = 1,45 do
        btns_level[i] = LevelPanel:getChildByName("btn_level"..i)
        -- btns_level[i]:loadTextureNormal("Default/Button_Normal.png",0)
        btns_level[i]:loadTexturePressed("majia/img/LevelPanel/btn_level.png",0)
        btns_level[i]:setTitleText(tostring(i))
        btns_level[i]:setTitleFontSize(30)
        btns_level[i]:setTitleColor({r = 0, g = 0, b = 0})
        btns_level[i]:setTitleFontName("majia/font555.ttf")
        if math.floor((i-1)/15) + 1 == self.model then
            btns_level[i]:setVisible(true);
        else
            btns_level[i]:setVisible(false);
        end
        btns_level[i]:onClick(function (...)
            LevelPanel:setVisible(false)
            SelectPanel:setVisible(true)
            level = i
            self:initSelectPanel()
        end);
    end

    for i=1,self:getMaxLevel()-1 do
        btns_level[max_level]:loadTextures("majia/img/LevelPanel/btn_leve.png","","")
        btns_level[i]:setOpacity(255);
        btns_level[i]:setTouchEnabled(true);
    end
    btns_level[max_level]:loadTextures("majia/img/LevelPanel/btn_level1.png","","")
    btns_level[max_level]:setOpacity(255);
    btns_level[max_level]:setTouchEnabled(true);
    for i = max_level + 1,45 do
        btns_level[i]:loadTextures("majia/img/LevelPanel/btn_leve.png","","");
        btns_level[i]:setTouchEnabled(false);
        btns_level[i]:setOpacity(128);
    end
end

function ShejianGameScene:initSelectPanel()
    local btn_select_return = SelectPanel:getChildByName("btn_return");
    local btn_select_go = SelectPanel:getChildByName("btn_go");
    btn_select_return:onClick(function (...)
        SelectPanel:setVisible(false);
        LevelPanel:setVisible(true);
        if level <= 15 then
            self.model = modelType.EASY
        elseif level <= 30 then
            self.model = modelType.NORMAL
        elseif level <= 45 then
            self.model = modelType.DIFFCULT
        end
        self:initLevelPanel()
    end)

    btn_select_go:onClick(function (...)
        if not self:isFullHeroes() then
            return
        end
        SelectPanel:setVisible(false)
        GamePanel:setVisible(true)
        self:addDataConfig()
        luckyFlag = 0
        self:startGame()
    end)

    for i = 1,5 do
        btn_resCards[i] = SelectPanel:getChildByName("btn_select"..i)
        btn_resCards[i]:setTag(0)
        btn_resCards[i]:loadTextures("majia/img/selectPanel/casrdbg.png","","")
        btn_resCards[i]:setVisible(false)
        local bluebg = ccui.ImageView:create("majia/img/selectPanel/bluebg.png")
        bluebg:setPosition(cc.p(btn_resCards[i]:getContentSize().width/2,btn_resCards[i]:getContentSize().height/2))
        btn_resCards[i]:addChild(bluebg,-1)
        btn_resCards[i]:onClick(function (...)
            btn_selectCards[btn_resCards[i]:getTag()]:getChildByName("img_mask"):setVisible(false)
            btn_selectCards[btn_resCards[i]:getTag()]:setTouchEnabled(true)
            btn_resCards[i]:setVisible(false)
            btn_resCards[i]:setTag(0)
        end)
     end

     for i = 1,10 do
         btn_selectCards[i] = SelectPanel:getChildByName("btn_"..i)
         local bluebg = ccui.ImageView:create("majia/img/selectPanel/bluebg.png")
         bluebg:setPosition(cc.p(btn_selectCards[i]:getContentSize().width/2,btn_selectCards[i]:getContentSize().height/2))
         btn_selectCards[i]:addChild(bluebg,-1)
         btn_selectCards[i]:onClick(function (...)
             local nextIndex = self:getNextCardIndex()
             if nextIndex == 0 then
                 return
             end
             btn_resCards[nextIndex]:getChildByName("txt_up"):setString(btn_selectCards[i]:getChildByName("txt_up"):getString())
             btn_resCards[nextIndex]:getChildByName("txt_down"):setString(btn_selectCards[i]:getChildByName("txt_down"):getString())
             btn_resCards[nextIndex]:getChildByName("txt_left"):setString(btn_selectCards[i]:getChildByName("txt_left"):getString())
             btn_resCards[nextIndex]:getChildByName("txt_right"):setString(btn_selectCards[i]:getChildByName("txt_right"):getString())
             btn_resCards[nextIndex]:setVisible(true)
             btn_resCards[nextIndex]:setTag(i)
             btn_resCards[nextIndex]:loadTextures("majia/img/hero/"..i..".png","","")
             btn_selectCards[i]:getChildByName("img_mask"):setVisible(true)
             btn_selectCards[i]:setTouchEnabled(false)
             local color = {}
            if i < 6 then
                color = {r = 14, g = 131, b = 240}
            else
                color = {r = 225, g = 48, b = 0}
            end
            btn_resCards[nextIndex]:getChildByName("txt_up"):setTextColor(color)
            btn_resCards[nextIndex]:getChildByName("txt_left"):setTextColor(color)
            btn_resCards[nextIndex]:getChildByName("txt_right"):setTextColor(color)
            btn_resCards[nextIndex]:getChildByName("txt_down"):setTextColor(color) 
         end)       
        
     end 

     self:showSelectPanelHeroes()

    local textArray = {}
    local text_return = btn_select_return:getChildByName("text_return");
    local text_go = btn_select_go:getChildByName("text_go");
    table.insert(textArray,text_return)
    table.insert(textArray,text_go)
    self:fontColorRoodom(textArray)
end

function ShejianGameScene:initUpgradePanel()
    local btn_close = UpgradePanel:getChildByName("btn_close")
    if btn_close then
        btn_close:onClick(function(...)
            UpgradePanel:setVisible(false)
        end)
    end
    local btn_unlock = UpgradePanel:getChildByName("btn_unlock")
    if btn_unlock then
        btn_unlock:onClick(function(...)
            if selectupIndex == nil then
                toastLayer:show("Please select the card to be purchased!")
                return
            end
            if self:isUnlockCard(selectupIndex + 5) then
                toastLayer:show("This card is unlocked!")
                return
            end
            local tgold = self:getGold()
            if tgold < cardNeedGold[selectupIndex] then
                toastLayer:show("Not enough gold coins!")
                return
            end
            tgold = tgold - cardNeedGold[selectupIndex]
            self:setGold(tgold);
            self:refreshGold(tgold);
            self:unlockCard(selectupIndex + 5);
            toastLayer:show("Unlocked successfully!");
            imgs_upgrade_mask[selectupIndex]:setVisible(false);
        end)
    end
    for i = 1,5 do
        imgs_upgrade_mask[i] = UpgradePanel:getChildByName("scrollview"):getChildByName("img_"..i):getChildByName("img_mask")
        txt_upgrade_gold[i] = UpgradePanel:getChildByName("scrollview"):getChildByName("img_"..i):getChildByName("txt_static")
        imgs_upgrade_selectbg[i] = UpgradePanel:getChildByName("scrollview"):getChildByName("img_"..i):getChildByName("img_selectbg")
        btns_upgrade[i] = UpgradePanel:getChildByName("scrollview"):getChildByName("img_"..i):getChildByName("btn_index")
        txt_upgrade_gold[i]:setString(cardNeedGold[i])
        if cardConfig[5+i].up == 10 then
            UpgradePanel:getChildByName("scrollview"):getChildByName("img_"..i):getChildByName("txt_up"):setString("A")
        else
            UpgradePanel:getChildByName("scrollview"):getChildByName("img_"..i):getChildByName("txt_up"):setString(""..cardConfig[5+i].up)
        end
        if cardConfig[5+i].down == 10 then
            UpgradePanel:getChildByName("scrollview"):getChildByName("img_"..i):getChildByName("txt_down"):setString("A")
        else
            UpgradePanel:getChildByName("scrollview"):getChildByName("img_"..i):getChildByName("txt_down"):setString(""..cardConfig[5+i].down)
        end
        if cardConfig[5+i].left == 10 then
            UpgradePanel:getChildByName("scrollview"):getChildByName("img_"..i):getChildByName("txt_left"):setString("A")
        else
            UpgradePanel:getChildByName("scrollview"):getChildByName("img_"..i):getChildByName("txt_left"):setString(""..cardConfig[5+i].left)
        end
        if cardConfig[5+i].right == 10 then
            UpgradePanel:getChildByName("scrollview"):getChildByName("img_"..i):getChildByName("txt_right"):setString("A")
        else
            UpgradePanel:getChildByName("scrollview"):getChildByName("img_"..i):getChildByName("txt_right"):setString(""..cardConfig[5+i].right)
        end
        btns_upgrade[i]:onClick(function ()
            for j = 1,5 do
                if j == i then
                    selectupIndex = i
                    imgs_upgrade_selectbg[j]:setVisible(true)
                else
                    imgs_upgrade_selectbg[j]:setVisible(false)
                end
            end
        end);
        local t = self:isUnlockCard(i+5)
        if t == true then
            imgs_upgrade_mask[i]:setVisible(false)
        else
            imgs_upgrade_mask[i]:setVisible(true)
        end
    end
    -- local textArray = {}
    -- local title = UpgradePanel:getChildByName("title")
    -- local text_unlock = btn_unlock:getChildByName("text_unlock")
    -- table.insert(textArray,title)
    -- table.insert(textArray,text_unlock)
    -- self:fontColorRoodom(textArray)
end

function ShejianGameScene:initHelpPanel()
    btn_help_pre = HelpPanel:getChildByName("btn_pre")
    if btn_help_pre then
        btn_help_pre:onClick(function(...)
            helpstep = helpstep - 1
            if helpstep < 1 then
                helpstep = 1
                return
            end
            self:showHelpStep()
        end)
    end
    btn_help_next = HelpPanel:getChildByName("btn_next")
    if btn_help_next then
        btn_help_next:onClick(function(...)
            helpstep = helpstep + 1
            if helpstep > 4 then
                helpstep = 4
                return
            end
            self:showHelpStep()
        end)
    end
    for i = 1,10 do
        help_cards[i] = HelpPanel:getChildByName("img_"..i)
        help_cards[i]:setLocalZOrder(i)
        local color = {}
        if i < 6 then
            color = {r = 14, g = 131, b = 240}
        else
            color = {r = 225, g = 48, b = 0}
        end
        help_cards[i]:getChildByName("txt_up"):setTextColor(color)
        help_cards[i]:getChildByName("txt_left"):setTextColor(color)
        help_cards[i]:getChildByName("txt_right"):setTextColor(color)
        help_cards[i]:getChildByName("txt_down"):setTextColor(color)
    end
    for i = 1,9 do
        help_pos[i] = HelpPanel:getChildByName("img_pos"..i)
    end
    img_tips = HelpPanel:getChildByName("img_tips")
    img_tips:setVisible(false)
    local btn_close = HelpPanel:getChildByName("btn_close")
    if btn_close then
        btn_close:onClick(function( ... )
            self:resetHelpCards();
            img_tips:setVisible(false);
            HelpPanel:setVisible(false);
            helpstep = 1;
        end)
    end

end

function ShejianGameScene:initDailyBounsPanel()
    DailyBounsPanel:setVisible(true)
    local btn_close = DailyBounsPanel:getChildByName("btn_close")
    if btn_close then
        btn_close:onClick(function(...)
            DailyBounsPanel:setVisible(false)
        end)
    end
    btn_sign = DailyBounsPanel:getChildByName("btn_sign")
    if btn_sign then
        btn_sign:onClick(function(...)
            self:processSign()
        end)
    end

    for i = 1,7 do
        signFlag[i] = DailyBounsPanel:getChildByName("img_"..i):getChildByName("img_check")
        signFlag[i]:setVisible(false)
        sign_value[i] = DailyBounsPanel:getChildByName("img_"..i):getChildByName("txt_number")
        sign_value[i]:setString(""..signGold[i])
    end

    local date = os.date("*t", os.time())
    local year = date.year
    local month = date.month
    local day = date.day
    local wday = date.wday
    local todayIndex = self:wdayToIndex(wday)
    for i = 1,todayIndex - 1 do
        local tKey = self:getKeyByIndex(todayIndex,i)
        if cc.UserDefault:getInstance():getBoolForKey(tKey) then
            signFlag[i]:setVisible(true);
        end
    end
    local strKey = ""..year..month..day
    if cc.UserDefault:getInstance():getBoolForKey(strKey) then
        btn_sign:setVisible(false)
        signFlag[todayIndex]:setVisible(true)
    else
        btn_sign:setVisible(true);
        signFlag[todayIndex]:setVisible(false)
    end
    -- local textArray = {}
    -- local title = DailyBounsPanel:getChildByName("title")
    -- local text_sign = btn_sign:getChildByName("text_sign")
    -- table.insert(textArray,title)
    -- table.insert(textArray,text_sign)
    -- self:fontColorRoodom(textArray)

end

function ShejianGameScene:wdayToIndex(wday)
    if wday > 1 then
        return wday -1
    elseif wday == 1 then
        return 7
    end
    return nil
end

function ShejianGameScene:getKeyByIndex(todayIndex,number)
    local deltaTime = 3600*24*(todayIndex - number)
    local date = os.date("*t", os.time() - deltaTime)
    local year = date.year
    local month = date.month
    local day = date.day
    return ""..year..month..day
end

function ShejianGameScene:processSign()
    local date = os.date("*t", os.time())
    local year = date.year
    local month = date.month
    local day = date.day
    local wday = date.wday
    local todayIndex = self:wdayToIndex(wday)
    local strKey = ""..year..month..day
    if cc.UserDefault:getInstance():getBoolForKey(strKey,false) then
        return
    else
        cc.UserDefault:getInstance():setBoolForKey(strKey,true)
        signFlag[todayIndex]:setVisible(true)
        btn_sign:setTouchEnabled(false)
        self:addGoldFromSign(todayIndex)
    end
end

function ShejianGameScene:addGoldFromSign(todayIndex)
    local  goldValue = self:getGold()
    goldValue = goldValue + signGold[todayIndex]
    self:setGold(goldValue)
    self:refreshGold()
end

--显示帮助步骤
function ShejianGameScene:showHelpStep()
    btn_help_pre = HelpPanel:getChildByName("btn_pre")
    btn_help_next = HelpPanel:getChildByName("btn_next")
    btn_help_pre:setVisible(false)
    btn_help_next:setVisible(false)
    self:resetHelpCards()
    self:enemySendCard(helpFightCards[helpstep].enemyCardIndex)
    utils:delayInvoke("helpMyCard",2.5,function()
        self:drawMyCard(helpFightCards[helpstep].myCardIndex,helpFightCards[helpstep].toPos)
    end);
end

--复位帮助界面的牌
function ShejianGameScene:resetHelpCards()
    for i = 1, 10 do
        help_cards[i]:stopAllActions()
        help_cards[i]:setRotationSkewY(0)
        if i<= 5 then
            help_cards[i]:loadTexture("majia/img/helpPanel/bluebgbig.png")
        else
            help_cards[i]:loadTexture("majia/img/helpPanel/redbgbig.png")
        end
        local color = {}
        if i < 6 then
            color = {r = 14, g = 131, b = 240}
        else
            color = {r = 225, g = 48, b = 0}
        end
        help_cards[i]:getChildByName("txt_up"):setTextColor(color)
        help_cards[i]:getChildByName("txt_left"):setTextColor(color)
        help_cards[i]:getChildByName("txt_right"):setTextColor(color)
        help_cards[i]:getChildByName("txt_down"):setTextColor(color)
        help_cards[i]:setPosition(cc.p(helpCardsPos[i].x,helpCardsPos[i].y))
        help_cards[i]:setLocalZOrder(i);
        local arrow = help_cards[i]:getChildByName("img_arrow")
        if arrow then
            arrow:setVisible(false)
        end
        local hand = help_cards[i]:getChildByName("hand")
        if hand then
            hand:removeFromParent()
        end
    end
end

--敌人出牌
function ShejianGameScene:enemySendCard(index)
    help_cards[index]:runAction(cc.Sequence:create(
        cc.DelayTime:create(1),
        cc.EaseBackIn:create(cc.MoveTo:create(0.5,cc.p(help_cards[index]:getPositionX(),display.height + help_cards[index]:getContentSize().height))),
        cc.CallFunc:create(function ()
            help_cards[index]:setPositionX(help_pos[5]:getPositionX());
        end),
        cc.DelayTime:create(0.5),
        cc.EaseBackIn:create(cc.MoveTo:create(0.5,cc.p(help_pos[5]:getPositionX(),help_pos[5]:getPositionY())))
    ));
end

--拖动自己的牌
function ShejianGameScene:drawMyCard(myCardIndex,toPos)
    local img = ccui.ImageView:create("majia/img/helpPanel/hand.png")
    img:setName("hand")
    img:setRotation(-45)
    img:setPosition(cc.p(150,100))
    help_cards[myCardIndex]:addChild(img)
    help_cards[myCardIndex]:setLocalZOrder(11)
    help_cards[myCardIndex]:runAction(cc.Sequence:create(
        cc.MoveTo:create(1,cc.p(help_pos[toPos]:getPositionX(),help_pos[toPos]:getPositionY())),
        cc.CallFunc:create(function ()
            img:removeFromParent()
            local enemyArrow = help_cards[helpFightCards[helpstep].enemyCardIndex]:getChildByName("img_arrow")
            enemyArrow:setVisible(true);
            enemyArrow:runAction(cc.RepeatForever:create(cc.Sequence:create(cc.FadeOut:create(0.5),cc.FadeIn:create(1.5))))
            local myArrow = help_cards[helpFightCards[helpstep].myCardIndex]:getChildByName("img_arrow")
            myArrow:setVisible(true)
            myArrow:runAction(cc.RepeatForever:create(
                cc.Sequence:create(
                    cc.FadeOut:create(0.5),
                    cc.FadeIn:create(1.5)
                )
            ));
        end),
        cc.CallFunc:create(function ()
            img_tips:getChildByName("txt_tip"):setString(helpFightCards[helpstep].str)
            img_tips:setPositionY(helpFightCards[helpstep].tipY)
            img_tips:setVisible(true)
        end),
        cc.DelayTime:create(3.0),
        cc.CallFunc:create(function ()
            local enemyArrow = help_cards[helpFightCards[helpstep].enemyCardIndex]:getChildByName("img_arrow")
            local myArrow = help_cards[helpFightCards[helpstep].myCardIndex]:getChildByName("img_arrow")
            enemyArrow:stopAllActions();
            enemyArrow:setVisible(false);
            myArrow:stopAllActions();
            myArrow:setVisible(false);
            local enemyCards = help_cards[helpFightCards[helpstep].enemyCardIndex]
            enemyCards:runAction(
                cc.Sequence:create(
                    cc.RotateTo:create(0.5,0,-180),
                    cc.RotateTo:create(0.5,0,-270),
                    cc.CallFunc:create(function ()
                        enemyCards:loadTexture("majia/img/hero/bluebgbig.png")
                        local color = {}
                        color = {r = 14, g = 131, b = 240}
                        enemyCards:getChildByName("txt_up"):setTextColor(color)
                        enemyCards:getChildByName("txt_left"):setTextColor(color)
                        enemyCards:getChildByName("txt_right"):setTextColor(color)
                        enemyCards:getChildByName("txt_down"):setTextColor(color)
                        enemyCards:loadTexture("majia/img/helpPanel/bluebgbig.png")
                    end),
                    cc.RotateTo:create(0.5,0,-360),
                    cc.CallFunc:create(function ()
                        img_tips:getChildByName("txt_tip"):setString("")
                        img_tips:setVisible(false)
                    end),
                    cc.CallFunc:create(function ()
                        btn_help_pre:setVisible(true)
                        btn_help_next:setVisible(true)
                    end)
                )
            );
        end)
    ));
end

--显示选择英雄页面的英雄
function ShejianGameScene:showSelectPanelHeroes()
    for i = 1,10 do
        local color = {}
        if i < 6 then
            color = {r = 14, g = 131, b = 240}
        else
            color = {r = 225, g = 48, b = 0}
        end
        cards[i]:getChildByName("txt_up"):setTextColor(color)
        cards[i]:getChildByName("txt_left"):setTextColor(color)
        cards[i]:getChildByName("txt_right"):setTextColor(color)
        cards[i]:getChildByName("txt_down"):setTextColor(color)
    end
    for i = 1,5 do
       btn_resCards[i]:setTag(0);
       btn_resCards[i]:setVisible(false);
    end
    local t = self:getMaxLevel();
    if t < 5 then
        t = 5;
    end
    if t > 9 then
        t = 9;
    end

   
    for j = 1,10 do
        if j <= t or self:isUnlockCard(j) then
            btn_selectCards[j]:setTouchEnabled(true);
            btn_selectCards[j]:loadTextures("majia/img/hero/"..j..".png","","");
            self:addCardConfig(j);
            btn_selectCards[j]:getChildByName("txt_up"):setVisible(true);
            btn_selectCards[j]:getChildByName("txt_down"):setVisible(true);
            btn_selectCards[j]:getChildByName("txt_left"):setVisible(true);
            btn_selectCards[j]:getChildByName("txt_right"):setVisible(true);
            btn_selectCards[j]:getChildByName("img_mask"):setVisible(false);
        else
            btn_selectCards[j]:setTouchEnabled(false);
            btn_selectCards[j]:getChildByName("img_mask"):setVisible(true);
        end
    end
end

--获得下一个出战英雄的索引
function ShejianGameScene:getNextCardIndex()
    for i= 1,5 do
        if btn_resCards[i]:getTag() == 0 then
            return i;
        end
    end
    return 0;
end

--检查是否选取了5个英雄
function ShejianGameScene:isFullHeroes()
    local number = 0;
    for i= 1,5 do
        if btn_resCards[i]:getTag() ~= 0 then
            number = number + 1;
        end
    end
    if number == 5 then
        return true;
    end
    return false;
end

--卡片是否解锁
function ShejianGameScene:isUnlockCard(index)
    return cc.UserDefault:getInstance():getBoolForKey("card"..index,false)
end

--解锁卡牌
function ShejianGameScene:unlockCard(index)
    cc.UserDefault:getInstance():setBoolForKey("card"..index,true)
end

--刷新金币
function ShejianGameScene:refreshGold()
    local goldbg = StartPanel:getChildByName("goldbg")
    local gold_text = goldbg:getChildByName("gold_text")
    local  goldValue =  cc.UserDefault:getInstance():getIntegerForKey("gold",0)
    gold_text:setString(""..goldValue)
end

--获取金币
function ShejianGameScene:getGold()
    return cc.UserDefault:getInstance():getIntegerForKey("gold",0);
end

--设置金币
function ShejianGameScene:setGold(gold)
    cc.UserDefault:getInstance():setIntegerForKey("gold",gold);
end

--设置最大关卡
function ShejianGameScene:setMaxLevel(maxlevel)
    cc.UserDefault:getInstance():setIntegerForKey("max_level",maxlevel);
end

--获取最大关卡
function ShejianGameScene:getMaxLevel()
    return cc.UserDefault:getInstance():getIntegerForKey("max_level",1);
end

--给牌加载配置
function ShejianGameScene:addCardConfig(index)
    if cardConfig[index].up == 10 then
        btn_selectCards[index]:getChildByName("txt_up"):setString("A");
    else
        btn_selectCards[index]:getChildByName("txt_up"):setString(""..cardConfig[index].up);
    end

    if cardConfig[index].down == 10 then
        btn_selectCards[index]:getChildByName("txt_down"):setString("A");
    else
        btn_selectCards[index]:getChildByName("txt_down"):setString(""..cardConfig[index].down);
    end

    if cardConfig[index].left == 10 then
        btn_selectCards[index]:getChildByName("txt_left"):setString("A");
    else
        btn_selectCards[index]:getChildByName("txt_left"):setString(""..cardConfig[index].left);
    end
    
    if cardConfig[index].right == 10 then
        btn_selectCards[index]:getChildByName("txt_right"):setString("A");
    else
        btn_selectCards[index]:getChildByName("txt_right"):setString(""..cardConfig[index].right);
    end
end

--加载数据配置
function ShejianGameScene:addDataConfig()
    for i = 1,5 do
        myHeroesIndex[i] = btn_resCards[i]:getTag()
    end
    self:addLevelConfig()
    for i = 1,10 do
        cards[i]:setTag(myHeroesIndex[i])
    end

    for i = 1,10 do
        cards[i]:setPosition(cc.p(startCardsPos[i].x,startCardsPos[i].y));
        if cards[i]:getChildByName("bg") == nil then
            local btn_bluebg = ccui.ImageView:create("majia/img/helpPanel/bluebgbig.png");
            local btn_redbg = ccui.ImageView:create("majia/img/helpPanel/redbgbig.png");
            local bg = nil;
            if i <= 5 then
                bg = btn_bluebg;
            else
                bg = btn_redbg;
            end
            bg:setPosition(cc.p(174/2,210/2));
            bg:setName("bg");
            cards[i]:addChild(bg,-1);
        else
            local bg = cards[i]:getChildByName("bg");
            if i <= 5 then
                bg:loadTexture("majia/img/helpPanel/bluebgbig.png");
            else
                bg:loadTexture("majia/img/helpPanel/redbgbig.png");
            end
        end
        self:refreshCard(i,cards[i]:getTag());
    end
    for i = 1,9 do
        imgpos[i]:setTag(0);
    end
end

--加载关卡配置
function ShejianGameScene:addLevelConfig()
    for i = 6,10 do
        myHeroesIndex[i] = levelConfig[level][i-5];
        enemyCardIndexes[#enemyCardIndexes + 1] = i;
    end
end

--根据这张牌的index刷新这张牌
function ShejianGameScene:refreshCard(i,index)
    local up = cardConfig[index].up;
    local strUp = ""..up;
    if up == 10 then
        strUp = "A";
    end

    local down = cardConfig[index].down;
    local strDown = ""..down;
    if down == 10 then
        strDown = "A";
    end

    local left = cardConfig[index].left;
    local strLeft = ""..left;
    if left == 10 then
        strLeft = "A";
    end

    local right = cardConfig[index].right;
    local strRight = ""..right;
    if right == 10 then
        strRight = "A";
    end

    cards[i]:getChildByName("txt_up"):setString(strUp);
    cards[i]:getChildByName("txt_down"):setString(strDown);
    cards[i]:getChildByName("txt_left"):setString(strLeft);
    cards[i]:getChildByName("txt_right"):setString(strRight);
    cards[i]:loadTexture("majia/img/hero/"..index..".png");
    cards[i]:setLocalZOrder(i);
end

--开始游戏
function ShejianGameScene:startGame()
    if luckyFlag == SELF then
        self:setTouchEnabled(true);
        game_txt_tip:setVisible(true);
    else
        self:setTouchEnabled(false);
        game_txt_tip:setVisible(false);
        self:AIPlay();
    end
end

--AI电脑出牌
function ShejianGameScene:AIPlay()
    local tableindex = -1;
    local index = -1;
    local pos = -1;
    tableindex,index,pos = self:getCardsAndPos();
    cards[index]:runAction(cc.Sequence:create(
            cc.DelayTime:create(1),
            cc.CallFunc:create(function ()
                self:playSound("majia/sound/send.mp3");
            end),
            cc.EaseBackIn:create(cc.MoveTo:create(0.5,cc.p(cards[index]:getPositionX(),display.height + cards[index]:getContentSize().height))),
            cc.CallFunc:create(function ()
                cards[index]:setPositionX(imgpos[pos]:getPositionX());
            end),
            cc.DelayTime:create(0.5),
            cc.EaseBackIn:create(cc.MoveTo:create(0.5,cc.p(imgpos[pos]:getPositionX(),imgpos[pos]:getPositionY()))),
            cc.CallFunc:create(function ()
                self:playSound("majia/sound/down.mp3");
                table.remove(enemyCardIndexes,tableindex);
                imgpos[pos]:setTag(cards[index]:getTag() + ENEMY * 100 + index * 1000);
                self:processFight(pos);
            end),
            cc.DelayTime:create(0.5),
            cc.CallFunc:create(function ()
                luckyFlag = SELF;
                self:setTouchEnabled(true);
                game_txt_tip:setVisible(true);
                btn_game_return:setTouchEnabled(false);
                utils:delayInvoke("check GameOver",1.1,function()
                    btn_game_return:setTouchEnabled(true)  
                    local res =  self:gameOver()
                    if res then
                        ScorePanel:setVisible(true)
                        if res == SELF then 
                            score_gold_txt:setString("Gold:    +50")
                            score_gold_txt:setVisible(true)
                            txt_congratulations:setString("congratulations !")
                            self:setGold(self:getGold() + 50)
                            self:refreshGold()
                            level = level + 1;
                            if level > max_level then
                                max_level = level;
                                self:setMaxLevel(max_level);
                            end
                            btn_reset:setVisible(false)
                            btn_next:setVisible(true)   
                        elseif res == ENEMY then
                            score_gold_txt:setVisible(false);
                            txt_congratulations:setString("You failed !")
                            btn_reset:setVisible(true)
                            btn_next:setVisible(false)   
                        
                        elseif res == DRAW then
                            score_gold_txt:setVisible(false);
                            txt_congratulations:setString("Draw");
                            btn_reset:setVisible(true)
                            btn_next:setVisible(false) 
                        end
                    end
            end);
        end)
    ));
end

--游戏是否结束
function ShejianGameScene:gameOver()
    local enemyCard = 0;
    local selfCard = 0;
    for i = 1,9 do
        if imgpos[i]:getTag() == 0 then
            return false;
        elseif math.floor(imgpos[i]:getTag()%1000/100) == 0 then
            enemyCard = enemyCard + 1;
        elseif math.floor(imgpos[i]:getTag()%1000/100) == 1 then
            selfCard = selfCard + 1;  
        end
    end
    if selfCard > enemyCard then
        self:playSound("majia/sound/success.mp3");
        return SELF;
    elseif selfCard < enemyCard then
        self:playSound("majia/sound/fail.mp3");
        return ENEMY;
    elseif selfCard == enemyCard then
        self:playSound("majia/sound/fail.mp3");
        return DRAW;
    end
end

--AI取得要出战的牌的索引和出战目的地
function ShejianGameScene:getCardsAndPos()
    local remainEnemyNumer = #enemyCardIndexes;
    local r = math.random(1,remainEnemyNumer);
    local rIndex = enemyCardIndexes[r];
    local remainEmptyPos = {};
    for i = 1,9 do
        if imgpos[i]:getTag() == 0 then
            remainEmptyPos[#remainEmptyPos + 1] = i;
        end
    end
    local rPosIndex = math.random(1,#remainEmptyPos);
    local rPos = remainEmptyPos[rPosIndex];
    return r,rIndex,rPos;
end

--处理翻牌
function ShejianGameScene:processFight(pos)
    local up = self:getUpIndex(pos);
    local down = self:getDownIndex(pos);
    local left = self:getLeftIndex(pos);
    local right = self:getRightIndex(pos);
    local type_ = math.floor((imgpos[pos]:getTag()%1000)/100);
    local cardIndex = imgpos[pos]:getTag()%100;

    if up then
        print("up ="..up);
        print("imgpos[up]:getTag() = "..imgpos[up]:getTag());
        print("math.floor((imgpos[up]:getTag()%1000)/100) = "..math.floor((imgpos[up]:getTag()%1000)/100))
    end
    if down then
        print("down ="..down);
        print("imgpos[down]:getTag() = "..imgpos[down]:getTag());
        print("math.floor((imgpos[down]:getTag()%1000)/100) = "..math.floor((imgpos[down]:getTag()%1000)/100))
    end
    
    if left then
        print("left ="..left);
        print("imgpos[left]:getTag() = "..imgpos[left]:getTag());
        print("math.floor((imgpos[left]:getTag()%1000)/100) = "..math.floor((imgpos[left]:getTag()%1000)/100))
    end

    if right then
        print("right ="..right);
        print("imgpos[right]:getTag() = "..imgpos[right]:getTag());
        print("math.floor((imgpos[right]:getTag()%1000)/100) = "..math.floor((imgpos[right]:getTag()%1000)/100))
    end
    if up and imgpos[up] and imgpos[up]:getTag() ~=0 and type_ ~= (math.floor((imgpos[up]:getTag()%1000)/100)) then --和上面的牌比较
        print("进入up,type="..type_);
        local cardUpNumber = cardConfig[cardIndex].up;
        print("cardUpNumber = "..cardUpNumber);
        local cardDownNumber_ = cardConfig[imgpos[up]:getTag()%100].down;
        print("cardDownNumber_"..cardDownNumber_);
        if cardUpNumber > cardDownNumber_ then
            self:flip(up);
        end
    end
    if down and imgpos[down] and imgpos[down]:getTag() ~=0 and type_ ~= (math.floor((imgpos[down]:getTag()%1000)/100)) then --和下面的牌比较
        print("进入down,type="..type_);
        local cardDownNumber = cardConfig[cardIndex].down;
        print("cardDownNumber = "..cardDownNumber);
        local cardUpNumber_ = cardConfig[imgpos[down]:getTag()%100].up;
        print("cardUpNumber_ = "..cardUpNumber_);
        if cardDownNumber > cardUpNumber_ then
            self:flip(down);
        end
    end
    if left and imgpos[left] and imgpos[left]:getTag() ~=0 and type_ ~= (math.floor((imgpos[left]:getTag()%1000)/100)) then --和左边的牌比较
        print("进入left,type="..type_);
        local cardLeftNumber = cardConfig[cardIndex].left;
        print("cardLeftNumber = "..cardLeftNumber);
        local cardRightNumber_ = cardConfig[imgpos[left]:getTag()%100].right;
        print("cardRightNumber_ = "..cardRightNumber_);
        if cardLeftNumber > cardRightNumber_ then
            self:flip(left);
        end
    end
    if right and imgpos[right] and imgpos[right]:getTag() ~=0 and type_ ~= (math.floor((imgpos[right]:getTag()%1000)/100)) then --和右边的牌比较
        print("进入right,type="..type_);
        local cardRightNumber = cardConfig[cardIndex].right;
        print("cardRightNumber = "..cardRightNumber);
        local cardLeftNumber_ = cardConfig[imgpos[right]:getTag()%100].left;
        print("cardLeftNumber_ = "..cardLeftNumber_)
        if cardRightNumber > cardLeftNumber_ then
            self:flip(right);
        end
    end 
end

--翻牌
function ShejianGameScene:flip(pos)
    print("翻牌======")
    local index = math.floor(imgpos[pos]:getTag()/1000);
    cards[index]:runAction(
    cc.Sequence:create(
    cc.RotateTo:create(0.5,0,-180),cc.RotateTo:create(0.5,0,-270),cc.CallFunc:create(function ()
        local t = math.floor((imgpos[pos]:getTag()%1000)/100);
        local bg = cards[index]:getChildByName("bg");
        print("bg",bg)
        local color = {}
        if t == SELF then
            bg:loadTexture("majia/img/helpPanel/redbgbig.png");
            color = {r = 225, g = 48, b = 0}
        else
            color = {r = 14, g = 131, b = 240}
            bg:loadTexture("majia/img/helpPanel/bluebgbig.png");
        end
        cards[index]:getChildByName("txt_up"):setTextColor(color)
        cards[index]:getChildByName("txt_left"):setTextColor(color)
        cards[index]:getChildByName("txt_right"):setTextColor(color)
        cards[index]:getChildByName("txt_down"):setTextColor(color)
        local tag = imgpos[pos]:getTag();
        if math.floor(tag%1000/100) == SELF then
            imgpos[pos]:setTag(imgpos[pos]:getTag() - SELF * 100);
        elseif math.floor(tag%1000/100) == ENEMY then
            imgpos[pos]:setTag(imgpos[pos]:getTag() + SELF * 100);
        end
    end),cc.RotateTo:create(0.5,0,-360)))
    print("pos 为"..pos.."的牌执行了动作");
end

--寻找上面的索引
function ShejianGameScene:getUpIndex(index)
    if index < 4 then
        return nil;
    else
        return index - 3;
    end
    return nil;
end

--寻找下面的索引
function ShejianGameScene:getDownIndex(index)
    if index > 6 then
        return nil;
    else
        return index + 3;
    end
    return nil;
end

--寻找左边的索引
function ShejianGameScene:getLeftIndex(index)
    if (index == 1) or (index == 4) or (index == 7) then
        return nil;
    else
        return index - 1;
    end
    return nil;
end

--寻找右边的索引
function ShejianGameScene:getRightIndex(index)
    if (index == 3) or (index == 6) or (index == 9) then
        return nil;
    else
        return index + 1;
    end
    return nil;
end

--播放音效
function ShejianGameScene:playSound(path)
    if soundSwitch then
        PLAY_SOUND(path);
    end
end

--飘字特效
function ShejianGameScene:addFloatEffect(x,y,number)
    local label = cc.Label:createWithTTF("-"..number, "majia/font555.TTF", 32)
    label:setColor(cc.c3b(255,0,0));
    label:setAnchorPoint(cc.p(0.5,0.5));
    label:setPosition(cc.p(x,y));
    node_effect:addChild(label);
    label:runAction(cc.Sequence:create(cc.MoveBy:create(0.5,cc.p(0,50)),cc.DelayTime:create(0.5),cc.RemoveSelf:create()));
end

--初始化鼠标监听事件
function ShejianGameScene:initMouseListen()
    local clickIndex = -1;
    local function onTouch(eventType, x, y)
        if eventType == "began" then
            clickIndex = self:getClickCardIndex(x,y);
            if clickIndex ~= -1 then
                cards[clickIndex]:setZOrder(11);
            end
            return true;
        elseif eventType == "moved" then
            if clickIndex == -1 then
                return;
            end
            cards[clickIndex]:setPosition(x - (display.width - 1136)/2,y);
        elseif eventType == "ended" then
            local upIndex = -1;
            upIndex = self:getClickUpCardIndex(x,y);
            if clickIndex == -1 then
                return;
            end
            if upIndex == -1 then
                local startpos = {[1] = {x=100,y=440},[2] = {x=100,y=360},[3] = {x=100,y=280},[4] = {x=100,y=200},[5] = {x=100,y=120}};
                cards[clickIndex]:setPosition(cc.p(startpos[clickIndex].x,startpos[clickIndex].y));
                cards[clickIndex]:setZOrder(clickIndex);
                self:playSound("majia/sound/send.mp3");
            else
                self:playSound("majia/sound/down.mp3");
                cards[clickIndex]:setPosition(cc.p(imgpos[upIndex]:getPositionX(),imgpos[upIndex]:getPositionY()));
                cards[clickIndex]:setZOrder(0);
                imgpos[upIndex]:setTag(cards[clickIndex]:getTag() + SELF * 100 + clickIndex * 1000);
                self:processFight(upIndex);
                luckyFlag = ENEMY;
                self:setTouchEnabled(false);
                game_txt_tip:setVisible(false);
                self:startGame();
            end
        end
    end
    self:setTouchEnabled(true)
    self:registerScriptTouchHandler(onTouch)
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
--1 2 3
--4 5 6
--7 8 9
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

function ShejianGameScene:fontColorRoodom(fontChangeArr)
    local function getRgb()
        local r = math.random(0,255)
        local g = math.random(0,255)
        local b = math.random(0,255)
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

function ShejianGameScene:onExit( )
    if self._update then
        scheduler = cc.Director:getInstance():getScheduler()
        scheduler:unscheduleScriptEntry(self._update)
        self._update = nil
    end
    cc.SimpleAudioEngine:getInstance():stopMusic()
end

cc.exports.ShejianGameScene = ShejianGameScene
return ShejianGameScene

