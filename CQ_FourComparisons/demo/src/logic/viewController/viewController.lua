local viewController = class("viewController")
local viewConfig = import(".viewConfig")

function viewController.gotoView(viewName,viewData)
	-- if viewName == "game" then
	
	-- end
    if viewConfig[viewName] then
		local luaFilePath = viewConfig[viewName].luaFilePath
		local data = viewConfig[viewName].data
		if  viewData  then
			data = viewData
		end
		local view = require(luaFilePath).new(nil,nil,data)
        if viewConfig[viewName].isScene then
			view:showWithScene()
		elseif viewConfig[viewName].isIPAGame then
			local runScene = display.getRunningScene()
			local scene = require(luaFilePath)
			scene:create():addTo(runScene)
		else
			local scene = display.getRunningScene()
			scene:addChild(view)
			view:setName(viewName)
		    viewController.showAction(view)
        end
    end
end

-- 打开界面
function viewController.showAction(layer,time)
	if(time == nil or time == 0)then
		time = 0.33
	end
	
	if layer.mLayout then
		layer.mLayout:setAnchorPoint(cc.p(0.5,0.5))
		layer.mLayout:ignoreAnchorPointForPosition(true)
		layer.mLayout:setScale(0.1)
		local scaleAction = cc.ScaleTo:create(time, 1, 1)
		local seq = cc.Sequence:create(cc.EaseBackOut:create(scaleAction))
	    layer.mLayout:runAction(seq)
	end
end

-- 关闭界面
function viewController.closeAction(layer, time)
	if(time == nil or time == 0)then
		time = 0.33
	end
	print("关闭界面动画"..time)
	layer:setScale(1);
    local scaleAction = cc.ScaleTo:create(time, 0.1);
    local actionSequence = cc.Sequence:create(cc.EaseBackIn:create(scaleAction), cc.CallFunc:create(function()
		layer:removeFromParent(true);
	end));
    layer.mLayout:runAction(actionSequence);
end

return viewController