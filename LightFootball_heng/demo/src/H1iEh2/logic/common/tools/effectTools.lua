local actionTools = {}
-- 把常用的action放到这里

-- 翻牌的效果
function actionTools.flopCard(bgCard, card)
    local rotateOut = cc.OrbitCamera:create(0.1, 1, 0, 0, 90, 0, 0)
    local rotateIn =  cc.OrbitCamera:create(0.1, 1, 0, 180 -90, -90, 0, 0)
    bgCard:setVisible(true)
    local function afterMoveCall()
        bgCard:setVisible(false)
    end
    local function afterCall()
        if card then
            card:setVisible(true)
        end
    end
    local actCall = cc.CallFunc:create(afterMoveCall)
    local cardActCall = cc.CallFunc:create(afterCall)
    local seq_1 = cc.Sequence:create(rotateOut, actCall)
    local seq_2 = cc.Sequence:create(cc.DelayTime:create(0.1), cardActCall, rotateIn)
    bgCard:runAction(seq_1)
    card:runAction(seq_2)
end

function actionTools.createTextFloatAction(parent_node_, pos_, str_, move_pos_, color_)
    
    local text_widget = ccui.Text:create()
    text_widget:ignoreContentAdaptWithSize(true)
    text_widget:setFontSize(22)
    text_widget:setString(str_)
    parent_node_:addChild(text_widget)
    text_widget:setTextColor(color_ or {r=255, g=0, b=0})
    text_widget:setPosition(pos_)

    -- print("createTextFloatAction ================= ")

    local action_time = 1.5
    text_widget:runAction(
        cc.Sequence:create(
            cc.Spawn:create(
                cc.MoveBy:create(action_time, move_pos_),
                cc.FadeOut:create(action_time)
            ),
            cc.CallFunc:create(function ()
                text_widget:removeFromParent()
            end)
        )
    )
end

return actionTools