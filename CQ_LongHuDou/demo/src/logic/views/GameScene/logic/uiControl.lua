local uiControl = class("uiControl", cc.load("mvc").BehaviorBase)

local cfg = require("logic.views.GameScene.cfg.cfg")

local ImagePath = "game/LongHuDou/images/game/"
local _aRoleData = {
    [1] = {
        id = 1,
        name = "long",
        bgImg =  "VSDragon_long.png",
        weaponImg = "weaponLong.png",
        shieldImg = "shieldLong.png",
        pos = {x =105.49 ,y =170},
        mp3 = cfg.Sound.long
        
    },
    [2] = {
        id = 2,
        name = "hu",
        bgImg = "VSDragon_lh.png",
        weaponImg = "weaponHu.png",
        shieldImg = "shieldHu.png",
        pos = {x =900.00 ,y =170},
        mp3 = cfg.Sound.hu
    }
}

local function initRoleItem(self,item,data)
    item.RoleData = data
    local weapon = item:getChildByName('weapon')
    local btnAttack = item:getChildByName("btnAttack")
    local btnDefense = item:getChildByName("btnDefense")
    local shield = item:getChildByName("shield")

    if self.iAIIDx == data.id then
       
        item:getChildByName("bg"):loadTexture(ImagePath..data.bgImg, 0)

        btnAttack:setVisible(false)
        btnDefense:setVisible(false)
        item.HP = self.s_aLevelsDiagram[self._iLevel].AI_hp
        item.initHP = self.s_aLevelsDiagram[self._iLevel].AI_hp
        item.attackSpeed = self.s_aLevelsDiagram[self._iLevel].Attack_speed
        -- item.time = self.s_aLevelsDiagram[self._iLevel].time
    end

    if(data.name == "hu") then
        weapon:setPosition(-49.01, 95.02)
        weapon:setAnchorPoint(0,0.5)
        shield:setPosition(-49.01, 95.02)
    end

    if self.iPlayerIDx == data.id then
        local  btnTbl = global.saveTools.getData(global.viewData.PLAYER_INFO_SAVE_TO_LOCAL) or {}
        item:getChildByName("bg"):loadTexture( "select/job/huoban_"..btnTbl.job.."_"..btnTbl.sex..".png", 0)
        item:getChildByName("bg"):ignoreContentAdaptWithSize(true)
        item:getChildByName("bg"):setScale(0.8, 0.8)
        item.HP = self.s_aLevelsDiagram[self._iLevel].player_hp
        item.initHP = self.s_aLevelsDiagram[self._iLevel].player_hp
        weapon:setVisible(false)
        btnDefense:addTouchEventListener(function(sender,eventType)
            if 0 == eventType then
                self:onClickBtnDefense()
            end
        end)
        local btnAttack= btnAttack
        btnAttack:addTouchEventListener(function(sender,eventType)
            if 0 == eventType then
                self:onClickBtnAttack()
            end
        end)
    end

   
    
    item:getChildByName("round"):setVisible(false)
    weapon:loadTexture(ImagePath..data.weaponImg, 0)
    shield:setVisible(false)
    item:setPosition(data.pos)
end

function uiControl:onCreate()
    local dataInfo = self:readLocalSaveData()
    local level = dataInfo.level or 1
    local select = dataInfo.select or {2,1}
    local level_name = self.s_aLevelsDiagram[level].scene_name
    self.mView['levelText']:setString(level_name)
    
    dump(select)
    self.iPlayerIDx = select[1]
    self.iAIIDx = select[2]
    self.roleMap = {}
    for i = 1,#_aRoleData do
        local roleItem = self.mView["template"]:clone()
        self:addChild(roleItem)
        local roleData = _aRoleData[i]
        initRoleItem(self,roleItem,roleData)
        self.roleMap[i] = roleItem
    end
    self.iStartAIWeaponX = self.roleMap[self.iAIIDx]:getChildByName("weapon"):getPositionX()
    self.iStartPlayerWeaponX = self.roleMap[self.iPlayerIDx]:getChildByName("weapon"):getPositionX()
    self.roleMap[self.iAIIDx]:getChildByName("hp"):setPercent(100)
    self.roleMap[self.iPlayerIDx]:getChildByName("hp"):setPercent(100)
end 

function uiControl:checkGameOver()
    if self.roleMap[self.iPlayerIDx].HP == 0 then
        return cfg.MSG.FAIl
    end
    if self.roleMap[self.iAIIDx].HP == 0 then
        if self._iLevel == #self.s_aLevelsDiagram then
            return cfg.MSG.WIN
        end
        return cfg.MSG.NEXT_LEVEL
    end
    return cfg.SWITCH
end

function uiControl:playerRound()

    AudioEngine.playEffect(self.roleMap[self.iPlayerIDx].RoleData.mp3, false)
    self.round = "player"
    self.roleMap[self.iPlayerIDx]:getChildByName("weapon"):setVisible(true)
    self.roleMap[self.iPlayerIDx]:getChildByName("round"):setVisible(true)
    self.roleMap[self.iAIIDx]:getChildByName("round"):setVisible(false)
    self.roleMap[self.iAIIDx]:getChildByName("weapon"):setVisible(false)
    self.roleMap[self.iAIIDx]:getChildByName("weapon"):setPositionX(self.iStartAIWeaponX)
    self.roleMap[self.iPlayerIDx]:getChildByName("shield"):setVisible(false)
end

function uiControl:AIRound()
    AudioEngine.playEffect(self.roleMap[self.iAIIDx].RoleData.mp3, false)


    self.round = "AI"
    self.roleMap[self.iAIIDx]:getChildByName("round"):setVisible(true)
    self.roleMap[self.iPlayerIDx]:getChildByName("round"):setVisible(false)
    self.roleMap[self.iAIIDx]:getChildByName("weapon"):setVisible(true)
    self.roleMap[self.iPlayerIDx]:getChildByName("weapon"):setVisible(false)
    self.roleMap[self.iPlayerIDx]:getChildByName("weapon"):setPositionX(self.iStartPlayerWeaponX)
    self.roleMap[self.iAIIDx]:getChildByName("shield"):setVisible(false)
end





return uiControl