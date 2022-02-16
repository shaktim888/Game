local Monster = class('Monster')
local cfg = require("logic.game.GuardCastle.cfg.cfg")
function Monster:ctor(info,oSprite,iID,oParentContainer)
    self._aInfo = nil
    self._iHP = info.HP
    self._oMonster = nil
    self._oParentContainer = oParentContainer
    self._oTween = nil
    self._iType = nil
    self._iID = nil
    self._bStopAnim = false
    self._bCached = true
    self._bTouchCrabs = false
    self._bStartArchery = false
    self:_init(info,oSprite,iID);
end

function Monster:_init(info,oSprite,iID) 
    self._aInfo = info
    self._oMonster = oSprite
    self._oMonster:setVisible(false)

    local objSize = self._oMonster:getBoundingBox()
    local startX = {
        [1] = cfg.CANVAS_WIDTH + objSize.width,
        [2] = 0 - objSize.width
    }
    local startY = self._aInfo.posY
    if self._aInfo.id ~= 1 then
        startY = self._aInfo.posY + objSize.height/2
    end
    local objPos = {x = startX[math.random(1,2)] ,y = startY }

    global.async.runInNextFrame(function()
        if (cfg.TEST) then
            local oText = ccui.Text:create()
            oText:setPosition(100,100)
            oText:setString("TEST"..iID)
            oText:setColor(cc.c3b(255, 0, 0))
            self._oMonster:addChild(oText);
        end
        self._oMonster:setAnchorPoint(self._aInfo.anchorPoint)
        self._oMonster:setPosition(objPos)
        self._oMonster:setVisible(true)
        self:move()
    end)
    self._iID = iID;
    self._oParentContainer:addChild(self._oMonster)
end

function Monster:move()
    local X,Y = self._oMonster:getPosition()
    -- self._oMonster:setPositionX(X-10)
    local targetPosX 
    if X < cfg.CANVAS_WIDTH/2 then
        targetPosX = math.random(self._aInfo.LeftX[1],self._aInfo.LeftX[2])
    else
        targetPosX = math.random(self._aInfo.RightX[1],self._aInfo.RightX[2])
        self._oMonster:setFlippedX(true)
    end

    local jump = cc.JumpTo:create(1.5, cc.p(targetPosX,Y), 10, 15)
    

    local callfunc = cc.CallFunc:create(function()
        if  self._aInfo.id == 1 then
            local attack1 = cc.RotateBy:create(0.5, 10)
            local attack2 = cc.RotateBy:create(0.5, -10)
            local seqAttack = cc.Sequence:create(attack1,attack2)
            local forever = cc.RepeatForever:create(seqAttack)
            self._oMonster:runAction(forever)
        else
            self._bStartArchery = true
        end
    end)
    local seq = cc.Sequence:create(jump,callfunc)
    self._oMonster:runAction(seq)
end

function Monster:arrowAttack(MonsterID)
    local x,y = self._oMonster:getPosition()
    local info = cfg.Arrow[2]
    info.monsterId = MonsterID
    self._oParentContainer:spawnArrow(info,{x = x, y =y});
end

function Monster:getPosition()
    return self._oMonster:getPosition()
end

function Monster:getPositionX()
    return self._oMonster:getPositionX()
end

function Monster:unload() 
    self._oParentContainer.removeChild(self._oMonster);
end








return Monster
