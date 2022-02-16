local people = class("people")

people.peopleJumpTime = 0.5                                                                 --机器人和人物跳跃一次需要的时间
people.peopleJumpStiffTime = 0.2                                                            --人物跳跃后僵硬时间
people.peopleJumpTimeInterval = 2 + people.peopleJumpTime + people.peopleJumpStiffTime      --机器人跳跃时间间隔
people.peopleOffsetY = 35                                                                   --同一格地图，人物在Y坐标相比地图块向上偏移量

--创建人物
function people:createPeople(position)
    local  peopleSprite = ccui.ImageView:create()
    peopleSprite:loadTexture("game/MountaintopJumps/image/people/00.png", 0)
    peopleSprite:setPosition(position:getPositionX(), position:getPositionY() + people.peopleOffsetY)
    peopleSprite.JumpLock = false
    return peopleSprite
end

--创建机器人
function people:createRobot(position)
    local peopleSprite = ccui.ImageView:create()
    local index = math.random(1, 3)
    peopleSprite:loadTexture("game/MountaintopJumps/image/people/0" .. index .. ".png", 0)
    peopleSprite:setPosition(position:getPositionX(), position:getPositionY() + people.peopleOffsetY)
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
            --print("开始跳")
        end),
        cc.JumpTo:create(people.peopleJumpTime, cc.p(endPosition:getPositionX(), endPosition:getPositionY() + people.peopleOffsetY), 50, 1),
        CCCallFuncN:create(function()
            event()
            --print("跳完了")
        end),
        cc.DelayTime:create(people.peopleJumpStiffTime),
        CCCallFuncN:create(function()
            peopleSprite.JumpLock = false
            --print("僵硬结束")
        end)
    )
    peopleSprite:runAction(action)
end

return people