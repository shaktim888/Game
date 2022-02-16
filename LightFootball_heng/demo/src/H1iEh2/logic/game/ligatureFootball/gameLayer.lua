local Game = class("Game", cc.load("mvc").ModuleBase)
Game.RESOURCE_FILENAME = "game/ligatureFootball/GameLayer.lua"
local math = require('math')
local accountLayer = import(".accountLayout")
local enemyPlayer = import(".enemyPlayer")
local resPath = "game/ligatureFootball/obstacle/"
local mapPath = "game/ligatureFootball/map/"
local sendTag = 500

local MUSIC_KEY = "_MUSIC_KEY"

function Game:onCreate(level)
    self.currentLevel = level
    if not self.currentLevel then
        self.currentLevel = 1
    end
    self.mView["num_level"]:setString(self.currentLevel)
    self.gameStaus = {"pause","win","lose"}
    self.playerArray = {};
    self.send_dorArr = {};
    self.canShoot = true
    self.canTouch = true
    self.size = cc.Director:getInstance():getVisibleSize();--cc.Director:getInstance():getWinSize()
    self.mView["btn_shoot"]:addClickEventListener(handler(self,self.onShootClick))
    self.mView["btn_pause"]:addClickEventListener(handler(self,self.onPauseClick))
    self.mView["btn_music_on"]:addClickEventListener(handler(self,self.onMusicOnClick))
    self.mView["btn_music_off"]:addClickEventListener(handler(self,self.onMusicOffClick))
    local mapAllpath = mapPath.."map"..self.currentLevel..".tmx"
    self.mapInfo = cc.TMXMapInfo:create(mapAllpath)
    self.objectGroups = self.mapInfo:getObjectGroups()
    self:initPlayerAndSenddor()
    self:initBallAndGoal()
    self:initGoalman()

    self.draw = cc.DrawNode:create()
    self:addChild(self.draw)
    self.enemyPlayer = enemyPlayer.new(nil,nil,self,self.currentLevel)
    self.mView["enemyLayer"]:addChild(self.enemyPlayer)
    self:onUpdate(handler(self,self.update))
    self.mView["touchLayer"]:addTouchEventListener(handler(self,self.playerTouch))

    local isPlayMusic = global.saveTools.getData(MUSIC_KEY)
    if isPlayMusic == 0 then
        self.mView["btn_music_on"]:setVisible(false)
        self.mView["btn_music_off"]:setVisible(true)
        global.utils.sound.setEffectVolume(0)
        global.utils.sound.setMusicVolume(0)
    elseif isPlayMusic == 1 then
        self.mView["btn_music_on"]:setVisible(true)
        self.mView["btn_music_off"]:setVisible(false)
        global.utils.sound.setEffectVolume(100)
        global.utils.sound.setMusicVolume(100)
    else
        global.utils.sound.setEffectVolume(100)
        global.utils.sound.setMusicVolume(100)
        self.mView["btn_music_on"]:setVisible(true)
        self.mView["btn_music_off"]:setVisible(false)
    end
end

function Game:onMusicOnClick()
    global.saveTools.saveData(MUSIC_KEY,0)
    self.mView["btn_music_on"]:setVisible(false)
    self.mView["btn_music_off"]:setVisible(true)
    global.utils.sound.setEffectVolume(0)
    global.utils.sound.setMusicVolume(0)
end

function Game:onMusicOffClick()
    global.saveTools.saveData(MUSIC_KEY,1)
    self.mView["btn_music_on"]:setVisible(true)
    self.mView["btn_music_off"]:setVisible(false)
    global.utils.sound.setEffectVolume(100)
    global.utils.sound.setMusicVolume(100)
end

function Game:playerTouch(sender_, eventType_)
    if eventType_ == 0 then
        if not self.canTouch then
            return 
        end
        local pos = sender_:getTouchBeganPosition()
        for f=1,#self.playerArray do
            if cc.rectContainsPoint(self.playerArray[f]:getBoundingBox(),pos) then
                self.pos_next = self:getPosition(self.playerArray[f])
                self.draw:clear()
                self.draw:drawSegment(self.pos_start,self.pos_next,5,cc.c4f(255, 215, 0, 180));
                break
            end
        end
        return true
    elseif eventType_ == 1 then
        if not self.canTouch then
            return 
        end
        local pos = sender_:getTouchBeganPosition()
        self.draw:clear()
        for f=1,#self.playerArray do
            if cc.rectContainsPoint(self.playerArray[f]:getBoundingBox(),pos) then
                self.pos_next = self:getPosition(self.playerArray[f])
                self.draw:drawSegment(self.pos_start, self.pos_next,5,cc.c4f(255, 215, 0, 180));
                break
            end
        end
        
    elseif eventType_ == 2 or eventType_ == 3 then
        if not self.canTouch then
            return 
        end
        local pos = sender_:getTouchBeganPosition()
        self.draw:clear();
        for f=1,#self.playerArray do
            if cc.rectContainsPoint(self.playerArray[f]:getBoundingBox(),pos) then
                self.canTouch = false
                self.ball:runAction(cc.Sequence:create(
                    cc.MoveTo:create(0.5,cc.p(self.pos_next.x + self.ball:getContentSize().width, self.pos_next.y)),
                    cc.CallFunc:create(handler(self,function ()
                        self.pos_start = self.pos_next
                        self.canTouch = true
                        local tag= self.playerArray[f]:getTag()
                        if 0 == math.fmod(tag,100) then
                            local sendin = self.mView["enemyLayer"]:getChildByTag(tag+1)
                            self.pos_start = self:getPosition(sendin)
                            self.ball:setPositionX(sendin:getPositionX() + 50)
                            self.ball:setPositionY(sendin:getPositionY() + 20)                       
                        end
                    end))
                ))
                break
            end
        end
    end

end

function Game:onShootClick(sender,eventType)
    if self.canShoot then
        self.canShoot = false
        global.utils.sound.playSound("game/ligatureFootball/sound/shoot.mp3")
        self.ball:runAction(cc.Sequence:create(
            cc.MoveTo:create(0.5,cc.p(self.goal:getPositionX()+self.ball:getContentSize().width-20,self.goal:getPositionY()-40)),
            cc.CallFunc:create(function ()
                self.canShoot = false
            end))
        )
    end
end

function Game:onPauseClick()
    global.utils.sound.playSound("game/ligatureFootball/sound/click.wav")
    local shareDirector = cc.Director:getInstance()
    shareDirector:pause()
    self:gotoAccoutLayer(self.gameStaus[1])
end

function Game:gotoAccoutLayer(status)
    local account = accountLayer.new(nil,nil,status,self.currentLevel)
    self.mView["accoutLayer"]:addChild(account)
end

function Game:initPlayerAndSenddor()
    
    self.data  = self.objectGroups[1]:getObjects();
    local rl = #self.data 
    for i= 1,#self.data do
        local player = cc.Sprite:create(resPath.."Our.png")
        player:setPosition(self.data[rl - i + 1].y ,self.size.height - self.data[rl - i + 1].x)
        self.mView["enemyLayer"]:addChild(player)
        table.insert (self.playerArray,player)
    end
    local indx = #self.playerArray;
    self.pos_start = cc.p(self.playerArray[indx]:getPositionX(),self.playerArray[indx]:getPositionY());
    self.data5  = self.objectGroups[5]:getObjects();

    local rl5 = #self.data5;
    for b= 1,#self.data5 do
        local send_dor = nil
        if 0 == math.fmod(b-1,2) then
            send_dor = cc.Sprite:create(resPath.."send.png")
            send_dor:setTag(sendTag)
        else
            send_dor = cc.Sprite:create(resPath.."sendin.png")
            send_dor:setTag(sendTag + 1)
            sendTag = sendTag + 100
        end
        send_dor:setPosition(self.data5[rl5 - b + 1].y,self.size.height - self.data5[rl5 - b + 1].x)
        send_dor:setScale(0.5)
        self.mView["enemyLayer"]:addChild(send_dor)
        table.insert (self.send_dorArr,send_dor)
        table.insert (self.playerArray,send_dor)
    end
    
end

function Game:initBallAndGoal() 
    self.ball = self.mView["ball"]
    self.goal = self.mView["wang"]
    self.ball.isOver = false
    self.ball:setPositionX(self.pos_start.x + self.ball:getContentSize().width)
    self.ball:setPositionY(self.pos_start.y)
    self.goal:setPositionX(self.size.width - self.goal:getContentSize().width / 2)--self.size.width/2)
    self.goal:setPositionY(self.size.height/2);--self.size.height-self.goal:getContentSize().height/2-40)
end

function Game:initGoalman() 
    self.goalmen = cc.Sprite:create(resPath.."Other.png")
    self.goalmen:setPosition(cc.p(self.goal:getPositionX() - 40,self.size.height / 2 ));--cc.p(self.size.width/2,self.goal:getPositionY()-20))
    self.goalmen:setScale(1.2)
    -- self.goalmen:setRotation(90);
    self.mView["enemyLayer"]:addChild(self.goalmen)
    local a = cc.MoveBy:create(0.5,cc.p(0,self.goal:getContentSize().height/2))
    local b = cc.MoveBy:create(0.5,cc.p(0,-self.goal:getContentSize().height/2))
    local c = cc.Sequence:create(a,a:reverse(),b,b:reverse())
    self.goalmen:runAction(cc.RepeatForever:create(c))
    
end

function Game:getPosition(node)
    local X = node:getPositionX()
    local Y = node:getPositionY()
    return cc.p(X,Y)
end

function Game:update(a)
    if not self.ball.isOver then

        local distance = math.sqrt(cc.pDistanceSQ(self:getPosition(self.ball), self:getPosition(self.goalmen)))
        if  distance < self.ball:getBoundingBox().width + self.goalmen:getBoundingBox().width-30 and
            distance > self.goalmen:getBoundingBox().width/2 then
            self.canShoot = false
            self.canTouch =false
            self.ball.isOver = true
            self.goalmen:stopAllActions()
            self.ball:stopAllActions()
            self.ball:setPositionX(self.goal:getPositionX()+self.ball:getContentSize().width-20)
            self.ball:setPositionY(self.goal:getPositionY()-40)
            if self.ball:getPositionX() > self.goalmen:getPositionX() then
                self.goalmen:initWithFile(resPath.."Other.png")
                self.goalmen:setColor(cc.c3b(122,122,122));
            else
                self.goalmen:initWithFile(resPath.."Other.png")
                self.goalmen:setColor(cc.c3b(122,122,122));
            end
            self.ball:runAction(cc.Sequence:create(
                cc.MoveBy:create(0.5,cc.p(0,-100)),
                cc.CallFunc:create(handler(self,function ()
                    self:gotoAccoutLayer(self.gameStaus[3])
                end)))
            )
            
        end
       
        if  (not self.ball.isOver) and cc.rectIntersectsRect(self.goal:getBoundingBox(), self.ball:getBoundingBox()) then
            self.ball:stopAllActions()
            self.ball:setPositionX(self.goal:getPositionX()+self.ball:getContentSize().width-20)
            self.ball:setPositionY(self.goal:getPositionY()-40)
            self.goalmen:stopAllActions()
            self.canShoot = false
            self.canTouch =false
            self.ball.isOver = true
            self:gotoAccoutLayer(self.gameStaus[2])
        end

        

    end
end

return Game
