local animation = class("animation")

function animation:createAnimation(point, score)
    local scoreLabel = ccui.Text:create()
    scoreLabel:setFontName("game/HeroLine/image/nvpk.ttf")
    scoreLabel:setFontSize(30)
    scoreLabel:setTextColor({r = 255, g = 255, b = 255})
    scoreLabel:setString("+10")
    scoreLabel:setPosition(point.x, point.y + 20)
    local action = cc.Sequence:create(
        cc.JumpBy:create(0.6, cc.p(100, 0), 100, 1),
        CCCallFuncN:create(function()
            scoreLabel:removeFromParent()
        end)
    )
    scoreLabel:runAction(action)
    return scoreLabel
end

return animation