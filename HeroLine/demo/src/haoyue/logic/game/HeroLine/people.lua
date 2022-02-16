local people = class("people")

local peopleSizeWidth = 120                                                                    --人物宽度
local peopleSizeHeight = 110                                                                   --人物高度
local peopleCoordinateX = 150 + peopleSizeWidth/ 2                                             --第一个人物的X坐标
local peopleCoordinateY = 50 + peopleSizeHeight/ 2                                             --第一个人物的Y坐标
local peopleOffsetY = 200                                                                      --人物生成时Y坐标偏移量
local peopleWeight = 500                                                                       --人物重量，也就是下坠速度
local peopleNumber = 5                                                                         --所有人物的种类数量

--创建人物
function people:createPeople(i, j)
    local index = math.random(0, peopleNumber - 1)
    local peopleSprite = ccui.ImageView:create()
    peopleSprite:loadTexture("game/HeroLine/image/people/0"..index..".png", 0)
    -- peopleSprite:ignoreContentAdaptWithSize(false);
    -- peopleSprite:setContentSize(100, 100);
    peopleSprite.x = (i - 1) * peopleSizeWidth+ peopleCoordinateX
    peopleSprite.y = (j - 1) * peopleSizeHeight+ peopleCoordinateY
    peopleSprite:setPosition(peopleSprite.x, peopleSprite.y + peopleOffsetY)
    peopleSprite.i = i
    peopleSprite.j = j
    peopleSprite.type = index
    peopleSprite.selectedStatus = false
    local action = cc.Sequence:create(
        cc.MoveBy:create(peopleCoordinateY/ peopleWeight, cc.p(0, -1 * peopleOffsetY))
    )
    peopleSprite:runAction(action)
    return peopleSprite
end

--判断是否被选中
function people:judgeSelected(newPeople, point)
    local bool = cc.rectContainsPoint(newPeople:getBoundingBox(), point)
    return bool
end

--消除时下移动动画
function people:moveDownAnimation(newPeople, j)
    local action = cc.Sequence:create(
        cc.MoveBy:create((newPeople.j - j) * peopleSizeHeight/ peopleWeight, cc.p(0, (newPeople.j - j) * peopleSizeHeight* -1))
    )
    newPeople.y = (j - 1) * peopleSizeHeight+ peopleCoordinateY
    newPeople:runAction(action)
end

--创建新人物
function people:createNewPeople(i, j)
    local index = math.random(0, peopleNumber - 1)
    local peopleSprite = ccui.ImageView:create()
    peopleSprite:loadTexture("game/HeroLine/image/people/0"..index..".png", 0)
    -- peopleSprite:ignoreContentAdaptWithSize(false);
    -- peopleSprite:setContentSize(100, 100);
    peopleSprite.x = (i - 1) * peopleSizeWidth+ peopleCoordinateX
    peopleSprite.y = (j - 1) * peopleSizeHeight+ peopleCoordinateY
    peopleSprite:setPosition(peopleSprite.x, peopleSprite.y + display.height)
    peopleSprite.i = i
    peopleSprite.j = j
    peopleSprite.type = index
    peopleSprite.selectedStatus = false
    local action = cc.Sequence:create(
        cc.MoveBy:create(display.height / peopleWeight - 0.6, cc.p(0, -1 * display.height))
    )
    peopleSprite:runAction(action)
    return peopleSprite
end


--创建机器人
function people:createRobot(position)
    local peopleSprite = ccui.ImageView:create()
    local index = math.random(1, 3)
    peopleSprite:loadTexture("game/HeroLine/image/people/0" .. index .. ".png", 0)
    peopleSprite:setPosition(position:getPositionX(), position:getPositionY() + peopleOffsetY)
    peopleSprite.JumpLock = false
    return peopleSprite
end

--人物跳跃
function people:peopleJump(peopleSprite, endPosition, event)
    if peopleSprite.JumpLock then
        return 
    end
    local action = cc.Sequence:create(
        CCCallFuncN:create(function()
            peopleSprite.JumpLock = true  
            print("开始跳")
        end),
        cc.JumpTo:create(people.peopleJumpTime, cc.p(endPosition:getPositionX(), endPosition:getPositionY() + peopleOffsetY), 50, 1),
        CCCallFuncN:create(function()
            event()
            print("跳完了")
        end),
        cc.DelayTime:create(people.peopleJumpStiffTime),
        CCCallFuncN:create(function()
            peopleSprite.JumpLock = false
            print("僵硬结束")
        end)
    )
    peopleSprite:runAction(action)
end

return people