local Level = class("Level",cc.load("mvc").ModuleBase)
Level.RESOURCE_FILENAME = "game/LongHuDou/Level.lua"
Level.behavior = {
    "logic.common.behavior.FontColorChange"
}
Level.changecolorfont = {
    best = {},
    last = {}
}

local Game = require("logic.game.LongHuDou.Game")
local cfg = require("logic.game.LongHuDou.cfg.cfg")
local LevelNum = 10
local LevelBlockBgPath = "game/LongHuDou/images/level/"

function Level:onCreate(role)
    dump(role)
    
    local cfg = global.saveTools.getData(cfg.LocalSave)
    for i = 1, LevelNum do
        local levelBlock = self.mView["level_"..i]
        local txt = levelBlock:getChildByName("text")
        local btn = levelBlock:getChildByName("btn")
        local bg = levelBlock:getChildByName("bg")
        txt:setString(tostring(i))
        if i <= cfg.level then
            btn:setEnabled(true)
            bg:loadTexture(LevelBlockBgPath.."level_on.png")
        else
            btn:setEnabled(false)
            bg:loadTexture(LevelBlockBgPath.."level_off.png")
        end
        btn:addTouchEventListener(function(sender,state)
            if(state == 2)then
                Game.new(nil,nil,i,role):showWithScene()
            end
        end)
    end
   
  
end

function Level:shootScreenTest()
    local role = {1,2}
    Game.new(nil,nil,math.random(1,10),role):showWithScene()
end


return Level