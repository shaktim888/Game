local GameSceneLayer = class("GameSceneLayer", cc.load("mvc").ModuleBase)
GameSceneLayer.RESOURCE_FILENAME = "game/Game_Layer.lua"

local seed = 5
local attackIndexs = {}
local clickIndex ={}

--阵营数据
local color = {}

--关卡数据
local level = nil
local armyNumber = nil
local pointNumber = nil

--当前防御塔皮肤
local current_tower_skin = 1
--防御塔皮肤的生成小兵的速度 、最大生命值的上限
local tower_config = {
    [1]     = {life = 150,speed = 0.10},
    [2]     = {life = 180,speed = 0.15},
    [3]     = {life = 200,speed = 0.20},
    [4]     = {life = 240,speed = 0.25},
    [5]     = {life = 250,speed = 0.30},
    [6]     = {life = 280,speed = 0.35},
};

--电脑初级中级高级的间隔时间基数
local aiInterval =  {
    [1] = 5,
    [2] = 7,
    [3] = 10,
};

--敌人阵营 生成小兵的速度 、最大生命值的上限
local config = {
    [1]     = {life = 100,speed = 0.1},
    [2]     = {life = 100,speed = 0.1},
    [3]     = {life = 100,speed = 0.25},
    [4]     = {life = 100,speed = 0.35},
};

--UI节点
local drawNode = nil
local node_draw = nil
local node_ball = nil
local node_small = nil

--动态添加的节点
local cell_imgs = {}
local rings = {}

--人数、据点数量配置
local levelConfig = {
    [1] = {armyNumber = 2, pointNumber = 5};
    [2] = {armyNumber = 2, pointNumber = 6};
    [3] = {armyNumber = 2, pointNumber = 7};
    [4] = {armyNumber = 2, pointNumber = 8};
    [5] = {armyNumber = 2, pointNumber = 9};
    [6] = {armyNumber = 3, pointNumber = 10};
    [7] = {armyNumber = 3, pointNumber = 11};
    [8] = {armyNumber = 3, pointNumber = 12};
    [9] = {armyNumber = 3, pointNumber = 12};
    [10] = {armyNumber = 3, pointNumber = 12};
    [11] = {armyNumber = 4, pointNumber = 12};
    [12] = {armyNumber = 4, pointNumber = 12};
    [13] = {armyNumber = 4, pointNumber = 12};
    [14] = {armyNumber = 4, pointNumber = 12};
    [15] = {armyNumber = 4, pointNumber = 12};
}

--防御塔节点位置配置
local levelPosition = {
    [1] = 
    { 
        [1]  = {x = 115,y = 417},
        [2]  = {x = 910,y = 129},
        [3]  = {x = 281,y = 350},
        [4]  = {x = 481,y = 279},
        [5]  = {x = 687,y = 207},
        [6]  = {x = 0,y = 0},
        [7]  = {x = 0,y = 0},
        [8]  = {x = 0,y = 0},
        [9]  = {x = 0,y = 0},
        [10] = {x = 0,y = 0},
        [11] = {x = 0,y = 0},
        [12] = {x = 0,y = 0},
    },
    [2] = 
    { 
        [1]  = {x = 115,y = 417},
        [2]  = {x = 910,y = 129},
        [3]  = {x = 216,y = 156},
        [4]  = {x = 510,y = 84},
        [5]  = {x = 509,y = 406},
        [6]  = {x = 513,y = 277},
        [7]  = {x = 0,y = 0},
        [8]  = {x = 0,y = 0},
        [9]  = {x = 0,y = 0},
        [10] = {x = 0,y = 0},
        [11] = {x = 0,y = 0},
        [12] = {x = 0,y = 0},
    },
    [3] = 
    { 
        [1]  = {x = 294,y = 278},
        [2]  = {x = 977,y = 438},
        [3]  = {x = 800,y = 194},
        [4]  = {x = 379,y = 98},
        [5]  = {x = 509,y = 462},
        [6]  = {x = 513,y = 277},
        [7]  = {x = 741,y = 75},
        [8]  = {x = 0,y = 0},
        [9]  = {x = 0,y = 0},
        [10] = {x = 0,y = 0},
        [11] = {x = 0,y = 0},
        [12] = {x = 0,y = 0},
    },
    [4] = 
    { 
        [1]  = {x = 1009,y = 412},
        [2]  = {x = 1007,y = 108},
        [3]  = {x = 645,y = 278},
        [4]  = {x = 301,y = 271},
        [5]  = {x = 509,y = 462},
        [6]  = {x = 513,y = 277},
        [7]  = {x = 741,y = 75},
        [8]  = {x = 108,y = 263},
        [9]  = {x = 0,y = 0},
        [10] = {x = 0,y = 0},
        [11] = {x = 0,y = 0},
        [12] = {x = 0,y = 0},
    },
    [5] = 
    { 
        [1]  = {x = 867,y = 336},
        [2]  = {x = 539,y = 89},
        [3]  = {x = 821,y = 98},
        [4]  = {x = 317,y = 250},
        [5]  = {x = 443,y = 429},
        [6]  = {x = 599,y = 274},
        [7]  = {x = 274,y = 94},
        [8]  = {x = 144,y = 236},
        [9]  = {x = 133,y = 441},
        [10] = {x = 0,y = 0},
        [11] = {x = 0,y = 0},
        [12] = {x = 0,y = 0},
    },
    [6] = 
    { 
        [1]  = {x = 118,y = 290},
        [2]  = {x = 900,y = 506},
        [3]  = {x = 827,y = 69},
        [4]  = {x = 810,y = 283},
        [5]  = {x = 524,y = 505},
        [6]  = {x = 510,y = 70},
        [7]  = {x = 533,y = 281},
        [8]  = {x = 155,y = 69},
        [9]  = {x = 122,y = 472},
        [10] = {x = 297,y = 140},
        [11] = {x = 0,y = 0},
        [12] = {x = 0,y = 0},
    },
    [7] = 
    { 
        [1]  = {x = 118,y = 75},
        [2]  = {x = 294,y = 496},
        [3]  = {x = 1005,y = 498},
        [4]  = {x = 1008,y = 63},
        [5]  = {x = 524,y = 505},
        [6]  = {x = 510,y = 70},
        [7]  = {x = 758,y = 189},
        [8]  = {x = 184,y = 284},
        [9]  = {x = 459,y = 295},
        [10] = {x = 297,y = 140},
        [11] = {x = 1015,y = 258},
        [12] = {x = 0,y = 0},
    },
    [8] = 
    { 
        [1]  = {x = 114,y = 473},
        [2]  = {x = 112,y = 70},
        [3]  = {x = 1005,y = 498},
        [4]  = {x = 1008,y = 63},
        [5]  = {x = 524,y = 505},
        [6]  = {x = 510,y = 70},
        [7]  = {x = 781,y = 141},
        [8]  = {x = 295,y = 358},
        [9]  = {x = 552,y = 250},
        [10] = {x = 297,y = 140},
        [11] = {x = 780,y = 355},
        [12] = {x = 109,y = 257},
    },
    [9] = 
    { 
        [1]  = {x = 311,y = 269},
        [2]  = {x = 509,y = 0},
        [3]  = {x = 731,y = 266},
        [4]  = {x = 515,y = 416},
        [5]  = {x = 1011,y = 271},
        [6]  = {x = 1004,y = 73},
        [7]  = {x = 511,y = 247},
        [8]  = {x = 199,y = 497},
        [9]  = {x = 795,y = 71},
        [10] = {x = 216,y = 70},
        [11] = {x = 851,y = 496},
        [12] = {x = 109,y = 257},
    },
    [10] = 
    { 
        [1]  = {x = 118,y = 273},
        [2]  = {x = 505,y = 72},
        [3]  = {x = 1009,y = 278},
        [4]  = {x = 521,y = 496},
        [5]  = {x = 802,y = 346},
        [6]  = {x = 1004,y = 73},
        [7]  = {x = 511,y = 247},
        [8]  = {x = 120,y = 478},
        [9]  = {x = 820,y = 154},
        [10] = {x = 115,y = 74},
        [11] = {x = 1008,y = 494},
        [12] = {x = 310,y = 390},
    },
    [11] = 
    { 
        [1]  = {x = 516,y = 66},
        [2]  = {x = 266,y = 66},
        [3]  = {x = 805,y = 68},
        [4]  = {x = 527,y = 474},
        [5]  = {x = 761,y = 408},
        [6]  = {x = 1006,y = 263},
        [7]  = {x = 511,y = 247},
        [8]  = {x = 120,y = 478},
        [9]  = {x = 789,y = 219},
        [10] = {x = 204,y = 217},
        [11] = {x = 1008,y = 494},
        [12] = {x = 310,y = 390},
    },
    [12] = 
    { 
        [1]  = {x = 720,y = 68},
        [2]  = {x = 303,y = 68},
        [3]  = {x = 716,y = 498},
        [4]  = {x = 316,y = 496},
        [5]  = {x = 808,y = 352},
        [6]  = {x = 1006,y = 263},
        [7]  = {x = 534,y = 222},
        [8]  = {x = 120,y = 478},
        [9]  = {x = 1002,y = 71},
        [10] = {x = 189,y = 219},
        [11] = {x = 1008,y = 494},
        [12] = {x = 327,y = 353},
    },
    [13] = 
    { 
        [1]  = {x = 1006,y = 68},
        [2]  = {x = 119,y = 506},
        [3]  = {x = 341,y = 378},
        [4]  = {x = 751,y = 175},
        [5]  = {x = 808,y = 354},
        [6]  = {x = 1006,y = 263},
        [7]  = {x = 518,y = 278},
        [8]  = {x = 291,y = 78},
        [9]  = {x = 561,y = 472},
        [10] = {x = 144,y = 236},
        [11] = {x = 1008,y = 494},
        [12] = {x = 512,y = 71},
    },
    [14] = 
    { 
        [1]  = {x = 1006,y = 68},
        [2]  = {x = 119,y = 506},
        [3]  = {x = 115,y = 73},
        [4]  = {x = 1008,y = 496},
        [5]  = {x = 281,y = 354},
        [6]  = {x = 1006,y = 263},
        [7]  = {x = 835,y = 345},
        [8]  = {x = 384,y = 61},
        [9]  = {x = 417,y = 497},
        [10] = {x = 106,y = 290},
        [11] = {x = 730,y = 499},
        [12] = {x = 661,y = 64},
    },
    [15] = 
    { 
        [1]  = {x = 1006,y = 68},
        [2]  = {x = 119,y = 506},
        [3]  = {x = 115,y = 73},
        [4]  = {x = 1008,y = 496},
        [5]  = {x = 281,y = 354},
        [6]  = {x = 807,y = 309},
        [7]  = {x = 530,y = 309},
        [8]  = {x = 332,y = 163},
        [9]  = {x = 417,y = 497},
        [10] = {x = 106,y = 290},
        [11] = {x = 730,y = 499},
        [12] = {x = 528,y = 81},
    },
}

function GameSceneLayer:init()
    seed = 5
    self.aiHandler = {}
    --阵营数据
    color = {}
    --关卡数据
    level = nil
    armyNumber = nil
    pointNumber = nil
    drawNode = nil
    node_draw = nil
    node_ball = nil
    node_small = nil
    --动态添加的节点
    cell_imgs = {}
    rings = {}
    attackIndexs = {} 
end

function GameSceneLayer:registTouchEvent()
    print("1111111")
    local function onTouch(eventType, x, y)
        if eventType == "began" then
            clickIndex = self:checkClick(cc.p(x,y),true);
            if clickIndex ~= 0 then
                attackIndexs[#attackIndexs +1] = clickIndex;
                print("print(clickIndex)"..clickIndex)
            end
            return true
        elseif eventType == "moved" then
            if #attackIndexs~= 0 then
                self:drawAttackRoute(cc.p(x,y));
            end
            
        elseif eventType == "ended" then
            local res = self:checkGameOver();
            if res == -1 then
                self:processClickUp(cc.p(x,y));
            end
            
            attackIndexs = {};
            drawNode:clear();
            self:clearCircle();
        end
    end

    local layer = cc.Layer:create()

    layer:setTouchEnabled(true)
    layer:setContentSize(cc.size(1280,720)) 
    layer:registerScriptTouchHandler(onTouch)
    self:addChild(layer)
end

function GameSceneLayer:seededRandom(max, min) 
    max = max or 1
    min = min or 0
    seed = (seed * 9301 + 49297) % 233280
    local rnd = seed / 233280.0
    return min + rnd * (max - min)
end

function GameSceneLayer:onCreate(_data)
    print(_data.level)
    -- self:addNodeClick(self.mView["btn_return"],{
    --     endCallBack = function () 
    --         self:gotoStart()
    --     end
    -- })
    self.mView["img_role"]:setVisible(true)
    self.mView["img_role"]:runAction(cc.Sequence:create({
		cc.Spawn:create({
			cc.Sequence:create({cc.ScaleTo:create(0.1,1.05),cc.ScaleTo:create(0.2,1)}),
			cc.FadeIn:create(0.3)
		}),
		cc.DelayTime:create(1),
		cc.Spawn:create({
			cc.Sequence:create({cc.ScaleTo:create(0.2,1.05),cc.ScaleTo:create(0.2,0.75)}),
            cc.FadeOut:create(1),
            cc.CallFunc:create(function ()
                self.mView["img_role"]:setVisible(false)
            end)
		})
	}))

    self.mView["btn_return"]:setTouchEnabled(true)
    self.mView["btn_return"]:addTouchEventListener(handler(self,self.gotoStart))
    self:init()
    --UI节点
    node_draw = self.mView["node_draw"]
    node_ball = self.mView["node_ball"]
    node_ball:setVisible(true)
    node_small = self.mView["node_small"]
    node_small:setVisible(true)

    --动态生成的节点
    if drawNode  == nil then
        drawNode =  cc.DrawNode:create()
        node_draw:addChild(drawNode)
    end
    cell_imgs = {}

     --动态数据
    level =_data.level
  
    current_tower_skin = tonumber(global.viewData.getTowerIndex())

    --游戏数据配置
    armyNumber = levelConfig[level].armyNumber;
    pointNumber = levelConfig[level].pointNumber;

    --初始化
    self:setLevelPosition()
    self:initColor()
    self:initPoint()
    self:initSelectRing()

   
    --调度器--按时间生成各个阵营小兵
    if self.groupHandlers then 
        cc.Director:getInstance():getScheduler():unscheduleScriptEntry(self.groupHandlers)
        self.groupHandlers = nil;
    end
    self.groupHandlers = cc.Director:getInstance():getScheduler():scheduleScriptFunc(function()
        for i= 1, #cell_imgs do
            local index = cell_imgs[i]:getTag()
            if index ~=0 then
                local txt = cell_imgs[i]:getChildByName("hideNumber");
                local tnumber = txt:getString()
                tnumber = tnumber + self:getSpeed(index,level);
                local thp = self:getMaxHealth(index,level);
                if tnumber > thp then
                    tnumber = thp
                end
                txt:setString(""..tnumber);
    
                local img_num_bg = cell_imgs[i]:getChildByName("img_num_bg");
                local label = img_num_bg:getChildByName("number");
                label:setString("".. math.floor(tnumber));
            end
        end

        local isResult = self:checkGameOver()
        if isResult == 0 or isResult == 1 then
            self:clearTimerHander()
            self:gotoResult(isResult)
        end
    end, 1/10,false);

    --敌方的智能攻击
    self.aiHandler = {}
    for i=2,armyNumber do
        aiInterval[i-1] = 5
        if self.aiHandler[i-1] then 
		    cc.Director:getInstance():getScheduler():unscheduleScriptEntry(aiHandler[i-1])
		    self.aiHandler[i-1] = nil;
	    end
        self.aiHandler[i-1] = cc.Director:getInstance():getScheduler():scheduleScriptFunc(
                function()
                    self:think(color[i]);
                end, 
            aiInterval[i-1],false);
    end

end


-- function GameSceneLayer:onTouchBegan(touch, event)
--     local touchPoint = touch:getLocation()
--     local clickIndex = self:checkClick(touchPoint,true);
--     if clickIndex ~= 0 then
--         attackIndexs[#attackIndexs +1] = clickIndex;
--     end
--     return true
-- end


--检测是否有效点击
function GameSceneLayer:checkClick(pos,isMe)
    for i = 1,pointNumber do
        if isMe then 
            if cell_imgs[i]:getTag() == color[1] then
                if cc.rectContainsPoint(cell_imgs[i]:getBoundingBox(),cell_imgs[i]:convertToNodeSpace(pos)) then
                    return i;
                end
            end
        else
            if cc.rectContainsPoint(cell_imgs[i]:getBoundingBox(),cell_imgs[i]:convertToNodeSpace(pos)) then
                return i;
            end
        end
    end
    return 0;
end

-- function GameSceneLayer:onTouchMoved(touch, event)
--     local touchPoint = touch:getLocation()
--     if #attackIndexs~= 0 then
--         self:drawAttackRoute(touchPoint);
--     end
-- end

--绘制攻击路线
function GameSceneLayer:drawAttackRoute(pos)
    local index = self:checkClick(pos,true);
    if index ~= 0 then
        if not self:IsInattackIndexs(index) then
            attackIndexs[#attackIndexs +1] = index;
        end
    end
    self:clear();
    self:clearCircle();
    for i= 1,#attackIndexs do
        local index = attackIndexs[i];
        local frompos = cell_imgs[index]:getParent():convertToWorldSpace(cc.p(cell_imgs[index]:getPositionX(),cell_imgs[index]:getPositionY()));
        frompos.x = frompos.x - (display.width-1280)/2;
        local topos = cc.p(pos.x - (display.width-1280)/2,pos.y);
        self:draw(frompos,topos);
        self:drawCircle(index);
    end

end

--该攻击索引是否已经在攻击索引集合中了
function GameSceneLayer:IsInattackIndexs(index)
    for i= 1,#attackIndexs do
        if attackIndexs[i] == index then
            return true;
        end
    end
    return false;
end

--画线段
function GameSceneLayer:draw(frompos,topos)
    drawNode:drawSegment(frompos,topos,5,cc.c4b(1,1,1,1));
end

--画圆
function GameSceneLayer:drawCircle(index)
    rings[index]:setVisible(true);
end

--清空画布
function GameSceneLayer:clear()
    drawNode:clear();
end

--清除画圆
function GameSceneLayer:clearCircle()
    for i = 1,pointNumber do
        rings[i]:setVisible(false);
    end
end

-- function GameSceneLayer:onTouchEnded(touch, event)
--     local res = self:checkGameOver();
--     local touchPoint = touch:getLocation()
--     if res == -1 then
--         self:processClickUp(touchPoint);
--     end
    
--     attackIndexs = {};
--     drawNode:clear();
--     self:clearCircle();
-- end

--处理鼠标弹起
function GameSceneLayer:processClickUp(pos)
    local index = self:checkClick(pos,false);
    print("processClickUp"..index)
    if index ~= 0 then
       if cell_imgs[index]:getTag() == color[1] then 
          self:removePos(index);
       else 
       end
       self:Attack(attackIndexs,index); 
    end
end

--去除鼠标弹起的这个病毒后的集合
function GameSceneLayer:removePos(index)
    for i=1,#attackIndexs do
        if attackIndexs[i] == index then
            table.remove(attackIndexs,i);
            break;
        end
    end
end

--清除定时器
function GameSceneLayer:clearTimerHander()
    if self.groupHandlers then 
		cc.Director:getInstance():getScheduler():unscheduleScriptEntry(self.groupHandlers)
		self.groupHandlers = nil;
	end
    for i = 2, armyNumber do
        if self.aiHandler[i-1] then 
		    cc.Director:getInstance():getScheduler():unscheduleScriptEntry(self.aiHandler[i-1])
		    self.aiHandler[i-1] = nil;
        end
    end
end

--AI
function GameSceneLayer:think(index)
    --寻找可被攻击的目标细胞：找敌方病毒数最小的，再在里面找最近的那个
    --寻找目标细胞找到派病毒的目标细胞集：将自己的细胞按照离目标细胞的距离进行升序排列，然后根据病毒数决定派哪些细胞攻击
    local disIndex = self:getTargetByColor();
    if disIndex == nil then
        return 
    end
    local resIndexs = self:getSourceSetByColor(disIndex,index);
    if #resIndexs == 0 then
        local r = self:seededRandom(0,100);
        if r<10 then
            --出兵，找个病毒数字最少的攻击
            local weekestIndex = self:getWeekestEnemy(index);
            local r = self:getRandomSelfACellIndex(index);
            local t = {};
            t[1] = r;
            self:Attack(t,weekestIndex);
        end
    else
        --出兵
        self:Attack(resIndexs,disIndex);  
    end
end

--释放病毒取进攻别的细胞
function GameSceneLayer:Attack(fromIndexs,toIndex)
    local toBase = cell_imgs[toIndex]:getParent():convertToWorldSpace(cc.p(cell_imgs[toIndex]:getPositionX(),cell_imgs[toIndex]:getPositionY()))
    toBase.x = toBase.x - (display.width-1280)/2
    for i = 1, #fromIndexs do
        local index = fromIndexs[i]
        local fromposBase = cell_imgs[index]:getParent():convertToWorldSpace(cc.p(cell_imgs[index]:getPositionX(),cell_imgs[index]:getPositionY()))
        fromposBase.x = fromposBase.x - (display.width-1280)/2
        local number = math.floor(self:getNumberByIndex(index)/2)
        self:refreshNumberByIndex(index,number)
        self:singleAttack(index,toIndex,fromposBase,toBase,number)
    end
    --self:playSound("majia/sound/send.mp3")
end

--一个细胞对另一个细胞派出病毒
function GameSceneLayer:singleAttack(fromIndex,toIndex,fromposBase,toBase,number)
    for i= 1,number do
        local from_x = fromposBase.x +  math.floor(self:seededRandom(1,26));
        local from_y = fromposBase.y + math.floor(self:seededRandom(1,26));
        local to_x = toBase.x +  math.floor(self:seededRandom(1,26));
        local to_y = toBase.y + math.floor(self:seededRandom(1,26));
        local path = self:getSoldierByColor(cell_imgs[fromIndex]:getTag());
        local soldier = ccui.ImageView:create(path);
        soldier:setPosition(cc.p(from_x,from_y));
        soldier:setScale(0.2);
        node_small:addChild(soldier);
        local dis = cc.pGetDistance(cc.p(from_x,from_y),cc.p(to_x,to_y));
        soldier:runAction(
        cc.Sequence:create(cc.Spawn:create(cc.MoveTo:create(dis/(1280/8),cc.p(to_x,to_y))),cc.RemoveSelf:create(),cc.CallFunc:create(function ()
            local img_num_bg = cell_imgs[toIndex]:getChildByName("img_num_bg");
            local numberlabel = img_num_bg:getChildByName("number");
            local txt = cell_imgs[toIndex]:getChildByName("hideNumber");
            local number = tonumber(txt:getString());
            if (cell_imgs[toIndex]:getTag() == 0) or (cell_imgs[toIndex]:getTag() == cell_imgs[fromIndex]:getTag()) or (cell_imgs[fromIndex]:getTag()~=1 and cell_imgs[toIndex]:getTag()~=1) then
                number = number +1;
                if cell_imgs[toIndex]:getTag() == 0 then
                    cell_imgs[toIndex]:loadTexture(self:getSmallPathByColor(cell_imgs[fromIndex]:getTag()));
                end
                cell_imgs[toIndex]:setTag(cell_imgs[fromIndex]:getTag());
                local thp = self:getMaxHealth(cell_imgs[toIndex]:getTag(),level);
                if number > thp then
                    number = thp;
                end
                numberlabel:setString(""..math.floor(number));
                numberlabel:setVisible(true);
                txt:setString(""..math.floor(number));
            else
                number = number - 1 ;
                if number <= 0 then
                    number = 0;
                    --self:playSound("majia/sound/change.mp3");
                end
                if math.floor(number) == 0 then
                    cell_imgs[toIndex]:setTag(cell_imgs[fromIndex]:getTag());
                    if toIndex <= armyNumber then
                        cell_imgs[toIndex]:loadTexture(self:getSmallPathByColor(cell_imgs[fromIndex]:getTag()));
                        local img_num_bg = cell_imgs[toIndex]:getChildByName("img_num_bg");
                        local number = img_num_bg:getChildByName("number");
                        number:setPosition(cc.p(img_num_bg:getContentSize().width/2,img_num_bg:getContentSize().height/2));
                    else
                        cell_imgs[toIndex]:loadTexture(self:getSmallPathByColor(cell_imgs[fromIndex]:getTag()));
                    end
                end
                numberlabel:setString(""..math.floor(number));
                numberlabel:setVisible(true);
                txt:setString(""..math.floor(number));
            end
        end)));
    end
end

--通过颜色获得小兵的的纹理
function GameSceneLayer:getSoldierByColor(index)
    if self:isMe(index) then
        return "dynamic/other_slider.png";
    else
        return "dynamic/player_slider.png";
    end
end

--通过颜色获得非主要基地的的纹理
function GameSceneLayer:getSmallPathByColor(index)
    if self:isMe(index) then
        return "skin/tower_skin/"..current_tower_skin..".png";
    else
        return "dynamic/other.png";
    end
end

--获取当前一个细胞的病毒数
function GameSceneLayer:getNumberByIndex(index)
    local img_num_bg = cell_imgs[index]:getChildByName("img_num_bg");
    local label = img_num_bg:getChildByName("number")
    local mumber = label:getString();
    return math.floor(tonumber(mumber));
end

--刷新当前病毒数
function GameSceneLayer:refreshNumberByIndex(index,subnumber)
    local txt = cell_imgs[index]:getChildByName("hideNumber")
    local strhideNumber = txt:getString()
    local hideNumber = tonumber(strhideNumber)
    hideNumber = hideNumber - subnumber
    txt:setString(""..hideNumber)
    local img_num_bg = cell_imgs[index]:getChildByName("img_num_bg");
    local label = img_num_bg:getChildByName("number")
    label:setString(math.floor(math.floor(hideNumber)))
end

--寻找可被攻击的目标细胞
function GameSceneLayer:getTargetByColor()
    local targetcells = {};
    for i=1,pointNumber do
        local tag = cell_imgs[i]:getTag();
        if self:isMe(tag) or tag == 0 then
            targetcells[#targetcells+1] = i;
        end
    end
    --按照节点细胞数排序
    table.sort(targetcells,function (a,b)
        local img_num_bg_a = cell_imgs[a]:getChildByName("img_num_bg");
        local alabel = img_num_bg_a:getChildByName("number");

        local img_num_bg_b = cell_imgs[b]:getChildByName("img_num_bg");
        local blabel = img_num_bg_b:getChildByName("number");
       
        local astring = alabel:getString();
        local bstring = blabel:getString();
        local anumber = math.floor(tonumber(astring));
        local bnumber = math.floor(tonumber(bstring));
        if anumber ~= bnumber then
            return anumber < bnumber;
        else
            local aroute = self:getNearestDistance(index,a);
            local broute = self:getNearestDistance(index,b);
            return aroute < broute;
        end
    end);
    return targetcells[1];
end

--按照最近路线排序
function GameSceneLayer:getNearestDistance(myTag,index)
    local mycell = {};
    for i=1,pointNumber do
        if cell_imgs[i]:getTag() == myTag then
            mycell[#mycell + 1] = i;
        end
    end
    local distance = 10000;
    for i=1,#mycell do
        local posi = cell_imgs[i]:getParent():convertToWorldSpace(cc.p(cell_imgs[i]:getPositionX(),cell_imgs[i]:getPositionY()));
        local posindex = cell_imgs[index]:getParent():convertToWorldSpace(cc.p(cell_imgs[index]:getPositionX(),cell_imgs[index]:getPositionY()));
        local tdis = cc.pGetDistance(posi,posindex);
        if  tdis< distance then
            distance = tdis;
        end
    end
    return distance;
end

--根据被攻击目标细胞寻找可以攻击的源细胞集
function GameSceneLayer:getSourceSetByColor(disIndex,index)
    local mycell = {};
    for i= 1,pointNumber do
        if cell_imgs[i]:getTag() == index then
            mycell[#mycell + 1] = i;
        end
    end
    table.sort(mycell,function (a,b)
        local adistance = cc.pGetDistance(cc.p(cell_imgs[disIndex]:getPositionX(),cell_imgs[disIndex]:getPositionY()),cc.p(cell_imgs[a]:getPositionX(),cell_imgs[a]:getPositionY()));
        local bdistance = cc.pGetDistance(cc.p(cell_imgs[disIndex]:getPositionX(),cell_imgs[disIndex]:getPositionY()),cc.p(cell_imgs[b]:getPositionX(),cell_imgs[b]:getPositionY()));
            return adistance < bdistance;
    end);
    local sourceSet = {};
    local sum = 0;
    local img_num_bg = cell_imgs[disIndex]:getChildByName("img_num_bg");
    local dislabel = img_num_bg:getChildByName("number");

    local disString = dislabel:getString();
    local disnumber = math.floor(tonumber(disString));

    for i= 1,#mycell do
        sourceSet[#sourceSet+1] = mycell[i];
        local img_num_bg_1 = cell_imgs[mycell[i]]:getChildByName("img_num_bg");
        local label =img_num_bg_1:getChildByName("number");
        local string = label:getString();
        local number = math.floor(tonumber(string));
        sum = sum + number;
        if sum >= disnumber*2 + 30 then
            break;
        end
    end
    return sourceSet;
end

--找到一个病毒数最少的敌人细胞
function GameSceneLayer:getWeekestEnemy(play_index)
    local index = nil;
    local tNumber = 10000;
    for i= 1,pointNumber do
        if self:isMe(cell_imgs[i]:getTag()) then
            local img_num_bg = cell_imgs[i]:getChildByName("img_num_bg");
            local label = img_num_bg:getChildByName("number");
            local numberString = label:getString();
            local number = tonumber(numberString);
            if number < tNumber then
                index = i;
                tNumber = number;
            end
        end
    end
    return index;
end

--在己方的细胞中随机找到一个细胞
function GameSceneLayer:getRandomSelfACellIndex(index)
    local mycell = {};
    for i= 1,pointNumber do
        if cell_imgs[i]:getTag() == index then
            mycell[#mycell+1] = i;
        end
    end
    local r = self:seededRandom(1,#mycell+1);
    return mycell[r];
end


--通过据点索引获得该据点的分裂速度
function GameSceneLayer:getSpeed(index,level)
    if self:isMe(index) then
        return  tower_config[current_tower_skin].speed;
    else
        return self:getEnemySpeed(index,level)
    end
end

--通过据点索引和关卡索引获得敌人的分裂速度
function GameSceneLayer:getEnemySpeed(index,level)
    return config[index].speed + level*0.005;
end

--通过据点据点索引和关卡获得敌人的生命上限
function GameSceneLayer:getEnemyMaxHealth(index,level)
    return config[index].life + level*5;
end

--通过据点索引获得该据点的生命值上限
function GameSceneLayer:getMaxHealth(index,level)
    if self:isMe(index) then
            return tower_config[current_tower_skin].life;
    else
        return self:getEnemyMaxHealth(index,level)
    end
end

--设置关卡模式的各个据点位置
function GameSceneLayer:setLevelPosition()
    for i= 1,levelConfig[level].pointNumber do
        local node = node_ball:getChildByName("node_"..i);
        node:setPosition(cc.p(levelPosition[level][i].x,levelPosition[level][i].y));
    end
end

--初始化颜色
function GameSceneLayer:initColor()
    --玩家自己的索引值
    color[1] = 1
    local t = {}
    for i=1,armyNumber do
        t[i] = i;
    end
    for i=1,armyNumber do
        local r = math.floor(self:seededRandom(1,armyNumber+1));
        t[i],t[r] = t[r],t[i];
    end
    for i=1,armyNumber do
        if t[i] == color[1] then
            table.remove(t,i);
            break;
        end
    end
    for i= 1,#t do
        color[i+1] = t[i];
    end
end

--初始画选择环
function GameSceneLayer:initSelectRing()
    if #rings == 0 then
        for i= 1,12 do
            local node = node_ball:getChildByName("node_"..i);
            rings[i] = ccui.ImageView:create("dynamic/circle.png");
            rings[i]:setPosition(cell_imgs[i]:getParent():convertToWorldSpace(cc.p(cell_imgs[i]:getPositionX(),cell_imgs[i]:getPositionY())))
            rings[i]:setPositionX(rings[i]:getPositionX() - (display.width-1280)/2);
            rings[i]:setVisible(false);
            rings[i]:setScale(0.6);
            node_draw:addChild(rings[i]);
        end
    else
        for i= 1,12 do
            rings[i]:setPosition(cell_imgs[i]:getParent():convertToWorldSpace(cc.p(cell_imgs[i]:getPositionX(),cell_imgs[i]:getPositionY())))
            rings[i]:setPositionX(rings[i]:getPositionX() - (display.width-1280)/2);
            rings[i]:setVisible(false);
        end
    end
end

--初始化据点
function GameSceneLayer:initPoint()
    if #cell_imgs == 0 then
        for i = 1,12 do
            local node = node_ball:getChildByName("node_"..i)
            if i <= armyNumber then
                cell_imgs[i] = ccui.ImageView:create()
                cell_imgs[i]:setTag(color[i])
                cell_imgs[i]:loadTexture(self:getColorImageBase(color[i]));

                local img_num_bg = ccui.ImageView:create("dynamic/img_label.png")
                img_num_bg:setAnchorPoint(cc.p(0.5,0.5));
                img_num_bg:setName("img_num_bg");
                img_num_bg:setPosition(cc.p(cell_imgs[i]:getContentSize().width/2,0));

                local numberlabel = cc.Label:createWithTTF("100","dynamic/font.ttf", 20);
                numberlabel:setAnchorPoint(cc.p(0.5,0.5));
                numberlabel:setName("number");
                numberlabel:setPosition(cc.p(img_num_bg:getContentSize().width/2,img_num_bg:getContentSize().height/2));
                numberlabel:enableOutline(cc.c4b(0,0,0,255), 2)
                cell_imgs[i]:addChild(img_num_bg)
                img_num_bg:addChild(numberlabel)

                local hidenumber =  ccui.Text:create("0", "", 22);
                hidenumber:setName("hideNumber");
                hidenumber:setVisible(false);
                cell_imgs[i]:addChild(hidenumber)

            else
                cell_imgs[i]  = ccui.ImageView:create("dynamic/small_empty.png");
                cell_imgs[i]:setTag(0);

                local img_num_bg = ccui.ImageView:create("dynamic/img_label.png")
                img_num_bg:setAnchorPoint(cc.p(0.5,0.5));
                img_num_bg:setPosition(cc.p(cell_imgs[i]:getContentSize().width/2,0));
                img_num_bg:setName("img_num_bg");

                local numberlabel = cc.Label:createWithTTF("0", "dynamic/font.ttf", 20);
                numberlabel:setAnchorPoint(cc.p(0.5,0.5));
                numberlabel:setName("number");
                numberlabel:setPosition(cc.p(img_num_bg:getContentSize().width/2,img_num_bg:getContentSize().height/2));
                numberlabel:enableOutline(cc.c4b(0,0,0,255), 2);
                numberlabel:setVisible(true);
              
                cell_imgs[i]:addChild(img_num_bg)
                img_num_bg:addChild(numberlabel)

                local hidenumber =  ccui.Text:create("0", "", 22);
                hidenumber:setName("hideNumber");
                hidenumber:setVisible(false);
                cell_imgs[i]:addChild(hidenumber)
               
                if i > pointNumber then
                    cell_imgs[i]:setVisible(false);
                else
                    cell_imgs[i]:setVisible(true);
                end
            end
            cell_imgs[i]:setPosition(cc.p(cell_imgs[i]:getContentSize().width/2,cell_imgs[i]:getContentSize().height/2)); 
            node:addChild(cell_imgs[i]);
        end
    else
        for i = 1,12 do
            if i <= armyNumber then
                cell_imgs[i]:setTag(color[i]);                        
                cell_imgs[i]:loadTexture(self:getColorImageBase(color[i]));
                local numberlabel = cell_imgs[i]:getChildByName("number");
                numberlabel:setString(""..100);
                numberlabel:setVisible(true);
                local text = cell_imgs[i]:getChildByName("hideNumber");
                if isRandom then
                    text:setString(""..math.random(50,300));
                else
                    text:setString("100");
                end
            else
                cell_imgs[i]:loadTexture("dynamic/small_empty.png");
                cell_imgs[i]:setTag(0);
                local numberlabel = cell_imgs[i]:getChildByName("number");
                numberlabel:setString(""..0);
                numberlabel:setVisible(false);
                local text = cell_imgs[i]:getChildByName("hideNumber");
                text:setString(""..0);
                if i > pointNumber then
                    cell_imgs[i]:setVisible(false);
                else
                    cell_imgs[i]:setVisible(true);
                end
            end
        end
    end
end

--通过颜色值获得颜色图片
function GameSceneLayer:getColorImageBase(index)
    if self:isMe(index) then
        return "skin/tower_skin/"..current_tower_skin..".png";
    else
        if index == 2 then
            return "dynamic/icon/1.png";
        elseif index == 3 then
            return "dynamic/icon/2.png";
        elseif index == 4 then
            return "dynamic/icon/3.png";
        end
    end
end

--是否是自己
function GameSceneLayer:isMe(index)
    return index == color[1]
end

function GameSceneLayer:checkGameOver()
    local number = 0;
    --没有我的颜色的病毒-失败
    for i=1,pointNumber do 
        if cell_imgs[i]:getTag() == color[1] then
            number = number +1
        end
    end
    if (number == 0)  then
        return 0
    end
  
     --只有我的颜色的病毒-胜利
     local otherColor = 0;
     for i=1,pointNumber do 
         if (cell_imgs[i]:getTag() ~= color[1])  and (cell_imgs[i]:getTag() ~= 0)  then
             otherColor = otherColor +1
         end
     end
     if otherColor == 0 then
         return 1;
     end
    return -1
end

function GameSceneLayer:onExit()
	self:clearTimerHander()
end

function GameSceneLayer:gotoStart()
	global.viewController.gotoView("start")
end

function GameSceneLayer:gotoResult(num)
    local data = {
        isWin = num==1,
        currnet_level = level
    }
    if num == 1  then
        global.viewData.setCoin(global.viewData.getCoin() + level*10)
    end
    
    if num == 1 then
        level = level + 1
        if level<= 15 then
            global.viewData.setLevel(level)
        end
    end
   
	global.viewController.gotoView("result",data)
end

return GameSceneLayer
