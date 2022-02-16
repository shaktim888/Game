local ShejianGameScene = class("ShejianGameScene", function()
    return cc.Layer:create()
end)
local local_bit = require "app.utils.local_bit"
local seed = 5
local debug = 1

--游戏层
local StartPanel
local SettingPanel
local RankPanel
local BattleInfoPanel
local GamePanel
local ScorePanel
local HelpPanel
local LevelPanel
local DailyBounsPanel
local UpgradePanel
local SkinPanel

local musicSwitch = true
local soundSwitch = true

--游戏层
local levelbtns = {}
local drawNode
local btn_start_bg
local node_draw
local node_ball
local cell_imgs = {}
local rings = {}
local txt_time
local node_small
local curr_score

--BattleInfoPanel
local color_btns = {}
local grade_btns = {}

--结算层
local gold_txt
local img_congratulations
local txt_next

--StartPanel
local txt_startpanel_gold
local btn_head
local img_head
local selectupIndex
local selectSkinIndex

--签到层
local signFlag = {}
local sign_value = {}
local signGold ={
    [1] = 1000;
    [2] = 1000;
    [3] = 1500;
    [4] = 1500;
    [5] = 2000;
    [6] = 2000;
    [7] = 3000;
}
local btn_signClose
local btn_sign

--UpgradePanel
local imgs_upgrade_mask = {}
local imgs_upgrade_select = {}
local txt_upgrade_gold = {}
local imgs_upgrade_selectbg = {}
local btns_upgrade = {}
local current_select_grade = nil

--SkinPanel
local imgs_skin_mask = {}
local imgs_skin_select = {}
local txt_skin_gold = {}
local imgs_skin_selectbg = {}
local btns_skin = {}
local current_select_skin = nil

--排行榜
local list_rank
local img_clone

--设置层
local musicNumber
local btn_musics = {}

--游戏逻辑
local maxlevel
local grade = 1
local RED = 1;
local YELLOW = 2;
local GREEN = 3;
local PURPLE = 4;
local color = {}
color[1] = RED
local modelType = {}
modelType.EXPERIENCE = 1
modelType.ADVENTURE = 2
local level = 1
local armyNumber = 2
local pointNumber = 9
local startTime = 0
local aiHandler = {}
local timeHandle = nil

local clickIndex = 0
local attackIndexs = {}

local fontcolor

--升等级所需的金币(购买基地皮肤)
local levelNeedGold ={
    [1] = 0;
    [2] = 5000;
    [3] = 10000;
    [4] = 15000;
    [5] = 20000;
    [6] = 25000;
    [7] = 30000;
    [8] = 35000;
    [9] = 40000;
    [10] = 45000;
};

--购买所需的金币(购买士兵皮肤)
local soldierNeedGold = {
    [1] = 0;
    [2] = 10000;
    [3] = 15000;
    [4] = 20000;
    [5] = 25000;
    [6] = 30000;
    [7] = 35000;
    [8] = 40000;
    [9] = 45000;
    [10] = 50000;
};

--电脑初级中级高级的间隔时间基数
local aiInterval =  {
    [1] = 5,
    [2] = 5,
    [3] = 5,
};

--每个据点的病毒的最大生命的基础配置
local config = {
    [1]     = {life = 200,speed = 0.1},
    [2]     = {life = 200,speed = 0.1},
    [3]     = {life = 200,speed = 0.1},
    [4]     = {life = 200,speed = 0.1},
    [5]     = {life = 100,speed = 0.05},
    [6]     = {life = 100,speed = 0.05},
    [7]     = {life = 100,speed = 0.05},
    [8]     = {life = 100,speed = 0.05},
    [9]     = {life = 100,speed = 0.05},
    [10]    = {life = 100,speed = 0.05},
    [11]    = {life = 100,speed = 0.05},
    [12]    = {life = 100,speed = 0.05},
    [13]    = {life = 100,speed = 0.05},
    [14]    = {life = 100,speed = 0.05},
    [15]    = {life = 100,speed = 0.05},

};

--敌人种类和据点数
local levelConfig = {
    [1] = {armyNumber = 2, pointNumber = 5};
    [2] = {armyNumber = 2, pointNumber = 6};
    [3] = {armyNumber = 2, pointNumber = 7};
    [4] = {armyNumber = 2, pointNumber = 8};
    [5] = {armyNumber = 2, pointNumber = 9};
    [6] = {armyNumber = 3, pointNumber = 10};
    [7] = {armyNumber = 3, pointNumber = 11};
    [8] = {armyNumber = 3, pointNumber = 12};
    [9] = {armyNumber = 3, pointNumber = 12};
    [10] = {armyNumber = 3, pointNumber = 12};
    [11] = {armyNumber = 4, pointNumber = 12};
    [12] = {armyNumber = 4, pointNumber = 12};
    [13] = {armyNumber = 4, pointNumber = 12};
    [14] = {armyNumber = 4, pointNumber = 12};
    [15] = {armyNumber = 4, pointNumber = 12};

    [16] = {armyNumber = 2, pointNumber = 8};
    [17] = {armyNumber = 2, pointNumber = 9};
    [18] = {armyNumber = 2, pointNumber = 10};
    [19] = {armyNumber = 2, pointNumber = 11};
    [20] = {armyNumber = 2, pointNumber = 12};
    [21] = {armyNumber = 3, pointNumber = 12};
    [22] = {armyNumber = 3, pointNumber = 12};
    [23] = {armyNumber = 3, pointNumber = 12};
    [24] = {armyNumber = 3, pointNumber = 12};
    [25] = {armyNumber = 3, pointNumber = 12};
    [26] = {armyNumber = 4, pointNumber = 12};
    [27] = {armyNumber = 4, pointNumber = 12};
    [28] = {armyNumber = 4, pointNumber = 12};
    [29] = {armyNumber = 4, pointNumber = 12};
    [30] = {armyNumber = 4, pointNumber = 12};

    [31] = {armyNumber = 2, pointNumber = 12};
    [32] = {armyNumber = 2, pointNumber = 12};
    [33] = {armyNumber = 2, pointNumber = 12};
    [34] = {armyNumber = 2, pointNumber = 12};
    [35] = {armyNumber = 2, pointNumber = 12};
    [36] = {armyNumber = 3, pointNumber = 12};
    [37] = {armyNumber = 3, pointNumber = 12};
    [38] = {armyNumber = 3, pointNumber = 12};
    [39] = {armyNumber = 3, pointNumber = 12};
    [40] = {armyNumber = 3, pointNumber = 12};
    [41] = {armyNumber = 4, pointNumber = 12};
    [42] = {armyNumber = 4, pointNumber = 12};
    [43] = {armyNumber = 4, pointNumber = 12};
    [44] = {armyNumber = 4, pointNumber = 12};
    [45] = {armyNumber = 4, pointNumber = 12};
};

--体验模式的位置
local basePosition = {
    [1] = {x = 83, y = 443 },
    [2] = {x = 969, y = 130},
    [3] = {x = 968, y = 429},
    [4] = {x = 84, y = 132},
    [5] = {x = 527, y = 285},
    [6] = {x = 358, y = 442},
    [7] = {x = 738, y = 106},
    [8] = {x = 275, y = 277},
    [9] = {x = 797, y = 290},
    [10] = {x = 247, y = 76},
    [11] = {x = 483, y = 83},
    [12] = {x = 652, y = 458 },
};

--关卡各个节点的位置
local levelPosition = {
    [1] = 
    { 
        [1]  = {x = 115,y = 417},
        [2]  = {x = 910,y = 129},
        [3]  = {x = 281,y = 350},
        [4]  = {x = 481,y = 279},
        [5]  = {x = 687,y = 207},
        [6]  = {x = 0,y = 0},
        [7]  = {x = 0,y = 0},
        [8]  = {x = 0,y = 0},
        [9]  = {x = 0,y = 0},
        [10] = {x = 0,y = 0},
        [11] = {x = 0,y = 0},
        [12] = {x = 0,y = 0},
    },
    [2] = 
    { 
        [1]  = {x = 115,y = 417},
        [2]  = {x = 910,y = 129},
        [3]  = {x = 216,y = 156},
        [4]  = {x = 510,y = 84},
        [5]  = {x = 509,y = 406},
        [6]  = {x = 513,y = 277},
        [7]  = {x = 0,y = 0},
        [8]  = {x = 0,y = 0},
        [9]  = {x = 0,y = 0},
        [10] = {x = 0,y = 0},
        [11] = {x = 0,y = 0},
        [12] = {x = 0,y = 0},
    },
    [3] = 
    { 
        [1]  = {x = 294,y = 278},
        [2]  = {x = 977,y = 438},
        [3]  = {x = 800,y = 194},
        [4]  = {x = 379,y = 98},
        [5]  = {x = 509,y = 462},
        [6]  = {x = 513,y = 277},
        [7]  = {x = 741,y = 75},
        [8]  = {x = 0,y = 0},
        [9]  = {x = 0,y = 0},
        [10] = {x = 0,y = 0},
        [11] = {x = 0,y = 0},
        [12] = {x = 0,y = 0},
    },
    [4] = 
    { 
        [1]  = {x = 1009,y = 412},
        [2]  = {x = 1007,y = 108},
        [3]  = {x = 645,y = 278},
        [4]  = {x = 301,y = 271},
        [5]  = {x = 509,y = 462},
        [6]  = {x = 513,y = 277},
        [7]  = {x = 741,y = 75},
        [8]  = {x = 108,y = 263},
        [9]  = {x = 0,y = 0},
        [10] = {x = 0,y = 0},
        [11] = {x = 0,y = 0},
        [12] = {x = 0,y = 0},
    },
    [5] = 
    { 
        [1]  = {x = 867,y = 336},
        [2]  = {x = 539,y = 89},
        [3]  = {x = 821,y = 98},
        [4]  = {x = 317,y = 250},
        [5]  = {x = 443,y = 429},
        [6]  = {x = 599,y = 274},
        [7]  = {x = 274,y = 94},
        [8]  = {x = 144,y = 236},
        [9]  = {x = 133,y = 441},
        [10] = {x = 0,y = 0},
        [11] = {x = 0,y = 0},
        [12] = {x = 0,y = 0},
    },
    [6] = 
    { 
        [1]  = {x = 118,y = 290},
        [2]  = {x = 900,y = 506},
        [3]  = {x = 827,y = 69},
        [4]  = {x = 810,y = 283},
        [5]  = {x = 524,y = 505},
        [6]  = {x = 510,y = 70},
        [7]  = {x = 533,y = 281},
        [8]  = {x = 155,y = 69},
        [9]  = {x = 122,y = 472},
        [10] = {x = 297,y = 140},
        [11] = {x = 0,y = 0},
        [12] = {x = 0,y = 0},
    },
    [7] = 
    { 
        [1]  = {x = 118,y = 75},
        [2]  = {x = 294,y = 496},
        [3]  = {x = 1005,y = 498},
        [4]  = {x = 1008,y = 63},
        [5]  = {x = 524,y = 505},
        [6]  = {x = 510,y = 70},
        [7]  = {x = 758,y = 189},
        [8]  = {x = 184,y = 284},
        [9]  = {x = 459,y = 295},
        [10] = {x = 297,y = 140},
        [11] = {x = 1015,y = 258},
        [12] = {x = 0,y = 0},
    },
    [8] = 
    { 
        [1]  = {x = 114,y = 473},
        [2]  = {x = 112,y = 70},
        [3]  = {x = 1005,y = 498},
        [4]  = {x = 1008,y = 63},
        [5]  = {x = 524,y = 505},
        [6]  = {x = 510,y = 70},
        [7]  = {x = 781,y = 141},
        [8]  = {x = 295,y = 358},
        [9]  = {x = 552,y = 250},
        [10] = {x = 297,y = 140},
        [11] = {x = 780,y = 355},
        [12] = {x = 109,y = 257},
    },
    [9] = 
    { 
        [1]  = {x = 311,y = 269},
        [2]  = {x = 509,y = 0},
        [3]  = {x = 731,y = 266},
        [4]  = {x = 515,y = 416},
        [5]  = {x = 1011,y = 271},
        [6]  = {x = 1004,y = 73},
        [7]  = {x = 511,y = 247},
        [8]  = {x = 199,y = 497},
        [9]  = {x = 795,y = 71},
        [10] = {x = 216,y = 70},
        [11] = {x = 851,y = 496},
        [12] = {x = 109,y = 257},
    },
    [10] = 
    { 
        [1]  = {x = 118,y = 273},
        [2]  = {x = 505,y = 72},
        [3]  = {x = 1009,y = 278},
        [4]  = {x = 521,y = 496},
        [5]  = {x = 802,y = 346},
        [6]  = {x = 1004,y = 73},
        [7]  = {x = 511,y = 247},
        [8]  = {x = 120,y = 478},
        [9]  = {x = 820,y = 154},
        [10] = {x = 115,y = 74},
        [11] = {x = 1008,y = 494},
        [12] = {x = 310,y = 390},
    },
    [11] = 
    { 
        [1]  = {x = 516,y = 66},
        [2]  = {x = 266,y = 66},
        [3]  = {x = 805,y = 68},
        [4]  = {x = 527,y = 474},
        [5]  = {x = 761,y = 408},
        [6]  = {x = 1006,y = 263},
        [7]  = {x = 511,y = 247},
        [8]  = {x = 120,y = 478},
        [9]  = {x = 789,y = 219},
        [10] = {x = 204,y = 217},
        [11] = {x = 1008,y = 494},
        [12] = {x = 310,y = 390},
    },
    [12] = 
    { 
        [1]  = {x = 720,y = 68},
        [2]  = {x = 303,y = 68},
        [3]  = {x = 716,y = 498},
        [4]  = {x = 316,y = 496},
        [5]  = {x = 808,y = 352},
        [6]  = {x = 1006,y = 263},
        [7]  = {x = 534,y = 222},
        [8]  = {x = 120,y = 478},
        [9]  = {x = 1002,y = 71},
        [10] = {x = 189,y = 219},
        [11] = {x = 1008,y = 494},
        [12] = {x = 327,y = 353},
    },
    [13] = 
    { 
        [1]  = {x = 1006,y = 68},
        [2]  = {x = 119,y = 506},
        [3]  = {x = 341,y = 378},
        [4]  = {x = 751,y = 175},
        [5]  = {x = 808,y = 354},
        [6]  = {x = 1006,y = 263},
        [7]  = {x = 518,y = 278},
        [8]  = {x = 291,y = 78},
        [9]  = {x = 561,y = 472},
        [10] = {x = 144,y = 236},
        [11] = {x = 1008,y = 494},
        [12] = {x = 512,y = 71},
    },
    [14] = 
    { 
        [1]  = {x = 1006,y = 68},
        [2]  = {x = 119,y = 506},
        [3]  = {x = 115,y = 73},
        [4]  = {x = 1008,y = 496},
        [5]  = {x = 281,y = 354},
        [6]  = {x = 1006,y = 263},
        [7]  = {x = 835,y = 345},
        [8]  = {x = 384,y = 61},
        [9]  = {x = 417,y = 497},
        [10] = {x = 106,y = 290},
        [11] = {x = 730,y = 499},
        [12] = {x = 661,y = 64},
    },
    [15] = 
    { 
        [1]  = {x = 1006,y = 68},
        [2]  = {x = 119,y = 506},
        [3]  = {x = 115,y = 73},
        [4]  = {x = 1008,y = 496},
        [5]  = {x = 281,y = 354},
        [6]  = {x = 807,y = 309},
        [7]  = {x = 530,y = 309},
        [8]  = {x = 332,y = 163},
        [9]  = {x = 417,y = 497},
        [10] = {x = 106,y = 290},
        [11] = {x = 730,y = 499},
        [12] = {x = 528,y = 81},
    },
    [16] = 
    { 
        [1]  = {x = 1009,y = 412},
        [2]  = {x = 1007,y = 108},
        [3]  = {x = 645,y = 278},
        [4]  = {x = 301,y = 271},
        [5]  = {x = 509,y = 462},
        [6]  = {x = 513,y = 277},
        [7]  = {x = 741,y = 75},
        [8]  = {x = 108,y = 263},
        [9]  = {x = 0,y = 0},
        [10] = {x = 0,y = 0},
        [11] = {x = 0,y = 0},
        [12] = {x = 0,y = 0},
    },
    [17] = 
    { 
        [1]  = {x = 867,y = 336},
        [2]  = {x = 539,y = 89},
        [3]  = {x = 821,y = 98},
        [4]  = {x = 317,y = 250},
        [5]  = {x = 443,y = 429},
        [6]  = {x = 599,y = 274},
        [7]  = {x = 274,y = 94},
        [8]  = {x = 144,y = 236},
        [9]  = {x = 133,y = 441},
        [10] = {x = 0,y = 0},
        [11] = {x = 0,y = 0},
        [12] = {x = 0,y = 0},
    },
    [18] = 
    { 
        [1]  = {x = 118,y = 290},
        [2]  = {x = 900,y = 506},
        [3]  = {x = 827,y = 69},
        [4]  = {x = 810,y = 283},
        [5]  = {x = 524,y = 505},
        [6]  = {x = 510,y = 70},
        [7]  = {x = 533,y = 281},
        [8]  = {x = 155,y = 69},
        [9]  = {x = 122,y = 472},
        [10] = {x = 297,y = 140},
        [11] = {x = 0,y = 0},
        [12] = {x = 0,y = 0},
    },
    [19] = 
    { 
        [1]  = {x = 118,y = 75},
        [2]  = {x = 294,y = 496},
        [3]  = {x = 1005,y = 498},
        [4]  = {x = 1008,y = 63},
        [5]  = {x = 524,y = 505},
        [6]  = {x = 510,y = 70},
        [7]  = {x = 758,y = 189},
        [8]  = {x = 184,y = 284},
        [9]  = {x = 459,y = 295},
        [10] = {x = 297,y = 140},
        [11] = {x = 1015,y = 258},
        [12] = {x = 0,y = 0},
    },
    [20] = 
    { 
        [1]  = {x = 114,y = 473},
        [2]  = {x = 112,y = 70},
        [3]  = {x = 1005,y = 498},
        [4]  = {x = 1008,y = 63},
        [5]  = {x = 524,y = 505},
        [6]  = {x = 510,y = 70},
        [7]  = {x = 781,y = 141},
        [8]  = {x = 295,y = 358},
        [9]  = {x = 552,y = 250},
        [10] = {x = 297,y = 140},
        [11] = {x = 780,y = 355},
        [12] = {x = 109,y = 257},
    },
    [21] = 
    { 
        [1]  = {x = 114,y = 473},
        [2]  = {x = 112,y = 70},
        [3]  = {x = 1005,y = 498},
        [4]  = {x = 1008,y = 63},
        [5]  = {x = 524,y = 505},
        [6]  = {x = 510,y = 70},
        [7]  = {x = 781,y = 141},
        [8]  = {x = 295,y = 358},
        [9]  = {x = 552,y = 250},
        [10] = {x = 297,y = 140},
        [11] = {x = 780,y = 355},
        [12] = {x = 109,y = 257},
    },
    [22] = 
    { 
        [1]  = {x = 114,y = 473},
        [2]  = {x = 112,y = 70},
        [3]  = {x = 1005,y = 498},
        [4]  = {x = 1008,y = 63},
        [5]  = {x = 524,y = 505},
        [6]  = {x = 510,y = 70},
        [7]  = {x = 781,y = 141},
        [8]  = {x = 295,y = 358},
        [9]  = {x = 552,y = 250},
        [10] = {x = 297,y = 140},
        [11] = {x = 780,y = 355},
        [12] = {x = 109,y = 257},
    },
    [23] = 
    { 
        [1]  = {x = 114,y = 473},
        [2]  = {x = 112,y = 70},
        [3]  = {x = 1005,y = 498},
        [4]  = {x = 1008,y = 63},
        [5]  = {x = 524,y = 505},
        [6]  = {x = 510,y = 70},
        [7]  = {x = 781,y = 141},
        [8]  = {x = 295,y = 358},
        [9]  = {x = 552,y = 250},
        [10] = {x = 297,y = 140},
        [11] = {x = 780,y = 355},
        [12] = {x = 109,y = 257},
    },
    [24] = 
    { 
        [1]  = {x = 311,y = 269},
        [2]  = {x = 509,y = 89},
        [3]  = {x = 731,y = 266},
        [4]  = {x = 515,y = 416},
        [5]  = {x = 1011,y = 271},
        [6]  = {x = 1004,y = 73},
        [7]  = {x = 511,y = 247},
        [8]  = {x = 199,y = 497},
        [9]  = {x = 795,y = 71},
        [10] = {x = 216,y = 70},
        [11] = {x = 851,y = 496},
        [12] = {x = 109,y = 257},
    },
    [25] = 
    { 
        [1]  = {x = 118,y = 273},
        [2]  = {x = 505,y = 72},
        [3]  = {x = 1009,y = 278},
        [4]  = {x = 521,y = 496},
        [5]  = {x = 802,y = 346},
        [6]  = {x = 1004,y = 73},
        [7]  = {x = 511,y = 247},
        [8]  = {x = 120,y = 478},
        [9]  = {x = 820,y = 154},
        [10] = {x = 115,y = 74},
        [11] = {x = 1008,y = 494},
        [12] = {x = 310,y = 390},
    },
    [26] = 
    { 
        [1]  = {x = 516,y = 66},
        [2]  = {x = 266,y = 66},
        [3]  = {x = 805,y = 68},
        [4]  = {x = 527,y = 474},
        [5]  = {x = 761,y = 408},
        [6]  = {x = 1006,y = 263},
        [7]  = {x = 511,y = 247},
        [8]  = {x = 120,y = 478},
        [9]  = {x = 789,y = 219},
        [10] = {x = 204,y = 217},
        [11] = {x = 1008,y = 494},
        [12] = {x = 310,y = 390},
    },
    [27] = 
    { 
        [1]  = {x = 720,y = 68},
        [2]  = {x = 303,y = 68},
        [3]  = {x = 716,y = 498},
        [4]  = {x = 316,y = 496},
        [5]  = {x = 808,y = 352},
        [6]  = {x = 1006,y = 263},
        [7]  = {x = 534,y = 222},
        [8]  = {x = 120,y = 478},
        [9]  = {x = 1002,y = 71},
        [10] = {x = 189,y = 219},
        [11] = {x = 1008,y = 494},
        [12] = {x = 327,y = 353},
    },
    [28] = 
    { 
        [1]  = {x = 1006,y = 68},
        [2]  = {x = 119,y = 506},
        [3]  = {x = 341,y = 378},
        [4]  = {x = 751,y = 175},
        [5]  = {x = 808,y = 354},
        [6]  = {x = 1006,y = 263},
        [7]  = {x = 518,y = 278},
        [8]  = {x = 291,y = 78},
        [9]  = {x = 561,y = 472},
        [10] = {x = 144,y = 236},
        [11] = {x = 1008,y = 494},
        [12] = {x = 512,y = 71},
    },
    [29] = 
    { 
        [1]  = {x = 1006,y = 68},
        [2]  = {x = 119,y = 506},
        [3]  = {x = 115,y = 73},
        [4]  = {x = 1008,y = 496},
        [5]  = {x = 281,y = 354},
        [6]  = {x = 1006,y = 263},
        [7]  = {x = 835,y = 345},
        [8]  = {x = 384,y = 61},
        [9]  = {x = 417,y = 497},
        [10] = {x = 106,y = 290},
        [11] = {x = 730,y = 499},
        [12] = {x = 661,y = 64},
    },
    [30] = 
    { 
        [1]  = {x = 1006,y = 68},
        [2]  = {x = 119,y = 506},
        [3]  = {x = 115,y = 73},
        [4]  = {x = 1008,y = 496},
        [5]  = {x = 281,y = 354},
        [6]  = {x = 807,y = 309},
        [7]  = {x = 530,y = 309},
        [8]  = {x = 332,y = 163},
        [9]  = {x = 417,y = 497},
        [10] = {x = 106,y = 290},
        [11] = {x = 730,y = 499},
        [12] = {x = 528,y = 81},
    },
    [31] = 
    { 
        [1]  = {x = 1006,y = 68},
        [2]  = {x = 119,y = 506},
        [3]  = {x = 115,y = 73},
        [4]  = {x = 1008,y = 496},
        [5]  = {x = 281,y = 354},
        [6]  = {x = 807,y = 309},
        [7]  = {x = 530,y = 309},
        [8]  = {x = 332,y = 163},
        [9]  = {x = 417,y = 497},
        [10] = {x = 106,y = 290},
        [11] = {x = 730,y = 499},
        [12] = {x = 528,y = 81},
    },
    [32] = 
    { 
        [1]  = {x = 1006,y = 68},
        [2]  = {x = 119,y = 506},
        [3]  = {x = 115,y = 73},
        [4]  = {x = 1008,y = 496},
        [5]  = {x = 281,y = 354},
        [6]  = {x = 807,y = 309},
        [7]  = {x = 530,y = 309},
        [8]  = {x = 332,y = 163},
        [9]  = {x = 417,y = 497},
        [10] = {x = 106,y = 290},
        [11] = {x = 730,y = 499},
        [12] = {x = 528,y = 81},
    },
    [33] = 
    { 
        [1]  = {x = 1006,y = 68},
        [2]  = {x = 119,y = 506},
        [3]  = {x = 115,y = 73},
        [4]  = {x = 1008,y = 496},
        [5]  = {x = 281,y = 354},
        [6]  = {x = 807,y = 309},
        [7]  = {x = 530,y = 309},
        [8]  = {x = 332,y = 163},
        [9]  = {x = 417,y = 497},
        [10] = {x = 106,y = 290},
        [11] = {x = 730,y = 499},
        [12] = {x = 528,y = 81},
    },
    [34] = 
    { 
        [1]  = {x = 1006,y = 68},
        [2]  = {x = 119,y = 506},
        [3]  = {x = 115,y = 73},
        [4]  = {x = 1008,y = 496},
        [5]  = {x = 281,y = 354},
        [6]  = {x = 807,y = 309},
        [7]  = {x = 530,y = 309},
        [8]  = {x = 332,y = 163},
        [9]  = {x = 417,y = 497},
        [10] = {x = 106,y = 290},
        [11] = {x = 730,y = 499},
        [12] = {x = 528,y = 81},
    },
    [35] = 
    { 
       [1]  = {x = 1006,y = 68},
        [2]  = {x = 119,y = 506},
        [3]  = {x = 115,y = 73},
        [4]  = {x = 1008,y = 496},
        [5]  = {x = 281,y = 354},
        [6]  = {x = 807,y = 309},
        [7]  = {x = 530,y = 309},
        [8]  = {x = 332,y = 163},
        [9]  = {x = 417,y = 497},
        [10] = {x = 106,y = 290},
        [11] = {x = 730,y = 499},
        [12] = {x = 528,y = 81},
    },
    [36] = 
    { 
        [1]  = {x = 1006,y = 68},
        [2]  = {x = 119,y = 506},
        [3]  = {x = 115,y = 73},
        [4]  = {x = 1008,y = 496},
        [5]  = {x = 281,y = 354},
        [6]  = {x = 807,y = 309},
        [7]  = {x = 530,y = 309},
        [8]  = {x = 332,y = 163},
        [9]  = {x = 417,y = 497},
        [10] = {x = 106,y = 290},
        [11] = {x = 730,y = 499},
        [12] = {x = 528,y = 81},
    },
    [37] = 
    { 
        [1]  = {x = 1006,y = 68},
        [2]  = {x = 119,y = 506},
        [3]  = {x = 115,y = 73},
        [4]  = {x = 1008,y = 496},
        [5]  = {x = 281,y = 354},
        [6]  = {x = 807,y = 309},
        [7]  = {x = 530,y = 309},
        [8]  = {x = 332,y = 163},
        [9]  = {x = 417,y = 497},
        [10] = {x = 106,y = 290},
        [11] = {x = 730,y = 499},
        [12] = {x = 528,y = 81},
    },
    [38] = 
    { 
        [1]  = {x = 1006,y = 68},
        [2]  = {x = 119,y = 506},
        [3]  = {x = 115,y = 73},
        [4]  = {x = 1008,y = 496},
        [5]  = {x = 281,y = 354},
        [6]  = {x = 807,y = 309},
        [7]  = {x = 530,y = 309},
        [8]  = {x = 332,y = 163},
        [9]  = {x = 417,y = 497},
        [10] = {x = 106,y = 290},
        [11] = {x = 730,y = 499},
        [12] = {x = 528,y = 81},
    },
    [39] = 
    { 
        [1]  = {x = 1006,y = 68},
        [2]  = {x = 119,y = 506},
        [3]  = {x = 115,y = 73},
        [4]  = {x = 1008,y = 496},
        [5]  = {x = 281,y = 354},
        [6]  = {x = 807,y = 309},
        [7]  = {x = 530,y = 309},
        [8]  = {x = 332,y = 163},
        [9]  = {x = 417,y = 497},
        [10] = {x = 106,y = 290},
        [11] = {x = 730,y = 499},
        [12] = {x = 528,y = 81},
    },
    [40] = 
    { 
        [1]  = {x = 118,y = 273},
        [2]  = {x = 505,y = 72},
        [3]  = {x = 1009,y = 278},
        [4]  = {x = 521,y = 496},
        [5]  = {x = 802,y = 346},
        [6]  = {x = 1004,y = 73},
        [7]  = {x = 511,y = 247},
        [8]  = {x = 120,y = 478},
        [9]  = {x = 820,y = 154},
        [10] = {x = 115,y = 74},
        [11] = {x = 1008,y = 494},
        [12] = {x = 310,y = 390},
    },
    [41] = 
    { 
        [1]  = {x = 516,y = 66},
        [2]  = {x = 266,y = 66},
        [3]  = {x = 805,y = 68},
        [4]  = {x = 527,y = 474},
        [5]  = {x = 761,y = 408},
        [6]  = {x = 1006,y = 263},
        [7]  = {x = 511,y = 247},
        [8]  = {x = 120,y = 478},
        [9]  = {x = 789,y = 219},
        [10] = {x = 204,y = 217},
        [11] = {x = 1008,y = 494},
        [12] = {x = 310,y = 390},
    },
    [42] = 
    { 
        [1]  = {x = 720,y = 68},
        [2]  = {x = 303,y = 68},
        [3]  = {x = 716,y = 498},
        [4]  = {x = 316,y = 496},
        [5]  = {x = 808,y = 352},
        [6]  = {x = 1006,y = 263},
        [7]  = {x = 534,y = 222},
        [8]  = {x = 120,y = 478},
        [9]  = {x = 1002,y = 71},
        [10] = {x = 189,y = 219},
        [11] = {x = 1008,y = 494},
        [12] = {x = 327,y = 353},
    },
    [43] = 
    { 
        [1]  = {x = 1006,y = 68},
        [2]  = {x = 119,y = 506},
        [3]  = {x = 341,y = 378},
        [4]  = {x = 751,y = 175},
        [5]  = {x = 808,y = 354},
        [6]  = {x = 1006,y = 263},
        [7]  = {x = 518,y = 278},
        [8]  = {x = 291,y = 78},
        [9]  = {x = 561,y = 472},
        [10] = {x = 144,y = 236},
        [11] = {x = 1008,y = 494},
        [12] = {x = 512,y = 71},
    },
    [44] = 
    { 
        [1]  = {x = 1006,y = 68},
        [2]  = {x = 119,y = 506},
        [3]  = {x = 115,y = 73},
        [4]  = {x = 1008,y = 496},
        [5]  = {x = 281,y = 354},
        [6]  = {x = 1006,y = 263},
        [7]  = {x = 835,y = 345},
        [8]  = {x = 384,y = 61},
        [9]  = {x = 417,y = 497},
        [10] = {x = 106,y = 290},
        [11] = {x = 730,y = 499},
        [12] = {x = 661,y = 64},
    },
    [45] = 
    { 
        [1]  = {x = 1006,y = 68},
        [2]  = {x = 119,y = 506},
        [3]  = {x = 115,y = 73},
        [4]  = {x = 1008,y = 496},
        [5]  = {x = 281,y = 354},
        [6]  = {x = 807,y = 309},
        [7]  = {x = 530,y = 309},
        [8]  = {x = 332,y = 163},
        [9]  = {x = 417,y = 497},
        [10] = {x = 106,y = 290},
        [11] = {x = 730,y = 499},
        [12] = {x = 528,y = 81},
    },
};

function printEX(...)
    if debug == 1 then
        print(...);
    end
end

function ShejianGameScene:getClassName()
    return "ShejianGameScene"
end

function ShejianGameScene:seededRandom(max, min) 
   max = max or 1
   min = min or 0
   seed = (seed * 9301 + 49297) % 233280
   local rnd = seed / 233280.0
   return min + rnd * (max - min)
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
    txt_startpanel_gold:setString(""..math.random(1000,10000))
end

function ShejianGameScene:grabsGamePanel()
    self:initGamePanel()
    self:loadLevelConfig()
    self:initColor()
    self:initPoint(true)
    self:initSelectRing()
end

function ShejianGameScene:init()
    self.loadNode = cc.CSLoader:createNode("majia/ShejianGameLayer.csb")
    self.loadNode:setContentSize(cc.size(display.size.height, display.size.width))
    ccui.Helper:doLayout(self.loadNode)
    self:addChild(self.loadNode, 0)
    local offsetX = (display.width-1136)/2
    self.loadNode:setPositionX(offsetX)

    musicSwitch = cc.UserDefault:getInstance():getBoolForKey("musicSwitch",true);
    soundSwitch = cc.UserDefault:getInstance():getBoolForKey("soundSwitch",true);
    musicNumber = cc.UserDefault:getInstance():getIntegerForKey("musicNumber",1);
    if musicSwitch then
        self:playMusic("majia/sound/"..musicNumber..".mp3");
    end

    StartPanel = self.loadNode:getChildByName("StartPanel")
	GamePanel = self.loadNode:getChildByName("GamePanel")
	HelpPanel = self.loadNode:getChildByName("HelpPanel")
	ScorePanel = self.loadNode:getChildByName("ScorePanel")
    SettingPanel = self.loadNode:getChildByName("SettingPanel")
    BattleInfoPanel = self.loadNode:getChildByName("BattleInfoPanel")
    RankPanel = self.loadNode:getChildByName("RankPanel")
    LevelPanel = self.loadNode:getChildByName("LevelPanel")
    DailyBounsPanel = self.loadNode:getChildByName("DailyBounsPanel")
    UpgradePanel = self.loadNode:getChildByName("UpgradePanel")
    SkinPanel = self.loadNode:getChildByName("SkinPanel")

    local role = StartPanel:getChildByName("role")
    role:ignoreContentAdaptWithSize(true)
    role:setPositionX(900)

    self:registerPnl(StartPanel)
    self:registerPnl(UpgradePanel)
    self:registerPnl(GamePanel)

    self:unlockSkinIndex(1);
    self:unlockSoldierSkinIndex(1);
    if self:getSkinIndex() == 0 then
        self:setSkinIndex(1);
    end
    if self:getSoldierSkinIndex() == 0 then
        self:setSoldierSkinIndex(1);
    end
    selectSkinIndex = self:getSoldierSkinIndex()
    selectupIndex = self:getSkinIndex()

    self.randomLife = math.floor(self:seededRandom(1,50))
    self.randomSpeed =  math.floor(self:seededRandom(1,11)*0.001)

    self:initStartPanel()
    self:initScorePanel()
    self:initMouseListen()
    self:initUpgradePanel()

    StartPanel:setVisible(true)
	GamePanel:setVisible(false)
	HelpPanel:setVisible(false)
	ScorePanel:setVisible(false)
    SettingPanel:setVisible(false)
    BattleInfoPanel:setVisible(false)
    RankPanel:setVisible(false)
    LevelPanel:setVisible(false)
    DailyBounsPanel:setVisible(false)
    UpgradePanel:setVisible(false)
    SkinPanel:setVisible(false)
end

--初始化鼠标监听事件
function ShejianGameScene:initMouseListen()
    local function onTouch(eventType, x, y)
        if eventType == "began" then
            clickIndex = self:checkClick(cc.p(x,y),true);
            if clickIndex ~= 0 then
                attackIndexs[#attackIndexs +1] = clickIndex;
            end
            return true
        elseif eventType == "moved" then
            if #attackIndexs~= 0 then
                self:drawAttackRoute(cc.p(x,y));
            end
            
        elseif eventType == "ended" then
            local res = self:checkGameOver();
            if ((res ~= 1) and (res ~= 0)) then
                self:processClickUp(cc.p(x,y));
            end
            
            attackIndexs = {};
            drawNode:clear();
            self:clearCircle();
        end
    end

    self:setTouchEnabled(true)
    self:registerScriptTouchHandler(onTouch)
end

--处理鼠标弹起
function ShejianGameScene:processClickUp(pos)
    local index = self:checkClick(pos,false);
    if index ~= 0 then
       if cell_imgs[index]:getTag() == color[1] then 
          self:removePos(index);
       else 
       end
       self:Attack(attackIndexs,index); 
    end
end

--去除鼠标弹起的这个病毒后的集合
function ShejianGameScene:removePos(index)
    for i=1,#attackIndexs do
        if attackIndexs[i] == index then
            table.remove(attackIndexs,i);
            break;
        end
    end
end

--画线段
function ShejianGameScene:draw(frompos,topos)
    drawNode:drawSegment(frompos,topos,5,cc.c4b(1,1,1,1));
end

--画圆
function ShejianGameScene:drawCircle(index)
    rings[index]:setVisible(true);
end

--清除画圆
function ShejianGameScene:clearCircle()
    for i = 1,pointNumber do
        rings[i]:setVisible(false);
    end
end

--清空画布
function ShejianGameScene:clear()
    drawNode:clear();
end

--绘制攻击路线
function ShejianGameScene:drawAttackRoute(pos)
    local index = self:checkClick(pos,true);
    if index ~= 0 then
        if not self:IsInattackIndexs(index) then
            attackIndexs[#attackIndexs +1] = index;
        end
    end
    self:clear();
    self:clearCircle();
    for i= 1,#attackIndexs do
        local index = attackIndexs[i];
        local frompos = cell_imgs[index]:getParent():convertToWorldSpace(cc.p(cell_imgs[index]:getPositionX(),cell_imgs[index]:getPositionY()));
        frompos.x = frompos.x - (display.width-1136)/2;
        local topos = cc.p(pos.x - (display.width-1136)/2,pos.y);
        self:draw(frompos,topos);
        self:drawCircle(index);
    end

end

--该攻击索引是否已经在攻击索引集合中了
function ShejianGameScene:IsInattackIndexs(index)
    for i= 1,#attackIndexs do
        if attackIndexs[i] == index then
            return true;
        end
    end
    return false;
end

--检测是否有效点击
function ShejianGameScene:checkClick(pos,isMe)
    for i = 1,pointNumber do
        if isMe then 
            if cell_imgs[i]:getTag() == color[1] then
                if cc.rectContainsPoint(cell_imgs[i]:getBoundingBox(),cell_imgs[i]:convertToNodeSpace(pos)) then
                    return i;
                end
            end
        else
            if cc.rectContainsPoint(cell_imgs[i]:getBoundingBox(),cell_imgs[i]:convertToNodeSpace(pos)) then
                return i;
            end
        end
    end
    return 0;
end

function ShejianGameScene:initStartPanel()
    txt_startpanel_gold = StartPanel:getChildByName("img_addgold"):getChildByName("txt_gold")
    self:refreshGold()
    btn_head = StartPanel:getChildByName("img_headbg"):getChildByName("btn")
    btn_head:onClick(function (...)
        self:initUpgradePanel()
        UpgradePanel:setVisible(true)
    end)
    img_head = StartPanel:getChildByName("img_headbg"):getChildByName("img_head")
    img_head:loadTexture("majia/img/UpgradePanel/skin/"..selectupIndex..".png")
   
    --每日签到
    local btn_showSign = StartPanel:getChildByName("btn_showSign")
    btn_showSign:onClick(function ( ...)
        self:initDailyBounsPanel()
        DailyBounsPanel:setVisible(true)
    end)

    --防御塔皮肤
    local btn_upgrade = StartPanel:getChildByName("btn_upgrade")
    btn_upgrade:onClick(function (...)
        self:initUpgradePanel()
        UpgradePanel:setVisible(true)
    end)

    --人物皮肤
    local btn_startpanel_skin = StartPanel:getChildByName("btn_skin");
    btn_startpanel_skin:onClick(function (...)
        self:initSkinPanel()
        SkinPanel:setVisible(true)
    end)

    --排行榜
    local rankBtn = StartPanel:getChildByName("btn_rank")
    rankBtn:onClick(function( ... )
        RankPanel:setVisible(true);
        self:initRankPanel();
    end)

    --设置层
    local settingBtn = StartPanel:getChildByName("btn_setting");
    settingBtn:onClick(function( ... )
        self:initSetting()
        SettingPanel:setVisible(true)
    end)

    --帮助层
    local startHelpBtn = StartPanel:getChildByName("btn_help")
	if startHelpBtn then
		startHelpBtn:onClick(function( ... )
			HelpPanel:setVisible(true)
		end)
    end
    helpCloseBtn = HelpPanel:getChildByName("btn_close")  
	if helpCloseBtn then
		helpCloseBtn:onClick(function( ... )
			HelpPanel:setVisible(false)
		end)
    end
    
    --冒险模式
    local btn_adventure = StartPanel:getChildByName("btn_adventure")
    btn_adventure:onClick(function(...)
        self:initLevelPanel()
        StartPanel:setVisible(false)
        LevelPanel:setVisible(true)
        self.model = modelType.ADVENTURE
    end)

    --体验模式
    local startPlayBtn = StartPanel:getChildByName("btn_play")
	if startPlayBtn then
		startPlayBtn:onClick(function( ... )
            BattleInfoPanel:setVisible(true)
            self:initBattleInfoPanel()
            self.model = modelType.EXPERIENCE
		end)
    end
    
    --字体颜色修改
    local txt_adventure = btn_adventure:getChildByName("txt_adventure")
    local txt_play = startPlayBtn:getChildByName("txt_play")
    local fontChangeArr = {
        txt_startpanel_gold,txt_adventure,txt_play
    }
    local function getRgb()
        local textArray = {{231,207,205},{211,209,184},{232,232,232},{219,205,196},{223,190,121},{192,178,151}}
        local index = math.random(1,6)
        local r = textArray[index][1]
        local g = textArray[index][2]
        local b = textArray[index][3]
        return cc.c3b(r,g,b)
    end
    fontcolor = getRgb()
    for key, v in pairs(fontChangeArr or {}) do
        local widget = v
        if widget and widget.setTextColor and type(widget.setTextColor) == "function" then
            widget:setTextColor(fontcolor)
        elseif widget and widget.setTitleColor and type(widget.setTitleColor) == "function"  then
            widget:setTitleColor(fontcolor)
        end
    end
     
end

function ShejianGameScene:initBattleInfoPanel()
    for i=1,4 do
        color_btns[i] = BattleInfoPanel:getChildByName("btn_color"..i)
        color_btns[i]:setTag(i)
        color_btns[i]:onClick(function(event)
            local tag = event.target:getTag()
            color[1] = tag
            self:refreshColorBtn(tag)
        end)
    end
    for i=1,3 do
        grade_btns[i] = BattleInfoPanel:getChildByName("btn_grade"..i);
        grade_btns[i]:setTag(i);
        grade_btns[i]:onClick(function (event)
            local tag = event.target:getTag();
            grade = tag;
            if grade == 1 then
                armyNumber = 2;
                pointNumber = 9
            elseif grade == 2 then
                armyNumber = 3; 
                pointNumber = 10
            elseif grade ==3 then
                armyNumber = 4;
                pointNumber = 12;
            end
            self:refreshGradeBtn(tag);
        end);
    end

    local btn_battleInfo_close = BattleInfoPanel:getChildByName("btn_close")
    btn_battleInfo_close:onClick(function (...)
        BattleInfoPanel:setVisible(false)
    end)
  
    local btn_ok = BattleInfoPanel:getChildByName("btn_ok")
    if btn_ok then
       btn_ok:onClick(function ()
           BattleInfoPanel:setVisible(false)
           StartPanel:setVisible(false)
           GamePanel:setVisible(true)
           self:startGame()
       end)
   end
end

function ShejianGameScene:initGamePanel()
    node_draw = GamePanel:getChildByName("node_draw")
    if drawNode  == nil then
        drawNode =  cc.DrawNode:create()
        node_draw:addChild(drawNode)
     end
    btn_start_bg = GamePanel:getChildByName("bg")
    btn_start_bg:loadTexture("majia/img/LevelPanel/bg1.png")
    node_ball = GamePanel:getChildByName("node_ball")
    txt_time = GamePanel:getChildByName("txt_time")
    txt_time:setVisible(false)
    node_small = GamePanel:getChildByName("node_small")
    curr_score = GamePanel:getChildByName("score")
	local gameCloseBtn = GamePanel:getChildByName("close")   
	if gameCloseBtn then
		gameCloseBtn:onClick(function( ... )
            GamePanel:setVisible(false);
            StartPanel:setVisible(true);
		end)
    end
    local returnButton = GamePanel:getChildByName("btn_return");
    if returnButton then
		returnButton:onClick(function( ... )
        GamePanel:setVisible(false);
        StartPanel:setVisible(true);
        self:clearTimerHander();
        node_small:removeAllChildren();
		end)
    end
    
    local btn_game_music = GamePanel:getChildByName("btn_music")
    btn_game_music:setVisible(false)
end

function ShejianGameScene:initScorePanel()
    gold_txt = ScorePanel:getChildByName("gold_txt")
    img_congratulations = ScorePanel:getChildByName("img_congratulations")
    local scoreReplayBtn = ScorePanel:getChildByName("btn_reset")
    txt_next = scoreReplayBtn:getChildByName("txt_next")
    if scoreReplayBtn then
		scoreReplayBtn:onClick(function( ... )
		    ScorePanel:setVisible(false)
            self:startGame();
		end)
    end
    local scoreCloseBtn = ScorePanel:getChildByName("close");
    if scoreCloseBtn then
		scoreCloseBtn:onClick(function( ... )
            if self.model == modelType.EXPERIENCE then
			    ScorePanel:setVisible(false)
                self:startGame();
            elseif self.model == modelType.ADVENTURE then
                ScorePanel:setVisible(false)
                GamePanel:setVisible(false);
                self:refreshLevel();
    	        LevelPanel:setVisible(true);
            end
		end)
	end
    local scoreLeaveBtn = ScorePanel:getChildByName("btn_leave");
    if scoreLeaveBtn then
		scoreLeaveBtn:onClick(function( ... )
		    ScorePanel:setVisible(false)
            GamePanel:setVisible(false);
            StartPanel:setVisible(true);
		end)
	end
end

function ShejianGameScene:initSetting()
    local btn_setting_close = SettingPanel:getChildByName("btn_close");
    btn_setting_close:onClick(function( ... )
        SettingPanel:setVisible(false)
    end)
    local btn_music_on = SettingPanel:getChildByName("btn_on")
    local btn_music_off = SettingPanel:getChildByName("btn_off")
    btn_music_on:onClick(function (...)
        if musicSwitch == false then
            musicSwitch = true
            btn_music_on:loadTextures("majia/img/SettingPanel/select.png","majia/img/SettingPanel/select.png","");
            btn_music_off:loadTextures("majia/img/SettingPanel/normal.png","majia/img/SettingPanel/normal.png","");
            cc.UserDefault:getInstance():setBoolForKey("musicSwitch",true);
            local number = cc.UserDefault:getInstance():getIntegerForKey("musicNumber",1);
            self:playMusic("majia/sound/1.mp3");
        end
    end)
    btn_music_off:onClick(function (...)
        musicSwitch = false
        btn_music_off:loadTextures("majia/img/SettingPanel/select.png","majia/img/SettingPanel/select.png","")
        btn_music_on:loadTextures("majia/img/SettingPanel/normal.png","majia/img/SettingPanel/normal.png","")
        cc.UserDefault:getInstance():setBoolForKey("musicSwitch",false)
        STOP_MUSIC()
    end)
    local btn_sound_on = SettingPanel:getChildByName("btn_soundon")
    local btn_sound_off = SettingPanel:getChildByName("btn_soundoff")
    btn_sound_on:onClick(function (...)
        soundSwitch = true
        btn_sound_on:loadTextures("majia/img/SettingPanel/select.png","majia/img/SettingPanel/select.png","")
        btn_sound_off:loadTextures("majia/img/SettingPanel/normal.png","majia/img/SettingPanel/normal.png","")
        cc.UserDefault:getInstance():setBoolForKey("soundSwitch",true)
    end);
    btn_sound_off:onClick(function (...)
        soundSwitch = false
        btn_sound_off:loadTextures("majia/img/SettingPanel/select.png","majia/img/SettingPanel/select.png","")
        btn_sound_on:loadTextures("majia/img/SettingPanel/normal.png","majia/img/SettingPanel/normal.png","")
        cc.UserDefault:getInstance():setBoolForKey("soundSwitch",false)
    end)
    local btn_music1 = SettingPanel:getChildByName("btn_music1")
    local btn_music2 = SettingPanel:getChildByName("btn_music2")
    local btn_music3 = SettingPanel:getChildByName("btn_music3")
    btn_musics[1] = btn_music1
    btn_musics[2] = btn_music2
    btn_musics[3] = btn_music3
    btn_music1:onClick(function (...)
        if musicNumber ~= 1 then
            musicNumber = 1
            btn_music1:loadTextures("majia/img/SettingPanel/select.png","majia/img/SettingPanel/select.png","")
            btn_music2:loadTextures("majia/img/SettingPanel/normal.png","majia/img/SettingPanel/normal.png","")
            btn_music3:loadTextures("majia/img/SettingPanel/normal.png","majia/img/SettingPanel/normal.png","")
            self:playMusic("majia/sound/1.mp3")
        end
        cc.UserDefault:getInstance():setIntegerForKey("musicNumber",1)
    end)
    btn_music2:onClick(function (...)
        if musicNumber ~= 2 then
            musicNumber = 2
            btn_music1:loadTextures("majia/img/SettingPanel/normal.png","majia/img/SettingPanel/normal.png","")
            btn_music2:loadTextures("majia/img/SettingPanel/select.png","majia/img/SettingPanel/select.png","")
            btn_music3:loadTextures("majia/img/SettingPanel/normal.png","majia/img/SettingPanel/normal.png","")
            self:playMusic("majia/sound/2.mp3");
        end
        cc.UserDefault:getInstance():setIntegerForKey("musicNumber",2)
    end)
    btn_music3:onClick(function (...)
        if musicNumber ~= 3 then
            musicNumber = 3;
            btn_music1:loadTextures("majia/img/SettingPanel/normal.png","majia/img/SettingPanel/normal.png","")
            btn_music2:loadTextures("majia/img/SettingPanel/normal.png","majia/img/SettingPanel/normal.png","")
            btn_music3:loadTextures("majia/img/SettingPanel/select.png","majia/img/SettingPanel/select.png","")
            self:playMusic("majia/sound/3.mp3")
        end
        cc.UserDefault:getInstance():setIntegerForKey("musicNumber",3);
    end)
    local btn_setting_ok = SettingPanel:getChildByName("btn_setting_ok")
    btn_setting_ok:onClick(function (...)
        SettingPanel:setVisible(false)
    end);

    if cc.UserDefault:getInstance():getBoolForKey("musicSwitch",true) then
        print(21)
        btn_music_on:loadTextures("majia/img/SettingPanel/select.png","","");
        btn_music_off:loadTextures("majia/img/SettingPanel/normal.png","","");
    else
        print(2)
        btn_music_on:loadTextures("majia/img/SettingPanel/normal.png","","");
        btn_music_off:loadTextures("majia/img/SettingPanel/select.png","","");
    end
    if cc.UserDefault:getInstance():getBoolForKey("soundSwitch",true) then
        btn_sound_on:loadTextures("majia/img/SettingPanel/select.png","","");
        btn_sound_off:loadTextures("majia/img/SettingPanel/normal.png","","");
    else
        btn_sound_on:loadTextures("majia/img/SettingPanel/normal.png","","");
        btn_sound_off:loadTextures("majia/img/SettingPanel/select.png","","");
    end
    local musicNumber = cc.UserDefault:getInstance():getIntegerForKey("musicNumber",1);
    for i=1,3 do
        if i == musicNumber then
            btn_musics[i]:loadTextures("majia/img/SettingPanel/select.png","","");
        else
            btn_musics[i]:loadTextures("majia/img/SettingPanel/normal.png","","");
        end
    end
end

function ShejianGameScene:initSkinPanel()
    current_select_skin = nil
    local btn_skin_close = SkinPanel:getChildByName("btn_close")
    btn_skin_close:onClick(function (...)
       SkinPanel:setVisible(false)
    end)
    local btn_skin_unlock = SkinPanel:getChildByName("btn_unlock")
    btn_skin_unlock:onClick(function (...)
       if current_select_grade == nil then
            toastLayer:show("Please select the skin of the emitting element to be purchased!");
            return;
        end
        if self:isUnlockSoldierSkinIndex(current_select_grade) then
            toastLayer:show("This skin is unlocked!");
            return;
        end
        local tgold = self:getGold();
        if tgold < soldierNeedGold[current_select_grade] then
            toastLayer:show("Not enough gold coins!");
            return;
        end
        tgold = tgold - soldierNeedGold[current_select_grade];
        self:setGold(tgold);
        self:refreshGold(tgold);
        self:setSoldierSkinIndex(current_select_grade);
        self:unlockSoldierSkinIndex(current_select_grade);
        imgs_skin_mask[current_select_grade]:setVisible(false);
        for i = 1 ,10 do
            if i == current_select_grade then
                imgs_skin_select[i]:setVisible(true);
            else
                imgs_skin_select[i]:setVisible(false);
            end
        end
    end)
    for i = 1,10 do
        imgs_skin_mask[i] = SkinPanel:getChildByName("img_"..i):getChildByName("img_mask");
        imgs_skin_select[i] = SkinPanel:getChildByName("img_"..i):getChildByName("img_select");
        txt_skin_gold[i] = SkinPanel:getChildByName("img_"..i):getChildByName("txt_static");
        txt_skin_gold[i]:setString(soldierNeedGold[i])
        imgs_skin_selectbg[i] = SkinPanel:getChildByName("img_"..i):getChildByName("img_selectbg");
        btns_skin[i] = SkinPanel:getChildByName("img_"..i):getChildByName("btn_index");
        btns_skin[i]:onClick(function ()
            for j = 1,10 do
                if j == i then
                    current_select_skin = i;
                    imgs_skin_selectbg[j]:setVisible(true);
                else
                    imgs_skin_selectbg[j]:setVisible(false);
                end
            end
            if self:isUnlockSoldierSkinIndex(i) then
                self:setSoldierSkinIndex(i);
                for i = 1 ,10 do
                    if i == current_select_skin then
                        imgs_skin_select[i]:setVisible(true);
                    else
                        imgs_skin_select[i]:setVisible(false);
                    end
                end
            end
        end);
        local t = self:isUnlockSoldierSkinIndex(i)
        if t == true then
            imgs_skin_mask[i]:setVisible(false)
        else
            imgs_skin_mask[i]:setVisible(true)
        end
        if i == self:getSoldierSkinIndex() then
            imgs_skin_select[i]:setVisible(true)
        else
            imgs_skin_select[i]:setVisible(false)
        end
    end
end

function ShejianGameScene:initUpgradePanel()
    current_select_grade = nil
    local btn_upgrade_close = UpgradePanel:getChildByName("btn_close");
    btn_upgrade_close:onClick(function (...)
        UpgradePanel:setVisible(false);
    end)

    local btn_upgrade_unlock = UpgradePanel:getChildByName("btn_unlock");
    btn_upgrade_unlock:onClick(function (...)
        if current_select_grade == nil then
            toastLayer:show("Please select the skin to be purchased!");
            return;
        end
        if self:isUnlockSkinIndex(current_select_grade) then
            toastLayer:show("This skin is unlocked!");
            return;
        end
        local tgold = self:getGold();
        if tgold < levelNeedGold[current_select_grade] then
            toastLayer:show("Not enough gold coins!");
            return;
        end
        tgold = tgold - levelNeedGold[current_select_grade];
        self:setGold(tgold);
        self:refreshGold();
        img_head:loadTexture("majia/img/UpgradePanel/skin/"..current_select_grade..".png")
        self:setSkinIndex(current_select_grade);
        self:unlockSkinIndex(current_select_grade);
        imgs_upgrade_mask[current_select_grade]:setVisible(false);
        for i = 1 ,10 do
            if i == current_select_grade then
                imgs_upgrade_select[i]:setVisible(true);
            else
                imgs_upgrade_select[i]:setVisible(false);
            end
        end

    end)
    for i = 1,10 do
        imgs_upgrade_mask[i] = UpgradePanel:getChildByName("img_"..i):getChildByName("img_mask")
        imgs_upgrade_select[i] = UpgradePanel:getChildByName("img_"..i):getChildByName("img_select")
        txt_upgrade_gold[i] = UpgradePanel:getChildByName("img_"..i):getChildByName("txt_static")
        txt_upgrade_gold[i]:setString(levelNeedGold[i])
        imgs_upgrade_selectbg[i] = UpgradePanel:getChildByName("img_"..i):getChildByName("img_selectbg")
        btns_upgrade[i] = UpgradePanel:getChildByName("img_"..i):getChildByName("btn_index")
        btns_upgrade[i]:onClick(function ()
            for j = 1,10 do
                if j == i then
                    current_select_grade = i;
                    imgs_upgrade_selectbg[j]:setVisible(true);
                else
                    imgs_upgrade_selectbg[j]:setVisible(false);
                end
            end
            if self:isUnlockSkinIndex(i) then
                self:setSkinIndex(i);
                for i = 1 ,10 do
                    if i == current_select_grade then
                        imgs_upgrade_select[i]:setVisible(true)
                        img_head:loadTexture("majia/img/UpgradePanel/skin/"..current_select_grade..".png")
                    else
                        imgs_upgrade_select[i]:setVisible(false);
                    end
                end
            end
        end)

        local t = self:isUnlockSkinIndex(i);
        if t == true then
            imgs_upgrade_mask[i]:setVisible(false);
        else
            imgs_upgrade_mask[i]:setVisible(true);
        end
        if i == self:getSkinIndex() then
            imgs_upgrade_select[i]:setVisible(true);
        else
            imgs_upgrade_select[i]:setVisible(false);
        end
    end
end

function ShejianGameScene:initDailyBounsPanel()
    btn_signClose = DailyBounsPanel:getChildByName("btn_close");
    btn_sign = DailyBounsPanel:getChildByName("btn_sign");
    for i = 1,7 do
        signFlag[i] = DailyBounsPanel:getChildByName("img_"..i):getChildByName("img_check");
        signFlag[i]:setVisible(false);
        sign_value[i] = DailyBounsPanel:getChildByName("img_"..i):getChildByName("txt_number");
        sign_value[i]:setString(""..signGold[i]);
    end
    btn_signClose:onClick(function (...)
        DailyBounsPanel:setVisible(false)
     end)
     
     btn_sign:onClick(function(...)
        self:processSign()
     end)

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
end

function ShejianGameScene:initRankPanel()
    local btn_rank_close =  RankPanel:getChildByName("btn_close");
    btn_rank_close:onClick(function (...)
        RankPanel:setVisible(false);
    end);
    list_rank = RankPanel:getChildByName("list");
    img_clone = RankPanel:getChildByName("img_clone");
    local info = self:getRecord();
    list_rank:removeAllItems();
    for i = 1, #info do
        local item = img_clone:clone();
        local txt_index = item:getChildByName("txt_index");
        local txt_name = item:getChildByName("txt_name");
        local txt_start_time = item:getChildByName("txt_start_time");
        local txt_play_time = item:getChildByName("txt_time");
        txt_index:setString(""..i);
        local str_start_time = (os.date("%m/%d/%Y %H:%M:%S", info[i].startTime))
        txt_start_time:setString(""..str_start_time);
        local h = math.floor((info[i].time)/3600);
        local m = math.floor((info[i].time)%3600/60);
        local s = info[i].time%60;
        local res = string.format("%02d:%02d:%02d",h,m,s);
        txt_play_time:setString(res);
        list_rank:pushBackCustomItem(item);
    end
end

--开始游戏
function ShejianGameScene:startGame()
    self:initGamePanel()
    self:loadLevelConfig()
    self:initColor()
    self:initPoint()
    self:initSelectRing()
    if self.model == modelType.EXPERIENCE then
        txt_time:setVisible(true);
    elseif self.model == modelType.ADVENTURE then
        txt_time:setVisible(false);
    end
    startTime = os.time();
    if self.groupHandlers then 
		cc.Director:getInstance():getScheduler():unscheduleScriptEntry(self.groupHandlers)
		self.groupHandlers = nil;
	end
    self.groupHandlers = cc.Director:getInstance():getScheduler():scheduleScriptFunc(function()
        for i= 1, #cell_imgs do
            if cell_imgs[i]:getTag() ~=0 then
                local txt = cell_imgs[i]:getChildByName("hideNumber");
                local tnumber = txt:getString()
                tnumber = tnumber + self:getSpeed(i,level);
                local thp = self:getMaxHealth(i,level);
                if tnumber > thp then
                    tnumber = thp
                end
                txt:setString(""..tnumber);
                local label = cell_imgs[i]:getChildByName("number");
                label:setString("".. math.floor(tnumber));
            end
        end
        local res = self:checkGameOver();
        if res == 0 then
            node_small:removeAllChildren();
            self:playSound("majia/sound/fail.mp3");
            img_congratulations:setString("you failed");
            gold_txt:setVisible(false);
        elseif res == 1 then
            node_small:removeAllChildren();
            self:playSound("majia/sound/pass.mp3");
            img_congratulations:setString("congratulations");
            if self.model == modelType.EXPERIENCE then
                self:saveRecord();
                txt_next:setString("replay");
                gold_txt:setVisible(false);
            else
                txt_next:setString("next");
                gold_txt:setString("Gold:    +50");
                self:setGold(self:getGold() + 50);
                gold_txt:setVisible(true);
                txt_startpanel_gold:setString(self:getGold());
            end
        end
        if (res == 0) or (res ==1) then
            self:clearTimerHander();
            ScorePanel:setVisible(true);
            if self.model == modelType.ADVENTURE then
                if level < 45 then
                    level = level + 1;
                    if level > maxlevel then
                        maxlevel = level;
                        cc.UserDefault:getInstance():setIntegerForKey("maxlevel",maxlevel);
                    end
                end
            end
        end
	end, 1/10,false);
    for i=2,armyNumber do
        aiInterval[i-1] = aiInterval[i-1];
        if aiHandler[i-1] then 
		    cc.Director:getInstance():getScheduler():unscheduleScriptEntry(aiHandler[i-1])
		    aiHandler[i-1] = nil;
	    end
            aiHandler[i-1] = cc.Director:getInstance():getScheduler():scheduleScriptFunc(function()
            self:think(color[i]);
	    end, aiInterval[i-1],false);
    end
    if timeHandle then
         cc.Director:getInstance():getScheduler():unscheduleScriptEntry(timeHandle)
		 timeHandle = nil;
    end
    if self.model == modelType.EXPERIENCE then
        timeHandle = cc.Director:getInstance():getScheduler():scheduleScriptFunc(function()
            local delta = os.time() - startTime;
            local h = math.floor(delta/3600);
            local m = math.floor(delta%3600/60);
            local s = delta%60;
            local res = string.format("%02d:%02d:%02d",h,m,s);
            txt_time:setString(res);
	    end, 1.0,false);
    end
end

--AI
function ShejianGameScene:think(color)
    --寻找可被攻击的目标细胞：找敌方病毒数最小的，再在里面找最近的那个
    --寻找目标细胞找到派病毒的目标细胞集：将自己的细胞按照离目标细胞的距离进行升序排列，然后根据病毒数决定派哪些细胞攻击
    local disIndex = self:getTargetByColor(color);
    local resIndexs = self:getSourceSetByColor(disIndex,color);
    if #resIndexs == 0 then
        local r = self:seededRandom(0,100);
        if r<10 then
            --出兵，找个病毒数字最少的攻击
            local weekestIndex = self:getWeekestEnemy(color);
            local r = self:getRandomSelfACellIndex(color);
            local t = {};
            t[1] = r;
            self:Attack(t,weekestIndex);
        end
    else
        --出兵
        self:Attack(resIndexs,disIndex);  
    end
end

--按照最近路线排序
function ShejianGameScene:getNearestDistance(color,index)
    local mycell = {};
    for i=1,pointNumber do
        if cell_imgs[i]:getTag() == color then
            mycell[#mycell + 1] = i;
        end
    end
    local distance = 10000;
    for i=1,#mycell do
        local posi = cell_imgs[i]:getParent():convertToWorldSpace(cc.p(cell_imgs[i]:getPositionX(),cell_imgs[i]:getPositionY()));
        local posindex = cell_imgs[index]:getParent():convertToWorldSpace(cc.p(cell_imgs[index]:getPositionX(),cell_imgs[index]:getPositionY()));
        local tdis = cc.pGetDistance(posi,posindex);
        if  tdis< distance then
            distance = tdis;
        end
    end
    return distance;
     
end

--根据被攻击目标细胞寻找可以攻击的源细胞集
function ShejianGameScene:getSourceSetByColor(disIndex,color)
    local mycell = {};
    for i= 1,pointNumber do
        if cell_imgs[i]:getTag() == color then
            mycell[#mycell + 1] = i;
        end
    end
    table.sort(mycell,function (a,b)
        local adistance = cc.pGetDistance(cc.p(cell_imgs[disIndex]:getPositionX(),cell_imgs[disIndex]:getPositionY()),cc.p(cell_imgs[a]:getPositionX(),cell_imgs[a]:getPositionY()));
        local bdistance = cc.pGetDistance(cc.p(cell_imgs[disIndex]:getPositionX(),cell_imgs[disIndex]:getPositionY()),cc.p(cell_imgs[b]:getPositionX(),cell_imgs[b]:getPositionY()));
            return adistance < bdistance;
    end);
    local sourceSet = {};
    local sum = 0;

    local dislabel = cell_imgs[disIndex]:getChildByName("number");
    local disString = dislabel:getString();
    local disnumber = math.floor(tonumber(disString));


    for i= 1,#mycell do
        sourceSet[#sourceSet+1] = mycell[i];
        local label = cell_imgs[mycell[i]]:getChildByName("number");
        local string = label:getString();
        local number = math.floor(tonumber(string));
        sum = sum + number;
        if sum >= disnumber*2 + 30 then
            break;
        end
    end
    return sourceSet;
end

--寻找可被攻击的目标细胞
function ShejianGameScene:getTargetByColor(color)
    local targetcells = {};
    for i=1,pointNumber do
        local tag = cell_imgs[i]:getTag();
        if tag ~= color then
            targetcells[#targetcells+1] = i;
        end
    end
    table.sort(targetcells,function (a,b)
        local alabel = cell_imgs[a]:getChildByName("number");
        local blabel = cell_imgs[b]:getChildByName("number");
        local astring = alabel:getString();
        local bstring = blabel:getString();
        local anumber = math.floor(tonumber(astring));
        local bnumber = math.floor(tonumber(bstring));
        if anumber ~= bnumber then
            return anumber < bnumber;
        else
            local aroute = self:getNearestDistance(color,a);
            local broute = self:getNearestDistance(color,b);
            return aroute < broute;
        end
    end);
    return targetcells[1];
end

--释放病毒取进攻别的细胞
function ShejianGameScene:Attack(fromIndexs,toIndex)
    local toBase = cell_imgs[toIndex]:getParent():convertToWorldSpace(cc.p(cell_imgs[toIndex]:getPositionX(),cell_imgs[toIndex]:getPositionY()))
    toBase.x = toBase.x - (display.width-1136)/2
    for i = 1, #fromIndexs do
        local index = fromIndexs[i]
        local fromposBase = cell_imgs[index]:getParent():convertToWorldSpace(cc.p(cell_imgs[index]:getPositionX(),cell_imgs[index]:getPositionY()))
        fromposBase.x = fromposBase.x - (display.width-1136)/2
        local number = math.floor(self:getNumberByIndex(index)/2)
        self:refreshNumberByIndex(index,number)
        self:singleAttack(index,toIndex,fromposBase,toBase,number)
    end
    self:playSound("majia/sound/send.mp3")
end

--获取当前一个细胞的病毒数
function ShejianGameScene:getNumberByIndex(index)
    local label = cell_imgs[index]:getChildByName("number")
    local mumber = label:getString();
    return math.floor(tonumber(mumber));
end

--刷新当前病毒数
function ShejianGameScene:refreshNumberByIndex(index,subnumber)
    local txt = cell_imgs[index]:getChildByName("hideNumber")
    local strhideNumber = txt:getString()
    local hideNumber = tonumber(strhideNumber)
    hideNumber = hideNumber - subnumber
    txt:setString(""..hideNumber)
    local label = cell_imgs[index]:getChildByName("number")
    label:setString(math.floor(math.floor(hideNumber)))
end

--通过颜色获得小兵的纹理
function ShejianGameScene:getSmallPathByColorEX(color,index)
    if self:isMe(index) then
        if self.model == modelType.EXPERIENCE then
            if color == RED then
                return "majia/img/DynamicLoad/soldier_red.png";
            elseif color == YELLOW then
                return "majia/img/DynamicLoad/soldier_yellow.png";
            elseif color == GREEN then
                return "majia/img/DynamicLoad/soldier_green.png";
            elseif color == PURPLE then
                return "majia/img/DynamicLoad/soldier_purple.png";
            end
        else
            return "majia/img/SkinPanel/soldier/"..selectSkinIndex..".png";
        end
    else
        if color == RED then
                return "majia/img/DynamicLoad/soldier_red.png";
            elseif color == YELLOW then
                return "majia/img/DynamicLoad/soldier_yellow.png";
            elseif color == GREEN then
                return "majia/img/DynamicLoad/soldier_green.png";
            elseif color == PURPLE then
                return "majia/img/DynamicLoad/soldier_purple.png";
            end
    end
end

--通过颜色获得非主要基地的的纹理
function ShejianGameScene:getSmallPathByColor(color,index)
    if self:isMe(index) then
        if self.model == modelType.EXPERIENCE then
            if color == RED then
                return "majia/img/BattleInfoPanel/small_red.png";
            elseif color == YELLOW then
                return "majia/img/BattleInfoPanel/small_yellow.png";
            elseif color == GREEN then
                return "majia/img/BattleInfoPanel/small_green.png";
            elseif color == PURPLE then
                return "majia/img/BattleInfoPanel/small_purple.png";
            end
        else
            return "majia/img/UpgradePanel/skin/"..selectupIndex..".png";
        end
    else
         if color == RED then
                return "majia/img/BattleInfoPanel/small_red.png";
            elseif color == YELLOW then
                return "majia/img/BattleInfoPanel/small_yellow.png";
            elseif color == GREEN then
                return "majia/img/BattleInfoPanel/small_green.png";
            elseif color == PURPLE then
                return "majia/img/BattleInfoPanel/small_purple.png";
            end
    end
end

--找到一个病毒数最少的敌人细胞
function ShejianGameScene:getWeekestEnemy(color)
    local index = nil;
    local tNumber = 10000;
    for i= 1,pointNumber do
        if cell_imgs[i]:getTag() ~= color then
            local label = cell_imgs[i]:getChildByName("number");
            local numberString = label:getString();
            local number = tonumber(numberString);
            if number < tNumber then
                index = i;
                tNumber = number;
            end
        end
    end
    return index;
end

--在己方的细胞中随机找到一个细胞
function ShejianGameScene:getRandomSelfACellIndex(color)
    local mycell = {};
    for i= 1,pointNumber do
        if cell_imgs[i]:getTag() == color then
            mycell[#mycell+1] = i;
        end
    end
    local r = self:seededRandom(1,#mycell+1);
    return mycell[r];
end
--一个细胞对另一个细胞派出病毒
function ShejianGameScene:singleAttack(fromIndex,toIndex,fromposBase,toBase,number)
    for i= 1,number do
        local from_x = fromposBase.x +  math.floor(self:seededRandom(1,26));
        local from_y = fromposBase.y + math.floor(self:seededRandom(1,26));
        local to_x = toBase.x +  math.floor(self:seededRandom(1,26));
        local to_y = toBase.y + math.floor(self:seededRandom(1,26));
        local path = self:getSmallPathByColorEX(cell_imgs[fromIndex]:getTag(),fromIndex);
        local soldier = ccui.ImageView:create(path);
        soldier:setPosition(cc.p(from_x,from_y));
        soldier:setScale(0.2);
        node_small:addChild(soldier);
        local dis = cc.pGetDistance(cc.p(from_x,from_y),cc.p(to_x,to_y));
        soldier:runAction(
        cc.Sequence:create(cc.Spawn:create(cc.MoveTo:create(dis/(1136/8),cc.p(to_x,to_y))),cc.RemoveSelf:create(),cc.CallFunc:create(function ()
            local numberlabel = cell_imgs[toIndex]:getChildByName("number");
            local txt = cell_imgs[toIndex]:getChildByName("hideNumber");
            local number = tonumber(txt:getString());
            if (cell_imgs[toIndex]:getTag() == 0) or (cell_imgs[toIndex]:getTag() == cell_imgs[fromIndex]:getTag()) then
                number = number +1;
                if cell_imgs[toIndex]:getTag() == 0 then
                    cell_imgs[toIndex]:loadTexture(self:getSmallPathByColor(cell_imgs[fromIndex]:getTag(),fromIndex));
                end
                cell_imgs[toIndex]:setTag(cell_imgs[fromIndex]:getTag());
                local thp = self:getMaxHealth(toIndex,level);
                if number > thp then
                    number = thp;
                end
                numberlabel:setString(""..math.floor(number));
                numberlabel:setVisible(true);
                txt:setString(""..math.floor(number));
            else
                number = number - 1 ;
                if number <= 0 then
                    number = 0;
                    self:playSound("majia/sound/change.mp3");
                end
                if math.floor(number) == 0 then
                    cell_imgs[toIndex]:setTag(cell_imgs[fromIndex]:getTag());
                    if toIndex <= armyNumber then
                        cell_imgs[toIndex]:loadTexture(self:getColorImage(cell_imgs[fromIndex]:getTag(),fromIndex));
                        local number = cell_imgs[toIndex]:getChildByName("number");
                        number:setPosition(cc.p(cell_imgs[toIndex]:getContentSize().width/2,cell_imgs[toIndex]:getContentSize().height/2));
                    else
                        cell_imgs[toIndex]:loadTexture(self:getSmallPathByColor(cell_imgs[fromIndex]:getTag(),fromIndex));
                    end
                end
                numberlabel:setString(""..math.floor(number));
                numberlabel:setVisible(true);
                txt:setString(""..math.floor(number));
            end
        end)));
    end
end

function ShejianGameScene:checkGameOver()
    local number = 0;
    --没有我的颜色的病毒-失败
    for i=1,pointNumber do 
        if cell_imgs[i]:getTag() == color[1] then
            number = number +1
        end
    end
    if (number == 0)  then
        return 0
    end
    --只有我的颜色的病毒-胜利
    local otherColor = 0;
    for i=1,pointNumber do 
        if (cell_imgs[i]:getTag() ~= color[1])  and (cell_imgs[i]:getTag() ~= 0)  then
            otherColor = otherColor +1
        end
    end
    if otherColor == 0 then
        return 1;
    end
    return -1
end

--刷新颜色按钮
function ShejianGameScene:refreshColorBtn(tag)
    for i=1,4 do
        if i == tag then
            color_btns[i]:loadTextures("majia/img/SettingPanel/select.png","majia/img/SettingPanel/select.png","");
        else
            color_btns[i]:loadTextures("majia/img/SettingPanel/normal.png","majia/img/SettingPanel/normal.png","");
        end
    end
end

--刷新等级按钮
function ShejianGameScene:refreshGradeBtn(tag)
    for i=1,3 do
        if i == tag then
            grade_btns[i]:loadTextures("majia/img/SettingPanel/select.png","majia/img/SettingPanel/select.png","");
        else
            grade_btns[i]:loadTextures("majia/img/SettingPanel/normal.png","majia/img/SettingPanel/normal.png","");
        end
    end
end

--通过据点据点索引和关卡获得敌人的生命上限
function ShejianGameScene:getEnemyMaxHealth(index,level)
    return config[index].life + level*5;
end

--通过据点索引和购买皮肤的索引获得自己的生命上限
function ShejianGameScene:getSelfMaxHealth(index)
    local skinIndex = self:getSkinIndex();
    if skinIndex == 0 then
        return config[index].life;
    else
        return config[index].life + skinIndex*5;
    end 
end

--通过据点索引获得该据点的生命值上限
function ShejianGameScene:getMaxHealth(index,level)
    if self.model == modelType.EXPERIENCE then
        if index <= armyNumber then
            return config[index].life;
        else
            return config[index].life + self.randomLife; -- math.floor(self:seededRandom(1,50));
        end
    else
        if self:isMe(index) then
             return self:getSelfMaxHealth(index);
        else
            return self:getEnemyMaxHealth(index,level)
        end
    end
end

--通过据点索引和购买皮肤的索引获得自己的分裂速度
function ShejianGameScene:getSelfSpeed(index)
    local skinIndex = self:getSkinIndex();
    if skinIndex == 0 then
        return config[index].speed;
    else
        return config[index].speed + skinIndex*0.0225;
    end 
end

--通过据点索引和关卡索引获得敌人的分裂速度
function ShejianGameScene:getEnemySpeed(index,level)
    return config[index].speed + level*0.005;
end

--通过据点索引获得该据点的分裂速度
function ShejianGameScene:getSpeed(index,level)
    if self.model == modelType.EXPERIENCE then
        if index <= armyNumber then
            return config[index].speed;
        else
            return config[index].speed + self.randomSpeed
        end
    else
        if self:isMe(index) then
             return self:getSelfSpeed(index);
        else
            return self:getEnemySpeed(index,level)
        end
    end
end

--清除定时器
function ShejianGameScene:clearTimerHander()
    if self.groupHandlers then 
		cc.Director:getInstance():getScheduler():unscheduleScriptEntry(self.groupHandlers)
		self.groupHandlers = nil;
	end
    for i = 2, armyNumber do
        if aiHandler[i-1] then 
		    cc.Director:getInstance():getScheduler():unscheduleScriptEntry(aiHandler[i-1])
		    aiHandler[i-1] = nil;
        end
	end
    if timeHandle then 
		cc.Director:getInstance():getScheduler():unscheduleScriptEntry(timeHandle)
		timeHandle = nil;
	end
end

--初始画选择环
function ShejianGameScene:initSelectRing()
    if #rings == 0 then
        for i= 1,12 do
            local node = node_ball:getChildByName("node_"..i);
            rings[i] = ccui.ImageView:create("majia/img/DynamicLoad/circle.png");
            rings[i]:setPosition(cell_imgs[i]:getParent():convertToWorldSpace(cc.p(cell_imgs[i]:getPositionX(),cell_imgs[i]:getPositionY())))
            rings[i]:setPositionX(rings[i]:getPositionX() - (display.width-1136)/2);
            rings[i]:setVisible(false);
            rings[i]:setScale(0.6);
            node_draw:addChild(rings[i]);
        end
    else
        for i= 1,12 do
            rings[i]:setPosition(cell_imgs[i]:getParent():convertToWorldSpace(cc.p(cell_imgs[i]:getPositionX(),cell_imgs[i]:getPositionY())))
            rings[i]:setPositionX(rings[i]:getPositionX() - (display.width-1136)/2);
            rings[i]:setVisible(false);
        end
    end
end

--初始化颜色
function ShejianGameScene:initColor()
    local t = {}
    for i=1,armyNumber do
        t[i] = i;
    end
    for i=1,armyNumber do
        local r = math.floor(self:seededRandom(1,armyNumber+1));
        t[i],t[r] = t[r],t[i];
    end
    for i=1,armyNumber do
        if t[i] == color[1] then
            table.remove(t,i);
            break;
        end
    end
    for i= 1,#t do
        color[i+1] = t[i];
    end
end

--初始化据点
function ShejianGameScene:initPoint(isRandom)
    if #cell_imgs == 0 then
        for i = 1,12 do
            local node = node_ball:getChildByName("node_"..i)
            if i <= armyNumber then
                cell_imgs[i]  = ccui.ImageView:create()
                cell_imgs[i]:setTag(color[i])
                cell_imgs[i]:loadTexture(self:getColorImageBase(color[i],i));
                local numberlabel = cc.Label:createWithTTF("100", "majia/font555.ttf", 36);
                numberlabel:setAnchorPoint(cc.p(0.5,0.5));
                numberlabel:setName("number");
                numberlabel:setPosition(cc.p(cell_imgs[i]:getContentSize().width/2,cell_imgs[i]:getContentSize().height/2));
                numberlabel:enableOutline(cc.c4b(0,0,0,255), 2);
                --隐藏域
                local hidenumber =  ccui.Text:create("", "", 22);
                if isRandom then
                    hidenumber:setString(""..math.random(50,300));
                    numberlabel:setString(""..math.random(50,300));
                else
                    hidenumber:setString("100");
                end
            
                hidenumber:setName("hideNumber");
                hidenumber:setVisible(false);
                cell_imgs[i]:addChild(numberlabel);
                cell_imgs[i]:addChild(hidenumber);
            else
                cell_imgs[i]  = ccui.ImageView:create("majia/img/DynamicLoad/small_empty.png");
                cell_imgs[i]:setTag(0);
                local numberlabel = cc.Label:createWithTTF("0", "majia/font555.ttf", 36);
                numberlabel:setAnchorPoint(cc.p(0.5,0.5));
                numberlabel:setName("number");
                numberlabel:setPosition(cc.p(cell_imgs[i]:getContentSize().width/2,cell_imgs[i]:getContentSize().height/2));
                numberlabel:enableOutline(cc.c4b(0,0,0,255), 2);
                numberlabel:setVisible(false);
                --隐藏域
                local hidenumber =  ccui.Text:create("", "", 22);
                hidenumber:setString("0");
                hidenumber:setName("hideNumber");
                hidenumber:setVisible(false);
                cell_imgs[i]:addChild(numberlabel);
                cell_imgs[i]:addChild(hidenumber);
                if i > pointNumber then
                    cell_imgs[i]:setVisible(false);
                else
                    cell_imgs[i]:setVisible(true);
                end
            end
            cell_imgs[i]:setPosition(cc.p(cell_imgs[i]:getContentSize().width/2,cell_imgs[i]:getContentSize().height/2)); 
            node:addChild(cell_imgs[i]);
        end
    else
        for i = 1,12 do
            if i <= armyNumber then
                cell_imgs[i]:setTag(color[i]);                        
                cell_imgs[i]:loadTexture(self:getColorImageBase(color[i],i));
                local numberlabel = cell_imgs[i]:getChildByName("number");
                numberlabel:setString(""..100);
                numberlabel:setVisible(true);
                local text = cell_imgs[i]:getChildByName("hideNumber");
                if isRandom then
                    text:setString(""..math.random(50,300));
                else
                    text:setString("100");
                end
            else
                cell_imgs[i]:loadTexture("majia/img/DynamicLoad/small_empty.png");
                cell_imgs[i]:setTag(0);
                local numberlabel = cell_imgs[i]:getChildByName("number");
                numberlabel:setString(""..0);
                numberlabel:setVisible(false);
                local text = cell_imgs[i]:getChildByName("hideNumber");
                text:setString(""..0);
                if i > pointNumber then
                    cell_imgs[i]:setVisible(false);
                else
                    cell_imgs[i]:setVisible(true);
                end
            end
        end
    end
end

--通过颜色值获得颜色图片
function ShejianGameScene:getColorImage(color,index)
    if self:isMe(index) then
        if self.model == modelType.EXPERIENCE then
            if color == 1 then
                return "majia/img/DynamicLoad/icon/red.png";
            elseif color == 2 then
                return "majia/img/DynamicLoad/icon/yellow.png";
            elseif color == 3 then
                return "majia/img/DynamicLoad/icon/green.png";
            elseif color == 4 then
                return "majia/img/DynamicLoad/icon/purple.png";
            end
        else
            return self:getImagePath();
        end
    else
        if color == 1 then
                return "majia/img/DynamicLoad/icon/red.png";
        elseif color == 2 then
            return "majia/img/DynamicLoad/icon/yellow.png";
        elseif color == 3 then
            return "majia/img/DynamicLoad/icon/green.png";
        elseif color == 4 then
            return "majia/img/DynamicLoad/icon/purple.png";
        end
    end
end

--通过颜色值获得颜色图片
function ShejianGameScene:getColorImageBase(color,index)
    if self:isMe(index) then
        if self.model == modelType.EXPERIENCE then
            if color == 1 then
                return "majia/img/DynamicLoad/icon/red.png"
            elseif color == 2 then
                return "majia/img/DynamicLoad/icon/yellow.png"
            elseif color == 3 then
                return "majia/img/DynamicLoad/icon/green.png"
            elseif color == 4 then
                return "majia/img/DynamicLoad/icon/purple.png"
            end
        else
            return self:getImagePath();
        end
    else
        if color == 1 then
                return "majia/img/DynamicLoad/icon/red.png";
        elseif color == 2 then
            return "majia/img/DynamicLoad/icon/yellow.png";
        elseif color == 3 then
            return "majia/img/DynamicLoad/icon/green.png";
        elseif color == 4 then
            return "majia/img/DynamicLoad/icon/purple.png";
        end
    end
end

--在冒险模式下，通过购买的皮肤获得图片
function ShejianGameScene:getImagePath(color)
    local skinIndex = self:getSkinIndex();
    return "majia/img/UpgradePanel/skin/"..skinIndex..".png";
end

--是否是自己
function ShejianGameScene:isMe(index)
    local res = false;
    if cell_imgs[index]:getTag() == color[1] then
        res = true;
    else
        res = false;
    end
    return res;
end

--加载关卡配制
function ShejianGameScene:loadLevelConfig()
    if self.model == modelType.EXPERIENCE then
        if grade == 1 then
            armyNumber = 2
            pointNumber = 9
        elseif grade == 2 then
            armyNumber = 3
            pointNumber = 10
        elseif grade ==3 then
            armyNumber = 4
            pointNumber = 12
        end
        self:setBasePosition();
    else
        armyNumber = levelConfig[level].armyNumber;
        pointNumber = levelConfig[level].pointNumber;
        self:setLevelPosition();
    end

end

--设置体验模式的各个据点位置
function ShejianGameScene:setBasePosition()
    for i= 1,12 do
        local node = node_ball:getChildByName("node_"..i);
        node:setPosition(cc.p(basePosition[i].x,basePosition[i].y));
    end
end

--设置关卡模式的各个据点位置
function ShejianGameScene:setLevelPosition()
    for i= 1,levelConfig[level].pointNumber do
        local node = node_ball:getChildByName("node_"..i);
        node:setPosition(cc.p(levelPosition[level][i].x,levelPosition[level][i].y));
    end
end

--创建关卡
function ShejianGameScene:initLevelPanel()
    local btn_level_return = LevelPanel:getChildByName("btn_return");
    btn_level_return:onClick(function (...)
        LevelPanel:setVisible(false)
        StartPanel:setVisible(true)
    end)

    if self.levelView ~= nil then
        return;
    end
    self.levelView = ccui.PageView:create()
    self.levelView:setTouchEnabled(true)
    self.levelView:setContentSize(cc.size(1136,540))
    self.levelView:setPosition(cc.p(0,0))
    LevelPanel:addChild(self.levelView)
    self.levelView:addEventListener(function(sender,event)
        printEX("事件值="..event)
        if event == 0 then
            printEX(""..self.levelView:getCurPageIndex())
        end
    end)

    levelbtns = {}
    for i=1,3 do
        local layout = ccui.Layout:create();
        layout:setContentSize(cc.size(1136, 540));
         for j = 1,3 do
            for k=1,5 do
                local btn= ccui.Button:create("majia/img/DynamicLoad/lock.png","","");
                levelbtns[#levelbtns+1] = btn;
                btn:setPosition(120+(225)*(k-1),465-(j-1)*(180));
                btn:setTag(((i-1)*15+(j-1)*5+k));
                local number = cc.Label:createWithTTF("", "majia/font555.ttf", 36);
                number:setName("number");
                number:setVisible(false);
                number:setAnchorPoint(cc.p(0.5,0.5));
                number:setString(""..btn:getTag());
	            number:setTextColor(fontcolor);
                number:setPosition(cc.p(btn:getContentSize().width/2,btn:getContentSize().height/2-15));
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
    self:refreshLevel()
end

--根据读取进度来刷新关卡
function ShejianGameScene:refreshLevel()
    maxlevel = cc.UserDefault:getInstance():getIntegerForKey("maxlevel",0);
    if maxlevel == 0 then
        maxlevel = 1;
    end
    for i=1,maxlevel-1 do
        levelbtns[i]:loadTextures("","","");
        local number = levelbtns[i]:getChildByName("number");
        number:setVisible(true);
        levelbtns[i]:setTouchEnabled(true);
    end

    levelbtns[maxlevel]:loadTextures("","","");
    levelbtns[maxlevel]:setTouchEnabled(true);
    local number = levelbtns[maxlevel]:getChildByName("number");
    number:setVisible(true);

    for i=maxlevel +1,45 do
        levelbtns[i]:setTouchEnabled(false);
    end
end

--保存记录
function ShejianGameScene:saveRecord()
    local number = cc.UserDefault:getInstance():getIntegerForKey("recordNumber",0);
    cc.UserDefault:getInstance():setIntegerForKey("recordNumber",number +1);
    local startTimeKey = "startTime"..(number +1);
    local endTimeKey = "endTime"..(number+1);
    local nameKey = "name"..(number+1);
    cc.UserDefault:getInstance():setIntegerForKey(startTimeKey,startTime);
    cc.UserDefault:getInstance():setIntegerForKey(endTimeKey,os.time());
end

--取得记录
function ShejianGameScene:getRecord()
    local info ={}
    local number = cc.UserDefault:getInstance():getIntegerForKey("recordNumber",0);
    for i=1,number do
        local startTimeKey = "startTime"..i;
        local endTimeKey = "endTime"..i;
        local nameKey = "name"..i;
        info[i] = {};
        info[i].name = cc.UserDefault:getInstance():getStringForKey(nameKey,"your name");
        info[i].startTime = cc.UserDefault:getInstance():getIntegerForKey(startTimeKey,0);
        info[i].time = cc.UserDefault:getInstance():getIntegerForKey(endTimeKey,300) - info[i].startTime;
    end
    table.sort(info,function (a,b)
        return a.time < b.time;
    end);
    return info
end

--给自己指定的士兵皮肤解锁
function ShejianGameScene:unlockSoldierSkinIndex(index)
    cc.UserDefault:getInstance():setBoolForKey("soldierSkinIndex_"..index,true);
end

--设置自己的小兵皮肤索引
function ShejianGameScene:setSoldierSkinIndex(index)
    cc.UserDefault:getInstance():setIntegerForKey("soldierSkinIndex",index);
end

--获得自己的小兵皮肤索引
function ShejianGameScene:getSoldierSkinIndex()
    local skinIndex = cc.UserDefault:getInstance():getIntegerForKey("soldierSkinIndex",0);
    return skinIndex;
end

--获得指定的士兵皮肤是否解锁
function ShejianGameScene:isUnlockSoldierSkinIndex(index)
    return cc.UserDefault:getInstance():getBoolForKey("soldierSkinIndex_"..index,false);
end

--给自己指定的总部皮肤解锁
function ShejianGameScene:unlockSkinIndex(index)
    cc.UserDefault:getInstance():setBoolForKey("skinIndex_"..index,true);
end

--设置自己总部升级皮肤索引
function ShejianGameScene:setSkinIndex(index)
    cc.UserDefault:getInstance():setIntegerForKey("skinIndex",index);
end

--获得指定的总部皮肤是否解锁
function ShejianGameScene:isUnlockSkinIndex(index)
    return cc.UserDefault:getInstance():getBoolForKey("skinIndex_"..index,false);
end

--获得自己总部升级皮肤索引
function ShejianGameScene:getSkinIndex()
    local skinIndex = cc.UserDefault:getInstance():getIntegerForKey("skinIndex",0)
    return skinIndex
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

--签到按钮
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

--刷新金币
function ShejianGameScene:refreshGold()
    local goldValue =  cc.UserDefault:getInstance():getIntegerForKey("gold",0)
    txt_startpanel_gold:setString(""..goldValue)
end

 --设置金币
function ShejianGameScene:setGold(gold)
    cc.UserDefault:getInstance():setIntegerForKey("gold",gold);
end

--获取金币
function ShejianGameScene:getGold()
   return cc.UserDefault:getInstance():getIntegerForKey("gold",0);
end

--播放音效
function ShejianGameScene:playSound(path)
    if soundSwitch then
        PLAY_SOUND(path);
    end
end

--播放背景音乐
function ShejianGameScene:playMusic(path)
    if musicSwitch then
        PLAY_MUSIC(path);
    end
end

function ShejianGameScene:onExit()
	if self._update then
		local scheduler = cc.Director:getInstance():getScheduler()
		scheduler:unscheduleScriptEntry(self._update)
		self._update = nil
	end
	cc.SimpleAudioEngine:getInstance():stopMusic()
end

cc.exports.ShejianGameScene = ShejianGameScene
return ShejianGameScene