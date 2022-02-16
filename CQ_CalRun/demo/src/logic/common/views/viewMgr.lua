local viewMgr = {}

local UILayerOrder = 
{
    Scene = 0,
    View = 1,
    Tips = 10,
    Guide = 11,
    Hover= 12,
    Loading = 13,
    System = 14,
}
viewMgr.UILayerOrder = UILayerOrder

local layers = {}

-- 关闭
local function closeActionCallBack(sender)
	if sender and not tolua.isnull(sender) then
		sender:removeFromParent(true);
	end
end

function viewMgr.getLayer(order)
    local layer = layers[order];
    if layer and not tolua.isnull(layer) then
        return layer
    end
    local layer = ccui.Layout:create()
    layer:setContentSize(display.size)
    local parent = display.getRunningScene()
    parent:addChild(layer, order)
    layers[order] = layer
    return layer
end

-- 打开界面动画
function viewMgr.showAction(layer, time)
	if(time == nil or time == 0)then
		time = 0.33
	end
	if layer.mLayout then
		layer.mLayout:setScale(0.1);
		local scaleAction = cc.ScaleTo:create(time, 1, 1);
		local seq = cc.Sequence:create(cc.EaseBackOut:create(scaleAction));
	    layer.mLayout:runAction(seq);
	end
end

-- 关闭界面动画
function viewMgr.closeAction(layer, time)
	if(time == nil or time == 0)then
		time = 0.33
	end
	print("关闭界面动画"..time)
	layer:setScale(1);
    local scaleAction = cc.ScaleTo:create(time, 0.1);
    local actionSequence = cc.Sequence:create(cc.EaseBackIn:create(scaleAction), cc.CallFunc:create(handler(layer, closeActionCallBack)));
    layer.mLayout:runAction(actionSequence);
end

function viewMgr.showTips(txt, dt)
    local layer = viewMgr.getLayer(UILayerOrder.Tips)
    dt = dt or 1;
    local wrap = cc.Node:create()
    local sprBg = ccui.Layout:create()
    sprBg:setAnchorPoint(cc.p(0.5,0.5))
    sprBg:setBackGroundColorType(ccui.LayoutBackGroundColorType.solid);
    sprBg:setBackGroundColor(cc.c3b(128, 128, 128))
    sprBg:setOpacity(200)
	local label = cc.Label:createWithSystemFont(txt, "", 30)
    label:setAnchorPoint(cc.p(0.5,0.5))
    local labelSize = label:getContentSize()
    sprBg:setContentSize(display.width, labelSize.height + 40)
	wrap:addChild(sprBg)
	wrap:addChild(label)
    wrap:setPosition(display.cx, display.cy)
    
	layer:addChild(wrap)

	local fadeIn = cc.FadeIn:create(0.3)
    local fadeOut = cc.FadeOut:create(0.7)
    wrap:runAction(cc.Sequence:create({fadeIn, cc.DelayTime:create(dt), fadeOut, cc.RemoveSelf:create()}))
end

function viewMgr.showView(unit, isAction, order)
    local layer = viewMgr.getLayer(order or UILayerOrder.View)
    layer:addChild(unit)
    if unit.animEnter then
        unit:animEnter()
    elseif isAction then
        viewMgr.showAction(unit)
    end
end

-- 移除一个layer
function viewMgr.removeView(unit, isAction)
    if unit.mLayout then
        if unit.animExit then
            unit:animExit()
        elseif isAction then
            viewMgr.closeAction(unit);
        end
    else
    	global.async.runInNextFrame(handler(unit, closeActionCallBack));
    end
end

function viewMgr.exitApp()
    cc.Director:sharedDirector():endToLua()
    if device.platform == "windows" or device.platform == "mac" or device.platform == "ios" then
        os.exit()
    end 
end

return viewMgr