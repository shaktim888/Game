local _CFG = {
}

_CFG.TEST = false

_CFG.CANVAS_WIDTH = 1280
_CFG.CANVAS_HEIGHT = 720

_CFG._sImagePath_ = "game/GuardCastle/images/"

_CFG._sImagePath = "game/GuardCastle/images/game/"

_CFG.Sound = {
    click = "game/GuardCastle/sound/click.mp3",
    bgm   = "game/GuardCastle/sound/bgm.mp3",
    game_over = "game/GuardCastle/sound/game_over.mp3",
    win = "game/GuardCastle/sound/win.mp3",
    arrow = "game/GuardCastle/sound/arrow.mp3",
    bigSkill = "game/GuardCastle/sound/bigSkill.mp3",
    attackArrow = "game/GuardCastle/sound/attackArrow.mp3",
    attackSword = "game/GuardCastle/sound/attackSword.mp3",
    enemydamage =  "game/GuardCastle/sound/enemydamage.mp3",
    castledamage =  "game/GuardCastle/sound/castledamage.mp3",
}
_CFG.PLAYER_INFO_SAVE_TO_LOCAL = "PLAYER_INFO_SAVE_TO_LOCAL_aa"

_CFG.GuardCastle_SAVE = "LOCAL_STORAGE_LUCKY_222_DICE_SAVE"

_CFG.STATE ={
   STATE_INIT = 0,
   STATE_PLAY = 1,
   STATE_OVER = 2,
   STATE_PAUSE = 3
} 

_CFG.MSG = {
    FAIL = 1,
    EXIT = 2,
    NEXT = 3,
    PAUSE = 4
}

_CFG.Arrow = {
   [1] = {
        id = 1,
        clearTime = 0.5,
        name = "玩家的点击弓箭",
   },
   [2] = {
        id = 2,
        clearTime = 0.5,
        name = "怪的弓箭",
   },
   [3] = {
       id = 3,
       clearTime = 0.3,
       name = "炮台自动发出的弓箭"
   },
   [4] = {
       id = 4,
       clearTime = 0.2,
       name = "大招的箭"
   }
}

_CFG.ArrowMoveTag = 10000

--怪攻击的箭。留在炮台的范围
local monsterAttackOffset = 290
_CFG.MonsterAttackPoint = {
    [1] = {x = {372,411}, y = {115 + monsterAttackOffset ,270 + monsterAttackOffset}}, --步兵射击有一个范围
    [2] = {x = {770,817}, y = {115 + monsterAttackOffset ,270 + monsterAttackOffset}},
    -- [3] = {x = 603.50, y = 259} --天上飞的射击的是塔中心
    -- [3] = {x = {435,549}, y = {}}
}

--炮台攻击发起点（上下左右中）
local offSet = 139
_CFG.CastleAttackPoint = {
    [1] = {x = 379.50, y = 372.50 + offSet},
    [2] = {x = 787.50, y = 372.50 + offSet},
    [3] = {x = 411.50, y = 274.50 + offSet},
    [4] = {x = 773.50, y = 274.50 + offSet},
    [5] = {x = 572.50, y = 365.00 + offSet} --点击炮台
}



_CFG.MonsterSpawnSpeed = 0.5
_CFG.MONSTER = {
    [1] = {
        id = 1,
        name = "步兵",
        posY = 360.00 - 50,
        LeftX = {320.00, 333.00},
        RightX = {822.00, 849.00},
        anchorPoint = cc.p(0.5,0),
        HP = 5
    },
    [2] = {
        id = 2,
        name = "地面弓箭手",
        posY = 360.00 - 50,
        LeftX = {126.00, 167.00},
        RightX = {986.00, 1035.00},
        anchorPoint = cc.p(0.5,0.5),
        HP = 8
    },
    [3] = {
        id = 3,
        name = "空中弓箭手",
        posY = 415 + 50,
        LeftX = {126.00, 167.00},
        RightX = {986.00, 1035.00},
        anchorPoint = cc.p(0.5,0.5),
        HP = 10
    }
}
_CFG.Castle = {
    HP = 100
}
_CFG.EachArrowHurt = 0.5
_CFG.GAME_TIME = 300


_CFG.COOLINGTIME = 25
--大招攻击起始范围
_CFG.BigKillRange = {
    x = {
        [1] = {80.00,333.00},
        [2] = {822,1100},
    },
    y = {720,800}
}
_CFG.BigKillTime = 2


_CFG.TEXT_GAME_OVER = "GAME OVER"
_CFG.TEXT_TIME = "TIME: ";
_CFG.TEXT_SELECT_A_LEVEL = "SELECT A LEVEL";
_CFG.TEXT_SUCCESS = "Congratulations";
_CFG.TEXT_LOST = "YOU LOST";
_CFG.TEXT_PAUSE = "PAUSE";
_CFG.TEXT_LOSE_RESULT = "YOU THREW";
_CFG.TEXT_ARE_SURE = "ARE YOU SURE?";
_CFG.TEXT_OF = "/";

_CFG.TEXT_TOTAL_SCORE = "TOTAL SCORE";




return _CFG