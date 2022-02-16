local _CFG = {
}

_CFG.TEST = false

_CFG.CANVAS_WIDTH = 720
_CFG.CANVAS_HEIGHT = 1280

_CFG._sImagePath = "game/FruitTurn/images/game/"

_CFG.BOARD = 0
_CFG.DICE = 1

_CFG.Sound = {
    click = "game/FruitTurn/sound/click.mp3",
    bgm   = "game/FruitTurn/sound/bgm.mp3",
    game_over = "game/FruitTurn/sound/game_over.mp3",
    run = "game/FruitTurn/sound/run.mp3",
    win = "game/FruitTurn/sound/win.mp3",
    bounce = "game/FruitTurn/sound/bounce.mp3"
}

_CFG.FruitTurn_SAVE = "LOCAL_STORAGE_LUCKY_33332232313_DICE_SAVE"
_CFG.FruitTurn_SAVE_SCORE = "FruitTurn_SAVE_SCORE"

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

_CFG.IDx = {
    Easy = 1,
    Hard = 2,
    SuperHard = 3
}

_CFG.LevelInfo = {
    [1] = {
        Time = 30,
        Num = 4,
        StartPos = {x=82, y=874},
        Space = {width=148,height=141},
        Scale = 1
        
    },
    [2] = {
        Time = 45,
        Num = 6,
        StartPos = {x=41, y=893},
        Space = {width=109,height=141},
        Scale = 0.8

    },
    [3] = {
        Time = 60,
        Num = 8,
        StartPos = {x=41, y=893},
        Space = {width=81,height=81},
        Scale = 0.5

    }
}

_CFG.BEST = "BEST: "
_CFG.TEXT_GAME_OVER = "GAME OVER"
_CFG.TEXT_TIME = "战斗剩余: ";
_CFG.TEXT_SELECT_A_LEVEL = "SELECT A LEVEL";
_CFG.TEXT_WIN = "YOU WON";
_CFG.TEXT_LOST = "YOU LOST";
_CFG.TEXT_PAUSE = "PAUSE";
_CFG.TEXT_LOSE_RESULT = "YOU THREW";
_CFG.TEXT_ARE_SURE = "ARE YOU SURE?";
_CFG.TEXT_OF = "/";
_CFG.TEXT_FISHES = "FISHES";
_CFG.TEXT_WIN_RESULT = "YOU THREW";
_CFG.TEXT_RESET = "ARE YOU SURE? ALL YOUR PREVIOUS SAVINGS WILL BE DELETED!";
_CFG.TEXT_TOTAL_SCORE = "TOTAL SCORE";
_CFG.TEXT_LEVEL = "LEVEL";
_CFG.TEXT_HELP1_DESKTOP = "MOVE THE CRABS WITH THE MOUSE TO BOUNCE THE FISHES";
_CFG.TEXT_HELP1_MOBILE = "MOVE THE CRABS WITH THE FINGER TO BOUNCE THE FISHES";
_CFG.TEXT_HELP2 = "THROW THE FISHES HERE";




return _CFG