local GameStartLayer = class("GameStartLayer", cc.load("mvc").ModuleBase)
GameStartLayer.RESOURCE_FILENAME = "start/Start_Layer.lua"

function GameStartLayer:onCreate(_data)
	self.mView["btn_start"]:ignoreContentAdaptWithSize(true)
    self.data = _data
    self.mView["role"]:ignoreContentAdaptWithSize(true)
    local panel_top_btn = require("logic/views/GameStart/TopButton").new(self,self.data.btnInfo)
    global.async.delay(0.1):Then(function()
        self:showPaoMaDeng("适度游戏益脑,沉迷游戏伤身,合理安排时间,享受健康生活")
    end)
end

function GameStartLayer:showPaoMaDeng(txt, dt, callback)
    local Tips = 10
    local layer = global.viewMgr.getLayer(Tips)
    dt = dt or 6;
    local wrap = cc.Node:create()
    local str = display.width > display.height and "heng" or "shu"
    local path = "common/bar/" .. str .. math.random(1, 5) .. ".png"
    local sprImage = ccui.ImageView:create(path)
    local sprImageSize = sprImage:getContentSize()
    wrap:addChild(sprImage)
    local sprBg = ccui.Layout:create()
    sprBg:setAnchorPoint(cc.p(0.5, 0.5))
    sprBg:setBackGroundColorType(ccui.LayoutBackGroundColorType.solid);
    sprBg:setBackGroundColor(cc.c3b(128, 128, 128))
    sprBg:setOpacity(0)
    local label = cc.Label:createWithSystemFont(txt, "", 20)
    label:setColor(cc.c3b(240, 225, 24))
    label:setAnchorPoint(cc.p(0, 0.5))
    local labelSize = label:getContentSize()
    sprBg:setContentSize(sprImageSize.width - 50, labelSize.height)
    sprBg:setClippingEnabled(true)
    wrap:addChild(sprBg)
    sprBg:addChild(label)
    wrap:setPosition(display.cx, display.height - 140)
    layer:addChild(wrap)

    local count = 10000
    local checkCount = nil

    local sprSize = sprBg:getContentSize()
    local function action()
        label:setPosition(sprSize.width, labelSize.height / 2)
        label:runAction(
        cc.Sequence:create(
        cc.MoveBy:create(dt, cc.p(-sprSize.width - labelSize.width, 0)),
        cc.CallFunc:create(checkCount)
        )
        )
    end

    checkCount = function()
        if count > 0 then
            action()
            count = count - 1
        else
            if callback then
                callback()
            end
            wrap:removeFromParent()
        end
    end

    checkCount()
end

function GameStartLayer:onbtn_startClick()
    global.viewController.gotoView("select")
end



return GameStartLayer