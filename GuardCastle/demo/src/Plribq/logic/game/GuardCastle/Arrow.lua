local Arrow = class('Arrow')
local cfg = require("logic.game.GuardCastle.cfg.cfg")
function Arrow:ctor(info,oSprite,iID,targetPoint,oParentContainer)
    self._aInfo = info
    self._oArrow = nil
    self._oContainer = nil
    self._oParentContainer = oParentContainer
    self._aTargetPoint = targetPoint
    self._iID = nil
    self._bStartMove = false
    self._bInvalid = false    --箭是否失效
    self:_init(oSprite,iID);
end

function Arrow:_init(oSprite,iID) 
    self._oContainer = cc.Node:create()
    self._oArrow = oSprite
    self._oContainer:setVisible(false)
    global.async.runInNextFrame(function()
        self._oArrow:setAnchorPoint(cc.p(1,0.5))
        self._oContainer:setPosition(self:getArrowStartPosition())
        self._oContainer:setVisible(true)
        self:setArrowTargetPoint()
    end)
    self._iID = iID;
    self._oContainer:addChild(self._oArrow)
    self._oParentContainer:addChild(self._oContainer)
    if (cfg.TEST) then
        local oText = ccui.Text:create()
        oText:setPosition(0,0)
        oText:setString("TEST"..iID)
        oText:setColor(cc.c3b(255, 0, 0))
        self._oContainer:addChild(oText);
    end
end

function Arrow:getArrowStartPosition()
    if self._aInfo.id == 1 then
        return cfg.CastleAttackPoint[5]
    elseif self._aInfo.id == 2 then
        return self._aTargetPoint -- 怪物的箭传入的是目标点是初始点
    elseif self._aInfo.id == 3 then
        -- 炮台 有四处射箭 (有怪，那就射箭，否则就支援其他处) --后续优化
        if self._aTargetPoint.y > 200 then 
            if self._aTargetPoint.x < cfg.CANVAS_WIDTH/2 then
                return cfg.CastleAttackPoint[1]
            else 
                return cfg.CastleAttackPoint[2]
            end
        else  
            if self._aTargetPoint.x < cfg.CANVAS_WIDTH/2 then
                return cfg.CastleAttackPoint[3]
            else  
                return cfg.CastleAttackPoint[4]
            end
        end
    elseif self._aInfo.id == 4 then
        return self._aTargetPoint
    end
end

function Arrow:setArrowTargetPoint()
    local targetPoint = {}
    if self._aInfo.id  == 2 then
        -- if self._aTargetPoint.y > 200 then 
        --     targetPoint = cfg.MonsterAttackPoint[3]
        -- else  
            if self._aTargetPoint.x < cfg.CANVAS_WIDTH/2 then
                targetPoint = {x = math.random(cfg.MonsterAttackPoint[1].x[1],cfg.MonsterAttackPoint[1].x[2]),y = math.random(cfg.MonsterAttackPoint[1].y[1],cfg.MonsterAttackPoint[1].y[2])}
            else  
                targetPoint = {x = math.random(cfg.MonsterAttackPoint[2].x[1],cfg.MonsterAttackPoint[2].x[2]),y = math.random(cfg.MonsterAttackPoint[2].y[1],cfg.MonsterAttackPoint[2].y[2])}
            end
        -- end
    elseif self._aInfo.id == 4 then
        targetPoint = {x = self._aTargetPoint.x ,y = 0}
    else
        targetPoint = self._aTargetPoint 
    end
    self:moveTargetPoint(targetPoint)
end

function Arrow:moveTargetPoint(targetPoint)
    self._bStartMove = true
    if (cfg.TEST) then
        local oText = ccui.Text:create()
        oText:setPosition(cfg.CastleAttackPoint[5])
        oText:setString("TEST")
        oText:setColor(cc.c3b(255, 0, 0))
        self._oParentContainer:addChild(oText);
    end
    local degree = math.atan2((targetPoint.y-self:getY()),(targetPoint.x-self:getX()))/(math.pi/180) 
    local distance = cc.pGetDistance(self:getPosition(),targetPoint)
    self._oContainer:setRotation(-degree)
    -- local move = cc.MoveTo:create(distance/734, targetPoint)
    local move = cc.MoveTo:create(0.2, targetPoint)
    AudioEngine.playEffect(cfg.Sound.arrow,false)
    local unload = cc.CallFunc:create(handler(self,self.unload))
    local seq = cc.Sequence:create(move,unload)
    seq:setTag(cfg.ArrowMoveTag)
    self._oContainer:runAction(seq)
end

function Arrow:stopMoveAction()
    self._bInvalid = true
    -- if self._aInfo.monsterId == 3 then
    --     self._oContainer:stopActionByTag(cfg.ArrowMoveTag)
    -- end
end

function Arrow:getX()
    return self._oContainer:getPositionX()
end

function Arrow:getY()
    return self._oContainer:getPositionY()
end

function Arrow:unload() 
    --怪物射出的箭
        global.async.delay(self._aInfo.clearTime):Then(function()
            if (self._oContainer) then
                self._oParentContainer:removeArrowID(self._iID)
                self._oParentContainer:removeChild(self._oContainer);
            end
        end)
       
end

function Arrow:getPosition()
    local x,y = self._oContainer:getPosition()

    return {x = x,y =y}
end

function Arrow:getID()
    return self._iID;
end

return Arrow
