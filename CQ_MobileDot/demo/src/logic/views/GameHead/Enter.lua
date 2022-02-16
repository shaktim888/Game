local Head = class("Head")

function Head:ctor(parent,widget)
    local scene = require("head/Head_Layer.lua").create()
    local root = scene.root
    self:initPlayerInfo(root)
    local whiteOffset = 50
    parent:addChild(root)
    root:setAnchorPoint(cc.p(0,1))
    root:setPosition(0, display.height + whiteOffset)
    local scoreText = root:getChildByName("scoreText")
    local x,y = scoreText:getPosition()
    local worldPos = root:convertToWorldSpace(cc.p(x,y))
    widget:setAnchorPoint(cc.p(0,0.5))
    widget:setPosition(worldPos)
    root:runAction(scene.animation)
    scene.animation:gotoFrameAndPlay(0, 45, true);
    if widget.setFntFile then
        widget:setFntFile("head/aa.fnt")
    else
        widget:setFontName("head/aa.TTF")
        widget:setFontSize(30)
        widget:setTextColor({r = 255, g = 165, b = 0})
        widget:enableOutline({r = 255, g = 0, b = 0, a = 255}, 1)
    end
end

function Head:initPlayerInfo(root)
    local  _aSaveInfo = global.saveTools.getData(global.viewData.PLAYER_INFO_SAVE_TO_LOCAL) or {}
    if _aSaveInfo.sex and _aSaveInfo.name then
        local job = _aSaveInfo.job
        local sex = _aSaveInfo.sex
        root:getChildByName("headImage"):loadTexture("select/job/head_"..job.."_"..sex..".png")
        root:getChildByName("nameText"):setString(_aSaveInfo.name)
    end
end

return Head