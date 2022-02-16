local Game = class("Game", cc.load("mvc").ModuleBase)
Game.RESOURCE_FILENAME = "game/LongHuDou/Game.lua"
require("json")
Game.behavior ={
    "logic.views.GameScene.logic.uiControl",
    "logic.views.GameScene.logic.stateControl",
    "logic.views.GameScene.logic.player",
    "logic.views.GameScene.logic.AI"
}

local cfg = require("logic.views.GameScene.cfg.cfg")
-- local WinMsg = require("logic.game.LongHuDou.WinMsg")
local MusicBtnImagePath = "game/LongHuDou/images/hall/"



function Game:onCreate()
    local dataInfo = self:readLocalSaveData()
    self._iLevel = dataInfo.level or 1
    local select = dataInfo.select or {1,2}
    local localSave = self:readLocalSaveData()
    self._iScore = localSave.score
    self.mView['scoreText']:setString(cfg.TEXT_SCORE..self._iScore)
   
    self:onUpdate(handler(self, self.update)) 
    self.s_aLevelsDiagram = require("logic.views.GameScene.cfg.levelCfg")
    self:initSound(localSave.isOpenMusic)
    local addComponentConfig = {
        self,
        self.mView["headPanel"],
        self.mView["scoreText"]
    }
    local panel_top_btn = require("logic/viewController/componentController").new(addComponentConfig)
end 


function Game:readLocalSaveData()
   local tmpData
   local localSave =  global.saveTools.getData(cfg.LocalSave) or {}
    if localSave.curlevel then
        tmpData = localSave
    else
       tmpData = {curlevel = 1, score = 0,select = {1,2}}
       global.saveTools.saveData(cfg.LocalSave, tmpData)
    end
   
    return tmpData
end

function Game:update(dt)
    if  not self.bStartGame  then return end
    if self.round == "AI" then
        self:aIRoundUpdate(dt)
    end 
    if self.round == "player" then
        self:playerRoundUpdate(dt)
    end
end


function Game:playerRoundUpdate(dt)
    if self.bStopPlayerMove  or not self.bPlayerAttack then return end
    if self.bPlayerAttack and not self.bStopPlayerWeaPonMove then
        local x =  self.roleMap[self.iPlayerIDx]:getChildByName("weapon"):getPositionX()
        if(self.roleMap[self.iPlayerIDx]:getPositionX()<cfg.CANVAS_WIDTH/2)then
            x = x+500*dt
        else
            x = x-500*dt
        end
        self.roleMap[self.iPlayerIDx]:getChildByName("weapon"):setPositionX(x)
        self.randAIDefenseTime = self.randAIDefenseTime + 1
        if self.randAIDefenseTime == 5 then
            if not self.isDefenseSuccess then
                self.roleMap[self.iAIIDx]:getChildByName("shield"):setVisible(true)
                self.bStopPlayerWeaPonMove = false
                global.async.delay(0.5):Then(function()
                    self:switch()    
            end)
            end  
        end
    end

    local PlayerWeapon = self.roleMap[self.iPlayerIDx]:getChildByName("weapon")
    local PlayerWeaponWorldPoint = self.roleMap[self.iPlayerIDx]:convertToWorldSpaceAR(cc.p(PlayerWeapon:getPosition()))
    local AIRect = self.roleMap[self.iAIIDx]:getBoundingBox()
    -- print("AI isKill",cc.rectContainsPoint(AIRect,PlayerWeaponWorldPoint))
    if cc.rectContainsPoint(AIRect,PlayerWeaponWorldPoint)  then
        print("怪物扣血")
        self.bStopPlayerMove = true
        self:addHP(self.iAIIDx)
        self:addScore()
        self:switch()    
    end

end

local _iTime = 2
function Game:aIRoundUpdate(dt)
    
    if self.isKill or self.isDefenseSuccess  then
        return
    end
    local AIWeapon = self.roleMap[self.iAIIDx]:getChildByName("weapon")
    local AIWeaponWorldPoint = self.roleMap[self.iAIIDx]:convertToWorldSpaceAR(cc.p(AIWeapon:getPosition()))
    local PlayerRect = self.roleMap[self.iPlayerIDx]:getBoundingBox()
    local posX,posY = self.roleMap[self.iAIIDx]:getChildByName("weapon"):getPosition()
    local relatePos = self.roleMap[self.iAIIDx]:convertToWorldSpace(cc.p(posX,posY))
    local playerX =  self.roleMap[self.iPlayerIDx]:getPositionX()
    if  cc.rectContainsPoint(PlayerRect,AIWeaponWorldPoint) then
        print("玩家扣血")
        self.isKill = true
        self:addHP(self.iPlayerIDx)
        AudioEngine.playEffect(cfg.Sound.defense, false)
        self.roleMap[self.iAIIDx]:getChildByName("weapon"):setPositionX(self.iStartAIWeaponX)
        global.async.delay(1):Then(function()
        self.roleMap[self.iPlayerIDx]:getChildByName("btnDefense"):setEnabled(true)

            self._bAIAattck= true 
            AudioEngine.playEffect(cfg.Sound.attack, false)
            self.isKill = false
        end)
    end




    local AIWeaponToNodePoint = self.roleMap[self.iPlayerIDx]:convertToNodeSpaceAR(AIWeaponWorldPoint)
    local PlayerShieldRect = self.roleMap[self.iPlayerIDx]:getChildByName("shield"):getBoundingBox()
    if self.isDefense and cc.rectContainsPoint(PlayerShieldRect,AIWeaponToNodePoint) then
        print("Defense Success")
        AudioEngine.playEffect(cfg.Sound.defense, false)
        self.isDefenseSuccess = true
        self.roleMap[self.iAIIDx]:getChildByName("bg"):setColor(cc.c3b(0, 0, 0))
        self.roleMap[self.iAIIDx]:getChildByName("yun"):setVisible(true)
        global.async.delay(0.5):Then(function()
            self:switch()    
        end)
    end


    if self._bAIAattck then
        local x =  self.roleMap[self.iAIIDx]:getChildByName("weapon"):getPositionX()
        local speed = math.random(300,self.roleMap[self.iAIIDx].attackSpeed)
        local scaleArr = {0.1,0.2,0.3,0.35,0.4}
        local scale = scaleArr[math.random(1,5)]
        -- self.roleMap[self.iAIIDx]:getChildByName("weapon"):setScale(scale, scale)
      
        if(self.roleMap[self.iAIIDx]:getPositionX()<cfg.CANVAS_WIDTH/2)then
            x = x + speed*dt
        else
            x = x - speed*dt
        end
        self.roleMap[self.iAIIDx]:getChildByName("weapon"):setPositionX(x)
    end
end

function Game:addHP(idx)
    local obj = self.roleMap[idx]
    obj.HP = obj.HP - 1
    if(obj.HP<=0) then
        self:switch()
    end
    local percent = string.format("%.2f",obj.HP/obj.initHP*100)
    obj:getChildByName("hp"):setPercent(percent)
    obj:getChildByName("percent"):setString(percent.."%")
    AudioEngine.playEffect(cfg.Sound.blood, false)
    local bloodEffect = obj:getChildByName("killHp")
    bloodEffect:setVisible(true)
    bloodEffect:runAction(cc.FadeIn:create(0.1))
    performWithDelay(bloodEffect, function()
        bloodEffect:runAction(cc.FadeOut:create(0.8))
    end, 0.2)
    

end

function Game:addScore()
    self._iScore = self._iScore + 5
    local localSave = global.saveTools.getData(cfg.LocalSave)
    localSave.score = self._iScore
    global.saveTools.saveData(cfg.LocalSave, localSave)
    self.mView['scoreText']:setString(cfg.TEXT_SCORE..self._iScore)
end

-- function Game:dizzyAct(pos)
--      local animate = require("res.game.LongHuDou.act.lua").create()
--     animate.root:runAction(animate.animation)
--     animate.root:setPosition(pos)
--     self:addChild(animate.root)
--     local function playDealSound()
--         AudioEngine.playEffect("game/Fqzs/sound/start.mp3",false)
--     end
--     local actionSound = cc.CallFunc:create(playDealSound);  --发牌声音
--     local delaytime = 0.5
--     animate.root:runAction(cc.Sequence:create(cc.D
-- end

function Game:showMsg(msg)
    self.mView["MSG"]:setString(msg)
    self.mView["MSG"]:setVisible(true)
    local fadeOut = cc.FadeOut:create(0.5)
    local fadeIn = cc.FadeIn:create(0.5)
    local seq = cc.Sequence:create(fadeIn,fadeOut)
    self.mView["MSG"]:runAction(seq)
end

function Game:onLoadedJSON()
    local str = cc.FileUtils:getInstance():getStringFromFile("logic/game/LongHuDou/cfg/levelCfg.json")
    local ok,datatable = pcall(function()
        return json.decode(str)
    end)
    if ok == true and type(datatable) == "table" then
        dump(datatable)
    end
    return datatable
end

-- function Game:onbtn_pauseClick()
--     AudioEngine.playEffect(cfg.Sound.click,false)

--     -- _bStartGame = false
--     -- _iGameState = cfg.STATE.STATE_PAUSE
--     local text = cfg.TEXT_PAUSE
--     local view = WinMsg.new(nil,nil,text,cfg.MSG.PAUSE)
--     global.viewMgr.showView(view, true)
-- end

function Game:onbtn_exitClick()
    -- _bStartGame = false
    -- _iGameState = cfg.STATE.STATE_PAUSE
    AudioEngine.playEffect(cfg.Sound.click,false)

    -- local text = cfg.TEXT_ARE_SURE
    -- local view = WinMsg.new(nil,nil,text,cfg.MSG.EXIT)
    -- global.viewMgr.showView(view, true)
end


function Game:onbtn_musicClick()
    local info = global.saveTools.getData(cfg.LocalSave)
    local isOpen = info.isOpenMusic
    if  isOpen then
        isOpen = false
        self.mView["btn_music"]:loadTextureNormal(MusicBtnImagePath.."but_off.png",0)
        global.utils.sound.isStopSound = true
        audio.stopMusic()
    else
        isOpen = true
        self.mView["btn_music"]:loadTextureNormal(MusicBtnImagePath.."but_on.png",0)
        global.utils.sound.isStopSound = false
        audio.playMusic(cfg.Sound.bgm,true)
    end
    info.isOpenMusic = isOpen
    global.saveTools.saveData(cfg.LocalSave, info)

end

function Game:initSound(isOpen) 
    -- if not isOpen then
    --     self.mView["btn_music"]:loadTextureNormal(MusicBtnImagePath.."but_off.png",0)
    --     global.utils.sound.isStopSound = true
    --     audio.stopMusic()
    -- else
    --     self.mView["btn_music"]:loadTextureNormal(MusicBtnImagePath.."but_on.png",0)
    --     AudioEngine.setMusicVolume(1)
    --     global.utils.sound.isStopSound = false
    --     audio.playMusic(cfg.Sound.bgm,true)
    -- end

end



return Game
