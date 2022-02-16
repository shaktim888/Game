local enemyPlayer = class("enemyPlayer", cc.load("mvc").ModuleBase)
enemyPlayer.RESOURCE_FILENAME = "game/ligatureFootball/EnemyPlayerLayer.lua"

local resPath = "game/ligatureFootball/obstacle/"
local mapPath = "game/ligatureFootball/map/"
local math = require('math')



function enemyPlayer:onCreate(parent,level)
    self.down_Arr ={} 
    self.enemyArr ={} 
    self.wallArr ={} 
    self.darkArr ={} 
    self.landArr ={}
    self.bg = parent
    self.currentlevel = level
    -- self.size = cc.Director:getInstance():getWinSize()
    self.size = cc.Director:getInstance():getVisibleSize();
    local mapAllpath = mapPath.."map"..level..".tmx"
    self.mapInfo = cc.TMXMapInfo:create(mapAllpath)
    self.objectGroups = self.mapInfo:getObjectGroups()
    self:wall()
    if level > 20 and level < 36 then 
        self:isDuck()
    elseif level > 44 and level < 49 then
        self:isDuck()
    end
    self:addPlayer()

    -- self:scheduleUpdate();
    if 10 == level or 11 == level or 12 == level or 26 == level or 27 == level or 28 == level or
        33 == level or 34 == level or 32 == level or 37 == level or 38 == level or 40 == level
        or 41 == level or 42 == level or 43 == level or 44 == level or 45 == level or 46 == level 
        or 47 == level or 48 == level then
        for a = 1,#self.data do 
            if 0 == math.fmod(a-1,2) then
                local b = cc.Sprite:create(resPath.."down.png")
                b:setPosition(self.data[a].x, self.data[a].y + 100);
                b:setScale(0.5);
                self.mView["allObject"]:addChild(b)
                table.insert (self.down_Arr,b)
                b:runAction(cc.RepeatForever:create(cc.Sequence:create(cc.FadeOut:create(0.5), cc.FadeIn:create(0.5))))
            end
        end
        self:runAction(cc.Sequence:create(cc.DelayTime:create(3),cc.CallFunc:create(handler(self,function()
                self:six()
        end))))
    end

    self:onUpdate(handler(self,self.update))
end

function enemyPlayer:addPlayer()
    self.data  = self.objectGroups[2]:getObjects();
    local rl = #self.data
    for i= 1,#self.data do
        local enemy = cc.Sprite:create(resPath.."Other.png")
        enemy:setTag(i)
        --self.size.width - 
        enemy:setPosition(self.data[rl - i + 1].y,self.size.height - self.data[rl - i + 1].x)
        self.mView["allObject"]:addChild(enemy)
        table.insert (self.enemyArr,enemy)
    end
end

function enemyPlayer:wall()
    local data  = self.objectGroups[3]:getObjects();
    local rl = #data
    for i= 1,#data do
        local wall = cc.Sprite:create(resPath.."wall.png")
        --self.size.width - 
        wall:setPosition(data[rl - i + 1].y,self.size.height - data[rl - i + 1].x)
        self.mView["allObject"]:addChild(wall)
        table.insert (self.wallArr,wall)
    end
end

function enemyPlayer:isDuck()
    self.data4  = self.objectGroups[4]:getObjects();
    self.data6  = self.objectGroups[6]:getObjects();
    local rl = #self.data4;
    for i= 1, #self.data4 do
        local b = cc.Sprite:create(resPath.."missle1.png")
        b:setPositionX(self.data4[rl - i + 1].y)
        b:setPositionY(self.size.height - self.data4[rl - i + 1].x)
        self.mView["allObject"]:addChild(b,5)
        b:setScale(0.5)
        b:setRotation(90);
        table.insert (self.darkArr,b)
        local c = cc.Animation:create()
        for d =1,2 do
            local e = resPath.."missle"..d..".png";
            c:addSpriteFrameWithFile(e)
        end
        c:setDelayPerUnit(0.1)
        c:setRestoreOriginalFrame(true)
        b:runAction(cc.RepeatForever:create(cc.Animate:create(c)))
    end

    local rl6 = #self.data6;
    for i= 1, #self.data6 do
        local b = cc.Sprite:create(resPath.."missle1.png")
        b:setPosition(self.data6[rl6 - i + 1].x,self.data6[rl6 - i + 1].x)
        self.mView["allObject"]:addChild(b,5)
        b:setScale(0.5)
        b:setRotation(180);
        table.insert (self.landArr,b)
        local c = cc.Animation:create()
        for d =1,2 do
            local e = resPath.."missle"..d..".png";
            c:addSpriteFrameWithFile(e)
        end
        c:setDelayPerUnit(0.1)
        c:setRestoreOriginalFrame(true)
        b:runAction(cc.RepeatForever:create(cc.Animate:create(c)))
    end
    self:darkRun()
end

function enemyPlayer:darkRun()
    if  24 == self.currentlevel or 27 == self.currentlevel or 35 == self.currentlevel or 36 == self.currentlevel or 46 == self.currentlevel then
        local b = math.floor(math.random() * #self.landArr) + 1
        local c = math.random() + 0.7
        self.landArr[b]:runAction(cc.Sequence:create(
            cc.MoveBy:create(c,cc.p(-self.size.width -300,0)),
            cc.CallFunc:create(handler(self,function()
                self.landArr[b]:setPositionX(self.data6[b].y)
                self.darkRun()
            end))
        ))
    end
    if  21 == self.currentlevel or 22 == self.currentlevel or 23 == self.currentlevel or 26 == self.currentlevel
    or 28 == self.currentlevel or 29 == self.currentlevel or 30 == self.currentlevel or 31 == self.currentlevel 
    or 33 == self.currentlevel or 34 == self.currentlevel or 32 == self.currentlevel or 45 == self.currentlevel
    or 47 == self.currentlevel or 48 == self.currentlevel  then
        local b = math.floor(math.random() * #self.darkArr) + 1
        local c = math.random() + 1.5
        self.darkArr[b]:runAction(cc.Sequence:create(
            cc.MoveBy:create(c,cc.p(0,-self.size.height -100)),
            cc.CallFunc:create(handler(self,function()
                self.darkArr[b]:setPositionY(self.data4[b].y)
                self:darkRun()
            end))
        )) 
    end
    
    if  25 == self.currentlevel then
        local d = math.floor(math.random() * #self.landArr) + 1
        local c = math.random() + 0.7
        self.landArr[d]:runAction(cc.Sequence:create(
            cc.MoveBy:create(c,cc.p(-self.size.width- 300,0)),
            cc.CallFunc:create(handler(self,function()
                self.landArr[d]:setPositionX(self.data6[d].x)
            end))
        ))
        local b = math.floor(math.random() * #self.darkArr)
        c = math.random() + 1.5
        self.darkArr[b]:runAction(cc.Sequence:create(
            cc.MoveBy:create(c, cc.p(0,-self.size.height - 100)),
            cc.CallFunc:create(handler(self,function()
                self.darkArr[b]:setPositionY(self.data4[b].y)
                self:darkRun()
            end))
        )) 
    end
end

function enemyPlayer:six()
    if 26 == self.currentlevel or 27 == self.currentlevel or 
        28 == self.currentlevel or 33 == self.currentlevel or 
        34 == self.currentlevel or 32 == self.currentlevel then
        for a = 1,#self.down_Arr do
            self.down_Arr[a]:removeFromParent();
        end
        self.down_Arr = {}
    else
        for a = 1,#self.down_Arr do
            self.down_Arr[a]:stopAllActions();
            self.down_Arr[a]:setOpacity(100)
        end
    end

    for a = 1,#self.data do 
        if 0 == math.fmod(a-1,2) then
            local child = self.mView["allObject"]:getChildByTag(a)
            child:runAction(cc.Sequence:create(cc.Sequence:create(cc.FadeOut:create(0.5), cc.FadeIn:create(0.5),cc.FadeOut:create(0.5))))
        end
    end

end

function enemyPlayer:getPosition(node)
    local X = node:getPositionX()
    local Y = node:getPositionY()
    return cc.p(X,Y)
end

function enemyPlayer:update(a)
    if not self.bg.ball.isOver then
        for a=1,#self.enemyArr do
            local distance = math.sqrt(cc.pDistanceSQ(self:getPosition(self.bg.ball), self:getPosition(self.enemyArr[a])))
            if distance < self.bg.ball:getBoundingBox().width/2 + 50 then
                self.enemyArr[a]:stopAllActions()
                self.bg.ball:stopAllActions()
                if self.bg.ball:getPositionX() > self.enemyArr[a]:getPositionX() then
                    self.enemyArr[a]:initWithFile(resPath.."Other.png")
                    self.enemyArr[a]:setColor(cc.c3b(122,122,122));
                else
                    self.enemyArr[a]:initWithFile(resPath.."Other.png")
                    self.enemyArr[a]:setColor(cc.c3b(122,122,122));
                end
                self.bg.canTouch =false
                self.bg.canShoot = false
                self.bg.ball.isOver = true
                self.bg.ball:runAction(cc.Sequence:create(
                    cc.MoveBy:create(0.5,cc.p(0,-100)),
                    cc.CallFunc:create(handler(self,function ()
                        self.bg:gotoAccoutLayer(self.bg.gameStaus[3])
                    end)))
                )
            end
        end

        for b=1,#self.wallArr do
            if cc.rectIntersectsRect(self.bg.ball:getBoundingBox(), self.wallArr[b]:getBoundingBox()) then
                self.bg.ball:stopAllActions()
                self.bg.canTouch =false
                self.bg.canShoot = false
                self.bg.ball.isOver = true
                self.bg.ball:runAction(cc.Sequence:create(
                    cc.MoveBy:create(0.5,cc.p(0,-100)),
                    cc.CallFunc:create(handler(self,function ()
                        self.bg:gotoAccoutLayer(self.bg.gameStaus[3])
                    end)))
                )
            end
        end

        for c=1,#self.darkArr do
            if  cc.rectIntersectsRect(self.bg.ball:getBoundingBox(), self.darkArr[c]:getBoundingBox()) then
                self.bg.ball:stopAllActions()
                self.darkArr[c]:stopAllActions()
                self.bg.canTouch =false
                self.bg.canShoot = false
                self.bg.ball.isOver = true
                self.bg.ball:runAction(cc.Sequence:create(
                    cc.MoveBy:create(0.5,cc.p(0,-100)),
                    cc.CallFunc:create(handler(self,function ()
                        self.bg:gotoAccoutLayer(self.bg.gameStaus[3])
                    end)))
                )
            end
        end

        for d =1,#self.landArr do
            if  cc.rectIntersectsRect(self.bg.ball:getBoundingBox(), self.landArr[d]:getBoundingBox()) then
                self.bg.ball:stopAllActions()
                self.landArr[d]:stopAllActions()
                self.bg.canTouch =false
                self.bg.canShoot = false
                self.bg.ball.isOver = true
                self.bg.ball:runAction(cc.Sequence:create(
                    cc.MoveBy:create(0.5,cc.p(0,-100)),
                    cc.CallFunc:create(handler(self,function ()
                        self.bg:gotoAccoutLayer(self.bg.gameStaus[3])
                    end)))
                )
            end
        end
    end
end

return enemyPlayer