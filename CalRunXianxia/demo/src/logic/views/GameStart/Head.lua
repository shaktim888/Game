local Head = class("Head")

function Head:ctor(parent)
    local scene = require("start/Head.lua").create()
    local root = scene.root
    self:initPlayerInfo(root)
    parent:addChild(root)
    root:setAnchorPoint(cc.p(0,1))
    root:setPosition(0, display.height)
end

function Head:initPlayerInfo(root)
    local  _aSaveInfo = global.saveTools.getData(global.viewData.PLAYER_INFO_SAVE_TO_LOCAL) or {}
    if _aSaveInfo.sex and _aSaveInfo.name then
        root:getChildByName("headImage"):loadTexture(_aSaveInfo.headImage)
        root:getChildByName("playerName"):setString(_aSaveInfo.name)
    end
end

return Head