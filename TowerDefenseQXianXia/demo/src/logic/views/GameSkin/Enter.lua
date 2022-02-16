local GameSkinSetLayer = class("GameSkinSetLayer", cc.load("mvc").ModuleBase)
GameSkinSetLayer.RESOURCE_FILENAME = "skin/Skin_Layer.lua"

--升等级所需的金币(购买基地皮肤)
local levelNeedGold ={
    [1] = 0;
    [2] = 100;
    [3] = 200;
    [4] = 400;
    [5] = 800;
    [6] = 1600;
    
};

local tower_config = {
    [1]     = {life = 150,speed = 0.10},
    [2]     = {life = 180,speed = 0.15},
    [3]     = {life = 200,speed = 0.20},
    [4]     = {life = 240,speed = 0.25},
    [5]     = {life = 250,speed = 0.30},
    [6]     = {life = 280,speed = 0.35},
};

function GameSkinSetLayer:onCreate(_data)
    self.gold_node = _data.node
    self.mView["panel"]:setTouchEnabled(false)
    self.mView["bg"]:setTouchEnabled(true)
    self:addNodeClick(self.mView["panel"],{endCallBack = function () self:close()end,scaleAction = false})
    self.mView["layout_skin"]:setVisible(true)
    self.current_index = nil
    self.mView["layout_tip"]:setVisible(false)
    local index = tonumber(global.viewData.getTowerIndex())
    for i = 1,6 do
        local str = "img_"..i
        local txt_static = self.mView[str]:getChildByName("txt_static")
        local img_mask = self.mView[str]:getChildByName("img_mask")
        local img_select = self.mView[str]:getChildByName("img_select")
        local img_base = self.mView[str]:getChildByName("img_base")
        local img_selectbg = self.mView[str]:getChildByName("img_selectbg")
        txt_static:setString(levelNeedGold[i])
        if i == index then
            self.current_index = i
            img_selectbg:setVisible(true)
        else
            img_selectbg:setVisible(false)
        end
        if self:isUnlockSkinIndex(i) then
            img_mask:setVisible(false)
            img_select:setVisible(true)
        else
            img_mask:setVisible(true)
            img_select:setVisible(false)
        end
        self.mView[str]:setTouchEnabled(true)
        self.mView[str]:addTouchEventListener(handler(self,function (self,sender,type)
            if type == 2 then
                print(i)
                self.current_index = i
                self:initSkinSelect(i)
                if self:isUnlockSkinIndex(i) then
                    global.viewData.setTowerIndex(i)
                end
            end   
        end))
        self.mView["btm_unlock"]:setTouchEnabled(true)
        self.mView["btm_unlock"]:addTouchEventListener(handler(self,self.unlockSkin))

        local text_maxHealth = self.mView[str]:getChildByName("text_maxHealth")
        text_maxHealth:setString("生命上限"..tower_config[i].life)
        local text_speed = self.mView[str]:getChildByName("text_speed")
        text_speed:setString("成长速度"..tower_config[i].speed)
    end
end

function GameSkinSetLayer:unlockSkin(sender,type)
    if type == 2 then
        if self:isUnlockSkinIndex(self.current_index) then
            print("This skin is unlocked!");
            return;
        end
        local tgold = tonumber(global.viewData.getCoin())
        if tgold < levelNeedGold[self.current_index] then
            print("Not enough gold coins!");
            return;
        end
        global.viewData.setTowerIndex(self.current_index)
        self:unlockSkinIndex(self.current_index);
        self:initSkinMask(self.current_index)
        tgold = tgold - levelNeedGold[self.current_index];
        global.viewData.setCoin(tgold)
        self.gold_node:setString(tgold)
    end
end

function GameSkinSetLayer:initSkinMask(index)
    for i = 1,6 do
        if index == i then
            local str = "img_"..i
            local img_mask = self.mView[str]:getChildByName("img_mask")
            local img_select = self.mView[str]:getChildByName("img_select")
            img_mask:setVisible(false)
            img_select:setVisible(true)
        end
    end
end

function GameSkinSetLayer:initSkinSelect(index)
    for i = 1,6 do
        local str = "img_"..i
        local img_selectbg = self.mView[str]:getChildByName("img_selectbg")
        img_selectbg:setVisible(index == i)
    end
end

function GameSkinSetLayer:close()
    global.viewController.closeAction(self)
end

--给自己指定的总部皮肤解锁
function GameSkinSetLayer:unlockSkinIndex(index)
    cc.UserDefault:getInstance():setBoolForKey("skinIndex_"..index,true);
end


--获得指定的总部皮肤是否解锁
function GameSkinSetLayer:isUnlockSkinIndex(index)
    if index == 1 then
        return true
    end
    return cc.UserDefault:getInstance():getBoolForKey("skinIndex_"..index,false);
end

return GameSkinSetLayer
