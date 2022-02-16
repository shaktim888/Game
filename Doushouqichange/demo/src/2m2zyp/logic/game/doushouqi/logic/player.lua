local player = class("player", cc.load("mvc").BehaviorBase)
local enable = true

local function selectItem(item)
    item:getChildByName("selected"):setVisible(true)
end

local function unSelectItem(item)
    item:getChildByName("selected"):setVisible(false)
end

function player:onClickItem(i, j)
    if not enable then return end
    if (self.map[i][j]) then
        if not self.map[i][j].isOpen then
            if self.preSelect then
                unSelectItem(self.preSelect)
                self.preSelect = nil
            end
            self:openCard(self.map[i][j])
            self:switch()
            return
        end
        if self.preSelect then
            local item = self.map[i][j]
            if self.preSelect == item then
                return
            else
                if item.cardInfo[1] == self:getPlayerHandType() then
                    unSelectItem(self.preSelect)
                    selectItem(item)
                    self.preSelect = item
                else
                    if math.abs( i - self.preSelect.i ) + math.abs( j - self.preSelect.j ) == 1 then
                        unSelectItem(self.preSelect)
                        self:moveCard(self.preSelect, i, j)
                        self.preSelect = nil
                        self:switch()
                    end
                end
            end
        else
            if self.map[i][j].cardInfo[1] == self:getPlayerHandType() then
                selectItem(self.map[i][j])
                self.preSelect = self.map[i][j]
            end
        end
    else
        if self.preSelect then
            if math.abs( i - self.preSelect.i ) + math.abs( j - self.preSelect.j ) == 1 then
                unSelectItem(self.preSelect)
                self:moveCard(self.preSelect, i, j)
                self.preSelect = nil
                self:switch()
            end
        end
    end
    
end

function player:whiteRound()
    enable = true
end

function player:blackRound()
    enable = false
end

return player
