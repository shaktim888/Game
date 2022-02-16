local GameScene = class("GameScene", cc.load("mvc").ModuleBase)
GameScene.RESOURCE_FILENAME = "game/Game_Layer.lua"
;
local card_info = {
    [1] = {
        defMax = 3,
        defMin = 1,
        ackMax = 3,
        ackMin = 1,
        pic_path = "card_di_s.png"
    },
    [2] = {
        defMax = 6,
        defMin = 4,
        ackMax = 6,
        ackMin = 4,
        pic_path = "card_di_sr.png"
    },
    [3] = {
        defMax = 9,
        defMin = 7,
        ackMax = 9,
        ackMin = 7,
        pic_path = "card_di_ssr.png"
    }
}

local type = {1,2,3}
local clickTime = {0,0,0,0}

local myOutCard = nil
local enemyOutCard = nil
local myOutCardIndex = 1
local enemyCardIndex = 1

-- 1:选牌
-- 2:比牌
local gameState = 1

-- 1:牌权在自己手里
-- 2:牌权在敌方
local card_power = 1

local timenow
local lasetime
function GameScene:seededRandom(max, min) 
    while(true) do
        timenow = os.time()+100*math.random(100,500)
        if timenow~= lasetime then
            lasetime = timenow
            math.randomseed(timenow)
            local temp = (math.random(min,max))
            return temp
        end
       
    end
end

function GameScene:onCreate(data)
    self.data = data
    local panel_top_btn = require("logic/views/GameStart/TopButton").new(self,self.data.btnInfo)

    --我的血量
    self.my_text_HP =self.mView["img_player_head_1"]:getChildByName("text_HP")
    self.my_text_HP:setString(20)

    local  _aSaveInfo = global.saveTools.getData(global.viewData.PLAYER_INFO_SAVE_TO_LOCAL) or {}
    if _aSaveInfo.sex and _aSaveInfo.name then
        self.mView["img_player_head_1"]:loadTexture(_aSaveInfo.headImage)
    end
   
    --敌人血量
    self.enemy_text_HP =self.mView["img_player_head_2"]:getChildByName("text_HP")
    self.enemy_text_HP:setString(20)
    self.mView["img_player_head_2"]:loadTexture("game/hero_icon/"..math.random(1,20)..".png")

    self.my_text_jian =self.mView["img_player_head_1"]:getChildByName("text_jian")
    self.my_text_jian:setVisible(false)

    self.enemy_text_jian =self.mView["img_player_head_2"]:getChildByName("text_jian")
    self.enemy_text_jian:setVisible(false)

    --玩家手牌
    for i= 1,4 do
        local str = "img_myhero_"..i
        self:initCard(self.mView[str])
        self.mView[str]:setTouchEnabled(true)
        self.mView[str]:addTouchEventListener(function(sender, state)
                if state == 2 then
                    if  card_power == 1 and  gameState == 1 then
                        clickTime[i] = clickTime[i] + 1
                        if clickTime[i] == 1 then
                            self.mView[str]:setPositionY(self.mView[str]:getPositionY()+20)
                        elseif clickTime[i] == 2 then
                            self:outcard(self.mView[str])
                            myOutCardIndex = i
                            self:reset()
                        end
                    end
                end
            end)
    end

    --开始游戏
    card_power = 1
    gameState = 1
end

function GameScene:outcard(card)
    card:setVisible(false)
    local temp = card:clone()
    self:addChild(temp)
    temp:setVisible(true)
    local action1 = cc.MoveTo:create(0.3,cc.p(560,380))
    local action2 = cc.ScaleTo:create(0.3,0.7)
    local action3 = cc.Spawn:create(action1,action2)
    temp:runAction(action3)
    myOutCard = temp
    --转移牌权,敌方出牌
    card_power = 2
    self:think(card)
end

function GameScene:think(card)
    local index = math.floor(self:seededRandom(1,4))
    enemyCardIndex = index
    local str = "img_enemy_"..index
    self.mView[str]:setVisible(false)

    local temp = card:clone()
    self:initCard(temp)
    self:addChild(temp)
    temp:setVisible(true)
    temp:setPosition(self.mView[str]:getPositionX(),self.mView[str]:getPositionY())

    local action1 = cc.MoveTo:create(0.3,cc.p(725,380))
    local action2 = cc.ScaleTo:create(0.3,0.7)
    local action3 = cc.Spawn:create(action1,action2)

    local action4 = cc.DelayTime:create(2)
    local action5 = cc.CallFunc:create(function ()
        self:result()
    end)

    local action6 = cc.Sequence:create(action3,action4,action5)
    temp:runAction(action6)

    enemyOutCard = temp
    gameState = 2
    card_power = 1
end

function GameScene:result()
    local my_text_def = myOutCard:getChildByName("text_def")
    local my_def = tonumber(my_text_def:getString())
    local my_text_ack = myOutCard:getChildByName("text_ack")
    local my_ack = tonumber(my_text_ack:getString())

    local enemy_text_def = enemyOutCard:getChildByName("text_def")
    local enemy_def = tonumber(enemy_text_def:getString())
    local enemy_text_ack = enemyOutCard:getChildByName("text_ack")
    local enemy_ack = tonumber(enemy_text_ack:getString())

    if enemy_ack > my_def then
        local current_HP = tonumber(self.my_text_HP:getString()) - (enemy_ack - my_def)
        self.my_text_HP:setString(current_HP)
        self.my_text_jian:setString(current_HP)
        self.my_text_jian:setVisible(true)
        self.my_text_jian:setOpacity(255);
        self.my_text_jian:setString(my_ack - enemy_def)

        self.my_text_jian:runAction(cc.Sequence:create(
            cc.Spawn:create(
                cc.FadeIn:create(0.1),
                cc.MoveTo:create(2,cc.p(self.my_text_jian:getPositionX(),self.my_text_jian:getPositionY()+20)),
                cc.FadeOut:create(2)
            ),
            cc.CallFunc:create(function ()
                self.my_text_jian:setVisible(false)
                self.my_text_jian:setPositionY(self.enemy_text_jian:getPositionY()-20)
            end)
        ))
        --失败
        if current_HP <=0 then
            local data = {
                isWin = false
            }
            global.viewController.gotoView("result",data)
        end

        enemyOutCard:runAction(cc.Sequence:create(
            cc.FadeIn:create(0.1),
            cc.MoveTo:create(0.2,cc.p(self.mView["img_player_head_1"]:getPositionX(),self.mView["img_player_head_1"]:getPositionY())),
            cc.FadeOut:create(0.3),
            cc.CallFunc:create(function ()
                enemyOutCard:removeFromParent()
                enemyOutCard = nil
            end)
        ))
    else
        enemyOutCard:removeFromParent()
        enemyOutCard = nil
    end

    if my_ack > enemy_def then
        local current_HP = tonumber(self.enemy_text_HP:getString()) - (my_ack - enemy_def)
        self.enemy_text_HP:setString(current_HP)
        self.enemy_text_jian:setVisible(true)
        self.enemy_text_jian:setOpacity(255);
        self.enemy_text_jian:setString(enemy_def - my_ack)

        self.enemy_text_jian:runAction(cc.Sequence:create(
            cc.Spawn:create(
                cc.MoveTo:create(2,cc.p(self.enemy_text_jian:getPositionX(),self.enemy_text_jian:getPositionY()+20)),
                cc.FadeOut:create(2)
            ),
            cc.CallFunc:create(function ()
                self.enemy_text_jian:setVisible(false)
                self.enemy_text_jian:setPositionY(self.enemy_text_jian:getPositionY()-20)
            end)
        ))
         --胜利
         if current_HP <=0 then
            local data = {
                isWin = true
            }
            global.viewController.gotoView("result",data)
         end
         myOutCard:runAction(cc.Sequence:create(
            cc.MoveTo:create(0.2,cc.p(self.mView["img_player_head_2"]:getPositionX(),self.mView["img_player_head_2"]:getPositionY())),
            cc.FadeOut:create(0.3),
            cc.CallFunc:create(function ()
                myOutCard:removeFromParent()
                myOutCard = nil
            end)
        ))
    else
        myOutCard:removeFromParent()
        myOutCard =nil
    end

 
    self:runAction(cc.Sequence:create(
        cc.DelayTime:create(1),
        cc.CallFunc:create(function()
            self:faipai()
        end)
    ))
   
end

function GameScene:onJieSuan()
    local data = {
        isWin = true
    }
    global.viewController.gotoView("result",data)
end

function GameScene:faipai()
    local img_card_my  = self.mView["img_all_card"]:clone()
    self:addChild(img_card_my)
    local img_card_enemy = self.mView["img_all_card"]:clone()
    self:addChild(img_card_enemy)

    local str_card_my = "img_myhero_"..myOutCardIndex
    local str_card_enemy = "img_enemy_"..enemyCardIndex

    local action1 = cc.MoveTo:create(0.3,cc.p(self.mView[str_card_my]:getPositionX(),self.mView[str_card_my]:getPositionY()))
    local action3 = cc.CallFunc:create(function ()
        img_card_my:removeFromParent()
    end)
    local action5 = cc.CallFunc:create(function ()
        self:initCard(self.mView[str_card_my])
        self.mView[str_card_my]:setVisible(true)
        gameState = 1
        card_power = 1
    end)

    local action2 = cc.MoveTo:create(0.3,cc.p(self.mView[str_card_enemy]:getPositionX(),self.mView[str_card_enemy]:getPositionY()))
    local action4 = cc.CallFunc:create(function ()
        img_card_enemy:removeFromParent()
    end)
    local action6 = cc.CallFunc:create(function ()
        self.mView[str_card_enemy]:setVisible(true)
    end)

    img_card_my:runAction(cc.Sequence:create(action1,action5,action3))
    img_card_enemy:runAction(cc.Sequence:create(action2,action6,action4))
end

function GameScene:reset()
    for k = 1,4 do
        local str_name = "img_myhero_"..k
        if clickTime[k] == 1 or clickTime[k] == 2 then
            self.mView[str_name]:setPositionY(self.mView[str_name]:getPositionY()-20)
        end
        clickTime[k] = 0
    end
end

function GameScene:initCard(card)
    local img_card = card:getChildByName("img_card")
    local text_def = card:getChildByName("text_def")
    local text_ack = card:getChildByName("text_ack")
    local index = self:getGradeCard()
    img_card:loadTexture("game/card/"..card_info[index].pic_path)
    local data = self:getCardDataByIndex(index)
    text_def:setString(data.defvalue)
    text_ack:setString(data.ackvalue)
    card:loadTexture(data.heroIndex)
end

function GameScene:getGradeCard()
    local index = math.floor(self:seededRandom(1,10))
    local temp = 1
    if index < 5 then
        temp = type[1]
    elseif index < 9 then
        temp = type[2]
    else
        temp = type[3]
    end
    print("type:"..temp)
    return temp
end

function GameScene:getCardDataByIndex(index)
    local data = card_info[index]
    local def = math.floor(self:seededRandom(data.defMax,data.defMin))
    local ack = math.floor(self:seededRandom(data.ackMax,data.ackMin))
    local hero_index = math.floor(self:seededRandom(20,1))
    local texture = "game/dynamic/hero/"..hero_index..".png"
    local card = {
        defvalue = def,
        ackvalue = ack,
        heroIndex = texture
    }
    print("heroIndex:"..hero_index)
    print("defvalue:"..def)
    print("ackvalue:"..ack)
    return card
end

return GameScene
