local GameShop = class("GameShop", cc.load("mvc").ModuleBase)
GameShop.RESOURCE_FILENAME = "game/jump/GameShop.lua"

local MONEY_SAVE_KEY = "_MONEY_SAVE_KEY_"

local HERO_TWO_INDEX_SAVE_KEY = "_HERO_TWO_INDEX_SAVE_KEY_"
local HERO_THREE_INDEX_SAVE_KEY = "_HERO_THREE_INDEX_SAVE_KEY_"
local HERO_FOUR_INDEX_SAVE_KEY = "_HERO_FOUR_INDEX_SAVE_KEY_"

local HERO_INDEX_SAVE_KEY = "_HERO_INDEX_SAVE_KEY_"

local currentIndex = 1 

function GameShop:onCreate()
    if global.isGrabScreenMode == 1 then
        self.mView['icon_text']:setString(math.random(300,1000))
    end
    if global.saveTools.getData(HERO_INDEX_SAVE_KEY) then
        currentIndex = global.saveTools.getData(HERO_INDEX_SAVE_KEY)
    else
        currentIndex = 1
        global.saveTools.saveData(HERO_INDEX_SAVE_KEY,1)
    end
    self.mView['btn_return']:setTouchEnabled(true)
    self.mView['btn_lock']:setTouchEnabled(true)
    self.mView['btn_return']:addTouchEventListener(handler(self,self.onReturnClick))
    self.mView['btn_lock']:addTouchEventListener(handler(self,self.onLockClick))
    self:initList()
    local money = global.saveTools.getData(MONEY_SAVE_KEY)
    if money then
        self.mView['icon_text']:setString(money)
    else
        global.saveTools.saveData(MONEY_SAVE_KEY,0)
        self.mView['icon_text']:setString(0)
    end

    if global.isGrabScreenMode == 1 then
        self.mView['icon_text']:setString(math.random(300,1000))
    end
end

function GameShop:onReturnClick()
    local MainScene = require("logic/game/jump/MainScene")
    MainScene.new():showWithScene()
end

function GameShop:onLockClick()
    if currentIndex == 1 then
        return
    end 
    local money = tonumber(global.saveTools.getData(MONEY_SAVE_KEY))
    local str = "role_bg_"..currentIndex
    local gold_text = self.mView[str]:getChildByName("gold_text")
    local mask = self.mView[str]:getChildByName("mask")
    local num = tonumber(gold_text:getString())
    print(num)
    local temp = money-num
    if currentIndex == 2 then
        local isLock = global.saveTools.getData(HERO_TWO_INDEX_SAVE_KEY)
        if not isLock and num <= money then
            global.saveTools.saveData(HERO_TWO_INDEX_SAVE_KEY,true)
            global.saveTools.saveData(MONEY_SAVE_KEY,temp)
            global.saveTools.saveData(HERO_INDEX_SAVE_KEY,2)
            self.mView['icon_text']:setString(temp)
            mask:setVisible(false)
        end
    elseif currentIndex == 3 then
        local isLock = global.saveTools.getData(HERO_THREE_INDEX_SAVE_KEY)
        if not isLock and num <= money then
            global.saveTools.saveData(HERO_THREE_INDEX_SAVE_KEY,true)
            global.saveTools.saveData(MONEY_SAVE_KEY, temp)
            global.saveTools.saveData(HERO_INDEX_SAVE_KEY,3)
            self.mView['icon_text']:setString(temp)
            mask:setVisible(false)
        end
    elseif currentIndex == 4 then
        local isLock = global.saveTools.getData(HERO_FOUR_INDEX_SAVE_KEY)
        if not isLock and num <= money then
            global.saveTools.saveData(HERO_FOUR_INDEX_SAVE_KEY,true)
            global.saveTools.saveData(MONEY_SAVE_KEY, temp)
            global.saveTools.saveData(HERO_INDEX_SAVE_KEY,4)
            self.mView['icon_text']:setString(temp)
            mask:setVisible(false)
        end
    end
end

function GameShop:initList()
    for i = 1, 4 do
        local str = "role_bg_"..i
        local selectbg = self.mView[str]:getChildByName("selectbg")
        local mask = self.mView[str]:getChildByName("mask")
        selectbg:setVisible(false)
        if i == currentIndex then
            mask:setVisible(false)
            selectbg:setVisible(true)
        end

        if i == 1 then
            mask:setVisible(false)
        end
        self.mView[str]:setTouchEnabled(true)
        self.mView[str]:setTag(i)
        self.mView[str]:addTouchEventListener(handler(self,self.onSelectClick))
        self:isLock(i)
    end
end

function GameShop:isLock(tag)
    local str = "role_bg_"..tag
    local mask = self.mView[str]:getChildByName("mask")
    if tag == 2 then
        local isLock = global.saveTools.getData(HERO_TWO_INDEX_SAVE_KEY)
        if isLock then
            mask:setVisible(false)
        else
            mask:setVisible(true)
        end
    elseif tag == 3 then
        local isLock = global.saveTools.getData(HERO_THREE_INDEX_SAVE_KEY)
        if isLock then
            mask:setVisible(false)
        else
            mask:setVisible(true)
        end
    elseif tag == 4 then
        local isLock = global.saveTools.getData(HERO_FOUR_INDEX_SAVE_KEY)
        if isLock then
            mask:setVisible(false)
        else
            mask:setVisible(true)
        end
    end
  
end

function GameShop:onSelectClick(sender)
    local tag = sender:getTag();
    currentIndex = tag
    self:initMaskVisible(tag)
    if tag == 1 then
       global.saveTools.saveData(HERO_INDEX_SAVE_KEY,1)
    elseif tag == 2 then
        local isLock = global.saveTools.getData(HERO_TWO_INDEX_SAVE_KEY)
        if isLock then
            global.saveTools.saveData(HERO_INDEX_SAVE_KEY,2)
        end
    elseif tag == 3 then
        local isLock = global.saveTools.getData(HERO_THREE_INDEX_SAVE_KEY)
        if isLock then
            global.saveTools.saveData(HERO_INDEX_SAVE_KEY,3)
        end
    elseif tag == 4 then
        local isLock = global.saveTools.getData(HERO_FOUR_INDEX_SAVE_KEY)
        if isLock then
            global.saveTools.saveData(HERO_INDEX_SAVE_KEY,4)
        end
    end
end

function GameShop:initMaskVisible(tag)
    for i = 1, 4 do
        local str = "role_bg_"..i
        local selectbg = self.mView[str]:getChildByName("selectbg")
        if tag == i then
            selectbg:setVisible(true)
        else
            selectbg:setVisible(false)
        end
     end
end


return GameShop