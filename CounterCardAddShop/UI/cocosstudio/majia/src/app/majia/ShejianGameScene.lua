local ShejianGameScene = class("ShejianGameScene", function()
    return cc.Layer:create()
end)

local StartPanel 
local LevelPanel
local HelpPanel
local ScorePanel

local startPlayBtn
local startHelpBtn
local startScoreBtn
local helpCloseBtn
local scoreCloseBtn
local gameHelpBtn
local totalScore = 0;
local effectValue = nil;
local returnflag = false;
local img_magicCard = nil;
local heroIndex = nil;
local magicIndex = nil;
local heroSelectBG = {};
local magicSelectBG  = {};

local heroLevelLabel = {};--英雄升级界面中每个英雄的等级标签
local magicLevelLabel = {};--魔法升级界面中每个魔法的等级标签
local heroDamageLabel = {};--英雄升级界面中每个英雄的伤害标签
local magicEffectLabel = {};--魔法升级界面中每个魔法的效果标签
local heroUpgradeLabel = {};--英雄升级界面中每个英雄升级所需金币标签
local magicUpgradeLabel = {};--魔法升级界面中每个魔法升级所需金币标签

local debug = 1;
local musicSwitch = true;
local level = 1;
local maxLevel = 1;
local herostep = 4;
local magicstep = 4;
local levelbtns = {};

local heros_mask = {}
local magic_mask = {}

local HP = 0;
local EXP = 0;
local ENEMYHP = 0;
local txt_HP = nil;
local txt_ENEMYHP = nil;

local btn_technical
local txt_webviewTitle 
local node_webview 
local btn_webviewclose 
local txt_tips6

local btn_website 
local btn_technical 

local website_url = "https://www.showdoc.cc/p/247f7842e59edd2f3979628787d19fca";
local technical_url = "https://www.showdoc.cc/p/9d3eee16a813d8e3269eb61d5e5b9ea5";

--IOS配置
IAPitems =
{
    [1] = {productid = "60000",gold = 60000},
    [2] = {productid = "120000",gold = 120000},
    [3] = {productid = "180000",gold = 180000},
    [4] = {productid = "item4",gold = 240000},
    [5] = {productid = "item5",gold = 300000},
    [6] = {productid = "item6",gold = 360000},
};

local bossName = 
{
    [1] = "Pablo",
    [2] = "Tony",
    [3] = "Helen",
    [4] = "Darren",
    [5] = "Pablo",
    [6] = "Tony",
    [7] = "Helen",
    [8] = "Darren",
    [9] = "Kristen",
    [10] = "Juliet",
    [11] = "Walter",
    [12] = "Jane",
};

--签到奖励金钱
local signGold =
{
    [1] = 1000;
    [2] = 1000;
    [3] = 1500;
    [4] = 1500;
    [5] = 2000;
    [6] = 2000;
    [7] = 3000;
};

local hero_config =
{
    [1] = {name = "Shield",damage = 10},
    [2] = {name = "Defensive warrior",damage = 20},
    [3] = {name = "Gladiator",damage = 30},
    [4] = {name = "Spike warrior",damage = 40},
    [5] = {name = "swordsman",damage = 50},
    [6] = {name = "Fanatic warrior",damage = 60},
    [7] = {name = "Heavy warrior",damage = 70},
    [8] = {name = "Single sword warrior",damage = 80},
    [9] = {name = "Ghost warrior",damage = 90},
    [10] = {name = "Holy warrior",damage = 100},
   
}

local magic_config =
{
    [1] = {name = "Sniper",effect = -10},
    [2] = {name = "Shield",effect = 10},
    [3] = {name = "meat",effect = -20},
    [4] = {name = "Double sword",effect = -30},
    [5] = {name = "Evil sword",effect = -40},
    [6] = {name = "treatment",effect = 20},
    [7] = {name = "Axe",effect = 30},
    [8] = {name = "Hammering",effect = 40},
    [9] = {name = "combustion",effect = -50},
    [10] = {name = "Shock wave",effect = 50},
    
}



local level_config =
{
    [1] = {hp=110,boss = 1},[2] = {hp=120,boss = 11},[3] = {hp=130,boss = 5},[4] = {hp=140,boss = 10},[5] = {hp=150,boss = 10},[6] = {hp=160,boss = 2},[7] = {hp=170,boss = 4},[8] = {hp=180,boss = 12},[9] = {hp=190,boss = 10},[10] = {hp=200,boss = 2},
    [11] = {hp=210,boss = 9},[12] = {hp=220,boss = 11},[13] = {hp=230,boss = 7},[14] = {hp=240,boss = 1},[15] = {hp=250,boss = 11},[16] = {hp=260,boss = 5},[17] = {hp=270,boss = 7},[18] = {hp=280,boss = 1},[19] = {hp=290,boss = 4},[20] = {hp=300,boss = 3},
    [21] = {hp=310,boss = 7},[22] = {hp=320,boss = 12},[23] = {hp=330,boss = 3},[24] = {hp=340,boss = 5},[25] = {hp=350,boss = 12},[26] = {hp=360,boss = 8},[27] = {hp=370,boss = 4},[28] = {hp=380,boss = 5},[29] = {hp=390,boss = 2},[30] = {hp=400,boss = 4},
    [31] = {hp=410,boss = 5},[32] = {hp=420,boss = 5},[33] = {hp=430,boss = 5},[34] = {hp=440,boss = 7},[35] = {hp=450,boss = 8},[36] = {hp=460,boss = 4},[37] = {hp=470,boss = 6},[38] = {hp=480,boss = 4},[39] = {hp=490,boss = 3},[40] = {hp=500,boss = 7},
    [41] = {hp=510,boss = 4},[42] = {hp=520,boss = 8},[43] = {hp=530,boss = 8},[44] = {hp=540,boss = 3},[45] = {hp=550,boss = 5},[46] = {hp=560,boss = 2},[47] = {hp=570,boss = 8},[48] = {hp=580,boss = 3},[49] = {hp=590,boss = 5},[50] = {hp=600,boss = 5},
    [51] = {hp=610,boss = 2},[52] = {hp=620,boss = 6},[53] = {hp=630,boss = 2},[54] = {hp=640,boss = 8},[55] = {hp=650,boss = 2},[56] = {hp=660,boss = 3},[57] = {hp=670,boss = 9},[58] = {hp=680,boss = 8},[59] = {hp=690,boss = 8},[60] = {hp=700,boss = 10},
    [61] = {hp=710,boss = 3},[62] = {hp=720,boss = 7},[63] = {hp=730,boss = 1},[64] = {hp=740,boss = 9},[65] = {hp=750,boss = 10},[66] = {hp=760,boss = 10},[67] = {hp=770,boss = 2},[68] = {hp=780,boss = 9},[69] = {hp=790,boss = 7},[70] = {hp=800,boss = 12},
    [71] = {hp=810,boss = 10},[72] = {hp=820,boss = 2},[73] = {hp=830,boss = 4},[74] = {hp=840,boss = 4},[75] = {hp=850,boss = 1},[76] = {hp=860,boss = 7},[77] = {hp=870,boss = 1},[78] = {hp=880,boss = 7},[79] = {hp=890,boss = 6},[80] = {hp=900,boss = 4},
    [81] = {hp=910,boss = 11},[82] = {hp=920,boss = 8},[83] = {hp=930,boss = 6},[84] = {hp=940,boss = 3},[85] = {hp=950,boss = 4},[86] = {hp=960,boss = 6},[87] = {hp=970,boss = 3},[88] = {hp=980,boss = 6},[89] = {hp=990,boss = 9},[90] = {hp=1000,boss = 7},
    [91] = {hp=1010,boss = 7},[92] = {hp=1020,boss = 9},[93] = {hp=1030,boss = 1},[94] = {hp=1040,boss = 2},[95] = {hp=1050,boss = 9},[96] = {hp=1060,boss = 9},[97] = {hp=1070,boss = 11},[98] = {hp=1080,boss = 12},[99] = {hp=1090,boss = 3},[100] = {hp=1100,boss = 9},

    [101] = {hp=1110,boss = 1},[102] = {hp=1120,boss = 11},[103] = {hp=1130,boss = 5},[104] = {hp=1140,boss = 10},[105] = {hp=1150,boss = 10},[106] = {hp=1160,boss = 2},[107] = {hp=1170,boss = 4},[108] = {hp=1180,boss = 12},[109] = {hp=1190,boss = 10},[110] = {hp=1200,boss = 2},
    [111] = {hp=1210,boss = 9},[112] = {hp=1220,boss = 11},[113] = {hp=1230,boss = 7},[114] = {hp=1240,boss = 1},[115] = {hp=1250,boss = 11},[116] = {hp=1260,boss = 5},[117] = {hp=1270,boss = 7},[118] = {hp=1280,boss = 1},[119] = {hp=1290,boss = 4},[120] = {hp=1300,boss = 3},
    [121] = {hp=1310,boss = 7},[122] = {hp=1320,boss = 12},[123] = {hp=1330,boss = 3},[124] = {hp=1340,boss = 5},[125] = {hp=1350,boss = 12},[126] = {hp=1360,boss = 8},[127] = {hp=1370,boss = 4},[128] = {hp=1380,boss = 5},[129] = {hp=1390,boss = 2},[130] = {hp=1400,boss = 4},
    [131] = {hp=1410,boss = 5},[132] = {hp=1420,boss = 5},[133] = {hp=1430,boss = 5},[134] = {hp=1440,boss = 7},[135] = {hp=1450,boss = 8},[136] = {hp=1460,boss = 4},[137] = {hp=1470,boss = 6},[138] = {hp=1480,boss = 4},[139] = {hp=1490,boss = 3},[140] = {hp=1500,boss = 7},
    [141] = {hp=1510,boss = 4},[142] = {hp=1520,boss = 8},[143] = {hp=1530,boss = 8},[144] = {hp=1540,boss = 3},[145] = {hp=1550,boss = 5},[146] = {hp=1560,boss = 2},[147] = {hp=1570,boss = 8},[148] = {hp=1580,boss = 3},[149] = {hp=1590,boss = 5},[150] = {hp=1600,boss = 5},
    [151] = {hp=1610,boss = 2},[152] = {hp=1620,boss = 6},[153] = {hp=1630,boss = 2},[154] = {hp=1640,boss = 8},[155] = {hp=1650,boss = 2},[156] = {hp=1660,boss = 3},[157] = {hp=1670,boss = 9},[158] = {hp=1680,boss = 8},[159] = {hp=1690,boss = 8},[160] = {hp=1700,boss = 10},
    [161] = {hp=1710,boss = 3},[162] = {hp=1720,boss = 7},[163] = {hp=1730,boss = 1},[164] = {hp=1740,boss = 9},[165] = {hp=1750,boss = 10},[166] = {hp=1760,boss = 10},[167] = {hp=1770,boss = 2},[168] = {hp=1780,boss = 9},[169] = {hp=1790,boss = 7},[170] = {hp=1800,boss = 12},
    [171] = {hp=1810,boss = 10},[172] = {hp=1820,boss = 2},[173] = {hp=1830,boss = 4},[174] = {hp=1840,boss = 4},[175] = {hp=1850,boss = 1},[176] = {hp=1860,boss = 7},[177] = {hp=1870,boss = 1},[178] = {hp=1880,boss = 7},[179] = {hp=1890,boss = 6},[180] = {hp=1900,boss = 4},
    [181] = {hp=1910,boss = 11},[182] = {hp=1920,boss = 8},[183] = {hp=1930,boss = 6},[184] = {hp=1940,boss = 3},[185] = {hp=1950,boss = 4},[186] = {hp=1960,boss = 6},[187] = {hp=1970,boss = 3},[188] = {hp=1980,boss = 6},[189] = {hp=1990,boss = 9},[190] = {hp=2000,boss = 7},
    [191] = {hp=2010,boss = 7},[192] = {hp=2020,boss = 9},[193] = {hp=2030,boss = 1},[194] = {hp=2040,boss = 2},[195] = {hp=2050,boss = 9},[196] = {hp=2060,boss = 9},[197] = {hp=2070,boss = 11},[198] = {hp=2080,boss = 12},[199] = {hp=2090,boss = 3},[200] = {hp=2100,boss = 9},

    [201] = {hp=2110,boss = 7},[202] = {hp=2120,boss = 5},[203] = {hp=2130,boss = 1},[204] = {hp=2140,boss = 2},[205] = {hp=2150,boss = 9},[206] = {hp=2160,boss = 6},[207] = {hp=2170,boss = 3},[208] = {hp=2180,boss = 2},[209] = {hp=2190,boss = 6},[210] = {hp=2200,boss = 9},
    [211] = {hp=2210,boss = 2},[212] = {hp=2220,boss = 11},[213] = {hp=2230,boss = 7},[214] = {hp=2240,boss = 4},[215] = {hp=2250,boss = 11},[216] = {hp=2260,boss = 8},[217] = {hp=2270,boss = 1},[218] = {hp=2280,boss = 12},[219] = {hp=2290,boss = 9},[220] = {hp=2300,boss = 8},
    [221] = {hp=2310,boss = 5},[222] = {hp=2320,boss = 2},[223] = {hp=2330,boss = 6},[224] = {hp=2340,boss = 8},[225] = {hp=2350,boss = 12}

}

--自己的HP
local hp =
{
    [1] =  110+300, [2] =  120+300,[3] = 130+300,[4] = 140+200,[5] = 150+200,[6] = 160,[7] = 170,[8] = 180,[9] = 190,[10] =200,
    [11] = 210-50,[12] = 220-50,[13] =230-50,[14] = 240-50,[15] = 250-50,[16] = 260-50,[17] = 270-50,[18] = 280-50,[19] = 290-50,[20] = 300-50,
    [21] = 310-50,[22] = 320-50,[23] =330-50,[24] = 340-50,[25] = 350-50,[26] = 360-50,[27] = 370-50,[28] = 380-50,[29] = 390-50,[30] = 400-50,
    [31] = 410-50,[32] = 420-50,[33] =430-50,[34] = 440-50,[35] = 450-50,[36] = 460-50,[37] = 470-50,[38] = 480-50,[39] = 490-50,[40] = 500-50,
    [41] = 510-50,[42] = 520-50,[43] =530-50,[44] = 540-50,[45] = 550-50,[46] = 560-50,[47] = 570-50,[48] = 580-50,[49] = 590-50,[50] = 600-50,
    [51] = 610-50,[52] = 620-50,[53] =630-50,[54] = 640-50,[55] = 650-50,[56] = 660-50,[57] = 670-50,[58] = 680-50,[59] = 690-50,[60] = 700-50,
    [61] = 710-80,[62] = 720-80,[63] =730-80,[64] = 740-80,[65] = 750-80,[66] = 760-80,[67] = 770-80,[68] = 780-80,[69] = 790-80,[70] = 800-80,
    [71] = 810-80,[72] = 820-80,[73] =830-80,[74] = 840-80,[75] = 850-80,[76] = 860-80,[77] = 870-80,[78] = 880-80,[79] = 890-80,[80] = 900-80,
    [81] = 910-80,[82] = 920-80,[83] =930-80,[84] = 940,[85] = 950-80,[86] = 960-80,[87] = 970-80,[88] = 980-80,[89] = 990-80,[90] = 1000-80,
    [91] = 1010-80,[92] = 1020-80,[93] = 1030-80,[94] = 1040-80,[95] = 1050-80,[96] = 1060-80,[97] =1070-80,[98] = 1080-80,[99] =1090-80,[100] = 1100-80,

    [101] =1110-100,[102] = 1120-100,[103] = 1130-100,[104] = 1140-100,[105] = 1150-100,[106] = 1160-100,[107] = 1170-100,[108] = 1180-100,[109] = 1190-100,[110] =1200-100,
    [111] =1210-100,[112] = 1220-100,[113] = 1230-100,[114] = 1240-100,[115] = 1250-100,[116] = 1260-100,[117] = 1270-100,[118] = 1280-100,[119] = 1290-100,[120] =1300-100,
    [121] =1310-100,[122] = 1320-100,[123] = 1330-100,[124] = 1340-100,[125] = 1350-100,[126] = 1360-100,[127] = 1370-100,[128] = 1380-100,[129] = 1390-100,[130] =1400-100,
    [131] =1410-100,[132] = 1420-100,[133] = 1430-100,[134] = 1440-100,[135] = 1450-100,[136] = 1460-100,[137] = 1470-100,[138] = 1480-100,[139] = 1490-100,[140] =1500-100,
    [141] =1510-100,[142] = 1520-100,[143] = 1530-100,[144] = 1540-100,[145] = 1550-100,[146] = 1560-100,[147] = 1570-100,[148] = 1580-100,[149] = 1590-100,[150] =1600-100,
    [151] =1610-100,[152] = 1620-100,[153] = 1630-100,[154] = 1640-100,[155] = 1650-100,[156] = 1660-100,[157] = 1670-100,[158] = 1680-100,[159] = 1690-100,[160] =1700-100,
    [161] =1710-150,[162] = 1720-150,[163] = 1730-150,[164] = 1740-150,[165] = 1750-150,[166] = 1760-150,[167] = 1770-150,[168] = 1780-150,[169] = 1790-150,[170] =1800-150,
    [171] =1810-150,[172] = 1820-150,[173] = 1830-150,[174] = 1840-150,[175] = 1850-150,[176] = 1860-150,[177] = 1870-150,[178] = 1880-150,[179] = 1890-150,[180] =1900-150,
    [181] =1910-150,[182] = 1920-150,[183] = 1930-150,[184] = 1940-150,[185] = 1950-150,[186] = 1960-150,[187] = 1970-150,[188] = 1980-150,[189] = 1990-150,[190] =2000-150,
    [191] =2010-150,[192] = 2020-150,[193] = 2030-150,[194] = 2040-150,[195] = 2050-150,[196] = 2060-150,[197] = 2070-150,[198] = 2080-150,[199] = 2090-150,[200] =2100-150,

    [201] =2110-150,[202] = 2120-150,[203] = 2130-150,[204] = 2140-150,[205] = 2150-150,[206] = 2160-150,[207] = 2170-150,[208] = 2180-150,[209] = 2190-150,[210] = 2200-150,
    [211] =2210-150,[212] = 2220-150,[213] = 2230-150,[214] = 2240-150,[215] = 2250-150,[216] = 2260-150,[217] = 2270-150,[218] = 2280-150,[219] = 2290-150,[220] = 2300-150,
    [221] =2310-150,[222] = 2320-150,[223] = 2330-150,[224] = 2340-150,[225] = 2350-150,
};






function printEX(...)
    if debug == 1 then
        print(...);
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

 --根据经验获取等boss等级
 function ShejianGameScene:getBossLevelByExp(exp)
     if exp < 200 then
        return 1;
     end
     for i = 2,100 do
        if self:getUpBossExp(i) <= exp and exp < self:getUpBossExp(i + 1) then
            return i;
        end
     end
     return 0;
 end


 --获得boss的等级
function ShejianGameScene:getBossLevel()
    local bosslevel = cc.UserDefault:getInstance():getIntegerForKey("bosslevel",1);
    return bosslevel;
 end

 --设置boss的等级
function ShejianGameScene:setBossLevel(level)
    cc.UserDefault:getInstance():setIntegerForKey("bosslevel",level);
end

 --设置boss的等级
function ShejianGameScene:setBossLevel(bosslevel)
    local bosslevel = cc.UserDefault:getInstance():setIntegerForKey("bosslevel",bosslevel);
end

-- --获得boss的hp
-- function ShejianGameScene:getBossHPByLevel(bossLevel)
--     return 400 + bossLevel*0.1
-- end

 --获得某个英雄的伤害
function ShejianGameScene:getHeroDamage(index,level)
    return hero_config[index].damage + level * hero_config[index].damage * 0.1;
end

--获得某个魔法的效果
function ShejianGameScene:getMagicEffec(index,level)
    return magic_config[index].effect + level * magic_config[index].effect * 0.1;
end

 --获得英雄升级所要的金币
 function ShejianGameScene:getUpHeroGold(index,currLevel)
    return 10 * hero_config[index].damage * currLevel;
 end

 --获得魔法升级所要的金币
 function ShejianGameScene:getUpMagicGold(index,currLevel)
    local t = magic_config[index].effect
    if t < 0 then
        t = -t;
    end
    return 10 * t * currLevel;
 end

 --每关过关后给英雄加的经验
 function ShejianGameScene:getExpPrize(currLevel)
     local tlevel = currLevel - 5;
     if tlevel < 1 then
        tlevel = 1;
     end
     return self:getUpBossExp(tlevel)*0.5;
 end

 --每关过关后给英雄加的金币
 function ShejianGameScene:getGoldPrize(currLevel)
     return 100;
 end

 --获得英雄的经验
 function ShejianGameScene:getExp()
    local exp = cc.UserDefault:getInstance():getIntegerForKey("exp",0);
    return exp;
 end

  --设置英雄的经验
 function ShejianGameScene:setExp(exp)
    cc.UserDefault:getInstance():setIntegerForKey("exp",exp);
 end

 --获得boss升级所要的经验
 function ShejianGameScene:getUpBossExp(currLevel)
    if currLevel > 100 then
        currLevel = 100;
    end
    return currLevel * 100;
 end

 --获得boss的血量
 function ShejianGameScene:getBossHP(currLevel)
    return 400 + (currLevel - 1 ) * 25 * currLevel;
 end

 --获得当前的金币
 function ShejianGameScene:getGold()
     local goldnumber = cc.UserDefault:getInstance():getIntegerForKey("gold",0);
     return goldnumber;
 end

 --设置当前的金币
 function ShejianGameScene:setGold(goldnumber)
     cc.UserDefault:getInstance():setIntegerForKey("gold",goldnumber);
 end

function ShejianGameScene:ctor()
    math.randomseed(os.time())

end

function ShejianGameScene:onExit( )
	if self._update then
		scheduler = cc.Director:getInstance():getScheduler()
		scheduler:unscheduleScriptEntry(self._update)
		self._update = nil
	end
	cc.SimpleAudioEngine:getInstance():stopMusic()
end

--创建跑胡子大厅层
function ShejianGameScene:create()
    local layer = ShejianGameScene.new()
    layer:init()
    return layer
end

--返回该类名称
function ShejianGameScene:getClassName()
    return "ShejianGameScene"
end

local local_bit = require "app.utils.local_bit"




function ShejianGameScene:init()
    
    self.loadNode = cc.CSLoader:createNode("majia/ShejianGameLayer.csb")
    self.loadNode:setContentSize(cc.size(display.size.height, display.size.width))
    ccui.Helper:doLayout(self.loadNode)
    self:addChild(self.loadNode, 0)
	--self.loadNode:setRotation(-90)
	--self.loadNode:setAnchorPoint(0.5,0.5)
	--self.loadNode:setPosition(cc.p(568,320))

    local offsetX = (display.width-1136)/2;
    self.loadNode:setPositionX(offsetX);

    local firstHead = cc.UserDefault:getInstance():getIntegerForKey("headid",0);
    if firstHead == 0 then
        firstHead = 1;
        cc.UserDefault:getInstance():getIntegerForKey("headid",1);
    end
    local firstTime = cc.UserDefault:getInstance():getIntegerForKey("firstTime",0);
    if firstTime == 0 then
        cc.UserDefault:getInstance():setIntegerForKey("firstTime",1);
        self:setGold(10000);
    end


	PLAY_MUSIC("majia/sound/bg.mp3")--播放音乐

	StartPanel = self.loadNode:getChildByName("StartPanel")
	GamePanel = self.loadNode:getChildByName("GamePanel")
	HelpPanel = self.loadNode:getChildByName("HelpPanel")
	ScorePanel = self.loadNode:getChildByName("ScorePanel")
    LevelPanel = self.loadNode:getChildByName("LevelPanel");
    HeroPanel = self.loadNode:getChildByName("HeroPanel");
    MagicPanel = self.loadNode:getChildByName("MagicPanel");
    SelectHeadPanel = self.loadNode:getChildByName("SelectHeadPanel");
    ExitPanel = self.loadNode:getChildByName("ExitPanel");
    WebViewPanel = self.loadNode:getChildByName("WebViewPanel");
    DailyBounsPanel = self.loadNode:getChildByName("DailyBounsPanel");
    IPAPanel = self.loadNode:getChildByName("IPAPanel");
    

	StartPanel:setVisible(true)
	GamePanel:setVisible(false)
	HelpPanel:setVisible(false)
	ScorePanel:setVisible(false)
    LevelPanel:setVisible(false)
    HeroPanel:setVisible(false)
    MagicPanel:setVisible(false)
    SelectHeadPanel:setVisible(false)
    ExitPanel:setVisible(false)
    IPAPanel:setVisible(false)
    WebViewPanel:setVisible(false)
    DailyBounsPanel:setVisible(false)

	txt_webviewTitle = WebViewPanel:getChildByName("title");
    node_webview = WebViewPanel:getChildByName("node_webview");
	btn_webviewclose = WebViewPanel:getChildByName("btn_close");
	txt_tips6 = WebViewPanel:getChildByName("txt_tip");
	btn_website = StartPanel:getChildByName("web");
	btn_technical = StartPanel:getChildByName("tec");
	

	if btn_website then
		btn_website:onClick(function( ... )
            WebViewPanel:setVisible(true);
            self:setWebViewPanelInfo("Website",website_url);
		end)
	end

    if btn_technical then
        btn_technical:onClick(function( ... )
            WebViewPanel:setVisible(true);
            self:setWebViewPanelInfo("Technical",technical_url);
		end)
    end

    --IPA窗口
    btn_item = {};
     txt_ipa_number = {};
     btn_ipa_close = IPAPanel:getChildByName("btn_close");
     btn_ipa_close:onClick(function( ... )
        IPAPanel:setVisible(false);
     end);
     for i= 1,3 do
        btn_item[i] = IPAPanel:getChildByName("img_"..i):getChildByName("btn_index");
        txt_ipa_number[i] = IPAPanel:getChildByName("img_"..i):getChildByName("txt_number");
        btn_item[i]:onClick(function( ... )
            self:buy(i);
        end);
     end

    if btn_webviewclose then
        btn_webviewclose:onClick(function( ... )
            WebViewPanel:setVisible(false);
            if webview then
                webview:removeFromParent();
                webview = nil;
            end
		end)
    end

    btn_startpanel_add =  StartPanel:getChildByName("img_addgold"):getChildByName("btn_add");
    txt_startpanel_add = StartPanel:getChildByName("img_addgold"):getChildByName("txt_gold");
    txt_startpanel_name = StartPanel:getChildByName("txt_name");
    txt_startlevel = StartPanel:getChildByName("img_level"):getChildByName("txt_level");
    txt_exp = StartPanel:getChildByName("img_level"):getChildByName("txt_exp");
    img_head = StartPanel:getChildByName("img_head");
    btn_head = StartPanel:getChildByName("btn_head");
    txt_startpanel_add:setString(""..self:getGold());
    txt_startlevel:setString(""..self:getBossLevel());
    self:refreshExp();
    local headid = cc.UserDefault:getInstance():getIntegerForKey("headid",1);
    img_head:loadTexture(self:getBossTexturePath(headid));
    txt_startpanel_name:setString(""..self:getBossName(headid));
    if btn_startpanel_add then
        btn_startpanel_add:onClick(function (...)
            IPAPanel:setVisible(true);
            for i= 1,3 do
                txt_ipa_number[i]:setString(""..IAPitems[i].gold);
            end
        end);
    end

    --每日签到按钮
    btn_showSign = StartPanel:getChildByName("btn_showSign");
    --签到面板
    signFlag = {};
    sign_value = {};
    btn_signClose = DailyBounsPanel:getChildByName("btn_close");
    btn_sign = DailyBounsPanel:getChildByName("btn_sign");
    for i = 1,7 do
        signFlag[i] = DailyBounsPanel:getChildByName("img_"..i):getChildByName("img_check");
        signFlag[i]:setVisible(false);
        sign_value[i] = DailyBounsPanel:getChildByName("img_"..i):getChildByName("txt_number");
        sign_value[i]:setString(""..signGold[i]);
     end
     


    btn_showSign:onClick(function ( ...)
        DailyBounsPanel:setVisible(true);
        local date = os.date("*t", os.time());
        local year = date.year;
        local month = date.month;
        local day = date.day;
        local wday = date.wday;
        local todayIndex = self:wdayToIndex(wday);
        for i = 1,todayIndex - 1 do
            local tKey = self:getKeyByIndex(todayIndex,i);
            if cc.UserDefault:getInstance():getBoolForKey(tKey) then
                signFlag[i]:setVisible(true);
            end 
        end

        local strKey = ""..year..month..day;
        if cc.UserDefault:getInstance():getBoolForKey(strKey) then
            btn_sign:loadTextures("majia/img/btn_bg1.png","","");
            btn_sign:setTouchEnabled(false);
            signFlag[todayIndex]:setVisible(true);
        else
            btn_sign:loadTextures("majia/img/btn_bg.png","","");    
            btn_sign:setTouchEnabled(true);
            signFlag[todayIndex]:setVisible(false);
        end
    end);

     btn_signClose:onClick(function ( ...)
        DailyBounsPanel:setVisible(false);
     end);
     
     btn_sign:onClick(function ( ...)
        self:processSign();--处理签到
     end);

    if btn_head then
        btn_head:onClick(function (...)
            SelectHeadPanel:setVisible(true);
            local index = cc.UserDefault:getInstance():getIntegerForKey("headid",5);
            index = index - 4;
            img_ok:setPosition(cc.p(btns[index]:getPositionX(),btns[index]:getPositionY()));
        end);
    end

--    if self.gameOverHandlers then 
--		cc.Director:getInstance():getScheduler():unscheduleScriptEntry(self.gameOverHandlers)
--		self.gameOverHandlers = nil;
--	end
--    self.gameOverHandlers = cc.Director:getInstance():getScheduler():scheduleScriptFunc(function()

--	end, 0.1,false);

	self:initOnClick()

	curr_score = GamePanel:getChildByName("score") 
	gameCloseBtn = GamePanel:getChildByName("close")   

	if gameCloseBtn then
		gameCloseBtn:onClick(function( ... )
			--开始游戏
			--PLAY_SOUND("majia/click.mp3")--播放音乐
			--self:CloseGame() --退出游戏清空数据
            GamePanel:setVisible(false);
            StartPanel:setVisible(true);
		end)
	end

    if cc.UserDefault:getInstance():getBoolForKey("musicSwitch",true) then
        --musicButton:setOpacity(255);
        musicButton:loadTextures("majia/img/btn_sound.png","","");
    else
        --musicButton:setOpacity(128);
        musicButton:loadTextures("majia/img/btn_sound1.png","","");
    end

end

--刷新经验
function ShejianGameScene:refreshExp()
    local texp = self:getExp();
    local tLevel = self:getBossLevel();
    local upExp = self:getUpBossExp(tLevel + 1)
    txt_exp:setString(""..texp.."/"..upExp);
end

--获得boss纹理路径
function ShejianGameScene:getBossTexturePath(headid)
    return "majia/img/boss"..(headid)..".png";
end 


--获得boss名称
function ShejianGameScene:getBossName(headid)
    return bossName[headid];
end

--处理签到
function ShejianGameScene:processSign()
    local date = os.date("*t", os.time());
    local year = date.year;
    local month = date.month;
    local day = date.day;
    local wday = date.wday;
    local todayIndex = self:wdayToIndex(wday);

    local strKey = ""..year..month..day;
    if cc.UserDefault:getInstance():getBoolForKey(strKey,false) then
        return;
    else
        cc.UserDefault:getInstance():setBoolForKey(strKey,true);
        signFlag[todayIndex]:setVisible(true);
        btn_sign:setTouchEnabled(false);
        btn_sign:loadTextures("majia/img/btn_bg1.png","","");
        self:addGoldFromSign(todayIndex);
    end

end

--将wday转换成index
function ShejianGameScene:wdayToIndex(wday)
    if wday > 1 then
        return wday -1 ;
    elseif wday == 1 then
        return 7;
    end
    return nil;
end

--获得星期几(number)这天的key
function ShejianGameScene:getKeyByIndex(todayIndex,number)
    local deltaTime = 3600*24*(todayIndex - number);
    local date = os.date("*t", os.time() - deltaTime);
    local year = date.year;
    local month = date.month;
    local day = date.day;
    return ""..year..month..day;
end

--通过签到增加金币
function ShejianGameScene:addGoldFromSign(todayIndex)
    local  goldValue =  cc.UserDefault:getInstance():getIntegerForKey("gold",0);
    goldValue = goldValue + signGold[todayIndex];
    txt_startpanel_add:setString(""..goldValue);
    self:setGold(goldValue);
end


--关闭游戏
function ShejianGameScene:CloseGame()

end

--按钮监听
function ShejianGameScene:initOnClick()

	startPlayBtn = StartPanel:getChildByName("btn_play")
	startHelpBtn = StartPanel:getChildByName("help")
    btn_heroCard =  StartPanel:getChildByName("btn_heroCard")
    btn_magicCard =  StartPanel:getChildByName("btn_magicCard")
    node_effect = GamePanel:getChildByName("node_effect");
    img_tippanel = GamePanel:getChildByName("img_tippanel");
    txt_tip = img_tippanel:getChildByName("txt_tip");
    node_cards = GamePanel:getChildByName("node_cards");
    img_myBossbg = node_cards:getChildByName("img_myBossbg");
    img_enemyBossbg = node_cards:getChildByName("img_enemyBossbg");

    img_enemyHerosbg1 = node_cards:getChildByName("img_enemyHerosbg1");
    img_enemyHerosbg2 = node_cards:getChildByName("img_enemyHerosbg2");
    img_enemyHerosbg3 = node_cards:getChildByName("img_enemyHerosbg3");
    img_myHerosbg1 = node_cards:getChildByName("img_myHerosbg1");
    img_myHerosbg2 = node_cards:getChildByName("img_myHerosbg2");
    img_myHerosbg3 = node_cards:getChildByName("img_myHerosbg3");

    myHeroesbgs = {};--自己英雄的三个框
    myHeroesbgs[1] = img_myHerosbg1;
    myHeroesbgs[2] = img_myHerosbg2;
    myHeroesbgs[3] = img_myHerosbg3;

    enemyHeroesbgs = {};--敌人英雄的三个框
    enemyHeroesbgs[1] = img_enemyHerosbg1;
    enemyHeroesbgs[2] = img_enemyHerosbg2;
    enemyHeroesbgs[3] = img_enemyHerosbg3;

    myHeroesbgPos={};
    enemyHeroesbgsPos ={};
    for i=1,3 do
        myHeroesbgPos[i] = cc.p(myHeroesbgs[i]:getPositionX(),myHeroesbgs[i]:getPositionY());
        enemyHeroesbgsPos[i] = cc.p(enemyHeroesbgs[i]:getPositionX(),enemyHeroesbgs[i]:getPositionY())
    end


    myHeroes = {};--自己英雄的三张图片按钮
    myDamage = {};--自己英雄的damage/HP
    mybg = {};--自己英雄damage的背景
    myTip = {};--自己英雄的tip

    enemyHeroes = {};--敌人英雄的三张图片按钮
    enemyDamage = {};--敌人英雄的damage/HP
    enemybg = {};--敌人英雄damage的背景
    enemyTip    = {};--敌人英雄的tip
    
    

    for i = 1,3 do
        myHeroes[i] = myHeroesbgs[i]:getChildByName("btn_hero");
        myHeroes[i]:setTag(0);
        myHeroes[i]:setVisible(false);
        myHeroes[i]:onClick(function ()
            printEX("点击了我的英雄");
            if (effectValue ~= nil) then
                if effectValue <= 0   then
                    return;
                else
                    local myValue = tonumber(myDamage[i]:getString())+effectValue;
                    local enemyValue = tonumber(enemyDamage[i]:getString());
                    myDamage[i]:setString(""..myValue);
                    if enemyValue > myValue then
                        enemyDamage[i]:setTextColor(cc.c3b(0,255,0));
                        myDamage[i]:setTextColor(cc.c3b(255,0,0));
                    else
                        enemyDamage[i]:setTextColor(cc.c3b(255,0,0));
                        myDamage[i]:setTextColor(cc.c3b(0,255,0));
                    end
                    self:showMagicsCards(false);
                    for i = 1,3 do
                        myTip[i]:setVisible(false);
                        enemyTip[i]:setVisible(false);
                    end
                    self:playSound("majia/sound/up.mp3");
                    utils:delayInvoke("xxx",0.5,function()
		                self:enemySelectMagic();
	                end)
                end
            end
        end)
        myDamage[i] = myHeroesbgs[i]:getChildByName("txt_damage");
        myDamage[i]:setVisible(false);
        mybg[i] = myHeroesbgs[i]:getChildByName("img_bg");
        mybg[i]:setVisible(false);
        myTip[i] = myHeroesbgs[i]:getChildByName("img_tip");
        myTip[i]:setVisible(false);
        enemyHeroes[i] = enemyHeroesbgs[i]:getChildByName("btn_hero");
        enemyHeroes[i]:setTag(0);
        enemyHeroes[i]:setVisible(false);
        enemyTip[i] = enemyHeroesbgs[i]:getChildByName("img_tip");
        enemyTip[i]:setVisible(false);
        enemyHeroes[i]:onClick(function ()
             printEX("点击了敌人的英雄");
             if (effectValue ~= nil) then
                if effectValue >= 0 then
                    return;
                else
                    local enemyValue = tonumber(enemyDamage[i]:getString())+effectValue;
                    if enemyValue < 0 then
                        enemyValue = 0;
                    end
                    local myValue = tonumber(myDamage[i]:getString());
                    enemyDamage[i]:setString(""..enemyValue);
                    if enemyValue > myValue then
                        enemyDamage[i]:setTextColor(cc.c3b(0,255,0));
                        myDamage[i]:setTextColor(cc.c3b(255,0,0));
                    else
                        enemyDamage[i]:setTextColor(cc.c3b(255,0,0));
                        myDamage[i]:setTextColor(cc.c3b(0,255,0));
                    end
                    self:showMagicsCards(false);
                    for i = 1,3 do
                        myTip[i]:setVisible(false);
                        enemyTip[i]:setVisible(false);
                    end
                    self:playSound("majia/sound/harm.mp3");
                    utils:delayInvoke("xxx",0.5,function()
		                self:enemySelectMagic();
	                end)
                end
            end
        end);
        enemyDamage[i] = enemyHeroesbgs[i]:getChildByName("txt_damage");
        enemyDamage[i]:setVisible(false);
        enemybg[i] = enemyHeroesbgs[i]:getChildByName("img_bg");
        enemybg[i]:setVisible(false);
    end


    img_bg1 = node_cards:getChildByName("img_bg1");
    img_bg2 = node_cards:getChildByName("img_bg2");
    img_bg3 = node_cards:getChildByName("img_bg3");
    img_bg4 = node_cards:getChildByName("img_bg4");

    img_bgs = {};--下面4个英雄框
    img_bgs[1] = img_bg1;
    img_bgs[2] = img_bg2;
    img_bgs[3] = img_bg3;
    img_bgs[4] = img_bg4;

    btn_heroes = {};--下面4个英雄的按钮
    txt_heroesDamage ={};--下面4个英雄的左下角的伤害
    txt_heroesName = {};--下面4个英雄下面的名字


    for i = 1,4 do
        btn_heroes[i] = img_bgs[i]:getChildByName("btn_hero");
        txt_heroesDamage[i] = img_bgs[i]:getChildByName("txt_hp");
        txt_heroesName[i] = img_bgs[i]:getChildByName("txt_name");
        btn_heroes[i]:onClick(function( sender )
            local tag = sender.target:getTag();
            self:selectHero(tag);
            self:playSound("majia/sound/selecthero.wav");
            img_bgs[i]:setVisible(false);
        end);

    end

    --4个魔法框
    imgMagic_bg1 = node_cards:getChildByName("imgMagic_bg1");
    imgMagic_bg2 = node_cards:getChildByName("imgMagic_bg2");
    imgMagic_bg3 = node_cards:getChildByName("imgMagic_bg3");
    imgMagic_bg4 = node_cards:getChildByName("imgMagic_bg4");

    
    img_magicbgs = {};--下面4个英雄框
    img_magicbgs[1] = imgMagic_bg1;
    img_magicbgs[2] = imgMagic_bg2;
    img_magicbgs[3] = imgMagic_bg3;
    img_magicbgs[4] = imgMagic_bg4;

    btn_magics = {};--下面4个魔法按钮
    txt_magicsDamage ={};--下面4个魔法的左下角的收益
    txt_magicsName = {};--下面4个魔法下面的名字

    for i = 1,4 do
        btn_magics[i] = img_magicbgs[i]:getChildByName("btn_magic");
        txt_magicsDamage[i] = img_magicbgs[i]:getChildByName("txt_value");
        txt_magicsName[i] = img_magicbgs[i]:getChildByName("txt_name");
        btn_magics[i]:onClick(function( sender )
            local tag = sender.target:getTag();
            self:selectMagics(tag);
            --img_magicbgs[i]:setVisible(false);
        end);

    end

    exitpanelclose =  ExitPanel:getChildByName("close");
    exitpanelclose:onClick(function ()
        ExitPanel:setVisible(false);
    end);

    exitpanelyes =  ExitPanel:getChildByName("btn_yes");
    exitpanelyes:onClick(function ()
        ExitPanel:setVisible(false);


        GamePanel:setVisible(false);
        StartPanel:setVisible(true);
        totalScore = 0;

        self:showHeroes(false);
        self:showSelectCards(false);
        self:showMagicsCards(false);
        node_cards:stopAllActions();
        img_myBossbg:stopAllActions();
        img_enemyBossbg:stopAllActions();
        GamePanel:stopAllActions();
        self:resetHerobgPos();
        cc.Director:sharedDirector():getActionManager():removeAllActions();
        if img_magicCard then
            img_magicCard:setVisible(false);
        end

        returnflag = true;
    end);

    exitpanelno =  ExitPanel:getChildByName("btn_no");
    exitpanelno:onClick(function ()
        ExitPanel:setVisible(false);
    end);



	--开始游戏监听
	if startPlayBtn then
		startPlayBtn:onClick(function( ... )
			StartPanel:setVisible(false)
            self:createLevel();
            self:refreshLevel();
			LevelPanel:setVisible(true);
		end)
	end
    --英雄卡
	if btn_heroCard then
		btn_heroCard:onClick(function( ... )
			StartPanel:setVisible(false);
            self:createHero({maskType = "hero"});
            self:refreshHero();
            self:refreshHeroInfo();
            self:refreshGold(self:getGold());
            HeroPanel:setVisible(true);
		end)
	end
    --魔法卡
    if btn_magicCard then
		btn_magicCard:onClick(function( ... )
			StartPanel:setVisible(false);
            self:createMagic({maskType = "magic"});
            self:refreshMagic();
            self:refreshMagicInfo();
            self:refreshGold(self:getGold());
            MagicPanel:setVisible(true);
		end)
	end

	--开始游戏监听
	if startHelpBtn then
		startHelpBtn:onClick(function( ... )
			HelpPanel:setVisible(true)
			--开始游戏
			--PLAY_SOUND("majia/click.mp3")--播放音乐
		end)
	end

   heroReturn = HeroPanel:getChildByName("btn_return");
   if heroReturn then
		heroReturn:onClick(function( ... )
			HeroPanel:setVisible(false);
			StartPanel:setVisible(true);
		end)
	end
    btn_heroUpgrade = HeroPanel:getChildByName("btn_upgrade");
    btn_heroUpgrade:setZOrder(100);
    if btn_heroUpgrade then
        btn_heroUpgrade:onClick(function (...)
            self:upgradeHero();
        end);
    end

    btn_heropanel_add =  HeroPanel:getChildByName("img_addgold"):getChildByName("btn_add");
    txt_heropanel_add = HeroPanel:getChildByName("img_addgold"):getChildByName("txt_gold");
    if btn_heropanel_add then
        btn_heropanel_add:onClick(function (...)
            IPAPanel:setVisible(true);
        end);
    end

   magicReturn = MagicPanel:getChildByName("btn_return");
   if magicReturn then
		magicReturn:onClick(function( ... )
			MagicPanel:setVisible(false);
			StartPanel:setVisible(true);
		end)
	end

    btn_magicUpgrade = MagicPanel:getChildByName("btn_upgrade");
    btn_magicUpgrade:setZOrder(100);
    if btn_magicUpgrade then
        btn_magicUpgrade:onClick(function (...)
            self:upgradeMagic();
        end);
    end

    btn_magicpanel_add =  MagicPanel:getChildByName("img_addgold"):getChildByName("btn_add");
    txt_magicpanel_add = MagicPanel:getChildByName("img_addgold"):getChildByName("txt_gold");
    if btn_magicpanel_add then
        btn_magicpanel_add:onClick(function (...)
            IPAPanel:setVisible(true);
        end);
    end

    levelReturn = LevelPanel:getChildByName("btn_return");
    if levelReturn then
		levelReturn:onClick(function( ... )
			LevelPanel:setVisible(false);
			StartPanel:setVisible(true);
		end)
	end



   magicReturn = HeroPanel:getChildByName("btn_return");


	helpCloseBtn = HelpPanel:getChildByName("close")  

	if helpCloseBtn then
		helpCloseBtn:onClick(function( ... )
			HelpPanel:setVisible(false)
			--开始游戏
			--PLAY_SOUND("majia/click.mp3")--播放音乐
		end)
	end
	
    local bg = ScorePanel:getChildByName("bg");
    txt_score = ScorePanel:getChildByName("score");
    img_congratulations = ScorePanel:getChildByName("img_congratulations");
    txt_goldnumber = img_congratulations:getChildByName("txt_goldnumber");
    txt_expnumber = img_congratulations:getChildByName("txt_expnumber");
    txt_fail = ScorePanel:getChildByName("txt_fail");

    scoreCloseBtn = ScorePanel:getChildByName("close");
    if scoreCloseBtn then
		scoreCloseBtn:onClick(function( ... )
			ScorePanel:setVisible(false)
            GamePanel:setVisible(false);
            self:refreshLevel();
            LevelPanel:setVisible(true);
            self:showHeroes(false);
		end)
	end

    scoreReplayBtn = ScorePanel:getChildByName("btn_reset");
    txt_next = scoreReplayBtn:getChildByName("txt_next");
    if scoreReplayBtn then
		scoreReplayBtn:onClick(function( ... )
			ScorePanel:setVisible(false)
            self:showHeroes(false);
            self:startGame();
            
		end)
	end
    scoreLeaveBtn = ScorePanel:getChildByName("btn_leave");
    txt_leave = scoreReplayBtn:getChildByName("txt_leave");
    if scoreLeaveBtn then
		scoreLeaveBtn:onClick(function( ... )
			ScorePanel:setVisible(false)
            GamePanel:setVisible(false);
            self:refreshLevel();
            LevelPanel:setVisible(true);
             for i=1,3 do
                
                myHeroesbgs[i]:setVisible(false);
                myHeroes[i]:setVisible(false);
                myHeroes[i]:setTag(0);
                enemyHeroesbgs[i]:setVisible(false);
                enemyHeroes[i]:setVisible(false);
                enemyHeroes[i]:setTag(0);
                myDamage[i]:setVisible(false);
                mybg[i]:setVisible(false);
                myDamage[i]:setTextColor(cc.c3b(255,255,255));
                enemyDamage[i]:setVisible(false);
                enemybg[i]:setVisible(false);
                enemyDamage[i]:setTextColor(cc.c3b(255,255,255));
                myTip[i]:setVisible(false);
                enemyTip[i]:setVisible(false);
            end
		end)
	end

   img_congr = ScorePanel:getChildByName("img_congratulations");

    returnButton = GamePanel:getChildByName("btn_return");
    if returnButton then
		returnButton:onClick(function( ... )
        ExitPanel:setVisible(true);
        return;
--        GamePanel:setVisible(false);
--        StartPanel:setVisible(true);
--        totalScore = 0;

--        self:showHeroes(false);
--        self:showSelectCards(false);
--        self:showMagicsCards(false);
--        node_cards:stopAllActions();
--        img_myBossbg:stopAllActions();
--        img_enemyBossbg:stopAllActions();
--        GamePanel:stopAllActions();
--        self:resetHerobgPos();
--        cc.Director:sharedDirector():getActionManager():removeAllActions();
--        if img_magicCard then
--            img_magicCard:setVisible(false);
--        end

--        returnflag = true;
		end)
        
	end

    musicButton = GamePanel:getChildByName("btn_music");
    if musicButton then
		musicButton:onClick(function( ... )
            musicSwitch = not musicSwitch;
            cc.UserDefault:getInstance():setBoolForKey("musicSwitch",musicSwitch);
            if musicSwitch then
                PLAY_MUSIC("majia/sound/bg.mp3");
                 musicButton:loadTextures("majia/img/btn_sound.png","","");
                 --musicButton:setOpacity(255);
            else
                STOP_MUSIC();
                musicButton:loadTextures("majia/img/btn_sound1.png","","");
                --musicButton:setOpacity(128);
            end
		end)
	end

    gameHelpBtn = GamePanel:getChildByName("btn_help");
    if gameHelpBtn then
		gameHelpBtn:onClick(function( ... )
        HelpPanel:setVisible(true);
		end)
	end
    img_ok = SelectHeadPanel:getChildByName("img_ok");
    local btn_close = SelectHeadPanel:getChildByName("btn_close");
    btns = {}
    for i= 1,8 do
        btns[i] = SelectHeadPanel:getChildByName("btn_head"..i);
        btns[i]:setTag(i);
        if btns[i] then
		    btns[i]:onClick(function( sender )
                local tag = sender.target:getTag();
                    img_ok:setPosition(cc.p(btns[i]:getPositionX(),btns[i]:getPositionY()));
                    cc.UserDefault:getInstance():setIntegerForKey("headid",i+4);
                    img_head:loadTexture("majia/img/boss"..(i+4)..".png");
                    txt_startpanel_name:setString(""..self:getBossName(i+4));
		    end)
	    end
    end
    if btn_close then
		btn_close:onClick(function( sender )
            local headid = cc.UserDefault:getInstance():getIntegerForKey("headid",0);
            if headid == 0 then
                cc.UserDefault:getInstance():setIntegerForKey("headid",5);
            end
            SelectHeadPanel:setVisible(false);
            self:startFight();
		end)
    end
  
end

--刷新英雄卡信息
function ShejianGameScene:refreshHeroInfo()
    for i = 1,10 do
        local level = self:getHeroLevel(i);
        heroLevelLabel[i]:setString("Level:"..level);
        heroDamageLabel[i]:setString(""..self:getHeroDamage(i,level));
        heroUpgradeLabel[i]:setString(""..self:getUpHeroGold(i,level + 1));
    end
end


--刷新魔法卡信息
function ShejianGameScene:refreshMagicInfo()
    for i = 1,10 do
        local level = self:getMagicLevel(i);
        magicLevelLabel[i]:setString("Level:"..level);
        magicEffectLabel[i]:setString(""..self:getMagicEffec(i,level));
        magicUpgradeLabel[i]:setString(""..self:getUpMagicGold(i,level + 1));
    end
end


--升级英雄
function ShejianGameScene:upgradeHero()
    if heroIndex == nil then
        toastLayer:show("Please select a hero card");
        return;
    end
    local heroLevel = self:getHeroLevel(heroIndex);
    if heroLevel == 100 then
        return;
    end
    local goldnumber = self:getGold();
    local neednumber = self:getUpHeroGold(heroIndex,heroLevel + 1)
    if goldnumber < neednumber then
        toastLayer:show("Not enough gold coins");
        return;
    end
    goldnumber = goldnumber - neednumber
    self:setGold(goldnumber);
    self:refreshGold(goldnumber);
    heroLevel = heroLevel + 1;
    self:setHeroLevel(heroIndex,heroLevel);

    local currDamage = self:getHeroDamage(heroIndex,heroLevel);
    local nextlevelgold = self:getUpHeroGold(heroIndex,heroLevel + 1);

    heroLevelLabel[heroIndex]:setString("Level"..self:getHeroLevel(heroIndex));
    heroDamageLabel[heroIndex]:setString(""..currDamage);
    heroUpgradeLabel[heroIndex]:setString(""..nextlevelgold);

end

--升级魔法
function ShejianGameScene:upgradeMagic()
    if magicIndex == nil then
        toastLayer:show("Please select a magic card");
        return;
    end
    local magicLevel = self:getMagicLevel(magicIndex);
    if magicLevel == 100 then
        return;
    end

    local goldnumber = self:getGold();
    local neednumber = self:getUpMagicGold(magicIndex,magicLevel + 1)
    if goldnumber < neednumber then
        toastLayer:show("Not enough gold coins");
        return;
    end
    goldnumber = goldnumber - neednumber;
    self:setGold(goldnumber);
    self:refreshGold(goldnumber);
    magicLevel = magicLevel + 1;
    self:setMagicLevel(magicIndex,magicLevel);

    local currDamage = self:getMagicEffec(magicIndex,magicLevel);
    local nextlevelgold = self:getUpMagicGold(magicIndex,magicLevel + 1);

    magicLevelLabel[magicIndex]:setString("Level:"..self:getMagicLevel(magicIndex));
    magicEffectLabel[magicIndex]:setString(""..currDamage);
    magicUpgradeLabel[magicIndex]:setString(""..nextlevelgold);
end

--刷新金币
function ShejianGameScene:refreshGold(goldnumber)
    txt_startpanel_add:setString(""..goldnumber);
    txt_heropanel_add:setString(""..goldnumber);
    txt_magicpanel_add:setString(""..goldnumber);
end



--重置英雄位置
function ShejianGameScene:resetHerobgPos()
    for i=1,3 do
        myHeroesbgs[i]:stopAllActions();
        myHeroesbgs[i]:setPosition(myHeroesbgPos[i]);
        enemyHeroesbgs[i]:stopAllActions();
        enemyHeroesbgs[i]:setPosition(enemyHeroesbgsPos[i]);
        
    end
end

--获得某个英雄的等级
function ShejianGameScene:getHeroLevel(index)
    local strKey = "".."hero"..index.."Level";
    return cc.UserDefault:getInstance():getIntegerForKey(strKey,1);
end

--设置某个英雄的等级
function ShejianGameScene:setHeroLevel(index,currLevel)
    local strKey = "".."hero"..index.."Level";
    cc.UserDefault:getInstance():setIntegerForKey(strKey,currLevel);
end

--获得某个魔法的等级
function ShejianGameScene:getMagicLevel(index)
    local strKey = "".."magic"..index.."Level";
    return cc.UserDefault:getInstance():getIntegerForKey(strKey,1);
end

--设置某个魔法的等级
function ShejianGameScene:setMagicLevel(index,currLevel)
    local strKey = "".."magic"..index.."Level";
    cc.UserDefault:getInstance():setIntegerForKey(strKey,currLevel);
end



--[1] = {name = "Lightning I",effect = -10},


--显示或者隐藏6个英雄
function ShejianGameScene:showHeroes(visible)

    for i=1,3 do
        myHeroesbgs[i]:setVisible(visible);
        enemyHeroesbgs[i]:setVisible(visible);
    end
    for i=1,3 do
        myHeroes[i]:setVisible(false);
        myHeroes[i]:setTag(0);
        enemyHeroes[i]:setVisible(false);
        enemyHeroes[i]:setTag(0);
        myDamage[i]:setVisible(false);
        mybg[i]:setVisible(false);
        myDamage[i]:setTextColor(cc.c3b(255,255,255));
        enemyDamage[i]:setVisible(false);
        enemybg[i]:setVisible(false);
        enemyDamage[i]:setTextColor(cc.c3b(255,255,255));
        myTip[i]:setVisible(false);
        enemyTip[i]:setVisible(false);
    end

end

--加载4个随机的备选英雄
function ShejianGameScene:loadRandHeroes()
    --herostep
    local t = {};
    herostep = cc.UserDefault:getInstance():getIntegerForKey("herostep",4);
    for i=1,herostep do
        t[i] = i; 
    end
    for i=1,herostep do
        local r = math.floor(self:seededRandom(1,herostep+1));
        t[r],t[i] = t[i],t[r];
    end

    for i=1,4 do
        img_bgs[i]:loadTexture("majia/img/cardbg"..(1 + (t[i]-1)/10)..".png");
        btn_heroes[i]:loadTextures("majia/img/hero"..(1+(t[i]-1)%10)..".png","","");
        txt_heroesDamage[i]:setString(""..self:getHeroDamageByID(t[i]));
        txt_heroesName[i]:setString(""..self:getHeroNameByID(t[i]));
        btn_heroes[i]:setTag(t[i]);
    end
end

--加载4个随机的备选魔法
function ShejianGameScene:loadRandMagics()
    local t = {};
    magicstep = cc.UserDefault:getInstance():getIntegerForKey("magicstep",4);
    for i=1,magicstep do
        t[i] = i; 
    end
    for i=1,magicstep do
        local r = math.floor(self:seededRandom(1,magicstep+1));
        t[r],t[i] = t[i],t[r];
    end

    for i=1,4 do
        img_magicbgs[i]:loadTexture("majia/img/cardbg"..(1 + (t[i]-1)/10)..".png");
        btn_magics[i]:loadTextures("majia/img/magic"..(1+(t[i]-1)%10)..".png","","");
        txt_magicsDamage[i]:setString(""..self:getMagicValueByID(t[i]));
        txt_magicsName[i]:setString(""..self:getMagicNameByID(t[i]));
        btn_magics[i]:setTag(t[i]);
    end
end

--显示或者隐藏4个选择的英雄
function ShejianGameScene:showSelectCards(visible)
    img_bg1:setVisible(visible);
    img_bg2:setVisible(visible);
    img_bg3:setVisible(visible);
    img_bg4:setVisible(visible);
end

--显示或者隐藏4个选择的魔法
function ShejianGameScene:showMagicsCards(visible)
    imgMagic_bg1:setVisible(visible);
    imgMagic_bg2:setVisible(visible);
    imgMagic_bg3:setVisible(visible);
    imgMagic_bg4:setVisible(visible);
end


--播放音效
function ShejianGameScene:playSound(path)
    if musicSwitch then
        PLAY_SOUND(path);
    end
end

--开始游戏
function ShejianGameScene:startGame()
   returnflag = false;
   --local headid = cc.UserDefault:getInstance():getIntegerForKey("headid",0);
--   if headid == 0 then
--       SelectHeadPanel:setVisible(true);
--   else
       self:startFight();
--   end
end

--开始战斗
function ShejianGameScene:startFight()
    printEX("开始战斗");
    img_myBossbg:setPosition(cc.p(-104,360));
    img_myBossbg:setScale(1.5);
    local headid = cc.UserDefault:getInstance():getIntegerForKey("headid",0);
    local img_boss = img_myBossbg:getChildByName("img_boss");
    img_boss:loadTexture("majia/img/boss"..headid..".png");
    txt_HP = img_myBossbg:getChildByName("txt_hp");
    --HP = hp[level]
    HP = self:getBossHP(self:getBossLevel());
    txt_HP:setString(HP);

    img_enemyBossbg:setPosition(cc.p(1240,360));
    img_enemyBossbg:setScale(1.5);
    local enemyheadid = level_config[level].boss;
    local img_enemyboss = img_enemyBossbg:getChildByName("img_boss");
    img_enemyboss:loadTexture("majia/img/boss"..enemyheadid..".png");
    txt_ENEMYHP = img_enemyBossbg:getChildByName("txt_hp");
    ENEMYHP = level_config[level].hp;
    txt_ENEMYHP:setString(ENEMYHP);

    --cc.Spawn:create())
    node_cards:runAction(cc.Sequence:create(cc.CallFunc:create(function ()
        img_myBossbg:runAction(cc.MoveTo:create(0.2,cc.p(503,img_myBossbg:getPositionY())));
        img_enemyBossbg:runAction(cc.MoveTo:create(0.2,cc.p(633,img_enemyBossbg:getPositionY())));
    end),cc.DelayTime:create(0.2),cc.CallFunc:create(function ()
        --self:shake();
    end),cc.CallFunc:create(function ()
        img_myBossbg:runAction(cc.MoveTo:create(0.5,cc.p(100,220)));
        img_enemyBossbg:runAction(cc.MoveTo:create(0.5,cc.p(1036,520)));
    end),cc.DelayTime:create(0.5),cc.CallFunc:create(function ()
        img_myBossbg:runAction(cc.Sequence:create(cc.MoveTo:create(0.25,cc.p(568,100)),cc.MoveTo:create(0.25,cc.p(100,220))));
        img_enemyBossbg:runAction(cc.Sequence:create(cc.MoveTo:create(0.25,cc.p(568,540)),cc.MoveTo:create(0.25,cc.p(1036,520))));
        self:showHeroes(true);
    end),cc.DelayTime:create(0.5),cc.CallFunc:create(function ()
        self:loadRandHeroes();
        self:showSelectCards(true);
    end)));
    


    

end

--背景震动效果
function ShejianGameScene:shake(time)
--    local stopflag = false;
--    GamePanel:runAction(cc.Sequence:create(cc.DelayTime:create(time),cc.CallFunc:create(function ()
--        stopflag = true;
--    end)));
    self:playSound("majia/sound/bomb.wav");
    GamePanel:runAction(cc.RepeatForever:create(cc.Sequence:create(cc.CallFunc:create(function ()
        local x = self:seededRandom(0,51)-25;
        local y = self:seededRandom(0,51)-25;
        GamePanel:setPosition(cc.p(568 + x,320 + y));
    end)
   ,cc.DelayTime:create(0.01)
--,cc.CallFunc:create(function ()
--        if stopflag then
--            GamePanel:setPosition(cc.p(568,320));
--            GamePanel:stopAllActions();
--        end
--    end)
    )));
end

--创建英雄按钮
function ShejianGameScene:createHero(info)
    if self.heroView ~= nil then
        return;
    end
    self.heroView = self:createBGButton(info);
    HeroPanel:addChild(self.heroView);
    txt_heropanel_add:setString(""..self:getGold());
end

--创建魔法按钮
function ShejianGameScene:createMagic(info)
   if self.magicView ~= nil then
        return;
    end
    self.magicView = self:createBGButton(info);
    MagicPanel:addChild(self.magicView);
    txt_magicpanel_add:setString(""..self:getGold());
end



--创建关卡
function ShejianGameScene:createLevel()
    if self.levelView ~= nil then
        return;
    end
    self.levelView = ccui.PageView:create();
    self.levelView:setTouchEnabled(true);
    self.levelView:setContentSize(cc.size(1136,560));
    self.levelView:setPosition(cc.p(0,0));
    LevelPanel:addChild(self.levelView);
    for i=1,5 do
        local layout = ccui.Layout:create();
        layout:setContentSize(cc.size(1136, 560));
         for j = 1,5 do
            for k=1,9 do
                local btn= ccui.Button:create("majia/img/lock.png","","");
                levelbtns[#levelbtns+1] = btn;
                btn:setPosition(95+(91+30)*(k-1),505-(j-1)*(90+20));
                btn:setTag(((i-1)*9*5+(j-1)*9+k));
                local number = cc.Label:createWithTTF("", "majia/font555.ttf", 36);
                number:setName("number");
                number:setVisible(false);
                number:setAnchorPoint(cc.p(0.5,0.5));
                number:setString(""..btn:getTag());
	            number:setTextColor(cc.c3b(255,255,255));
                number:setPosition(cc.p(btn:getContentSize().width/2,btn:getContentSize().height/2+5));
                btn:addChild(number);

                layout:addChild(btn);
                btn:onClick(function(sender)
                    local tag = sender.target:getTag();
                    level = tag;
                    printEX("你点击了第"..tag.."关");
                    LevelPanel:setVisible(false);
                    GamePanel:setVisible(true);
                    self:startGame();

                end)
            end
        end
        self.levelView:addChild(layout);
    end
    self.levelView:addEventListener(function(sender,event)
        printEX("事件值="..event)
        if event == 0 then
            printEX(""..self.levelView:getCurPageIndex())
        end
    end)
end

--刷新英雄
function ShejianGameScene:refreshHero()
    --heros_mask;
    
    --magic_mask;
    local herostep = cc.UserDefault:getInstance():getIntegerForKey("herostep",4);
    for i=1,herostep do
        heros_mask[i]:setVisible(false);
    end
    --for i= herostep+1,30 do
    --升级后，只有一页了，然后升级
    for i = herostep + 1,10 do
        heros_mask[i]:setVisible(true);
    end
end


--刷新魔法
function ShejianGameScene:refreshMagic()
    local magicstep = cc.UserDefault:getInstance():getIntegerForKey("magicstep",4);
    for i=1,magicstep do
        magic_mask[i]:setVisible(false);
    end
    --for i= magicstep+1,30 do
    --升级后，只有一页了，然后升级
    for i= magicstep+1,10 do
        magic_mask[i]:setVisible(true);
    end
end

function ShejianGameScene:createBGButton(info)
    local pageView = ccui.PageView:create();
    pageView:setTouchEnabled(true);
    pageView:setContentSize(cc.size(1136,560));
    pageView:setPosition(cc.p(0,0));
    --升级后不需要三页了，只需要一页，然后升级
    --for i=1,3 do
    for i=1,1 do
        local layout = ccui.Layout:create();
        layout:setContentSize(cc.size(1136, 560));
         for j = 1,2 do
            for k=1,5 do
                local btn= ccui.Button:create("majia/img/cardbg"..i..".png","majia/img/cardbg"..i..".png","majia/img/cardbg"..i..".png");
                btn:setPosition(208+180*(k-1),440-(j-1)*(220));
                --btn:setTag(((i-1)*2*5+(j-1)*5+k));
                local img = nil;
                if info.maskType == "hero" then
                    img = ccui.ImageView:create("majia/img/hero"..((j-1)*5+k)..".png");
                else
                    img = ccui.ImageView:create("majia/img/magic"..((j-1)*5+k)..".png");
                end
                img:setPosition(btn:getContentSize().width/2,btn:getContentSize().height/2+16);
                local mask = ccui.ImageView:create("majia/img/mask.png");
                --mask:setTag(((i-1)*2*5+(j-1)*5+k));
                mask:setScale(1.38);
                mask:setPosition(cc.p(img:getContentSize().width/2,img:getContentSize().height/2));
                if info.maskType == "hero" then
                    heros_mask[#heros_mask + 1] = mask;
                else
                    magic_mask[#magic_mask +1] = mask;
                end
                img:addChild(mask,2);
                btn:addChild(img);

                
                local name = cc.Label:createWithTTF("", "majia/font555.ttf", 20);
                name:setAnchorPoint(cc.p(0.5,0.5));
                if info.maskType == "hero" then
	                name:setString(""..hero_config[(i-1)*2*5+(j-1)*5+k].name);
                else
                    name:setString(""..magic_config[(i-1)*2*5+(j-1)*5+k].name);
                end
	            name:setTextColor(cc.c3b(255,255,255));
                --name:setPosition(cc.p(img:getPositionX()-65,img:getPositionY()-107));
                name:setPosition(cc.p(img:getPositionX(),img:getPositionY()-107));
                btn:addChild(name);
                local img_bg_select = ccui.ImageView:create("majia/img/bg_select.png");
                if info.maskType == "hero" then
                    heroSelectBG[#heroSelectBG + 1] = img_bg_select;
                    self:addDamage(img,(j-1)*5 + k);
                    self:addHeroLevel(btn,(j-1)*5 + k);
                    self:addHeroUpgrade(img,(j-1)*5 + k);
                else
                    magicSelectBG[#magicSelectBG + 1] = img_bg_select;
                    self:addEffect(img,(j-1)*5 + k);
                    self:addMagicLevel(btn,(j-1)*5 + k);
                    self:addMagicUpgrade(img,(j-1)*5 + k);
                end
                
                img_bg_select:setPosition(cc.p(btn:getContentSize().width/2,btn:getContentSize().height/2));
                btn:addChild(img_bg_select);
                img_bg_select:setVisible(false);
                btn:setScale(0.8);
                layout:addChild(btn);
                btn:onClick(function( ... )
                    local index = (j-1)*5 + k;
                    self:onSelect(index,info.maskType);
                end)
            end
        end
        pageView:addChild(layout);
    end
    pageView:addEventListener(function(sender,event)
        printEX("事件值="..event)
        if event == 0 then
            printEX(""..pageView:getCurPageIndex())
        end
    end)
    return pageView;
end

--给英雄图片增加伤害标签
function ShejianGameScene:addDamage(img,index)
    local numberbg = ccui.ImageView:create("majia/img/numberbg.png");
    numberbg:setPosition(cc.p(img:getContentSize().width - 22.5,15));
    img:addChild(numberbg,0);
    local damage = cc.Label:createWithTTF("", "majia/font555.ttf", 20);
    heroDamageLabel[index] = damage;
    damage:setAnchorPoint(cc.p(1,0.5));
    damage:setPosition(cc.p(img:getContentSize().width,15));
    damage:setTextColor(cc.c3b(0,255,0));
    damage:setString("000");
    img:addChild(damage,1);
end

--给魔法图片增加效果标签
function ShejianGameScene:addEffect(img,index)
    local numberbg = ccui.ImageView:create("majia/img/numberbg.png");
    numberbg:setPosition(cc.p(img:getContentSize().width - 22.5,15));
    img:addChild(numberbg,0);
    local effect = cc.Label:createWithTTF("", "majia/font555.ttf", 20);
    magicEffectLabel[index] = effect;
    effect:setAnchorPoint(cc.p(1,0.5));
    effect:setPosition(cc.p(img:getContentSize().width,15));
    effect:setTextColor(cc.c3b(0,255,0));
    effect:setString("000");
    img:addChild(effect,1);

end

--给英雄按钮增加等级标签
function ShejianGameScene:addHeroLevel(btn,index)
    local level = cc.Label:createWithTTF("", "majia/font555.ttf", 20);
    heroLevelLabel[index] = level;
    level:setAnchorPoint(cc.p(0.5,0.5));

	level:setString("Level: 0");
	level:setTextColor(cc.c3b(255,255,255));
    --name:setPosition(cc.p(img:getPositionX()-65,img:getPositionY()-107));
    level:setPosition(cc.p(btn:getContentSize().width/2,btn:getContentSize().height-28));
    btn:addChild(level);
end

--给魔法按钮增加等级标签
function ShejianGameScene:addMagicLevel(btn,index)
    local level = cc.Label:createWithTTF("", "majia/font555.ttf", 20);
    magicLevelLabel[index] = level;
    level:setAnchorPoint(cc.p(0.5,0.5));

	level:setString("Level: 1");
	level:setTextColor(cc.c3b(255,255,255));
    --name:setPosition(cc.p(img:getPositionX()-65,img:getPositionY()-107));
    level:setPosition(cc.p(btn:getContentSize().width/2,btn:getContentSize().height-28));
    btn:addChild(level);
end

--给英雄加上升级标签
function ShejianGameScene:addHeroUpgrade(img,index)
    --heroUpgradeLabel
    local goldbg = ccui.ImageView:create("majia/img/upgoldbg.png");
    goldbg:setPosition(cc.p(img:getContentSize().width - 40,img:getContentSize().height-11));
    img:addChild(goldbg,0);
    local goldnumber = cc.Label:createWithTTF("", "majia/font555.ttf", 20);
    heroUpgradeLabel[index] = goldnumber;
    goldnumber:setAnchorPoint(cc.p(1,0.5));
    goldnumber:setPosition(cc.p(img:getContentSize().width,img:getContentSize().height-11));
    goldnumber:setTextColor(cc.c3b(255,255,0));
    goldnumber:setString("0000");
    img:addChild(goldnumber,1);
end

--给魔法加上升级标签
function ShejianGameScene:addMagicUpgrade(img,index)
    --magicUpgradeLabel
    local goldbg = ccui.ImageView:create("majia/img/upgoldbg.png");
    goldbg:setPosition(cc.p(img:getContentSize().width - 40,img:getContentSize().height-11));
    img:addChild(goldbg,0);
    local goldnumber = cc.Label:createWithTTF("", "majia/font555.ttf", 20);
    magicUpgradeLabel[index] = goldnumber;
    goldnumber:setAnchorPoint(cc.p(1,0.5));
    goldnumber:setPosition(cc.p(img:getContentSize().width,img:getContentSize().height-11));
    goldnumber:setTextColor(cc.c3b(255,255,0));
    goldnumber:setString("0000");
    img:addChild(goldnumber,1);
end

--英雄或者魔法按钮的相应函数
function ShejianGameScene:onSelect(index,maskType)
    if maskType == "hero" then
        local herostep = cc.UserDefault:getInstance():getIntegerForKey("herostep",4);
        if index > herostep then
            return;
        end
        heroIndex = index;
    else
        local magicstep = cc.UserDefault:getInstance():getIntegerForKey("magicstep",4);
        if index > magicstep then
            return;
        end
        magicIndex = index;
    end
    self:refreshSelectBG(index,maskType);

end

--刷新英雄或者魔法卡的显示背景
function ShejianGameScene:refreshSelectBG(index,maskType)
    local bgbtns = nil;
   if maskType == "hero" then
       bgbtns = heroSelectBG;
   else
       bgbtns = magicSelectBG;
   end
   for i = 1,# bgbtns do
       if i ~= index then
           bgbtns[i]:setVisible(false);
       else
           bgbtns[i]:setVisible(true);
       end
   end

end


--根据读取进度来刷新关卡
function ShejianGameScene:refreshLevel()
    maxlevel = cc.UserDefault:getInstance():getIntegerForKey("maxlevel",0);
    if maxlevel == 0 then
        maxlevel = 1;
    end
    for i=1,maxlevel-1 do
        levelbtns[i]:loadTextures("majia/img/unlock.png","","");
        local number = levelbtns[i]:getChildByName("number");
        number:setVisible(true);
        levelbtns[i]:setTouchEnabled(true);
    end

    levelbtns[maxlevel]:loadTextures("majia/img/unlock.png","","");
    levelbtns[maxlevel]:setTouchEnabled(true);
    local number = levelbtns[maxlevel]:getChildByName("number");
    number:setVisible(true);

    for i=maxlevel +1,9*5*5 do
        levelbtns[i]:setTouchEnabled(false);
    end
end

--通过id得到英雄的名字
function ShejianGameScene:getHeroNameByID(id)
   return hero_config[id].name;
end

--通过id得到魔法的名字
function ShejianGameScene:getMagicNameByID(id)
    return magic_config[id].name;
end


--通过id得到英雄的伤害
function ShejianGameScene:getHeroDamageByID(index)
    --return hero_config[id].damage;
    local level = self:getHeroLevel(index);
    return self:getHeroDamage(index,level);
end

--通过id得到魔法值
function ShejianGameScene:getMagicValueByID(index)
    --return magic_config[id].effect;
    local level = self:getMagicLevel(index);
    return self:getMagicEffec(index,level);
end

--选择英雄
function ShejianGameScene:selectHero(tag)
    for i=1,#myHeroes do
        if myHeroes[i]:getTag() ==  0 then
            myHeroes[i]:setTag(tag);
            myHeroes[i]:loadTextures("majia/img/hero"..(1+(tag-1)%10)..".png","","");
            myHeroes[i]:setVisible(true);
            myDamage[i]:setString(""..self:getHeroDamageByID(tag));
            myDamage[i]:setVisible(true);
            mybg[i]:setVisible(true);
            if i == 3 then
                self:showSelectCards(false);
                self:enemySelectHero();
            end
            return;
        end
    end
    
end

--增加敌人选择英雄过程
function ShejianGameScene:enemySelectHero()
    local t = {};
    for i=1,herostep do
        t[i] = i; 
    end
    for i=1,herostep do
        local r = math.floor(self:seededRandom(1,herostep+1));
        t[r],t[i] = t[i],t[r];
    end

    for i= 1,3 do
        enemyHeroes[i]:runAction(cc.Sequence:create(cc.DelayTime:create((i-1)*0.2),cc.CallFunc:create(function ()
            enemyHeroes[i]:loadTextures("majia/img/hero"..(1+(t[i]-1)%10)..".png","","");
            enemyHeroes[i]:setScale(1.5);
            enemyHeroes[i]:setVisible(true);
        end),cc.Spawn:create(cc.ScaleTo:create(0.2,1)),cc.CallFunc:create(function ()
            enemyDamage[i]:setString(""..self:getHeroDamageByID(t[i]));
            local myDamageValue = tonumber(myDamage[i]:getString());
            local enemyDamageValue = tonumber(enemyDamage[i]:getString());

            if myDamageValue > enemyDamageValue then
                myDamage[i]:setTextColor(cc.c3b(0,255,0));
                enemyDamage[i]:setTextColor(cc.c3b(255,0,0));
            elseif myDamageValue == enemyDamageValue then
                myDamage[i]:setTextColor(cc.c3b(255,255,255));
                enemyDamage[i]:setTextColor(cc.c3b(255,255,255));
            elseif myDamageValue < enemyDamageValue then
                myDamage[i]:setTextColor(cc.c3b(255,0,0));
                enemyDamage[i]:setTextColor(cc.c3b(0,255,0));
            end
            enemyDamage[i]:setVisible(true);
            enemybg[i]:setVisible(true);
            if i == 3 then
    --            img_myBossbg:runAction(cc.Sequence:create(cc.Spawn:create(cc.MoveTo:create(0.2,cc.p(568,100)),cc.ScaleTo:create(0.2,1))));
    --            img_enemyBossbg:runAction(cc.Sequence:create(cc.Spawn:create(cc.MoveTo:create(0.2,cc.p(568,540)),cc.ScaleTo:create(0.2,1))));
                effectValue = 0;
                self:loadRandMagics();
                self:showMagicsCards(true)
            end
        end)));
        
    end
end

--敌人选择魔法
function ShejianGameScene:enemySelectMagic()
    if returnflag then
        return;
    end
    local t = {};
    for i=1,magicstep do
        t[i] = i; 
    end
    local r = math.floor(self:seededRandom(1,magicstep+1));
    if img_magicCard == nil then
        img_magicCard = ccui.ImageView:create("majia/img/magic"..(1+(t[r]-1)%10)..".png");
        node_cards:addChild(img_magicCard,10);
    else
        img_magicCard:loadTexture("majia/img/magic"..(1+(t[r]-1)%10)..".png");
        img_magicCard:setVisible(true);
    end
    local effectValue = self:getMagicValueByID(r);

    local effectid = math.floor(self:seededRandom(1,4));
    local pos = nil;
    if effectValue > 0 then
        pos = cc.p(enemyHeroesbgs[effectid]:getPositionX(),enemyHeroesbgs[effectid]:getPositionY());
    else
        pos = cc.p(myHeroesbgs[effectid]:getPositionX(),myHeroesbgs[effectid]:getPositionY());
    end
    img_magicCard:setPosition(pos);
    img_magicCard:setScale(3);
    
    img_magicCard:runAction(cc.Sequence:create(cc.ScaleTo:create(0.5,1),cc.CallFunc:create(function ()
        --img_myBossbg:runAction(cc.Spawn:create(cc.MoveTo:create(0.5,cc.p(568,90)),cc.ScaleTo:create(0.5,1)));
        --img_enemyBossbg:runAction(cc.Spawn:create(cc.MoveTo:create(0.5,cc.p(568,570)),cc.ScaleTo:create(0.5,1)));
    end),cc.CallFunc:create(function ()
        img_magicCard:setVisible(false);
        if effectValue >0 then
            local value = tonumber(enemyDamage[effectid]:getString()) + effectValue;
            enemyDamage[effectid]:setString(""..value);
            self:playSound("majia/sound/up.mp3");
        else
            local value = tonumber(myDamage[effectid]:getString()) + effectValue;
            if value < 0 then
                value = 0;
            end
            myDamage[effectid]:setString(""..value);
            self:playSound("majia/sound/harm.mp3");
        end
        local myHP = tonumber(myDamage[effectid]:getString());
        local enemyHP = tonumber(enemyDamage[effectid]:getString())
        if myHP > enemyHP then
            myDamage[effectid]:setTextColor(cc.c3b(0,255,0));
            enemyDamage[effectid]:setTextColor(cc.c3b(255,0,0));
        elseif myHP == enemyHP then
            myDamage[effectid]:setTextColor(cc.c3b(255,255,255));
            enemyDamage[effectid]:setTextColor(cc.c3b(255,255,255));
        else
            myDamage[effectid]:setTextColor(cc.c3b(255,0,0));
            enemyDamage[effectid]:setTextColor(cc.c3b(0,255,0));
        end
        if returnflag then
            if img_magicCard then
                img_magicCard:setVisible(false);
            end
            return;
        end
        self:fight(1,tonumber(myDamage[1]:getString()),tonumber(enemyDamage[1]:getString()));


        img_myBossbg:runAction(cc.Sequence:create(cc.DelayTime:create(0.5),cc.Spawn:create(cc.MoveTo:create(0.5,cc.p(568,90)),cc.ScaleTo:create(0.5,1))));
        img_enemyBossbg:runAction(cc.Sequence:create(cc.DelayTime:create(0.5),cc.Spawn:create(cc.MoveTo:create(0.5,cc.p(568,570)),cc.ScaleTo:create(0.5,1))));

    end)));

end

--第几轮战争
function ShejianGameScene:fight(round,myHP,enemyHP)
    if returnflag then
        return;
    end
    
    local mySelf = myHeroesbgs[round];
    local enemy = enemyHeroesbgs[round];
    local myPos = cc.p(mySelf:getPositionX(),mySelf:getPositionY());
    local enemyPos = cc.p(enemy:getPositionX(),enemy:getPositionY());
    node_cards:runAction(cc.Sequence:create(cc.CallFunc:create(function ()
        if returnflag then
            return;
        end
        mySelf:runAction(cc.Sequence:create(cc.MoveTo:create(0.2,cc.p(myPos.x,myPos.y - 80)),cc.MoveTo:create(0.2,cc.p(myPos.x,myPos.y+20))));
        enemy:runAction(cc.Sequence:create(cc.MoveTo:create(0.2,cc.p(enemyPos.x,enemyPos.y + 80)),cc.MoveTo:create(0.2,cc.p(enemyPos.x,enemyPos.y-20))));
    end),cc.DelayTime:create(0.4),cc.CallFunc:create(function ()
        if returnflag then
            return;
        end
        self:shake(0.2);
    end),cc.DelayTime:create(0.25),cc.CallFunc:create(function ()
        GamePanel:stopAllActions();
        GamePanel:setPosition(cc.p(568,320));
        if myHP > enemyHP then
            enemy:setVisible(false);
            enemy:setPosition(enemyPos);
            mySelf:runAction(cc.Sequence:create(cc.MoveTo:create(0.2,cc.p(568,myPos.y+20)),cc.DelayTime:create(0.2),cc.MoveTo:create(0.2,cc.p(568,450)),cc.CallFunc:create(function ()
                if returnflag then
                    return;
                end 
                self:shake(0.2);   
            end),cc.DelayTime:create(0.25),cc.CallFunc:create(function ()
                GamePanel:stopAllActions();
                GamePanel:setPosition(cc.p(568,320));
                mySelf:setVisible(false);
                mySelf:setPosition(myPos);
                self:refreshHP(myHP,enemyHP);
                self:checkNext(round);
            end)));
        elseif myHP < enemyHP then
            mySelf:setVisible(false);
            mySelf:setPosition(myPos);
            if returnflag then
                    return;
            end
            enemy:runAction(cc.Sequence:create(cc.MoveTo:create(0.2,cc.p(568,enemyPos.y-20)),cc.DelayTime:create(0.2),cc.MoveTo:create(0.2,cc.p(568,200)),cc.CallFunc:create(function ()
                if returnflag then
                    return;
                end
                self:shake(0.2);    
            end),cc.DelayTime:create(0.25),cc.CallFunc:create(function ()
                GamePanel:stopAllActions();
                GamePanel:setPosition(cc.p(568,320));
                 enemy:setVisible(false);
                 enemy:setPosition(enemyPos);
                 self:refreshHP(myHP,enemyHP);
                 self:checkNext(round);
            end)));
        else
            mySelf:setVisible(false);
            enemy:setVisible(false);
            mySelf:setPosition(myPos);
            enemy:setPosition(enemyPos);
            self:refreshHP(myHP,enemyHP);
            if returnflag then
                    return;
            end
            self:checkNext(round);
        end
        
        
        
    end)));
end

--刷新分数
function ShejianGameScene:refreshHP(myHP,enemyHP)
    if myHP > enemyHP then
        ENEMYHP = ENEMYHP - myHP;
        if ENEMYHP < 0 then
            ENEMYHP = 0;
        end 
        txt_ENEMYHP:setString(""..ENEMYHP);
        self:addFloatEffect(568,550,myHP);
--    elseif myHP == enemyHP then
--        HP = HP - myHP;
--        if HP < 0 then
--            HP = 0;
--        end
--        ENEMYHP = ENEMYHP - enemyHP;
--        if ENEMYHP < 0 then
--            ENEMYHP = 0;
--        end
--        txt_HP:setString(""..HP);
--        txt_ENEMYHP:setString(""..ENEMYHP);
    elseif myHP < enemyHP then
        HP = HP - enemyHP;
        if HP < 0 then
            HP = 0;
        end
        txt_HP:setString(""..HP);
        self:addFloatEffect(568,50,enemyHP);
    end

end

--检查是否进行下一组
function ShejianGameScene:checkNext(round)
    if HP == 0 then
        --分数面板，重玩或者离开
        img_congratulations:setVisible(false);
        txt_fail:setVisible(true);
        txt_next:setString("replay");
        ScorePanel:setVisible(true);
        self:playSound("majia/sound/gameOver.mp3");
    elseif ENEMYHP == 0 then
        --分数面板，下一关或者离开
        self:playSound("majia/sound/pass.mp3.mp3");
        img_congratulations:setVisible(true);
        txt_fail:setVisible(false);
        txt_next:setString("next");


        local currlevel = self:getBossLevel();

        local fromgold = self:getGold();
        local prizeGold = self:getGoldPrize(currlevel);
        local togold = fromgold + prizeGold;
        self:setGold(togold);
        txt_goldnumber:setString("+"..prizeGold);
        txt_startpanel_add:setString(self:getGold());

        local fromexp = self:getExp();
        local prizeExp = self:getExpPrize(currlevel);
        local toexp= fromexp + prizeExp;
        self:setExp(toexp);
        txt_expnumber:setString("+"..prizeExp);
        if self:getBossLevelByExp(fromexp) < self:getBossLevelByExp(toexp) then
            self:setBossLevel(self:getBossLevelByExp(toexp));
            self:addFloatEffectII(ScorePanel:getContentSize().width/2,ScorePanel:getContentSize().height/2,"LEVEL UP",ScorePanel);
        end
        txt_startlevel:setString(""..self:getBossLevel());
        self:refreshExp();

        
        if level + 1 > cc.UserDefault:getInstance():getIntegerForKey("maxlevel",1) then
            maxlevel = level + 1;
            if level > 225 then
                level = 225;
            end
            cc.UserDefault:getInstance():setIntegerForKey("maxlevel",maxlevel)
            herostep = herostep + 1;
            magicstep = magicstep + 1;
            if herostep > 10 then
                herostep = 10;
            end
            if magicstep > 10 then
                magicstep = 10;
            end
            cc.UserDefault:getInstance():setIntegerForKey("herostep",herostep);
            cc.UserDefault:getInstance():setIntegerForKey("magicstep",magicstep);
        end
        level = level + 1;
        ScorePanel:setVisible(true);
    else
        if round == 3 then
            --下一轮重新开始
            printEX("重新开始");

            

            img_myBossbg:runAction(cc.MoveTo:create(0.25,cc.p(100,220)));
            img_enemyBossbg:runAction(cc.MoveTo:create(0.25,cc.p(1036,520)));

            self:showHeroes(true);
            self:loadRandHeroes();
            self:showSelectCards(true);
        else
            self:fight(round+1,tonumber(myDamage[round+1]:getString()),tonumber(enemyDamage[round+1]:getString()));
        end
    end
end

--选择魔法
function ShejianGameScene:selectMagics(tag)
    printEX("选择了魔法按钮");
--    for i=1,#myHeroes do
--        if myHeroes[i]:getTag() ==  0 then
--            myHeroes[i]:setTag(tag);
--            myHeroes[i]:loadTextures("majia/img/hero"..(1+(tag-1)%10)..".png","","");
--            myHeroes[i]:setVisible(true);
--            myDamage[i]:setString(""..self:getHeroDamageByID(tag));
--            myDamage[i]:setVisible(true);
--            if i == 3 then
--                self:showSelectCards(false);
--                self:enemySelectHero();
--            end
--            return;
--        end
--    end
--    for i=1,4 do
--        img_magicbgs[i]:loadTexture("majia/img/cardbg"..(1 + (t[i]-1)/10)..".png");
--        btn_magics[i]:loadTextures("majia/img/magic"..(1+(t[i]-1)%10)..".png","","");
--        txt_magicsDamage[i]:setString(""..self:getMagicValueByID(t[i]));
--        txt_magicsName[i]:setString(""..self:getMagicNameByID(t[i]));
--        btn_magics[i]:setTag(t[i]);
--    end
    for i = 1,3 do
        myTip[i]:setVisible(false);
        enemyTip[i]:setVisible(false);
    end
    effectValue = self:getMagicValueByID(tag);
    if effectValue > 0 then
        for i = 1,3 do
            myTip[i]:setVisible(true);
        end
    else
         for i = 1,3 do
            enemyTip[i]:setVisible(true);
        end
    end
end

--飘字特效
function ShejianGameScene:addFloatEffect(x,y,number)
    local label = cc.Label:createWithTTF("-"..number, "majia/font555.ttf", 32)
	label:setColor(cc.c3b(255,0,0));
	label:setAnchorPoint(cc.p(0.5,0.5));
    label:setPosition(cc.p(x,y));
    node_effect:addChild(label);
    label:runAction(cc.Sequence:create(cc.MoveBy:create(0.5,cc.p(0,50)),cc.DelayTime:create(0.5),cc.RemoveSelf:create()));
end

--飘字特效II
function ShejianGameScene:addFloatEffectII(x,y,str,node)
    local label = cc.Label:createWithTTF(""..str, "majia/font555.ttf", 32)
    label:setZOrder(10);
	label:setColor(cc.c3b(255,255,0));
	label:setAnchorPoint(cc.p(0.5,0.5));
    label:setPosition(cc.p(x,y));
    node:addChild(label);
    label:runAction(cc.Sequence:create(cc.DelayTime:create(0.5),cc.MoveBy:create(0.5,cc.p(0,50)),cc.DelayTime:create(0.5),cc.RemoveSelf:create()));
end


function ShejianGameScene:setWebViewPanelInfo(tile,url)
    txt_tips6:setOpacity(255);
    txt_tips6:setString("");
    txt_webviewTitle:setString(tile);
    --webview = node_webview :getChildByName("webview");
    webview = ccexp.WebView:create()
    webview:setContentSize(cc.size(700,520))
    webview:setScalesPageToFit(true)
    -- webview:loadHTMLString(true)
    webview:setPosition(cc.p(0,0))
    webview:loadURL(url);
    node_webview:addChild(webview)
    webview:setOnShouldStartLoading(function(sender,url)
        txt_tips6:setString("start loading ......");
        txt_tips6:stopAllActions();
        return true
    end)
    webview:setOnDidFinishLoading(function(sender,url)
        txt_tips6:setString("load complete !");
        txt_tips6:runAction(cc.Sequence:create(cc.FadeOut:create(1)));
    end)
    webview:setOnDidFailLoading(function(sender,url)
        txt_tips6:setString("load fail !")
        txt_tips6:runAction(cc.Sequence:create(cc.FadeOut:create(1)));
    end)  
    webview:reload();

end

--内购
function ShejianGameScene:buy(index)
    IPAPanel:setVisible(false);
    utils:iosBuy(IAPitems[index].productid,0,"cc",IAPitems[index].productid);
end

--加金币
function ShejianGameScene:addGoldCoin(item)
    print("----------------item = "..item);
    local buyGold = 0;
    if item == IAPitems[1].productid then
        buyGold = IAPitems[1].gold;
        --eventManager:publish("ReceiveALMS",{Score = IAPitems[1].gold});
    elseif item == IAPitems[2].productid then
        buyGold = IAPitems[2].gold;
        --eventManager:publish("ReceiveALMS",{Score = IAPitems[2].gold});
    elseif item == IAPitems[3].productid then
        buyGold = IAPitems[3].gold;
        --eventManager:publish("ReceiveALMS",{Score = IAPitems[3].gold});
    elseif item == IAPitems[4].productid then
        buyGold = IAPitems[4].gold;
        --eventManager:publish("ReceiveALMS",{Score = IAPitems[4].gold});
    elseif item == IAPitems[5].productid then
        buyGold = IAPitems[5].gold;
    --eventManager:publish("ReceiveALMS",{Score = IAPitems[5].gold});
    elseif item == IAPitems[6].productid then
        buyGold = IAPitems[6].gold;
    --eventManager:publish("ReceiveALMS",{Score = IAPitems[6].gold});
    end
    local gold_number = cc.UserDefault:getInstance():getIntegerForKey("gold",1);
    gold_number = gold_number + buyGold;
    txt_startpanel_add:setString(""..gold_number);
    cc.UserDefault:getInstance():setIntegerForKey("gold",gold_number);
end

cc.exports.ShejianGameScene = ShejianGameScene;
return ShejianGameScene
