local ShejianGameScene = class("ShejianGameScene", function()
    return cc.Layer:create()
end)
require("logic.views.GameScene.Utils")
local fontcolor

--主界面
local StartPanel 
local GamePanel
local ScorePanel
local HelpPanel
local ExitPanel
local HelpPanelEX
local img_card
local img_start_gold
local txt_gold

--帮助界面
local ex_btn_mask
local ex_card_send
local ex_txt_remain
local ex_card_trash
local ex_node_move
local ex_node_effect
local ex_cardsbg ={}
local ex_node_cards = {}
local helpStep = 0
--ClipNode
local spriteBall
local maskLayer
local hand

local medicineCard
local defenseCard
local weaponCard
local enemyCard

--游戏界面
local card_send
local txt_remain
local card_trash
local node_cards = {}
local cardsbg ={}
local node_move 
local node_effect
local img_infobg 
local txt_tip


local img_scorebg

--当前关卡
local maxLevel = 1
--音量控制
local soundSwitch = true
local btn_gamepanel_sound
local btn_sound

--游戏逻辑
local remainNumber = 54;
local canDraw = false;

--触摸鼠标时间
local beginIndex
local endIndex
local start_x
local start_y
local snapCard

function printEX(...)
    if debug == 1 then
        print(...);
    end
end

local Type ={};
Type.ENEMY      = 1;
Type.WEAPON     = 2;
Type.DEFENSE    = 3;
Type.MEDICINE   = 4;
Type.TOOLS      = 5;
Type.MONEY      = 6;
Type.HERO       = 7;

local enemy = 
{
    [1] = { index = 1, name = "",                   hp = 2,   typeIndex = Type.ENEMY ,description = "Monster: Type:enemy,Act on the hero, give the hero 2 damage." },
    [2] = { index = 2, name = "",                   hp = 3,   typeIndex = Type.ENEMY ,description = "warrior: Type:enemy,Act on the hero, give the hero 3 damage." },
    [3] = { index = 3, name = "",                       hp = 4,   typeIndex = Type.ENEMY ,description = "Orc: Type:enemy,Act on the hero, give the hero 4 damage." },
    [4] = { index = 1, name = "",                     hp = 5,   typeIndex = Type.ENEMY ,description = "Witch: Type:enemy,Act on the hero, give the hero 5 damage." },
    [5] = { index = 2, name = "",               hp = 6,   typeIndex = Type.ENEMY ,description = "Sea monster: Type:enemy,Act on the hero, give the hero 6 damage." },
    [6] = { index = 3, name = "",                 hp = 7,   typeIndex = Type.ENEMY ,description = "stone man: Type:enemy,Act on the hero, give the hero 7 damage." },
    [7] = { index = 1, name = "",                     hp = 8,   typeIndex = Type.ENEMY ,description = "demon: Type:enemy,Act on the hero, give the hero 8 damage." },
    [8] = { index = 2, name = "",                hp = 9,   typeIndex = Type.ENEMY ,description = "Multi-handed monster: Type:enemy,Act on the hero, give the hero 9 damage." },
    [9] = { index = 3, name = "",                    hp = 10,  typeIndex = Type.ENEMY ,description = "insect: Type:enemy,Act on the hero, give the hero 10 damage." },
};

local weapon = 
{
    [1] = { index = 1, name = "",   hp = 2, typeIndex = Type.WEAPON ,description = "weapon: Type:weapon,Act on the enemy, give the hero 2 damage." },
    [2] = { index = 2, name = "",   hp = 3, typeIndex = Type.WEAPON ,description = "weapon: Type:weapon,Act on the enemy, give the hero 3 damage." },
    [3] = { index = 1, name = "",   hp = 4, typeIndex = Type.WEAPON ,description = "weapon: Type:weapon,Act on the enemy, give the hero 4 damage." },
    [4] = { index = 2, name = "",   hp = 5, typeIndex = Type.WEAPON ,description = "weapon: Type:weapon,Act on the enemy, give the hero 5 damage." },
    [5] = { index = 1, name = "",   hp = 6, typeIndex = Type.WEAPON ,description = "weapon: Type:weapon,Act on the enemy, give the hero 6 damage." },
    [6] = { index = 2, name = "",   hp = 7, typeIndex = Type.WEAPON ,description = "weapon: Type:weapon,Act on the enemy, give the hero 7 damage." },
};                                                                      
                                                                       
local defense =                                                         
{
    [1] = { index = 1, name = "",   hp = 2, typeIndex = Type.DEFENSE ,description = "Shield: Type：Shield,Put it at the 1st or 3rd position and add 2 shield to the hero." },
    [2] = { index = 2, name = "",   hp = 3, typeIndex = Type.DEFENSE ,description = "Shield: Type：Shield,Put it at the 1st or 3rd position and add 3 shield to the hero." },
    [3] = { index = 1, name = "",   hp = 4, typeIndex = Type.DEFENSE ,description = "Shield: Type：Shield,Put it at the 1st or 3rd position and add 4 shield to the hero." },
    [4] = { index = 2, name = "",   hp = 5, typeIndex = Type.DEFENSE ,description = "Shield: Type：Shield,Put it at the 1st or 3rd position and add 5 shield to the hero." },
    [5] = { index = 1, name = "",   hp = 6, typeIndex = Type.DEFENSE ,description = "Shield: Type：Shield,Put it at the 1st or 3rd position and add 6 shield to the hero." },
    [6] = { index = 2, name = "",   hp = 7, typeIndex = Type.DEFENSE ,description = "Shield: Type：Shield,Put it at the 1st or 3rd position and add 7 shield to the hero." },
};

local medicine = 
{
    
    [1] = { index = 1, name = "",   hp = 2, typeIndex = Type.MEDICINE ,description = "Medicines: Type:Medicines,Put it at the 1st or 3rd position and add 2 points to the hero" },
    [2] = { index = 2, name = "",   hp = 3, typeIndex = Type.MEDICINE ,description = "Medicines: Type:Medicines,Put it at the 1st or 3rd position and add 3 points to the hero" },
    [3] = { index = 1, name = "",   hp = 4, typeIndex = Type.MEDICINE ,description = "Medicines: Type:Medicines,Put it at the 1st or 3rd position and add 4 points to the hero" },
    [4] = { index = 2, name = "",   hp = 5, typeIndex = Type.MEDICINE ,description = "Medicines: Type:Medicines,Put it at the 1st or 3rd position and add 5 points to the hero" },
    [5] = { index = 1, name = "",   hp = 6, typeIndex = Type.MEDICINE ,description = "Medicines: Type:Medicines,Put it at the 1st or 3rd position and add 6 points to the hero" },
    [6] = { index = 2, name = "",   hp = 7, typeIndex = Type.MEDICINE ,description = "Medicines: Type:Medicines,Put it at the 1st or 3rd position and add 7 points to the hero" },
    [7] = { index = 1, name = "",   hp = 8, typeIndex = Type.MEDICINE ,description = "Medicines: Type:Medicines,Put it at the 1st or 3rd position and add 8 points to the hero" },
    [8] = { index = 2, name = "",   hp = 9, typeIndex = Type.MEDICINE ,description = "Medicines: Type:Medicines,Put it at the 1st or 3rd position and add 9 points to the hero" },
};                                                                        

local tools = 
{
    [1] = { index = 1, name = "",   hp = 2,typeIndex = Type.TOOLS ,description = "Disappear: Type:Tool. For heroes, you can throw all the cards of the 1st, 2nd, and 3rd positions into the trash can." },
    [2] = { index = 2, name = "",     hp = 3,typeIndex = Type.TOOLS ,description = "Go Back: Type:Tool. For the card, you can throw any one of the 1st, 2nd, and 3rd cards into the trash can." },
    [3] = { index = 1, name = "",  hp = 4,typeIndex = Type.TOOLS ,description = "Conversion: Type:Tool. Acts on a non-enemy type card and randomly transfers it to a potion card!" },
    [4] = { index = 2, name = "",        hp = 5,typeIndex = Type.TOOLS ,description = "Kill: Type:Tool. Act on the enemy, attack the HP lost by the hero, and give the enemy a fatal blow!" },
    [5] = { index = 2, name = "",        hp = 6,typeIndex = Type.TOOLS ,description = "Rune: Type:Tool. Act on the enemy, absorb the enemy's life points and add to the hero, the enemy's life points does not change." },

};

local money = 
{
    [1] = { index = 1, name = "", hp = 2,    typeIndex = Type.MONEY ,description = "gold: Type:gold. Add 2 gold coins" },
    [2] = { index = 1, name = "", hp = 3,    typeIndex = Type.MONEY ,description = "gold: Type:gold. Add 3 gold coins" },
    [3] = { index = 1, name = "", hp = 4,    typeIndex = Type.MONEY ,description = "gold: Type:gold. Add 4 gold coins" },
    [4] = { index = 1, name = "", hp = 5,    typeIndex = Type.MONEY ,description = "gold: Type:gold. Add 5 gold coins" },
    [5] = { index = 1, name = "", hp = 6,    typeIndex = Type.MONEY ,description = "gold: Type:gold. Add 6 gold coins" },
    [6] = { index = 1, name = "", hp = 7,    typeIndex = Type.MONEY ,description = "gold: Type:gold. Add 7 gold coins" },
    [7] = { index = 1, name = "", hp = 8,    typeIndex = Type.MONEY ,description = "gold: Type:gold. Add 8 gold coins" },
    [8] = { index = 1, name = "", hp = 9,    typeIndex = Type.MONEY ,description = "gold: Type:gold. Add 9 gold coins" },
    [9] = { index = 1, name = "", hp = 10,   typeIndex = Type.MONEY ,description = "gold: Type:gold. Add 10 gold coins" },
}
local hero = 
{ 
    hp = 13; 
}

--动作类型
local actionType = {};
actionType.MOVE                     = 1;
actionType.WEAPON_ATTACK_ENEMY      = 2;
actionType.ENEMY_ATTACK_HERO        = 3;
actionType.ENEMY_ATTACK_DEFENSE     = 4;
actionType.ENEMY_ATTACK_WEAPON      = 5;
actionType.USER_TOOL                = 6;

--初级配置
local cardSet = {};
function ShejianGameScene:easyConfig()
    --54张牌的配置
    cardSet[55-1] = enemy[2];
    cardSet[55-2] = enemy[7];
    cardSet[55-3] = weapon[6];
    cardSet[55-4] = medicine[4];
    cardSet[55-5] = enemy[5];
    cardSet[55-6] = weapon[3];
    cardSet[55-7] = money[7];
    cardSet[55-8] = enemy[8];
    cardSet[55-9] = defense[6];
    cardSet[55-10] = medicine[8];
    cardSet[55-11] = weapon[2];
    cardSet[55-12] = weapon[3];
    cardSet[55-13] = enemy[9];
    cardSet[55-14] = weapon[5];
    cardSet[55-15] = medicine[6];
    cardSet[55-16] = money[3];
    cardSet[55-17] = enemy[9];
    cardSet[55-18] = weapon[3];
    cardSet[55-19] = medicine[4];
    cardSet[55-20] = defense[5];
    cardSet[55-21] = enemy[6];
    cardSet[55-22] = enemy[4];
    cardSet[55-23] = defense[6];
    cardSet[55-24] = enemy[9];
    cardSet[55-25] = medicine[1];
    cardSet[55-26] = tools[2];
    cardSet[55-27] = medicine[2];
    cardSet[55-28] = enemy[4];
    cardSet[55-29] = medicine[3];
    cardSet[55-30] = enemy[5];
    cardSet[55-31] = enemy[4];
    cardSet[55-32] = medicine[5];
    cardSet[55-33] = enemy[4];
    cardSet[55-34] = medicine[1];
    cardSet[55-35] = money[5];
    cardSet[55-36] = enemy[4];
    cardSet[55-37] = defense[5];
    cardSet[55-38] = money[4];
    cardSet[55-39] = enemy[8];
    cardSet[55-40] = money[2];
    cardSet[55-41] = medicine[2];
    cardSet[55-42] = defense[5];
    cardSet[55-43] = defense[1];
    cardSet[55-44] = enemy[3];
    cardSet[55-45] = weapon[6];
    cardSet[55-46] = enemy[3];
    cardSet[55-47] = enemy[7];
    cardSet[55-48] = tools[5];
    cardSet[55-49] = money[3];
    cardSet[55-50] = medicine[8];
    cardSet[55-51] = enemy[9];
    cardSet[55-52] = enemy[9];
    cardSet[55-53] = tools[4];
    cardSet[55-54] = medicine[8];    
end

--中级配置
function ShejianGameScene:normalConfig()
    cardSet[55-1] = enemy[2];
    cardSet[55-2] = enemy[7];
    cardSet[55-3] = weapon[6];
    cardSet[55-4] = medicine[4];
    cardSet[55-5] = enemy[5];
    cardSet[55-6] = weapon[3];
    cardSet[55-7] = money[7];
    cardSet[55-8] = enemy[8];
    cardSet[55-9] = defense[6];
    cardSet[55-10] = medicine[8];
    cardSet[55-11] = weapon[2];
    cardSet[55-12] = weapon[3];
    cardSet[55-13] = enemy[9];
    cardSet[55-14] = weapon[5];
    cardSet[55-15] = medicine[6];
    cardSet[55-16] = money[3];
    cardSet[55-17] = enemy[9];
    cardSet[55-18] = weapon[3];
    cardSet[55-19] = medicine[4];
    cardSet[55-20] = defense[5];
    cardSet[55-21] = enemy[6];
    cardSet[55-22] = enemy[4];
    cardSet[55-23] = defense[6];
    cardSet[55-24] = enemy[9];
    cardSet[55-25] = medicine[1];
    cardSet[55-26] = tools[2];
    cardSet[55-27] = medicine[2];
    cardSet[55-28] = enemy[4];
    cardSet[55-29] = medicine[3];
    cardSet[55-30] = enemy[5];
    cardSet[55-31] = enemy[4];
    cardSet[55-32] = medicine[5];
    cardSet[55-33] = enemy[4];
    cardSet[55-34] = medicine[1];
    cardSet[55-35] = money[5];
    cardSet[55-36] = enemy[4];
    cardSet[55-37] = defense[5];
    cardSet[55-38] = money[4];
    cardSet[55-39] = enemy[8];
    cardSet[55-40] = money[2];
    cardSet[55-41] = medicine[2];
    cardSet[55-42] = defense[5];
    cardSet[55-43] = defense[1];
    cardSet[55-44] = enemy[3];
    cardSet[55-45] = weapon[6];
    cardSet[55-46] = enemy[3];
    cardSet[55-47] = enemy[7];
    cardSet[55-48] = tools[5];
    cardSet[55-49] = money[3];
    cardSet[55-50] = medicine[8];
    cardSet[55-51] = enemy[9];
    cardSet[55-52] = enemy[9];
    cardSet[55-53] = tools[4];
    cardSet[55-54] = medicine[8];
end

--高级配置
function ShejianGameScene:highConfig()
    cardSet[55-1] = enemy[2];
    cardSet[55-2] = enemy[7];
    cardSet[55-3] = weapon[6];
    cardSet[55-4] = medicine[4];
    cardSet[55-5] = enemy[5];
    cardSet[55-6] = weapon[3];
    cardSet[55-7] = money[7];
    cardSet[55-8] = enemy[8];
    cardSet[55-9] = defense[6];
    cardSet[55-10] = medicine[8];
    cardSet[55-11] = weapon[2];
    cardSet[55-12] = weapon[3];
    cardSet[55-13] = enemy[9];
    cardSet[55-14] = weapon[5];
    cardSet[55-15] = medicine[6];
    cardSet[55-16] = money[3];
    cardSet[55-17] = enemy[9];
    cardSet[55-18] = weapon[3];
    cardSet[55-19] = medicine[4];
    cardSet[55-20] = defense[5];
    cardSet[55-21] = enemy[6];
    cardSet[55-22] = enemy[4];
    cardSet[55-23] = defense[6];
    cardSet[55-24] = enemy[9];
    cardSet[55-25] = medicine[1];
    cardSet[55-26] = tools[2];
    cardSet[55-27] = medicine[2];
    cardSet[55-28] = enemy[4];
    cardSet[55-29] = medicine[3];
    cardSet[55-30] = enemy[5];
    cardSet[55-31] = enemy[4];
    cardSet[55-32] = medicine[5];
    cardSet[55-33] = enemy[4];
    cardSet[55-34] = medicine[1];
    cardSet[55-35] = money[5];
    cardSet[55-36] = enemy[4];
    cardSet[55-37] = defense[5];
    cardSet[55-38] = money[4];
    cardSet[55-39] = enemy[8];
    cardSet[55-40] = money[2];
    cardSet[55-41] = medicine[2];
    cardSet[55-42] = defense[5];
    cardSet[55-43] = defense[1];
    cardSet[55-44] = enemy[3];
    cardSet[55-45] = weapon[6];
    cardSet[55-46] = enemy[3];
    cardSet[55-47] = enemy[7];
    cardSet[55-48] = tools[5];
    cardSet[55-49] = money[3];
    cardSet[55-50] = medicine[8];
    cardSet[55-51] = enemy[9];
    cardSet[55-52] = enemy[9];
    cardSet[55-53] = tools[4];
    cardSet[55-54] = medicine[8];
end

--洗牌
function ShejianGameScene:Shuffle(number)
    for i=1,number do
        local r =math.floor(self:seededRandom(1,number + 1));
        cardSet[r],cardSet[i] = cardSet[i],cardSet[r];
    end
end

local seed = 5
function ShejianGameScene:seededRandom(max, min) 
   max = max or 1
   min = min or 0
   seed = (seed * 9301 + 49297) % 233280
   local rnd = seed / 233280.0
   return min + rnd * (max - min)
end

function ShejianGameScene:ctor()
    math.randomseed(tonumber(tostring(os.time()):reverse():sub(1,6)));
end

function ShejianGameScene:onExit( )
	cc.SimpleAudioEngine:getInstance():stopMusic()
end

function ShejianGameScene:create()
    local layer = ShejianGameScene.new()
    self:init()
    return layer
end

function ShejianGameScene:getClassName()
    return "ShejianGameScene"
end


-- local eventExecuter = require("packages.eventExecuter.EventExecuter"):create()

function ShejianGameScene:registerPnl(panel)
    if not eventExecuter:hasEvents() then
        print("I am here")
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
            elseif panel:getName()  == "ScorePanel" then
                self:grabsScorePanel()
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
    txt_gold:setString(""..math.random(1000,10000));
end

function ShejianGameScene:grabsScorePanel()

end

function ShejianGameScene:grabsGamePanel()
    local model = math.random(1,3)
    if model == 1 then
        self:easyConfig();
    elseif model == 2 then
        self:normalConfig();
    elseif model == 3 then
        self:highConfig();
    end
    --玩家信息初始化
    local card = img_card:clone();
    local path = self:getHeroTextureIndex(math.random(1,13));
    card:loadTexture(path);
    card:setPosition(cc.p(0,0))
    node_cards[2]:addChild(card);
  
    local txt_value = card:getChildByName("txt_value")
    txt_value:setPosition(cc.p(txt_value:getPositionX()-20,txt_value:getPositionY()))
    txt_value:setString(math.random(1,13).."/13")

    local txt_name = card:getChildByName("txt_name")
    txt_name:setAnchorPoint(cc.p(0,0.5))
    txt_name:setString("$:")
    txt_name:setTextColor(cc.c3b(255,255,0))
    txt_name:setPosition(cc.p(20,txt_name:getPositionY()))
    
    local txt_gold = txt_name:clone();
    txt_gold:setName("txt_gold");
    txt_gold:setAnchorPoint(cc.p(0,0.5));
    txt_gold:setPosition(cc.p(40,txt_name:getPositionY()));
    txt_gold:setString(""..math.random(1000,10000));
    txt_gold:setTextColor(cc.c3b(255,255,0));
    txt_name:getParent():addChild(txt_gold);

    for i=5,8 do
        if node_cards[i]:getTag() == 0 then
            local card = self:createCard(cardSet[remainNumber].typeIndex,cardSet[remainNumber].index)
            remainNumber = remainNumber-1
            card:setPosition(0,0)
            node_cards[i]:addChild(card,100);
        end
    end
    txt_remain:setString(""..math.random(20,50));
end

function ShejianGameScene:init()
    self.loadNode = cc.CSLoader:createNode("majia/ShejianGameLayer.csb");
  
    maxLevel =  cc.UserDefault:getInstance():getIntegerForKey("maxLevel",1);
    self.loadNode:setContentSize(cc.size(display.size.height, display.size.width))
    ccui.Helper:doLayout(self.loadNode)
    self:addChild(self.loadNode, 0)

    local function getRgb()
        local textArray = {{231,207,205},{211,209,184},{232,232,232},{219,205,196},{223,190,121},{192,178,151}}
        local index = math.random(1,6)
        local r = textArray[index][1]
        local g = textArray[index][2]
        local b = textArray[index][3]
        return cc.c3b(r,g,b)
    end
    fontcolor = getRgb()
 
	GamePanel = self.loadNode:getChildByName("GamePanel")
	ScorePanel = self.loadNode:getChildByName("ScorePanel")
    HelpPanel = self.loadNode:getChildByName("HelpPanel")
    ExitPanel = self.loadNode:getChildByName("ExitPanel");
    img_card = self.loadNode:getChildByName("img_card");
    HelpPanelEX = self.loadNode:getChildByName("HelpPanelEX")

    -- local addComponentConfig = {
    --     GamePanel,
    --     GamePanel,
    --     self.fenshu
    -- }
    -- local panel_top_btn = require("logic/viewController/componentController").new(addComponentConfig)
    self:initGamePanel()
    self:initMouseListen()

	GamePanel:setVisible(true)
	
    self.model = 1;
    self:startGame();

end

--初始化鼠标监听事件
function ShejianGameScene:initMouseListen()
    beginIndex = -1;
    endIndex = -1;
    local function onTouch(eventType, x, y)
        if eventType == "began" then
           printEX("began");
           if not canDraw then
               return false;
           end
           beginIndex = self:getIndexByPos(x,y);
           printEX("begin index = "..beginIndex);
           if beginIndex == -1 then
               printEX("begin index == -1 返回！");
               return false;
           end
           if not beginIndex then
                return
           end
           local card = node_cards[beginIndex]:getChildByName("card");
           if card == nil then
                printEX(""..beginIndex.."号节点下没有卡牌！")
                return false;
           end
           self:countInfoTime();
           if beginIndex == 2 then
               return false;
           end
           start_x = x;
           start_y = y;
           snapCard = self:cloneCard(math.floor(card:getTag()/100),card:getTag()%100,self:getValue(beginIndex));
           snapCard:setPosition(cc.p(x-(x-cardsbg[beginIndex]:getPositionX()),y-(y-cardsbg[beginIndex]:getPositionY())));
           self:addMaskForSnapCard();
           node_move:addChild(snapCard);
           card:setVisible(false);
           return true;
        elseif eventType == "moved" then
            printEX("moved");
            printEX("x="..x);
            printEX("y="..y);
            self:removeInfo();
            if snapCard then
                snapCard:setPosition(cc.p(x-(start_x-cardsbg[beginIndex]:getPositionX()),y-(start_y-cardsbg[beginIndex]:getPositionY())));
            end
        elseif eventType == "ended" then
            printEX("ended");
            self:removeInfo();
            local endIndex = self:getIndexByPos(x,y);
            printEX("end index = "..endIndex);
            if endIndex == 9 then
                if beginIndex == 1 or beginIndex == 3 then
                    node_cards[beginIndex]:getChildByName("card"):setVisible(true);           
                else
                    if math.floor(node_cards[beginIndex]:getTag()/100) ~= Type.ENEMY  then
                        node_cards[beginIndex]:getChildByName("card"):removeFromParent();
                        node_cards[beginIndex]:setTag(0);
                        self:playSound("throw.mp3");
                        if self:checkPass() then
                        else
                            self:checkSendCard();
                        end
                    else
                        node_cards[beginIndex]:getChildByName("card"):setVisible(true);
                    end 
                end
                self:removeFromParent(snapCard);

            else
                if endIndex == -1  or (beginIndex >4 and endIndex > 4) then
                     self:getCard(beginIndex):setVisible(true);
                     self:removeFromParent(snapCard);
                    return;
                end
                local result = false;
                local actionType = -1;
                result,actionType = self:canFightOrMove(beginIndex,endIndex);
                if not result then
                     self:getCard(beginIndex):setVisible(true);
                     self:removeFromParent(snapCard);
                    return ;
                end
                self:process(beginIndex,endIndex,actionType);
            end
        end
    end

    self:setTouchEnabled(true)
    self:registerScriptTouchHandler(onTouch)
end

--处理两张卡牌的结果
function ShejianGameScene:process(beginIndex,endIndex,action)
    local card = self:getCard(beginIndex);
    if card == nil then
        return;
    end
    local beginType = math.floor(node_cards[beginIndex]:getTag()/100);
    local endType = math.floor(node_cards[endIndex]:getTag()/100);
    local beginID = node_cards[beginIndex]:getTag()%100;
    local endID = node_cards[endIndex]:getTag()%100;
    local beginValue = 0;
    if beginType == Type.WEAPON or beginType == Type.DEFENSE or beginType == Type.ENEMY or beginType == Type.MEDICINE or beginType == Type.MONEY then
        local str_value =  card:getChildByName("txt_value"):getString();
        beginValue = tonumber(str_value);
    end
    local endValue = 0;
    if endType~=0 and endType~= Type.TOOLS  then
        local str_value =  self:getCard(endIndex):getChildByName("txt_value"):getString();
        endValue = tonumber(str_value);
    end

    if action == actionType.MOVE then
        local tCard = self:cloneCard(math.floor(snapCard:getTag()/100),snapCard:getTag()%100,self:getValue(beginIndex));
        card:removeFromParent();
        node_cards[beginIndex]:setTag(0);
        self:removeFromParent(snapCard);

        if beginType == Type.MEDICINE then
            if endIndex == 1 or endIndex == 3 then
                local heroHP = self:getHeroHP();
                heroHP = heroHP + beginValue;
                if heroHP >13 then
                    heroHP = 13;
                end
                self:setHeroHP(heroHP);
                self:addHpEffect(beginValue);
                local mask = ccui.ImageView:create("majia/img/mask.png");
                mask:setPosition(cc.p(tCard:getContentSize().width/2,tCard:getContentSize().height/2));
                tCard:addChild(mask);
                self:playSound("addhp.wav");
            end
        elseif beginType == Type.MONEY then
            if endIndex == 1 or endIndex == 3 or endIndex ==4 then
                local heroGold = self:getHeroGold();
                heroGold = heroGold + beginValue;
                self:setHeroGold(heroGold);
                self:addGoldEffect(beginValue);
                local mask = ccui.ImageView:create("majia/img/mask.png");
                mask:setPosition(cc.p(tCard:getContentSize().width/2,tCard:getContentSize().height/2));
                tCard:addChild(mask);
                self:playSound("addgold.mp3");
            end
        end
        
        self:playSound("move.wav");
        node_cards[endIndex]:addChild(tCard);
        tCard:setPosition(cc.p(0,0));
        node_cards[endIndex]:setTag(tCard:getTag());
        if self:checkPass() then
        else
            self:checkSendCard();
        end
    elseif action == actionType.WEAPON_ATTACK_ENEMY then
        local endCard = node_cards[endIndex]:getChildByName("card");
        card:removeFromParent();
        node_cards[beginIndex]:setTag(0);
        self:removeFromParent(snapCard);
        self:addChangeEffect(endIndex,-beginValue);
        if beginValue >= endValue then
            endCard:removeFromParent();
            node_cards[endIndex]:setTag(0);
        else
            local txt_endValue = endCard:getChildByName("txt_value");
            local resValue = endValue - beginValue;
            txt_endValue:setString(""..resValue);
        end
        self:playSound("sword.mp3");
        if self:checkPass() then
        else
            self:checkSendCard();
        end
    elseif action ==  actionType.ENEMY_ATTACK_HERO then
        card:removeFromParent();
        node_cards[beginIndex]:setTag(0);
        self:removeFromParent(snapCard);

        local heroHP = self:getHeroHP();
        if beginValue >= heroHP then
            self:setHeroHP(0);
            self:addHpEffect(-beginValue);
            self:clear();
            -- img_scorebg:loadTexture("majia/img/scorePanel/imges_defeat.png");
            -- img_scorebg:setContentSize(cc.size(616,348));
            self:over()
            self:playSound("fail.mp3");
            print("GG");
        else
            self:setHeroHP(heroHP-beginValue)
            self:addHpEffect(-beginValue);
            if self:checkPass() then
            else
                self:checkSendCard();
            end
        end
        self:playEnemyAttackSound(beginIndex);
    elseif action ==  actionType.ENEMY_ATTACK_DEFENSE then
        local endCard = node_cards[endIndex]:getChildByName("card");
        if beginValue >= endValue then
            endCard:removeFromParent();
            node_cards[endIndex]:setTag(0);
            self:playEnemyAttackSound(beginIndex);
            local remainDamage = beginValue - endValue;
            local heroHP = self:getHeroHP();
            local txt_heroHP = node_cards[2]:getChildByName("card"):getChildByName("txt_value");
            if remainDamage >= heroHP then  
                txt_heroHP:setString("0/13");
                self:addHpEffect(-remainDamage);
                self:clear();
                -- img_scorebg:loadTexture("majia/img/imges_defeat.png");
                -- img_scorebg:setContentSize(cc.size(616,348));
                self:over()
                self:playSound("fail.mp3");
                print("GG");
            else 
                txt_heroHP:setString(""..(heroHP-remainDamage).."/13");
                self:addChangeEffect(endIndex,-endValue);
                self:addHpEffect(-remainDamage);
                card:removeFromParent();
                node_cards[beginIndex]:setTag(0);
                self:checkSendCard();
                utils:delayInvoke("checkpass",1,self:checkPass());
            end
        else
            local resValue = endValue - beginValue;
            local txt_value = endCard:getChildByName("txt_value");
            txt_value:setString(""..resValue);
            card:removeFromParent();
            node_cards[beginIndex]:setTag(0);
            self:addChangeEffect(endIndex,-beginValue);
            self:checkSendCard();
            utils:delayInvoke("checkpass",1,self:checkPass());
        end
        
        self:removeFromParent(snapCard);
    elseif action ==  actionType.ENEMY_ATTACK_WEAPON then
        local endCard = node_cards[endIndex]:getChildByName("card");
        card:setVisible(true);
        self:removeFromParent(snapCard);
        local tbeginIndex = endIndex;
        local tendIndex = beginIndex;

        local x = cardsbg[tendIndex]:getPositionX() - cardsbg[tbeginIndex]:getPositionX();
        local y = cardsbg[tendIndex]:getPositionY() - cardsbg[tbeginIndex]:getPositionY();
        local tCard = self:cloneCard(math.floor(endCard:getTag()/100),endCard:getTag()%100,self:getValue(endIndex));
        tCard:setPosition(cc.p(cardsbg[endIndex]:getPositionX(),cardsbg[endIndex]:getPositionY()));
        node_move:addChild(tCard);
        tCard:runAction(cc.Sequence:create(cc.MoveBy:create(0.5,cc.p(x,y)),cc.RemoveSelf:create(),cc.CallFunc:create(function ()
            local weaponDamage = self:getValue(endIndex);
            local enemyDamage = self:getValue(beginIndex);
            if weaponDamage >= enemyDamage then
                card:removeFromParent();
                node_cards[beginIndex]:setTag(0);
                if self:checkPass() then
                else
                    self:checkSendCard();
                end
            else
                self:setValue(beginIndex,enemyDamage - weaponDamage);
            end
            local weapon = node_cards[endIndex]:getChildByName("card");
            weapon:removeFromParent();
            node_cards[endIndex]:setTag(0);
             self:playSound("sword.mp3");
        end))); 
    elseif action ==  actionType.USER_TOOL then
        self:processTool(beginID,beginIndex,endIndex);
    end
    
end

--统计鼠标停留的时间
function ShejianGameScene:countInfoTime()
    local number = 0;
    if self.holdHandlers then 
		cc.Director:getInstance():getScheduler():unscheduleScriptEntry(self.holdHandlers)
		self.holdHandlers = nil;
	end
    self.holdHandlers = cc.Director:getInstance():getScheduler():scheduleScriptFunc(function()
        number = number + 1;
        if number == 2 then
            cc.Director:getInstance():getScheduler():unscheduleScriptEntry(self.holdHandlers)
		    self.holdHandlers = nil;
            self:showInfo();
        end
	end, 1,false);
end

--显示信息说明
function  ShejianGameScene:showInfo()
    if beginIndex == 2 then
        return;
    end
    local tag = node_cards[beginIndex]:getTag();
    local cardType = math.floor(tag/100);
    local index = tag%100;
    local typelist = {};
    if cardType == Type.DEFENSE then
        typelist = defense;
    elseif cardType == Type.WEAPON then
        typelist = weapon;
    elseif cardType == Type.ENEMY then
        typelist = enemy;
    elseif cardType == Type.MEDICINE then
        typelist = medicine;
    elseif cardType == Type.MONEY then
        typelist = money;
    elseif cardType == Type.TOOLS then
        typelist = tools;
    end
    txt_tip:setString(typelist[index].description);
    local x = 0;
    local y = 0;
    if beginIndex == 1 or beginIndex == 5 or beginIndex == 6 then
        x = cardsbg[beginIndex]:getPositionX() + cardsbg[beginIndex]:getContentSize().width/2;
        y = cardsbg[beginIndex]:getPositionY() + cardsbg[beginIndex]:getContentSize().height/2;
    elseif beginIndex == 3 or beginIndex == 4 or beginIndex == 7 or beginIndex == 8 then
        x = cardsbg[beginIndex]:getPositionX() - cardsbg[beginIndex]:getContentSize().width/2-368;
        y = cardsbg[beginIndex]:getPositionY() + cardsbg[beginIndex]:getContentSize().height/2;
    end
    img_infobg:setPosition(cc.p(x,y));
end

--移除信息说明
function ShejianGameScene:removeInfo()
    if self.holdHandlers then 
		cc.Director:getInstance():getScheduler():unscheduleScriptEntry(self.holdHandlers)
		self.holdHandlers = nil;
	end
    if img_infobg:getPositionX() ~= -800 then
       img_infobg:setPosition(cc.p(-800,img_infobg:getPositionY()));
    end
    
end

--从现有牌clone一张一摸一样的牌
function ShejianGameScene:cloneCard(cardType,index,value)
    local path = self:getTexture(cardType,index);
    local card = img_card:clone();
    local txt_value = card:getChildByName("txt_value");
    local size = card:getContentSize()
    txt_value:setPositionX(size.width)
    local txt_name = card:getChildByName("txt_name");
    card:loadTexture(path);
    if cardType == Type.HERO then
        txt_value:setString("13/13");
    elseif cardType == Type.TOOLS then
        txt_value:setString("");
    else
        txt_value:setString(""..value);
    end
    txt_name:setString(self:getName(cardType,index));
    card:setTag(cardType*100+index);
    card:setName("card");
    return card;
end

--是否点击了卡牌
function ShejianGameScene:getIndexByPos(x,y)
    for i=1,8 do
        if cc.rectContainsPoint(cardsbg[i]:getBoundingBox(),cardsbg[i]:getParent():convertToNodeSpace(cc.p(x,y))) then
            return i;
        end
    end
    if cc.rectContainsPoint(card_trash:getBoundingBox(),card_trash:getParent():convertToNodeSpace(cc.p(x,y))) then
        return 9;
    end
    return -1;
end

--是否要添加蒙版
function ShejianGameScene:addMaskForSnapCard()
    local beginType = math.floor(node_cards[beginIndex]:getTag()/100);
    if beginIndex == 1 or beginIndex == 3 then
        if beginType == Type.MEDICINE  or beginType == Type.MONEY then
            self:addMaskTo(snapCard);
        end
    elseif beginIndex == 4 then
        if beginType == Type.MONEY then
            self:addMaskTo(snapCard);
        end
    end
end

--给牌添加节点
function ShejianGameScene:addMaskTo(card)
    local mask = ccui.ImageView:create("majia/img/scorePanel/mask.png");
    mask:setPosition(cc.p(card:getContentSize().width/2,card:getContentSize().height/2));
    card:addChild(mask);
end

--处理是否通过
function ShejianGameScene:checkPass()
    if remainNumber > 0 then
        return false;
    end
    if node_cards[5]:getTag() == 0 and node_cards[6]:getTag() == 0 and node_cards[7]:getTag() == 0 and node_cards[8]:getTag() == 0 and self:getHeroHP() >0 then
        self:clear();
        -- img_scorebg:loadTexture("majia/img/scorePanel/next.png");
        -- img_scorebg:setContentSize(cc.size(705,372));
        self:over()
        self:playSound("pass.mp3");
        return true;
    end
    return false;
end

function ShejianGameScene:over()
    local over = require("logic.views.GameOver.Enter").new()
    self:addChild(over)
end

--处理发牌
function  ShejianGameScene:checkSendCard()
    local sum = 0;
    for i=5,8 do
        if node_cards[i]:getTag() == 0 then
            sum = sum + 1;
        end
    end
    if sum == 3 then
        utils:delayInvoke("sendCard",0.8,self:sendCard());
    end
end

--获取第几个节点的牌
function  ShejianGameScene:getCard(index)
    return node_cards[index]:getChildByName("card");
end

--是否能够发生战争或者移动
function ShejianGameScene:canFightOrMove(beginIndex,endIndex)
    --没有选取对象,不能发生战争或移动
    if beginIndex ==-1 or endIndex == -1 or beginIndex == endIndex then 
        self:playSound("invalid.mp3");
        return false;
    end
    --都在发牌栏，不能发生战争或移动
    if beginIndex >4 and endIndex >4 then 
        self:playSound("invalid.mp3");
        return false;
    end
    local beginType = math.floor(node_cards[beginIndex]:getTag()/100);
    local beginID = node_cards[beginIndex]:getTag()%100;
    local endType = math.floor(node_cards[endIndex]:getTag()/100);
    -- 如果是武器或者护盾
    if beginType == Type.WEAPON or beginType == Type.DEFENSE then 
        if beginIndex >4 then
            --如果武器或者护盾在发牌栏,并且1,3,4号位为空的时候可以放置 
            if (endIndex == 1 and node_cards[1]:getTag() == 0) or  (endIndex == 3 and node_cards[3]:getTag() == 0) or (endIndex == 4 and  node_cards[4]:getTag() == 0) then 
                return true,actionType.MOVE;
            end
        elseif beginIndex == 4 then
            --背包的东西只能放在空的1号3号位
            if (endIndex == 1 and node_cards[1]:getTag() == 0) or (endIndex == 3 and node_cards[3]:getTag() == 0) then 
                return true,actionType.MOVE;
            end
        elseif beginIndex == 1 or beginIndex == 3 then
            -- 1号3号位的武器只能去杀发牌栏的敌人
            if (beginType == Type.WEAPON  and endIndex >4 and endType == Type.ENEMY) then 
                return true,actionType.WEAPON_ATTACK_ENEMY;
            end
        end
    --如果是敌人
    elseif beginType == Type.ENEMY then 
        --攻击英雄
        if endIndex == 2 then 
            return true,actionType.ENEMY_ATTACK_HERO;
        elseif (endIndex == 1 or endIndex == 3) then
            ----可以将敌人拉到武器上 
            if endType == Type.WEAPON then 
                return true,actionType.ENEMY_ATTACK_WEAPON;
            --可以将敌人拉到护盾上
            elseif endType == Type.DEFENSE then 
                return true,actionType.ENEMY_ATTACK_DEFENSE;
            end
        end
     -- 如果是药水
    elseif beginType == Type.MEDICINE then
        --当药水在发牌栏 
        if beginIndex > 4 then 
            --此时药水可以放置1号空位，2号空位，3号空位
            if (endIndex == 1 and node_cards[1]:getTag() == 0) or (endIndex == 3 and node_cards[3]:getTag() == 0) or (endIndex == 4 and node_cards[4]:getTag() == 0) then 
                return true,actionType.MOVE;
            end
        --当药水在背包
        elseif beginIndex == 4 then
            --此时只能放置在1号空位，3号空位 
            if (endIndex == 1 and node_cards[1]:getTag() == 0) or (endIndex == 3 and node_cards[3]:getTag() == 0) then 
                return true,actionType.MOVE;
            end
        end
    --如果是金币 
    elseif beginType == Type.MONEY then
        if beginIndex > 4 then
            if (endIndex == 1 and node_cards[1]:getTag() == 0) or (endIndex == 3 and node_cards[3]:getTag() == 0) or (endIndex == 4 and node_cards[4]:getTag() == 0) then
                return true,actionType.MOVE;
            end
        end
    -- 如果是道具
    elseif beginType == Type.TOOLS then
        --道具在发牌栏 
        if beginIndex > 4 then
            --此时药水可以放置1号空位，2号空位，3号空位 
            if (endIndex == 1 and node_cards[1]:getTag() == 0) or (endIndex == 3 and node_cards[3]:getTag() == 0) or (endIndex == 4 and node_cards[4]:getTag() == 0) then 
                return true,actionType.MOVE;
            end
        --道具在背包
        elseif beginIndex == 4 then
            --此时只能放置在1号空位，3号空位 
            if (endIndex == 1 and node_cards[1]:getTag() == 0) or (endIndex == 3 and node_cards[3]:getTag() == 0) then 
                return true,actionType.MOVE;
            end
        --道具在1号位或者3号位
        elseif beginIndex == 1 or beginIndex == 3 then
            --消失：发牌栏的卡牌全部消失，再重新发4张 
            if beginID == 1 then
                --只能对自己英雄使用 
                if endIndex == 2 then 
                   return true,actionType.USER_TOOL;
                end
            --退回：指定回退发牌栏的任意一张牌，这张放在最后一张
            elseif beginID == 2 then 
                if endIndex > 4 and node_cards[endIndex]:getTag() ~= 0 then
                    return true,actionType.USER_TOOL;
                end
            --药水转化：可以将出敌人类型以外任意一张非2号位非4号位卡牌随机转换成一个药水卡牌
            elseif beginID == 3 then 
                if endIndex ~=2 and endIndex ~= 4 and node_cards[endIndex]:getTag() ~= 0 and endType ~= Type.ENEMY then
                    if (endIndex == 1 or endIndex == 3) and (endType == Type.MEDICINE or endType.MONEY) then
                        self:playSound("invalid.mp3");
                        return false;
                    end
                    return true,actionType.USER_TOOL;
                end
            --献祭：只能针对敌人，将英雄失去的hp作为伤害攻击敌方
            elseif beginID == 4 then 
                if endIndex >4 and endType == Type.ENEMY then
                    return true,actionType.USER_TOOL;
                end
            --水蛭：只能针对敌人，吸取敌人当前的hp加给自己
            elseif beginID == 5 then 
                if endIndex >4 and endType == Type.ENEMY then
                    return true,actionType.USER_TOOL;
                end
            end
        end   
    end
    self:playSound("invalid.mp3");
    return false;
end

--获得卡牌当前值
function ShejianGameScene:getValue(index)
    if math.floor(node_cards[index]:getTag()/100) == Type.TOOLS then
        return 0;
    end
    local card = self:getCard(index);
    if card == nil then
        return 0;
    end
    local txt_value = card:getChildByName("txt_value");
    local str_value = txt_value:getString();
    return tonumber(str_value);
end

--设置value
function ShejianGameScene:setValue(index,value)
    if math.floor(node_cards[index]:getTag()/100) == Type.TOOLS then
        return ;
    end
    local card = self:getCard(index);
    if card == nil then
        return ;
    end
    local txt_value = card:getChildByName("txt_value");
    txt_value:setString(""..value);
end

--获得英雄的HP
function ShejianGameScene:getHeroHP()
    local card = node_cards[2]:getChildByName("card");
    local txt_value = card:getChildByName("txt_value");
    local str = txt_value:getString();
    local index = string.find(str,"/");
    local resStr =string.sub(str,1,index - 1);
    local number = tonumber(resStr);
    return number;
end

--设置英雄的HP
function ShejianGameScene:setHeroHP(hp)
    local card = node_cards[2]:getChildByName("card");
    local txt_value = card:getChildByName("txt_value");
    txt_value:setString(""..hp.."/13");
    local card = node_cards[2]:getChildByName("card");
    card:loadTexture(self:getTexture(Type.HERO));
end

--获得英雄的金币
function ShejianGameScene:getHeroGold()
    local card = node_cards[2]:getChildByName("card");
    local txt_value = card:getChildByName("txt_gold");
    local str = txt_value:getString();
    local number = tonumber(str);
    return number;
end

--设置英雄的金币
function ShejianGameScene:setHeroGold(gold)
    local card = node_cards[2]:getChildByName("card");
    local txt_value = card:getChildByName("txt_gold");
    txt_value:setString(""..gold);
end

--带渐变删除
function ShejianGameScene:removeFromParent(widget)
    widget:runAction(cc.Sequence:create(
        cc.FadeOut:create(0.2),
        cc.RemoveSelf:create(),
        cc.CallFunc:create(function ()
            widget = nil;
        end)
    ));
end

-----------------------------分数界面-----------------------
function  ShejianGameScene:initScorePanel()
    img_scorebg = ScorePanel:getChildByName("bg");
    local scoreCloseBtn = ScorePanel:getChildByName("close");
    if scoreCloseBtn then
		scoreCloseBtn:onClick(function( ... )
            GamePanel:setVisible(false);
			ScorePanel:setVisible(false);
            StartPanel:setVisible(true);
		end)
	end
    local scoreReplayBtn = ScorePanel:getChildByName("btn_reset");
    if scoreReplayBtn then
		scoreReplayBtn:onClick(function( ... )
            ScorePanel:setVisible(false);
            self:startGame();
		end)
	end
    local scoreLeaveBtn = ScorePanel:getChildByName("btn_leave");
    if scoreLeaveBtn then
		scoreLeaveBtn:onClick(function( ... )
            GamePanel:setVisible(false);
            ScorePanel:setVisible(false);
            StartPanel:setVisible(true);
		end)
	end
end

-----------------------------大厅界面-----------------------
function  ShejianGameScene:initStartPanel()
    --帮助
    local startHelpBtn = StartPanel:getChildByName("btn_help")
	if startHelpBtn then
        startHelpBtn:onClick(function(...)
            HelpPanelEX:setVisible(true)
            self:showHelp();
            
		end)
    end

    local startPlayBtn = StartPanel:getChildByName("btn_play")
    local startPlayBtnEX = StartPanel:getChildByName("btn_playEX")
    local startPlayBtnEXX = StartPanel:getChildByName("btn_playEXX")
	if startPlayBtn then
		startPlayBtn:onClick(function( ... )
            StartPanel:setVisible(false);
            GamePanel:setVisible(true);
            self.model = 1;
            self:startGame();
            
		end)
	end

    if startPlayBtnEX then
		startPlayBtnEX:onClick(function( ... )
            local gold = cc.UserDefault:getInstance():getIntegerForKey("gold",1);
            if gold > 10000 then
                StartPanel:setVisible(false);
                GamePanel:setVisible(true);
                self.model = 2;
                self:startGame();
            else
                toastLayer:show("Gold coins greater than 60,000 to enter!")
            end
		end)
	end

    if startPlayBtnEXX then
		startPlayBtnEXX:onClick(function( ... )
            local gold = cc.UserDefault:getInstance():getIntegerForKey("gold",1);
            if gold > 20000 then
                StartPanel:setVisible(false);
                GamePanel:setVisible(true);
                self.model = 3;
                self:startGame();
            else
                toastLayer:show("Gold coins greater than 100,000 to enter!")
            end
		end)
    end
    
    local textArray = {}
    local txt_play = startPlayBtn:getChildByName("txt_play")
    local txt_playEX = startPlayBtnEX:getChildByName("txt_playEX")
    local txt_playEXX = startPlayBtnEXX:getChildByName("txt_playEXX")
    local txt_help = StartPanel:getChildByName("txt_help")
    local txt_web = StartPanel:getChildByName("txt_web")
    local txt_tec = StartPanel:getChildByName("txt_tec")

    table.insert(textArray,txt_play)
    table.insert(textArray,txt_playEX)
    table.insert(textArray,txt_playEXX)
    table.insert(textArray,txt_help)
    table.insert(textArray,txt_web)
    table.insert(textArray,txt_tec)
    self:fontColorRoodom(textArray)
end

function ShejianGameScene:fontColorRoodom(fontChangeArr)
    for key, v in pairs(fontChangeArr or {}) do
        local widget = v
        if widget and widget.setTextColor and type(widget.setTextColor) == "function" then
            widget:setTextColor(fontcolor)
        elseif widget and widget.setTitleColor and type(widget.setTitleColor) == "function"  then
            widget:setTitleColor(fontcolor)
        end
    end
end

--播放背景音乐
function ShejianGameScene:playMusic(path)
    if musicSwitch then
        PLAY_MUSIC(path);
    end
end

--点击声音开关
function  ShejianGameScene:onSound()
    soundSwitch = not soundSwitch;
    if soundSwitch then
        PLAY_MUSIC("majia/sound/bg.mp3");
        btn_sound:loadTextures("majia/img/startPanel/btn_music.png","","");
        btn_gamepanel_sound:loadTextures("majia/img/startPanel/btn_music.png","","");
    else
        STOP_MUSIC("majia/sound/bg.mp3");
        btn_sound:loadTextures("majia/img/startPanel/btn_music1.png","","");
        btn_gamepanel_sound:loadTextures("majia/img/startPanel/btn_music1.png","","");
    end
    cc.UserDefault:getInstance():setBoolForKey("soundSwitch",soundSwitch);
end

--敌人攻击声音
function ShejianGameScene:playEnemyAttackSound(index)
    if index == 9 or index == 6 or index == 7 or index == 2  then
        self:playSound("sword.mp3");
    else
        self:playSound("force.mp3");

    end
end
-----------------------------游戏逻辑----------------------

--开始游戏
function ShejianGameScene:startGame()
    if self.model == 1 then
        self:easyConfig();
    elseif self.model == 2 then
        self:normalConfig();
    elseif self.model == 3 then
        self:highConfig();
    end

    self:playSound("gamestart.mp3");
    self:showHero();
    utils:delayInvoke("showCard",1,self:sendCard());
end

--显示英雄
function ShejianGameScene:showHero()
    local card = img_card:clone();
    local path = self:getHeroTextureIndex(13);
    card:loadTexture(path);
    local txt_value = card:getChildByName("txt_value");
    txt_value:setPosition(cc.p(txt_value:getPositionX()-20,txt_value:getPositionY()));
    txt_value:setString("13/13");
    local txt_name = card:getChildByName("txt_name");
    txt_name:setAnchorPoint(cc.p(0,0.5));
    txt_name:setString("$:");
    txt_name:setTextColor(cc.c3b(255,255,0));
    txt_name:setPosition(cc.p(20,txt_name:getPositionY()));
    local txt_gold = txt_name:clone();
    txt_gold:setName("txt_gold");
    txt_gold:setAnchorPoint(cc.p(0,0.5));
    txt_gold:setPosition(cc.p(40,txt_name:getPositionY()));
    local gold_value = cc.UserDefault:getInstance():getIntegerForKey("gold",1);
    txt_gold:setString(""..gold_value);
    txt_gold:setTextColor(cc.c3b(255,255,0));
    txt_name:getParent():addChild(txt_gold);

    card:setName("card");
    card:setPosition(cc.p(300,-200));
    card:setRotation(-45);
    self:addChild(card,100);
    card:runAction(cc.Sequence:create(
        cc.Spawn:create(
            cc.RotateTo:create(0.5,0),
            cc.MoveTo:create(0.5,cc.p(cardsbg[2]:getPositionX(),cardsbg[2]:getPositionY()))),
            cc.CallFunc:create(function ()
                card:removeFromParent();
                card:setPosition(cc.p(0,0));
                node_cards[2]:addChild(card);
            end)
        )
    );
end

--发牌
function ShejianGameScene:sendCard()
    if remainNumber ==0 then
        return;
    end
    self:clearMedicineAndMoney(1);
    self:clearMedicineAndMoney(3);
    canDraw = false;
    local sum = 0;
    for i=5,8 do
        if node_cards[i]:getTag() == 0 then
            card_send:runAction(cc.Sequence:create(
                cc.DelayTime:create(0.5*sum),
                cc.CallFunc:create(function ()
                    local card = self:createCard(cardSet[remainNumber].typeIndex,cardSet[remainNumber].index);
                    remainNumber = remainNumber -1;
                    txt_remain:setString(""..remainNumber);
                    card:setScale(0.1);
                    card:setPosition(cc.p(card_send:getPositionX() + (display.width - 1136)/2,card_send:getPositionY()));
                    self:addChild(card,100);
                    self:playSound("sendcard.mp3");
                    card:runAction(cc.Sequence:create(
                        cc.Spawn:create(
                        cc.ScaleTo:create(0.5,1),
                        cc.MoveTo:create(0.5,cc.p(cardsbg[i]:getPositionX(),cardsbg[i]:getPositionY()))),
                        cc.CallFunc:create(function ()
                            card:removeFromParent();
                            card:setPosition(cc.p(0,0));
                            node_cards[i]:addChild(card);
                            node_cards[i]:setTag(card:getTag());
                            if node_cards[5]:getTag() ~= 0  and node_cards[6]:getTag() ~= 0  and node_cards[7]:getTag() ~= 0  and node_cards[8]:getTag() ~= 0  then
                                canDraw = true;
                            end
                        end))
                    );
                end)
            ));
            sum = sum + 1;
            if remainNumber - sum == 0 then
                canDraw = true;
                return;
            end
        end
    end
end

--加金币特效
function ShejianGameScene:addGoldEffect(number)
    local label = nil;
    local x = cardsbg[2]:getPositionX();
    local y = cardsbg[2]:getPositionY();
    label = cc.Label:createWithTTF("+"..number, "majia/font555.ttf", 32);
    label:setColor(cc.c3b(255,255,0));
	label:setAnchorPoint(cc.p(0.5,0.5));
    label:setPosition(cc.p(x,y));
    node_effect:addChild(label);
    label:runAction(cc.Sequence:create(cc.MoveBy:create(0.5,cc.p(0,50)),cc.DelayTime:create(0.5),cc.RemoveSelf:create()));
end

--飘字特效
function ShejianGameScene:addFloatEffect(x,y,number)
    local label = nil;
    if number < 0 then
        label = cc.Label:createWithTTF(""..number, "majia/font555.ttf", 32);
        label:setColor(cc.c3b(255,0,0));
    elseif number > 0 then
        label = cc.Label:createWithTTF("+"..number, "majia/font555.ttf", 32);
        label:setColor(cc.c3b(0,255,0));
    else
        label = cc.Label:createWithTTF("0", "majia/font555.ttf", 32);
        label:setColor(cc.c3b(255,255,0));
    end
	label:setAnchorPoint(cc.p(0.5,0.5));
    label:setPosition(cc.p(x,y));
    node_effect:addChild(label);
    label:runAction(cc.Sequence:create(cc.MoveBy:create(0.5,cc.p(0,50)),cc.DelayTime:create(0.5),cc.RemoveSelf:create()));
end

--加减血特效
function ShejianGameScene:addHpEffect(number)
    self:addChangeEffect(2,number);
    if number< 0 then
        cardsbg[2]:setScale(1.2);
        cardsbg[2]:runAction(cc.EaseElasticOut:create(cc.ScaleTo:create(0.5,1)));
    end
end

--数字改变特效
function ShejianGameScene:addChangeEffect(index,number)
    local x = cardsbg[index]:getPositionX();
    local y = cardsbg[index]:getPositionY();
    self:addFloatEffect(x,y,number);    
end

-----------------------------游戏界面-----------------------
--游戏界面初始化
function ShejianGameScene:initGamePanel()
    card_send = GamePanel:getChildByName("img_cardsend");
    txt_remain = card_send:getChildByName("txt_remain");
    card_trash = GamePanel:getChildByName("img_cardtrash");
    cardsbg ={};
    node_cards = {};
    for i=1,8 do
        cardsbg[i] = GamePanel:getChildByName("img_cardbg"..i);
        node_cards[i] = cardsbg[i]:getChildByName("node_card");
        node_cards[i]:setTag(0);
    end
    node_move = GamePanel:getChildByName("node_move");
    node_effect = GamePanel:getChildByName("node_effect");
    img_infobg = node_effect:getChildByName("img_infobg");
    txt_tip = img_infobg:getChildByName("txt_tip");

    local gameCloseBtn = GamePanel:getChildByName("btn_return")   
	if gameCloseBtn then
		gameCloseBtn:onClick(function( ... )
            GamePanel:setVisible(false);
            StartPanel:setVisible(true);
		end)
	end
end

--清理本轮指定位置已经使用的药水和金币
function ShejianGameScene:clearMedicineAndMoney(index)
    local tag = node_cards[index]:getTag();
    if math.floor(tag/100) == Type.MEDICINE or math.floor(tag/100) == Type.MONEY then
        node_cards[index]:removeAllChildren();
        node_cards[index]:setTag(0);
    end
end

--游戏通过后清除数据
function ShejianGameScene:clear()
    remainNumber = 54;
    txt_remain:setString(""..remainNumber);
    cc.UserDefault:getInstance():setIntegerForKey("gold",self:getHeroGold());
    for i = 1,8 do
        node_cards[i]:removeAllChildren();
        node_cards[i]:setTag(0);
    end
end

-----------------------------道具处理-------------------------
--道具处理函数
function ShejianGameScene:processTool(index,beginIndex,endIndex)
    if index == 1 then --处理消失
        self:processDisappear(beginIndex,endIndex);
    elseif index == 2 then --处理回退
        self:processBack(beginIndex,endIndex);
    elseif index == 3 then --处理药水转化
        self:processConvert(beginIndex,endIndex);
    elseif index == 4 then --处理献祭
        self:processSacrifice(beginIndex,endIndex);
    elseif index == 5 then --处理水蛭
        self:processLeech(beginIndex,endIndex);
    end
end

--处理消失
function ShejianGameScene:processDisappear(beginIndex,endIndex)
    local card = node_cards[beginIndex]:getChildByName("card");
    card:removeFromParent();
    node_cards[beginIndex]:setTag(0);
    self:removeFromParent(snapCard);
    for i= 5,8 do
        if node_cards[i]:getTag() ~= 0 then
            local card = node_cards[i]:getChildByName("card");
            local x = card_trash:getPositionX() - cardsbg[i]:getPositionX();
            local y = card_trash:getPositionY() - cardsbg[i]:getPositionY();
            card:runAction(cc.Sequence:create(
                cc.DelayTime:create(0.5),
                cc.CallFunc:create(function ()
                    if i == 5 then
                        self:playSound("disappear.mp3");
                    end
                end),
                cc.Spawn:create(
                    cc.ScaleTo:create(0.5,0.1),
                    cc.MoveBy:create(0.5,cc.p(x,y))
                ),
                cc.CallFunc:create(function ()
                    card:removeFromParent();
                    node_cards[i]:setTag(0);
                    if node_cards[5]:getTag() == 0 and node_cards[6]:getTag() == 0 and node_cards[7]:getTag() == 0 and node_cards[8]:getTag() == 0 then
                        if self:checkPass() then
                        else
                            self:sendCard();
                        end
                        return;
                    end
                end)
            ));
        end
    end
end

--处理回退
function ShejianGameScene:processBack(beginIndex,endIndex)
    local card = node_cards[beginIndex]:getChildByName("card");
    card:removeFromParent();
    node_cards[beginIndex]:setTag(0);
    self:removeFromParent(snapCard);
    local endCard = node_cards[endIndex]:getChildByName("card");
    local x = card_trash:getPositionX() - cardsbg[endIndex]:getPositionX();
    local y = card_trash:getPositionY() - cardsbg[endIndex]:getPositionY();
    endCard:runAction(cc.Sequence:create(
        cc.DelayTime:create(0.5),
        cc.CallFunc:create(function ()
            self:playSound("disappear.mp3");
        end),
        cc.Spawn:create(
            cc.ScaleTo:create(0.5,0.1),
            cc.MoveBy:create(0.5,cc.p(x,y))
        ),
        cc.CallFunc:create(function ()
            endCard:removeFromParent();
            node_cards[endIndex]:setTag(0);
            if self:checkPass() then
            else
                self:checkSendCard();
            end
        end)
    ));
end

--处理药水转化
function ShejianGameScene:processConvert(beginIndex,endIndex)
    local card = node_cards[beginIndex]:getChildByName("card");
    card:removeFromParent();
    node_cards[beginIndex]:setTag(0);
    self:removeFromParent(snapCard);
    local endCard = node_cards[endIndex]:getChildByName("card");
    node_cards[endIndex]:removeAllChildren();
    node_cards[endIndex]:setTag(0);
    local rindex = math.random(1,2);
    local medicineCard = self:createCard(Type.MEDICINE,rindex);
    medicineCard:setPosition(cc.p(0,0));
    node_cards[endIndex]:addChild(medicineCard);
    node_cards[endIndex]:setTag(medicineCard:getTag());
    self:playSound("convert.mp3");
    local value = self:getValue(endIndex);
    if endIndex == 1 or endIndex == 3 then
        local mask = ccui.ImageView:create("majia/img/gamePanel/mask.png");
        mask:setPosition(cc.p(medicineCard:getContentSize().width/2,medicineCard:getContentSize().height/2));
        medicineCard:addChild(mask);
        local heroHP= self:getHeroHP();
        heroHP = heroHP + value;
        if heroHP >13 then
            heroHP = 13;
        end
        self:getHeroHP(heroHP);
        self:addHpEffect(value);
    end
end

--处理献祭
function ShejianGameScene:processSacrifice(beginIndex,endIndex)
    local card = node_cards[beginIndex]:getChildByName("card");
    card:removeFromParent();
    node_cards[beginIndex]:setTag(0);
    self:removeFromParent(snapCard);
    local damage = 13 - self:getHeroHP();
    local endCard = node_cards[endIndex]:getChildByName("card");
    local value = self:getValue(endIndex);
    if damage >= value then
        endCard:removeFromParent();
        node_cards[endIndex]:setTag(0);
        if self:checkPass() then
        else
            self:checkSendCard();
        end
    else
        value = value - damage;
        self:setValue(endIndex, value);
    end
    self:playSound("sword.mp3");
    self:addChangeEffect(endIndex,-damage);
end

--处理水蛭
function ShejianGameScene:processLeech(beginIndex,endIndex)
    self:playSound("suck.mp3");
    local card = node_cards[beginIndex]:getChildByName("card");
    card:removeFromParent();
    node_cards[beginIndex]:setTag(0);
    self:removeFromParent(snapCard);
    local value = self:getValue(endIndex);
    local heroHP = self:getHeroHP();
    heroHP = heroHP + value;
    if heroHP > 13 then
        heroHP = 13;
    end
    self:setHeroHP(heroHP);
    self:addHpEffect(value);
end

-----------------------------帮助界面------------------------
--绑定帮助界面(EX)控件
function ShejianGameScene:initHelpPanelEX()
    ex_btn_mask = HelpPanelEX:getChildByName("btn_mask");
    ex_card_send = HelpPanelEX:getChildByName("img_cardsend");
    ex_txt_remain = ex_card_send:getChildByName("txt_remain");
    ex_card_trash = HelpPanelEX:getChildByName("img_cardtrash");
    ex_node_move = HelpPanelEX:getChildByName("node_move");
    ex_node_effect = HelpPanelEX:getChildByName("node_effect");
    ex_cardsbg ={};
    ex_node_cards = {};
    for i=1,8 do
        ex_cardsbg[i] = HelpPanelEX:getChildByName("img_cardbg"..i);
        ex_node_cards[i] = ex_cardsbg[i]:getChildByName("node_card");
    end

    ex_btn_mask:onClick(function(...)
        helpStep = helpStep + 1;
        if helpStep <= 12 then
            self:showStep(helpStep);
        else
            self:removeClip();
            if self.label then
                self.label:removeFromParent();
                self.label = nil;
            end
            if self.label2 then
                self.label2:removeFromParent();
                self.label2 = nil;
            end
            self:addClip("majia/img/gamePanel/mask2.png")
            self:showStep(helpStep);
        end
    end);
end

--进入帮助引导
function ShejianGameScene:showHelp()
    ex_btn_mask:setTouchEnabled(false);
    self:sendCardEX();
end

--显示帮助
function ShejianGameScene:showStep(step)
    ex_btn_mask:setTouchEnabled(false);
    if self.tip then
        self.tip:removeFromParent();
        self.tip = nil;
    end
    if step == 1 then
        self:setClipPosition(ex_cardsbg[5]:getPositionX(),ex_cardsbg[5]:getPositionY());
        self:setArrowPosition(ex_cardsbg[5]:getPositionX()-95,ex_cardsbg[5]:getPositionY() + 120);
        self:addTextEffect("This sign indicates that this is an enemy card.",nil,ex_card_send:getPositionX()-95,display.height - 150);
    elseif step == 2 then
        self:setArrowPosition(ex_cardsbg[5]:getPositionX()-20,ex_cardsbg[5]:getPositionY() + 120);
        self:addTextEffect("This value represents the enemy's health",nil,ex_card_send:getPositionX()- 95,display.height - 150);
    elseif step == 3 then
        self:setClipPosition(ex_cardsbg[6]:getPositionX(),ex_cardsbg[6]:getPositionY());
        self:setArrowPosition(ex_cardsbg[6]:getPositionX()-95,ex_cardsbg[6]:getPositionY() + 120);
        self:addTextEffect("This sign indicates that this is a weapon card.",nil,ex_card_send:getPositionX()-95,display.height - 150);
    elseif step == 4 then
        self:setArrowPosition(ex_cardsbg[6]:getPositionX()-20,ex_cardsbg[6]:getPositionY() + 120);
        self:addTextEffect("This value indicates the number of attack points of the weapon.",nil,ex_card_send:getPositionX()- 95,display.height - 150);
    elseif step == 5 then
        self:setClipPosition(ex_cardsbg[7]:getPositionX(),ex_cardsbg[7]:getPositionY());
        self:setArrowPosition(ex_cardsbg[7]:getPositionX()-95,ex_cardsbg[7]:getPositionY() + 120);
        self:addTextEffect("This sign indicates that this is a shield card.",nil,ex_card_send:getPositionX()-95,display.height - 150);
    elseif step == 6 then
        self:setArrowPosition(ex_cardsbg[7]:getPositionX()-20,ex_cardsbg[7]:getPositionY() + 120);
        self:addTextEffect("This value indicates the number of defense points of the shield.",nil,ex_card_send:getPositionX()- 95,display.height - 150);
    elseif step == 7 then
        self:setClipPosition(ex_cardsbg[8]:getPositionX(),ex_cardsbg[8]:getPositionY());
        self:setArrowPosition(ex_cardsbg[8]:getPositionX()-95,ex_cardsbg[8]:getPositionY() + 120);
        self:addTextEffect("This sign indicates that this is a potion card.",nil,ex_card_send:getPositionX()-95,display.height - 150);
    elseif step == 8 then
        self:setArrowPosition(ex_cardsbg[8]:getPositionX()-20,ex_cardsbg[8]:getPositionY() + 120);
        self:addTextEffect("This value indicates the value that can restore the hero's life.",nil,ex_card_send:getPositionX()- 95,display.height - 150);
    elseif step == 9 then
        self:setClipPosition(ex_cardsbg[2]:getPositionX(),ex_cardsbg[2]:getPositionY());
        self:setArrowPosition(ex_cardsbg[2]:getPositionX()-20,ex_cardsbg[2]:getPositionY() + 120);
        self:addTextEffect("Here is the hero's health.",nil,ex_card_send:getPositionX()- 95,display.height - 150);
    elseif step == 10 then
        self:setClipPosition(ex_cardsbg[1]:getPositionX(),ex_cardsbg[1]:getPositionY());
        self:setArrowPosition(ex_cardsbg[1]:getPositionX()-50,ex_cardsbg[1]:getPositionY() + 120);
        self:addTextEffect("This is the left equipment bar.",nil,ex_card_send:getPositionX()- 95,display.height - 150);
    elseif step == 11 then
        self:setClipPosition(ex_cardsbg[3]:getPositionX(),ex_cardsbg[1]:getPositionY());
        self:setArrowPosition(ex_cardsbg[3]:getPositionX()-50,ex_cardsbg[1]:getPositionY() + 120);
        self:addTextEffect("This is the right equipment bar.","These two equipment bars can be equipped with any card that is unexpected to the enemy.",ex_card_send:getPositionX()- 95,display.height - 150);
    elseif step == 12 then
        self:setClipPosition(ex_cardsbg[4]:getPositionX(),ex_cardsbg[1]:getPositionY());
        self:setArrowPosition(ex_cardsbg[4]:getPositionX()-50,ex_cardsbg[1]:getPositionY() + 120);
        local str = "Here is the backpack.Can temporarily equip any card except the enemy";
        local str2 = "The card in the backpack cannot be used unless it is moved to the equipment bar";
        self:addTextEffect(str,str2,ex_card_send:getPositionX()- 95,display.height - 150);
    elseif step == 13 then
        self:setClipPosition(display.width/2 + 50,display.height/2 - 150);
        local str = "Drag the weapon card to the equipment bar,Prepare to attack the enemy";
        self:addTextEffect(str,nil,ex_card_send:getPositionX()-95,display.height - 150);
        self:moveWeaponToEquipmentBar(0.5);
    elseif step == 14 then
        self:setClipPosition(display.width/2 + 50,display.height/2 - 150);
        local str = "Then the weapon can be dragged onto the enemy card to attack the enemy";
        self:addTextEffect(str,nil,ex_card_send:getPositionX()-95,display.height - 150);
        self:moveWeaponToKillEnemy(0.5);
    elseif step == 15 then
        self:setClipPosition(display.width/2 + 50,display.height/2 - 150);
        local str = "Drag the shield card to the equipment bar.";
        self:addTextEffect(str,nil,ex_card_send:getPositionX()-95,display.height - 150);
        self:moveDefenseToEquipmentBar(0.5);
    elseif step == 16 then
        self:setClipPosition(display.width/2 + 50,display.height/2 - 150);
        local str = "Drag the enemy card to the shield card.";
        local str2 = "The defense card will offset some of the enemy's attacks";
        self:addTextEffect(str,str2,ex_card_send:getPositionX()-95,display.height - 150);
        self:moveEnemyToShieldCard(0.5);
    elseif step == 17 then
        self:setClipPosition(display.width/2 + 50,display.height/2 - 150);
        local str = "When there is only one card left, the system will automatically issue a card";
        local str2 = "Every round will be like this, each round will be issued three cards until the card is finished";
        self:addTextEffect(str,str2,ex_card_send:getPositionX()-95,display.height - 150);
        self:sendThreeCardsMore();
    elseif step == 18 then
        self:setClipPosition(display.width/2 + 50,display.height/2 - 150);
        local str = "Drag the enemy card to the hero card.";
        local str2 = "This way the enemy will directly damage the hero";
        self:addTextEffect(str,str2,ex_card_send:getPositionX()-95,display.height - 150);
        self:moveEnemyToHeroCard(0.5);
    elseif step == 19 then
        self:setClipPosition(display.width/2 + 50,display.height/2 - 150);
        local str = "Drag the potion card to the equipment bar.";
        local str2 = "This will restore some of the hero's health";
        self:addTextEffect(str,str2,ex_card_send:getPositionX()-95,display.height - 150);
        self:moveMedicineToEquipmentBar(0.5);
    elseif step == 20 then
        self:setClipPosition(display.width/2 + 50,display.height/2 - 150);
        local str = "Drag the weapon card over the backpack to temporarily equip the weapon";
        local str2 = "But the weapon at this time is not usable";
        self:addTextEffect(str,str2,ex_card_send:getPositionX()-95,display.height - 150);
        self:moveWeaponToBackpack(0.5);
    elseif step == 21 then
        self:setClipPosition(display.width/2 + 50,display.height/2 - 150);
        local str = "At this time, there is only one card left on the table, and it is about to enter the next round of licensing.";
        local str2 = "So the system has to send three cards to supplement the cards on the table"
        self:addTextEffect(str,str2,ex_card_send:getPositionX()-95,display.height - 150);
        medicineCard:removeFromParent();
        self:sendThreeCardsMoreEx()
    elseif step == 22 then
        self:setClipPosition(display.width/2 + 50,display.height/2 - 150);
        local str = "Drag the weapon from the backpack to the equipment bar.";
        local str2 = "At this time the weapon can be used.";
        self:addTextEffect(str,str2,ex_card_send:getPositionX()-95,display.height - 150);
        self:moveWeaponToEquipmentBar(0.5);
    elseif step == 23 then
        self:setClipPosition(display.width/2 + 50,display.height/2 - 150);
        local str = "Kill another enemy";
        self:addTextEffect(str,nil,ex_card_send:getPositionX()-95,display.height - 150);
        self:moveWeaponToEnemyEX(0.5);
    elseif step == 24 then
        self:setClipPosition(display.width/2 + 50,display.height/2 - 150);
        local str = "This sign indicates that this is a tool card,each card has a different function";
        local str2 = "The objects of action are also different,press the card for 2 seconds to see the detailed usage"
        self:addTextEffect(str,str2,ex_card_send:getPositionX()-95,display.height - 150);
        self:setArrowPosition(ex_cardsbg[5]:getPositionX()-95,ex_cardsbg[5]:getPositionY() + 120);
    elseif step == 25 then
        self:setClipPosition(display.width/2 + 50,display.height/2 - 150);
        local str = "You can also throw unwanted cards into the trash can and throw them away.";
        self:addTextEffect(str,nil,ex_card_send:getPositionX()-95,display.height - 150);
        self:throwAway(0.5);
    elseif step == 26 then
        self:setClipPosition(display.width/2 + 50,display.height/2 - 150);
        local str = "This sign indicates that this is a gold coin card";
        self:addTextEffect(str,nil,ex_card_send:getPositionX()-95,display.height - 150);
        self:setArrowPosition(ex_cardsbg[6]:getPositionX()-95,ex_cardsbg[6]:getPositionY() + 120);
    elseif step == 27 then
        self:setClipPosition(display.width/2 + 50,display.height/2 - 150);
        local str = "Drag to the equipment bar to increase the hero's gold coin"
        self:addTextEffect(str,nil,ex_card_send:getPositionX()-95,display.height - 150);
        self:moveMoneyCardToEquipmentBar(0.5);
    elseif step == 28 then
        self:clearHelpEX();
        HelpPanelEX:setVisible(false);
    end
end

--增加一个ClipNode
function  ShejianGameScene:addClip(stencilPath)
    local stencil = cc.Node:create()
    spriteBall = cc.Sprite:create(stencilPath)
    spriteBall:setPosition(cc.p(display.width/2,display.height/2))
	stencil:addChild(spriteBall)
    self.clipNode = cc.ClippingNode:create()
    self.clipNode:setStencil(stencil)
    self:addChild(self.clipNode)

    maskLayer = cc.LayerColor:create(cc.c4b(0,0,0,220));
    self.clipNode:addChild(maskLayer);
    hand = cc.Sprite:create("majia/img/helpPanel/arrow.png");
    hand:setPosition(display.width/2,display.height/2);
    local fadeout = cc.FadeOut:create(0.5);
    local fadein = cc.FadeIn:create(0.5);
    hand:runAction(cc.RepeatForever:create(cc.Sequence:create(fadeout,fadein)));
    maskLayer:addChild(hand);

    self.helpex_exit = ccui.Button:create();
    self.helpex_exit:loadTextures("majia/img/startPanel/btn_bg.png","","");
    self.helpex_exit:setPosition(cc.p(1021 + (display.width - 1136)/2 , 596));
    self:addChild(self.helpex_exit);

    local helpex_exit_label = cc.Label:createWithTTF("Exit", "majia/font555.ttf", 36);
    helpex_exit_label:setAnchorPoint(cc.p(0.5,0.5));
    helpex_exit_label:setColor(cc.c3b(255,255,255));
    helpex_exit_label:setPosition(cc.p(self.helpex_exit:getContentSize().width/2,self.helpex_exit:getContentSize().height/2));
    self.helpex_exit:addChild(helpex_exit_label);
    self.helpex_exit:onClick(function (...)
        self:clearHelpEX();
        HelpPanelEX:setVisible(false);   
    end); 
    self.clipNode:setInverted(true);
    self.clipNode:setAlphaThreshold(0.05);
end

--删除Clip
function ShejianGameScene:removeClip()
    if self.clipNode then
        self.clipNode:removeFromParent();
        self.clipNode = nil;
    end

    if self.helpex_exit then
        self.helpex_exit:removeFromParent();
        self.helpex_exit = nil;
    end
end

--清除帮助面板里的所有内容
function ShejianGameScene:clearHelpEX()
    self:removeClip();
    helpStep = 0;
    if self.helpex_exit then
        self:removeChild(self.helpex_exit);
        self.helpex_exit = nil;
    end
    if self.tip then
        self.tip:removeFromParent();
        self.tip = nil;
    end

     if self.label ~= nil then
        self.label:removeFromParent();
        self.label = nil;
    end
    if self.label2 ~= nil then
        self.label2:removeFromParent();
        self.label2 = nil;
    end
    for i = 1,8 do
        ex_node_cards[i]:removeAllChildren();
    end
    ex_node_move:removeAllChildren();
end

--发牌
function ShejianGameScene:sendCardEX()
    --增加英雄
    self:showHeroEX();
    --药品牌
    medicineCard = self:createCard(Type.MEDICINE,1);
    medicineCard:setPosition(cc.p(ex_card_send:getPositionX(),ex_card_send:getPositionY()));
    ex_node_move:addChild(medicineCard);

    --防御牌
    defenseCard = self:createCard(Type.DEFENSE,1);
    defenseCard:setPosition(cc.p(ex_card_send:getPositionX(),ex_card_send:getPositionY()));
    ex_node_move:addChild(defenseCard);

    --武器牌
    weaponCard = self:createCard(Type.WEAPON,1);
    weaponCard:setPosition(cc.p(ex_card_send:getPositionX(),ex_card_send:getPositionY()));
    ex_node_move:addChild(weaponCard);

    --敌人牌
    enemyCard = self:createCard(Type.ENEMY,1);
    enemyCard:setPosition(cc.p(ex_card_send:getPositionX(),ex_card_send:getPositionY()));
    ex_node_move:addChild(enemyCard);

    enemyCard:runAction(cc.MoveTo:create(0.5,cc.p(ex_cardsbg[5]:getPositionX(),ex_cardsbg[5]:getPositionY())));
    weaponCard:runAction(cc.Sequence:create(cc.DelayTime:create(0.5),cc.CallFunc:create(function ()
        weaponCard:setZOrder(1);
    end),cc.MoveTo:create(0.5,cc.p(ex_cardsbg[6]:getPositionX(),ex_cardsbg[6]:getPositionY()))));
    defenseCard:runAction(cc.Sequence:create(cc.DelayTime:create(1),cc.CallFunc:create(function ()
        defenseCard:setZOrder(2);
    end),cc.MoveTo:create(0.5,cc.p(ex_cardsbg[7]:getPositionX(),ex_cardsbg[7]:getPositionY()))));
    medicineCard:runAction(cc.Sequence:create(cc.DelayTime:create(1.5),cc.CallFunc:create(function ()
        medicineCard:setZOrder(3);
    end),cc.MoveTo:create(0.5,cc.p(ex_cardsbg[8]:getPositionX(),ex_cardsbg[8]:getPositionY())),cc.CallFunc:create(function ()
        self:addClip("majia/img/gamePanel/mask.png");
        helpStep = helpStep + 1;
        self:showStep(helpStep);
    end)));     
end

--创建一张牌
function ShejianGameScene:createCard(cardType,index)
    local path = self:getTexture(cardType,index);
    local card = img_card:clone();
    local txt_value = card:getChildByName("txt_value");
    local txt_name = card:getChildByName("txt_name");
    card:loadTexture(path);
    if cardType == Type.HERO then
        txt_value:setString("13/13");
    elseif cardType == Type.TOOLS then
        txt_value:setString("");
    else
        txt_value:setString(self:getInitValue(cardType,index));
    end
    txt_name:setString(self:getName(cardType,index));
    card:setTag(cardType*100+index);
    card:setName("card");
    return card;
end

--根据类型获得牌的纹理
function ShejianGameScene:getTexture(cardType,index)
    local str = "majia/img/card/";
    if cardType == Type.ENEMY then
        str = str .. "enemy/enemy";
    elseif cardType == Type.WEAPON then
        str = str .. "weapon/weapon";
    elseif cardType == Type.DEFENSE then
        str = str .. "defense/defense";
    elseif cardType == Type.MEDICINE then
        str = str .. "medicine/medicine";
    elseif cardType == Type.TOOLS then
        str = str .. "tool/tool";
    elseif cardType == Type.MONEY then
        str = str .. "money/money";
    elseif cardType == Type.HERO then
        local str = self:getHeroTextureIndex(self:getHeroHP());
        return str;
    end
    str = str..index..".png";
    return str;
end

--显示英雄
function ShejianGameScene:showHeroEX()
    local card = img_card:clone();
    local path = self:getHeroTextureIndex(13);
    card:loadTexture(path);
    local txt_value = card:getChildByName("txt_value");
    txt_value:setPosition(cc.p(txt_value:getPositionX()-20,txt_value:getPositionY()));
    txt_value:setString("13/13");
    local txt_name = card:getChildByName("txt_name");
    txt_name:setAnchorPoint(cc.p(0,0.5));
    txt_name:setString("$:");
    txt_name:setTextColor(cc.c3b(255,255,0));
    txt_name:setPosition(cc.p(20,txt_name:getPositionY()));
    local txt_gold = txt_name:clone();
    txt_gold:setName("txt_gold");
    txt_gold:setAnchorPoint(cc.p(0,0.5));
    txt_gold:setPosition(cc.p(40,txt_name:getPositionY()));
    local gold_value = 0;
    txt_gold:setString(""..gold_value);
    txt_gold:setTextColor(cc.c3b(255,255,0));
    txt_name:getParent():addChild(txt_gold);
    card:setName("card");
    card:setPosition(cc.p(300,-200));
    card:setRotation(-45);
    self:addChild(card,100);
    card:runAction(cc.Sequence:create(
        cc.Spawn:create(
            cc.RotateTo:create(0.5,0),
            cc.MoveTo:create(0.5,cc.p(ex_cardsbg[2]:getPositionX(),ex_cardsbg[2]:getPositionY()))),
            cc.CallFunc:create(function ()
                card:removeFromParent();
                card:setPosition(cc.p(0,0));
                ex_node_cards[2]:addChild(card);
            end)
        )
    )
end

--根据英雄的血量选择英雄的图片
function ShejianGameScene:getHeroTextureIndex(hp)
    local str = "majia/img/card/hero/hero";
    local index = -1;
    if hp >=10 then
       index = 3;
    elseif hp >=5 then
        index = 2;
    else
        index = 1;
    end
    return str..index..".png";
end

--根据类型获得牌的初始值
function ShejianGameScene:getInitValue(cardType,index)
    local value = 0;
    if cardType == Type.ENEMY then
        return enemy[index].hp;
    elseif cardType == Type.WEAPON then
        return weapon[index].hp;
    elseif cardType == Type.DEFENSE then
        return defense[index].hp;
    elseif cardType == Type.MEDICINE then
       return medicine[index].hp;
    elseif cardType == Type.TOOLS then
        return tools[index].hp;
    elseif cardType == Type.MONEY then
        return money[index].hp;
    elseif cardType == Type.MONEY then
        return enemy[index].hp;
    elseif cardType == Type.HERO then
        return hero.hp;
    end  
end

--根据类型获得牌的名字
function ShejianGameScene:getName(cardType,index)
    local value = 0;
    if cardType == Type.ENEMY then
        return enemy[index].name;
    elseif cardType == Type.WEAPON then
        return weapon[index].name;
    elseif cardType == Type.DEFENSE then
        return defense[index].name;
    elseif cardType == Type.MEDICINE then
       return medicine[index].name;
    elseif cardType == Type.TOOLS then
        return tools[index].name;
    elseif cardType == Type.MONEY then
        return money[index].name;
    elseif cardType == Type.MONEY then
        return enemy[index].name;
    elseif cardType == Type.HERO then
        return "";
    end
    
end

--设置卡牌的位置
function ShejianGameScene:setClipPosition(x,y)
    spriteBall:setPosition(cc.p(x + (display.width - 1136)/2,y));
end

--设置箭头的位置
function ShejianGameScene:setArrowPosition(x,y)
    hand:setRotation(45);
    hand:setPosition(cc.p(x + (display.width - 1136)/2,y));
end

--增加文字特效
function ShejianGameScene:addTextEffect(str,str2,x,y)

    if self.label ~= nil then
        self.label:removeFromParent();
        self.label = nil;
    end
    if self.label2 ~= nil then
        self.label2:removeFromParent();
        self.label2 = nil;
    end
    self.label = cc.Label:createWithTTF("", "majia/font555.ttf", 20);
    self.label:setAnchorPoint(cc.p(0,0.5));
    self.label:setColor(cc.c3b(255,255,255));
    self.label:setPosition(cc.p(x + (display.width - 1136)/2 ,y));
    self:addChild(self.label);

    local i = 0;
    local res = "";
    self.label:runAction(cc.RepeatForever:create(cc.Sequence:create(cc.DelayTime:create(0.01),cc.CallFunc:create(function ()
       i = i +1;
       if i > string.len(str) then
           self.label:stopAllActions();

           if str2 ~= nil then
               if self.label2 ~= nil then
                   self.label2:removeFromParent();
                   self.label2 = nil;
               end
               self.label2 = cc.Label:createWithTTF("", "majia/font555.ttf", 20);
               self.label2:setAnchorPoint(cc.p(0,0.5));
               self.label2:setColor(cc.c3b(255,255,255));
               self.label2:setPosition(cc.p(self.label:getPositionX(),self.label:getPositionY() - 24));
               self:addChild(self.label2);
               local j = 0;
               local res2 = "";
               self.label2:runAction(cc.RepeatForever:create(cc.Sequence:create(cc.DelayTime:create(0.01),cc.CallFunc:create(function ()
                   j = j +1;
                   if j > string.len(str2) then
                       ex_btn_mask:setTouchEnabled(true);
                       self.label2:stopAllActions();
                       if self.tip ~= nil then
                           self.tip:removeFromParent();
                           self.tip = nil;
                       end
                       self.tip = cc.Label:createWithTTF("", "majia/font555.ttf", 20);
                       self.tip:setString("Click the screen to continue ...");
                       self.tip:setAnchorPoint(cc.p(0,0.5));
                       self.tip:setColor(cc.c3b(128,128,128));
                       self.tip:setPosition(cc.p(self.label:getPositionX(),self.label:getPositionY() - 48));
                       self:addChild(self.tip);
                       return;
                   else
                       res2 = res2 .. string.sub(str2,j,j);
                       self.label2:setAnchorPoint(cc.p(0,0.5));
                       self.label2:setPosition(cc.p(self.label:getPositionX(),self.label:getPositionY() - 24));
                       self.label2:setString(res2);
                   end
               end))));
           else
               ex_btn_mask:setTouchEnabled(true);
               if self.tip ~= nil then
                   self.tip:removeFromParent();
                   self.tip = nil;
               end
               self.tip = cc.Label:createWithTTF("", "majia/font555.ttf", 20);
               self.tip:setString("Click the screen to continue ...");
               self.tip:setAnchorPoint(cc.p(0,0.5));
               self.tip:setColor(cc.c3b(128,128,128));
               self.tip:setPosition(cc.p(self.label:getPositionX(),self.label:getPositionY() - 24));
               self:addChild(self.tip);
               return;
           end
       end
       res = res .. string.sub(str,i,i);
       self.label:setAnchorPoint(cc.p(0,0.5));
       self.label:setPosition(cc.p(x + (display.width - 1136)/2 ,y));
       self.label:setString(res);
    end))))

end

---移动武器牌到装备栏
function ShejianGameScene:moveWeaponToEquipmentBar(time)
    local img_hand = ccui.ImageView:create("majia/img/hand.png");
    img_hand:setRotation(-45);
    img_hand:setPosition(cc.p(100,50));
    weaponCard:addChild(img_hand);
    weaponCard:runAction(cc.Sequence:create(cc.MoveTo:create(time,cc.p(ex_cardsbg[1]:getPositionX(),ex_cardsbg[1]:getPositionY())),cc.CallFunc:create(function ()
        img_hand:removeFromParent();
    end)));
end

--从装备栏移动武器到敌人身上
function ShejianGameScene:moveWeaponToKillEnemy(time)
    local img_hand = ccui.ImageView:create("majia/img/hand.png");
    img_hand:setRotation(-45);
    img_hand:setPosition(cc.p(100,50));
    weaponCard:addChild(img_hand);
    weaponCard:runAction(cc.Sequence:create(cc.MoveTo:create(time,cc.p(ex_cardsbg[5]:getPositionX(),ex_cardsbg[5]:getPositionY())),cc.CallFunc:create(function ()
        img_hand:removeFromParent();
        weaponCard:removeFromParent();
        self:addFloatEffectEX(ex_cardsbg[5]:getPositionX(),ex_cardsbg[5]:getPositionY(),-7);
        local txt_hp = enemyCard:getChildByName("txt_value");
        txt_hp:setString("3");
    end)));
end

---移动护盾牌到装备栏
function ShejianGameScene:moveDefenseToEquipmentBar(time)
    local img_hand = ccui.ImageView:create("majia/img/hand.png");
    img_hand:setRotation(-45);
    img_hand:setPosition(cc.p(100,50));
    defenseCard:addChild(img_hand);
    defenseCard:runAction(cc.Sequence:create(cc.MoveTo:create(time,cc.p(ex_cardsbg[3]:getPositionX(),ex_cardsbg[3]:getPositionY())),cc.CallFunc:create(function ()
        img_hand:removeFromParent();
    end)));
end

--将敌人拉到护盾上
function ShejianGameScene:moveEnemyToShieldCard(time)
    local img_hand = ccui.ImageView:create("majia/img/hand.png");
    img_hand:setRotation(-45);
    img_hand:setPosition(cc.p(100,50));
    enemyCard:addChild(img_hand);
    enemyCard:setZOrder(3);
    enemyCard:runAction(cc.Sequence:create(cc.MoveTo:create(time,cc.p(ex_cardsbg[3]:getPositionX(),ex_cardsbg[3]:getPositionY())),cc.CallFunc:create(function ()
        img_hand:removeFromParent();
        defenseCard:removeFromParent();
        enemyCard:removeFromParent();
        ex_node_cards[2]:getChildByName("card"):getChildByName("txt_value"):setString("12/13");
        self:addFloatEffectEX(ex_cardsbg[2]:getPositionX(),ex_cardsbg[2]:getPositionY(),-1);
    end)));
end

--将敌人拉到英雄上
function ShejianGameScene:moveEnemyToHeroCard(time)
    local img_hand = ccui.ImageView:create("majia/img/hand.png");
    img_hand:setRotation(-45);
    img_hand:setPosition(cc.p(100,50));
    enemyCard:addChild(img_hand);
    enemyCard:setZOrder(2);
    enemyCard:runAction(cc.Sequence:create(cc.MoveTo:create(time,cc.p(ex_cardsbg[2]:getPositionX(),ex_cardsbg[2]:getPositionY())),cc.CallFunc:create(function ()
        img_hand:removeFromParent();
        enemyCard:removeFromParent();
        ex_node_cards[2]:getChildByName("card"):getChildByName("txt_value"):setString("3/13");
        self:addFloatEffectEX(ex_cardsbg[2]:getPositionX(),ex_cardsbg[2]:getPositionY(),-9);
    end)));
end

--发三张牌
function ShejianGameScene:sendThreeCardsMore()
    --敌人2
   enemy2Card = self:createCard(Type.ENEMY,1)
   enemy2Card:setPosition(cc.p(ex_card_send:getPositionX(),ex_card_send:getPositionY()));
   ex_node_move:addChild(enemy2Card);
   --武器牌
   weaponCard = self:createCard(Type.WEAPON,1);
   weaponCard:setPosition(cc.p(ex_card_send:getPositionX(),ex_card_send:getPositionY()));
   ex_node_move:addChild(weaponCard);
   --敌人牌
   enemyCard = self:createCard(Type.ENEMY,1);
   enemyCard:setPosition(cc.p(ex_card_send:getPositionX(),ex_card_send:getPositionY()));
   ex_node_move:addChild(enemyCard);
   enemyCard:runAction(cc.MoveTo:create(0.5,cc.p(ex_cardsbg[5]:getPositionX(),ex_cardsbg[5]:getPositionY())));
   weaponCard:runAction(cc.Sequence:create(cc.DelayTime:create(0.5),cc.CallFunc:create(function ()
       weaponCard:setZOrder(1);
   end),cc.MoveTo:create(0.5,cc.p(ex_cardsbg[6]:getPositionX(),ex_cardsbg[6]:getPositionY()))));
   enemy2Card:runAction(cc.Sequence:create(cc.DelayTime:create(1),cc.CallFunc:create(function ()
       enemy2Card:setZOrder(2);
   end),cc.MoveTo:create(0.5,cc.p(ex_cardsbg[7]:getPositionX(),ex_cardsbg[7]:getPositionY()))));
end

--移动药水牌到装备栏
function ShejianGameScene:moveMedicineToEquipmentBar(time)
    local img_hand = ccui.ImageView:create("majia/img/hand.png");
    img_hand:setRotation(-45);
    img_hand:setPosition(cc.p(100,50));
    medicineCard:addChild(img_hand);
    medicineCard:runAction(cc.Sequence:create(cc.MoveTo:create(time,cc.p(ex_cardsbg[3]:getPositionX(),ex_cardsbg[3]:getPositionY())),cc.CallFunc:create(function ()
        img_hand:removeFromParent();
        local mask = ccui.ImageView:create("majia/img/mask.png");
        mask:setPosition(cc.p(53,76));
        medicineCard:addChild(mask);
        ex_node_cards[2]:getChildByName("card"):getChildByName("txt_value"):setString("10/13");
        self:addFloatEffectEX(ex_cardsbg[2]:getPositionX(),ex_cardsbg[2]:getPositionY(),7);
    end)));
end

--移动武器到背包
function ShejianGameScene:moveWeaponToBackpack(time)
    local img_hand = ccui.ImageView:create("majia/img/hand.png");
    img_hand:setRotation(-45);
    img_hand:setPosition(cc.p(100,50));
    weaponCard:addChild(img_hand);
    weaponCard:setZOrder(4);
    weaponCard:runAction(cc.Sequence:create(cc.MoveTo:create(time,cc.p(ex_cardsbg[4]:getPositionX(),ex_cardsbg[4]:getPositionY())),cc.CallFunc:create(function ()
        img_hand:removeFromParent();
    end)));
end

--再发三张牌
function ShejianGameScene:sendThreeCardsMoreEx()
    --敌人牌
    enemyCard = self:createCard(Type.ENEMY,2);
    enemyCard:setPosition(cc.p(ex_card_send:getPositionX(),ex_card_send:getPositionY()));
    ex_node_move:addChild(enemyCard);
    --金钱牌
    moneyCard = self:createCard(Type.MONEY,1);
    moneyCard:setPosition(cc.p(ex_card_send:getPositionX(),ex_card_send:getPositionY()));
    ex_node_move:addChild(moneyCard);
    --道具牌
    toolCard = self:createCard(Type.TOOLS,2);
    toolCard:setPosition(cc.p(ex_card_send:getPositionX(),ex_card_send:getPositionY()));
    ex_node_move:addChild(toolCard);
    toolCard:runAction(cc.MoveTo:create(0.5,cc.p(ex_cardsbg[5]:getPositionX(),ex_cardsbg[5]:getPositionY())));
    moneyCard:runAction(cc.Sequence:create(cc.DelayTime:create(0.5),cc.CallFunc:create(function ()
        moneyCard:setZOrder(1);
    end),cc.MoveTo:create(0.5,cc.p(ex_cardsbg[6]:getPositionX(),ex_cardsbg[6]:getPositionY()))));
    enemyCard:runAction(cc.Sequence:create(cc.DelayTime:create(1),cc.CallFunc:create(function ()
        enemyCard:setZOrder(3);
    end),cc.MoveTo:create(0.5,cc.p(ex_cardsbg[8]:getPositionX(),ex_cardsbg[8]:getPositionY()))));
end

--从装备栏移动武器到敌人身上
function ShejianGameScene:moveWeaponToEnemyEX(time)
    local img_hand = ccui.ImageView:create("majia/img/hand.png");
    img_hand:setRotation(-45);
    img_hand:setPosition(cc.p(100,50));
    weaponCard:addChild(img_hand);
    weaponCard:setZOrder(3);
    weaponCard:runAction(cc.Sequence:create(cc.MoveTo:create(time,cc.p(ex_cardsbg[7]:getPositionX(),ex_cardsbg[7]:getPositionY())),cc.CallFunc:create(function ()
        img_hand:removeFromParent();
        weaponCard:removeFromParent();
        enemy2Card:removeFromParent();
        self:addFloatEffectEX(ex_cardsbg[7]:getPositionX(),ex_cardsbg[7]:getPositionY(),-6);
    end)));
end

--扔掉卡牌
function ShejianGameScene:throwAway(time)
    local img_hand = ccui.ImageView:create("majia/img/hand.png");
    img_hand:setRotation(-45);
    img_hand:setPosition(cc.p(100,50));
    toolCard:addChild(img_hand);
    toolCard:setZOrder(10);
    toolCard:runAction(cc.Sequence:create(cc.MoveTo:create(time,cc.p(ex_card_trash:getPositionX(),ex_card_trash:getPositionY())),cc.CallFunc:create(function ()
        toolCard:removeFromParent();
    end)));
end

--移动金币卡到装备栏
function ShejianGameScene:moveMoneyCardToEquipmentBar(time)
    local img_hand = ccui.ImageView:create("majia/img/hand.png");
    img_hand:setRotation(-45);
    img_hand:setPosition(cc.p(100,50));
    moneyCard:addChild(img_hand);
    moneyCard:setZOrder(4);
    moneyCard:runAction(cc.Sequence:create(cc.MoveTo:create(time,cc.p(ex_cardsbg[1]:getPositionX(),ex_cardsbg[1]:getPositionY())),cc.CallFunc:create(function ()
        img_hand:removeFromParent();
        local mask = ccui.ImageView:create("majia/img/mask.png");
        mask:setPosition(cc.p(53,76));
        moneyCard:addChild(mask);
        ex_node_cards[2]:getChildByName("card"):getChildByName("txt_gold"):setString("4");
        self:addGoldEffectEX(4);
    end)));
end

--飘字特效EX
function ShejianGameScene:addFloatEffectEX(x,y,number)
    local label = nil;
    if number < 0 then
        label = cc.Label:createWithTTF(""..number, "majia/font555.ttf", 32);
        label:setColor(cc.c3b(255,0,0));
    elseif number > 0 then
        label = cc.Label:createWithTTF("+"..number, "majia/font555.ttf", 32);
        label:setColor(cc.c3b(0,255,0));
    else
        label = cc.Label:createWithTTF("0", "majia/font555.ttf", 32);
        label:setColor(cc.c3b(255,255,0));
    end
	
	label:setAnchorPoint(cc.p(0.5,0.5));
    label:setPosition(cc.p(x,y));
    ex_node_effect:addChild(label);
    label:runAction(cc.Sequence:create(cc.MoveBy:create(0.5,cc.p(0,50)),cc.DelayTime:create(0.5),cc.RemoveSelf:create()));
end

--加金币特效
function ShejianGameScene:addGoldEffectEX(number)
    local label = nil;
    local x = cardsbg[2]:getPositionX();
    local y = cardsbg[2]:getPositionY();
    label = cc.Label:createWithTTF("+"..number, "majia/font555.ttf", 32);
    label:setColor(cc.c3b(255,255,0));
	label:setAnchorPoint(cc.p(0.5,0.5));
    label:setPosition(cc.p(x,y));
    ex_node_effect:addChild(label);
    label:runAction(cc.Sequence:create(cc.MoveBy:create(0.5,cc.p(0,50)),cc.DelayTime:create(0.5),cc.RemoveSelf:create()));
end

----------------------------通用接口---------------------------
--播放声音
function ShejianGameScene:playSound(fileName)
    if soundSwitch then
        PLAY_SOUND("majia/sound/"..fileName);
    end
end
function PLAY_SOUND( filename, isLoop )
	audio.playSound(filename,isLoop)
end
cc.exports.ShejianGameScene = ShejianGameScene;
return ShejianGameScene
