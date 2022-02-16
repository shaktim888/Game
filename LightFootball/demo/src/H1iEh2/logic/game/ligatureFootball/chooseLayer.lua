local ChooseLevel = class("ChooseLevel", cc.load("mvc").ModuleBase)
ChooseLevel.RESOURCE_FILENAME = "game/ligatureFootball/ChooseLayerScene.lua"
local math = require('math')

local CURRENT_LEVEL_KEY = "_CURRENT_LEVEL_KEY"

function ChooseLevel:onCreate()
    math.randomseed(os.time())
    self.currentLevel = global.saveTools.getData(CURRENT_LEVEL_KEY)
    if not self.currentLevel then
        self.currentLevel = 1
        global.saveTools.saveData(CURRENT_LEVEL_KEY,1)
    end
    self.mView["btn_return"]:addClickEventListener(handler(self,self.gotoMainGame))
    self:initPageLevel()
end

function ChooseLevel:gotoMainGame()
    global.utils.sound.playSound("game/ligatureFootball/sound/click.wav")
    global.viewJump.gotoMainGame()
end

function ChooseLevel:initPageLevel()
    local level = 1
    if global.isGrabScreenMode == 1 then
        self.currentLevel = math.random(10,20)
    end
    self.mView["page_level"]:setTouchEnabled(true)
    for i = 1,10 do
        local cell = self.mView["level_layout"]:clone()
        self.mView["page_level"]:addPage(cell)
        local child = cell:getChildren()
        for i = 1,#child do
            child[i]:addClickEventListener(handler(self,self.gotoGame))
            child[i]:setTag(level)
            local text = child[i]:getChildByName("text")
            text:setString("Level:"..level)
            local lock = child[i]:getChildByName("lock")
            lock:setVisible(self.currentLevel<level)
            level = level + 1
        end
    end
    self.mView["page_level"]:runAction(cc.Sequence:create(
        cc.DelayTime:create(0.1),
        cc.CallFunc:create(handler(self,function()
            local currentPage = math.ceil(self.currentLevel/5)-1
            self.mView["page_level"]:scrollToPage(currentPage);
        end))
    ))
end

function ChooseLevel:gotoGame(sender)
    local level = 1
    if global.isGrabScreenMode == 1 then
        level = math.random(1,10)
    else
        level = sender:getTag()
    end
   
    global.utils.sound.playSound("game/ligatureFootball/sound/click.wav")
    local gameLayer = require("logic.game.ligatureFootball.gameLayer")
    local view = gameLayer.new(nil,nil,level)
    global.viewMgr.showView(view, true)
end

return ChooseLevel