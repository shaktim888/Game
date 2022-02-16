local GameDailyLayer = class("GameDailyLayer", cc.load("mvc").ModuleBase)
GameDailyLayer.RESOURCE_FILENAME = "daily/Daily_Layer.lua"

local signGold ={
    [1] = 10;
    [2] = 20;
    [3] = 40;
    [4] = 60;
    [5] = 80;
    [6] = 100;
    [7] = 120;
}

local signFlag= {}
local imgMask = {}

function GameDailyLayer:onCreate(_data)
    self.gold_node = _data.node
    self.mView["panel"]:setTouchEnabled(false)
    self:addNodeClick(self.mView["panel"],{endCallBack = function () self:close()end,scaleAction = false,swallowTouche = false})
    
    self.mView["bg"]:setTouchEnabled(true)
    self.mView["btn_sign"]:setTouchEnabled(true)
    self.mView["btn_sign"]:addTouchEventListener(handler(self,self.processSign))
    self.mView["text_sign"]:setString("签 到")
   
    for i = 1,7 do
        local str = "img_"..i
        local img_mask = self.mView[str]:getChildByName("img_mask")
        local txt_number = self.mView[str]:getChildByName("txt_number")
        local img_check = self.mView[str]:getChildByName("img_check")
        txt_number:setString(signGold[i])
        img_check:setVisible(false)
        img_mask:setVisible(false)
        signFlag[i] = img_check
        imgMask[i] = img_mask
    end

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
            imgMask[i]:setVisible(true);
         end
     end
     local strKey = ""..year..month..day
     if cc.UserDefault:getInstance():getBoolForKey(strKey) then
        self.mView["btn_sign"]:setVisible(false)
        signFlag[todayIndex]:setVisible(true)
        imgMask[todayIndex]:setVisible(true);
     else
        self.mView["btn_sign"]:setVisible(true);
        signFlag[todayIndex]:setVisible(false)
        imgMask[todayIndex]:setVisible(false);
     end
end

--将wday转换成index
function GameDailyLayer:wdayToIndex(wday)
    if wday > 1 then
        return wday -1 ;
    elseif wday == 1 then
        return 7;
    end
    return nil;
end

--获得星期几(number)这天的key
function GameDailyLayer:getKeyByIndex(todayIndex,number)
    local deltaTime = 3600*24*(todayIndex - number);
    local date = os.date("*t", os.time() - deltaTime);
    local year = date.year;
    local month = date.month;
    local day = date.day;
    return ""..year..month..day;
end

--签到按钮
function GameDailyLayer:processSign()
    print("签到")
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
        imgMask[todayIndex]:setVisible(true);
        self.mView["btn_sign"]:setVisible(false)
    end
end

function GameDailyLayer:close()
    global.viewController.closeAction(self)
end


return GameDailyLayer