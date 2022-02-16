
--[[
	动画精灵类
]]
local AnimationSprite = class("AnimationSprite")

-- 初始化属性
function AnimationSprite:initVars_()

    ------私有变量---------

    -- 点击精灵
    self.clickSprite_ = nil;
    -- 精灵初始位置
    self.spriteX_ = 0;
    self.spriteY_ = 0;
    -- 层级
    self.zorder_ = 1;
    -- 动作精灵
    self.actSprite_ = nil;
    -- 动作文件
    self.action_ = nil;

    -- 是否在播放摇动
    self.playedShake_ = false;

    -- 碰撞盒子偏移
    self.offsetBoundingBox_ = nil;
    

    ------公有变量---------
    --精灵名字
    self.name = "";
    -- 是否可点击
    self.clicked = false;
    -- 当前播放动作名字
    self.curActName = "";
    -- 动画是否在播放，这个为外部设置属性
    self.actRuned = false;
end


function AnimationSprite:ctor(node)
    -- 定义属性-----
    self:initVars_();

    -- 初始化UI
    self:initUI_(node);

end

------------私有方法----------------------

-- 初始化UI node UI里的精灵
function AnimationSprite:initUI_(node)
    -- 点击精灵
    self.clickSprite_ = node;
    self.spriteX_,self.spriteY_ = self.clickSprite_:getPosition();
    self.zorder_ = self.clickSprite_:getLocalZOrder();
    self.clicked = false;
    
    self.name = node:getName();

    -- 获取动作精灵
    local children = node:getChildren();
    self.actSprite_ = children[1];
    if self.actSprite_ then
        local name = self.actSprite_:getName();
        local names = string.split(name, "_");
        if EXPORT_TEXTURE_MODE == ".lua" then
            self.action_ = self.actSprite_.animation;
            -- lua导出文件场景和层已经调用了，这里不能再调用runAction()
            --self.action_:setTimeSpeed(0.5);
        else
            -- 1动作文件名字，如果是csb文件加载动作
            local actName = names[1];
            for i=2,table.nums(names) do
                actName = "/"..names[i];
            end
            actName = actName..EXPORT_TEXTURE_MODE;
            self.action_ = cc.CSLoader:createTimeline(actName);
            self.actSprite_:runAction(self.action_);
            --self.action_:setTimeSpeed(0.5);
        end

        -- 默认播放动作1
        local loop = false;
        local info = self.action_:getAnimationInfo("act1");
        if info.startIndex ~= info.endIndex then loop = true end
        self.action_:play("act1",loop);
    end
end

--------------公有方法--------------------

--[[
    点击播放动作
    @param actName:动作名字
    @param playTime:播放次数
]]

function AnimationSprite:clickPlayAct(actName,playTime)
    if self.action_ then
        -- if DEBUG > 0 then
        --     print("AnimationSprite:clickPlayAct(actName,playTime)",self.name,actName,playTime);
        -- end
        -- 切换动作，先把上次的帧音效停掉
        -- 先停掉上次没有播放完的音效
        if self.frameSoundId_ ~= -1 then
            Music.stopEffect(self.frameSoundId_);
            self.frameSoundId_ = -1;
        end
    	-- 播放动作
        self.frameActPlayed_ = false;
        local loop = false;
        if playTime == 0 then loop = true end
        -- 当前播放的动作名字
        self.curActName = actName;
        self.action_:play(actName,loop);
    end
end

cc.exports.clickPlayAct = clickPlayAct;
--[[
    停止播放动作
]]
function AnimationSprite:stop()
    if self.action_ then
        self.action_:stop();
    end
end

--[[
    按帧频播放动作
    @param beganFrame 开始帧
    @param endFrame 结束帧
    @param playTime 播放次数
]]
function AnimationSprite:gotoFrameAndPlay(beganFrame,endFrame,playTime)
    if self.action_ then
        -- 切换动作，先把上次的帧音效停掉
        -- 先停掉上次没有播放完的音效
        if self.frameSoundId_ ~= -1 then
            Music.stopEffect(self.frameSoundId_);
            self.frameSoundId_ = -1;
        end
        -- 播放动作
        self.frameActPlayed_ = false;
        local loop = false;
        if playTime == 0 then loop = true end
        self.action_:gotoFrameAndPlay(beganFrame, endFrame, loop)
    end
end

--[[
    获取位置
]]
function AnimationSprite:getPosition()
    return self.clickSprite_:getPosition();
end

--[[
    设置位置
    @param x x坐标
    @param y y坐标
]]
function AnimationSprite:setPosition(x,y)
    self.clickSprite_:setPosition(x,y);
end

--[[
    改变初始位置
    @param x x坐标
    @param y y坐标
]]
function AnimationSprite:changeBeganPosition(x,y)
    self.spriteX_ = x;
    self.spriteY_ = y;
end

--[[
    获得大小尺寸
]]
function AnimationSprite:getContentSize()
    return self.clickSprite_:getContentSize();
end

--[[
    设置尺寸
    @param size cc.size
]]
function AnimationSprite:setContentSize(size)
    self.clickSprite_:setContentSize(size);
end

--[[
    获取骨骼
    @param name 骨骼名字
]]
function AnimationSprite:getBoneByName(boneName)
    return self.actSprite_:getChildByName(boneName);
end

--[[
    获取骨骼里面的精灵
    @param name 骨骼名字
    @param spriteName 精灵名字
]]
function AnimationSprite:getBoneSpriteByName(boneName,spriteName)
    local bone = self.actSprite_:getChildByName(boneName);
    return bone:getChildByName(spriteName);
end

--[[
    设置缩放
    @param scaleX 缩放
    @param scaleY 缩放
]]
function AnimationSprite:setScale(scaleX,scaleY)
    if not scaleY then scaleY = scaleX end
    self.clickSprite_:setScaleX(scaleX);
    self.clickSprite_:setScaleY(scaleY);
end

--[[
    获取缩放
]]
function AnimationSprite:getScale()
    local scaleX = self.clickSprite_:getScaleX();
    local scaleY = self.clickSprite_:getScaleY();
    return scaleX,scaleY;
end

--[[
    返回父坐标系中的一个AABB
]]
function AnimationSprite:getBoundingBox()
    local boundingBox = self.clickSprite_:getBoundingBox();
    if self.offsetBoundingBox_ then
        boundingBox.x = boundingBox.x - self.offsetBoundingBox_.x;
        boundingBox.y = boundingBox.y - self.offsetBoundingBox_.y;
        boundingBox.width = boundingBox.width - self.offsetBoundingBox_.width;
        boundingBox.height = boundingBox.height - self.offsetBoundingBox_.height;
    end
   return boundingBox;
end

--[[
    设置碰撞盒子偏移
    @param rect 矩形
]]
function AnimationSprite:setBoundingBoxOffset(rect)
    self.offsetBoundingBox_ = rect;
end

--[[
    设置层级
    @param zorder 层级
    @param changeBegan 是否改变层级的初始值
]]
function AnimationSprite:setZorder(zorder,changeBegan)
    self.clickSprite_:setLocalZOrder(zorder);
    if changeBegan then
        self.zorder_ = zorder;
    end
end

--[[
    返回初始位置
]]
function AnimationSprite:returnBeginPos()
    self:moveTo(self.spriteX_, self.spriteY_, 0.2,function()
        -- 反弹完成设为初始层级
        self:setZorder(self.zorder_);
    end);
end

--[[
    设置到初始位置
]]
function AnimationSprite:setBeginPos()
    self:setPosition(self.spriteX_, self.spriteY_);
end

--[[
    晃动
    @param callback 执行完成后回调
]]
function AnimationSprite:shake(callback)
    if not self.playedShake_ then
        self.playedShake_ = true;
        local rotation = self.clickSprite_:getRotation();
        self:rotateTo(rotation-10, 0.1,function()
            self:rotateTo(rotation+10, 0.1,function()
                self:rotateTo(rotation, 0.2,function()
                    self.playedShake_ = false;
                    if callback then callback()end
                end);
            end);
        end);
    end
end

--[[
    设置透明度
    @param opacity 透明度
]]
function AnimationSprite:setOpacity(opacity)
    self.clickSprite_:setOpacity(opacity);
end

--[[
    透明度动画
    @param began 开始时候透明度
    @param finish 结束时候的透明度
    @param time 执行时间
    @param callback 执行完成后回调
]]
function AnimationSprite:alphaAction(began,finish,time,callback)
    if DEBUG > 0 then
        print("AnimationSprite:alphaAction(began,finish,time,callback)",began,finish,time)
    end
    self.clickSprite_:show();
    self.clickSprite_:setOpacity(began);
    transition.execute(self.clickSprite_, cc.FadeTo:create(time, finish), {
        onComplete = function()
            if callback then callback()end
        end,
    })
end

--[[
    移动到
    @param x x坐标
    @param y y坐标
    @param time 执行时间
    @param callback 执行完成后回调
]]
function AnimationSprite:moveTo(x,y,time,callback)
    if not time then time = 1 end
    transition.execute(self.clickSprite_, cc.MoveTo:create(time, cc.p(x,y)), {
        onComplete = function()
            if callback then callback() end
        end,
    })
end

--[[
    延时
    @param time 执行时间
    @param callback 执行完成后回调
]]
function AnimationSprite:delayTime(time,callback)
    if not time then time = 1 end
    transition.execute(self.clickSprite_, cc.DelayTime:create(time), {
        onComplete = function()
            if callback then callback() end
        end,
    })
end

function AnimationSprite:bezierTo(x,y,cx,cy,time,callback)
    if not time then time = 1 end
    local bezier ={
        cc.p(cx, cy),
        cc.p(cx, cy),
        cc.p(x, y)
    }

    transition.execute(self.clickSprite_, cc.BezierTo:create(time, bezier), {
        onComplete = function()
            if callback then callback() end
        end
    });
end

--[[
    旋转到
    @param rotation 角度
    @param time 执行时间
    @param callback 执行完成后回调
]]
function AnimationSprite:rotateTo(rotation,time,callback)
    if not time then time = 1 end
    transition.execute(self.clickSprite_, cc.RotateTo:create(time, rotation), {
        onComplete = function()
            if callback then callback() end
        end,
    })
end

--[[
    设置角度
    @param rotation 角度
]]
function AnimationSprite:setRotation(rotation)
    self.clickSprite_:setRotation(rotation);
end

--[[
    获取角度
]]
function AnimationSprite:getRotation()
    return self.clickSprite_:getRotation();
end

--[[
    缩放到
    @param scaleX x缩放
    @param scaleY y缩放
    @param time 执行时间
    @param callback 执行完成后回调
]]
function AnimationSprite:scaleTo(scaleX,scaleY,time,callback)
    if not time then time = 1 end
    transition.execute(self.clickSprite_, cc.ScaleTo:create(time, scaleX, scaleY), {
        onComplete = function()
            if callback then callback() end
        end,
    })
end

--[[
    设置是否可点击
    @param clicked 是否可点击
]]
function AnimationSprite:setClicked(clicked)
    self.clicked = clicked;
    self.clickSprite_:setTouchEnabled(clicked);
end

--[[
    更新
    @param speedX x速度
    @param speedY y速度
    @param distance 距离
]]
function AnimationSprite:update(speedX,speedY,distance)
    local x,y = self.clickSprite_:getPosition();
    x = x + speedX;
    y = y + speedY;
    if x < self.spriteX_ + distance and x > self.spriteX_ - distance then
        self.clickSprite_:setPositionX(x);
    end

    if y < self.spriteY_ + distance and y > self.spriteY_ - distance then
        self.clickSprite_:setPositionY(y);
    end
end

--[[
    判断是否碰撞
    @param clickSprite 动作精灵
]]
function AnimationSprite:checkCollision(clickSprite)
    local clickSpriteRect = clickSprite:getBoundingBox();
    local thisRect = self:getBoundingBox();
    return cc.rectIntersectsRect(clickSpriteRect, thisRect);
end

--[[
    设置是否可裁剪
    @param enabled 是否可裁剪
]]
function AnimationSprite:setClippingEnabled(enabled)  
    self.clickSprite_:setClippingEnabled(enabled);
end

--[[
    获取点击精灵
]]
function AnimationSprite:getClickSprite()
    return self.clickSprite_;
end

--[[
    获取动作精灵
]]
function AnimationSprite:getActSprite()
    return self.actSprite_
end

--[[
    显示
]]
function AnimationSprite:show()
    self.clickSprite_:show();
end

--[[
    隐藏
]]
function AnimationSprite:hide()
    self.clickSprite_:hide();
end

return AnimationSprite;