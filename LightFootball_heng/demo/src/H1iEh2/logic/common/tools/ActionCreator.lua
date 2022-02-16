local ActionCreator = {}

--[[    
    创建列表的抖动动画
]]
function ActionCreator.listSideInShakeAction(list_, shake_dir_, end_cb_, max_item_num_)
    assert(list_, "ActionCreator.listSideInShakeAction param invalid!")

    if list_.__in_fade_ani then 
        return 
    end
    list_.__in_fade_ani = true

    list_:doLayout()
    local dir = list_:getDirection()
    
    local seconds, delta_seconds = 0.9, 0.04
    local offset = 250

    local item_l = list_:getItems()
    local total_time = seconds + delta_seconds * #item_l
    for k, v in pairs(item_l) do
        local x, y = v:getPosition()

        local moveAction = cc.EaseElasticOut:create(cc.MoveTo:create(seconds, cc.p(x, y)), 0.5)
        local delay = cc.DelayTime:create(delta_seconds * k)
        if dir == 1 then
            if shake_dir_ ~= 1 then
                v:setPositionX(x + offset)
            else
                v:setPositionY(y + offset)
            end
            v:runAction(cc.Sequence:create(delay, moveAction))
        else
            -- 列表为纵向的时候 下一帧才会dolayout
            local func = cc.CallFunc:create(function ()
                if shake_dir_ ~= 1 then
                    v:setPositionX(x + offset)
                else
                    v:setPositionY(y + offset)
                end
            end)
            v:runAction(cc.Sequence:create(func, delay, moveAction))
        end

        if max_item_num_ and max_item_num_ <= k then 
            total_time = seconds + delta_seconds * max_item_num_
            break
        end
    end

    list_:setVisible(true)
    local endAction = cc.Sequence:create(
        cc.DelayTime:create(total_time),
        cc.CallFunc:create(function ()
            list_.__in_fade_ani = false
            if end_cb_ and type(end_cb_) == "function" then
                end_cb_()
            end
        end)
    )
    list_:runAction(endAction)
end

-- function ActionCreator.createTextFloatAction(parent_node_, pos_, str_, move_pos_)
    
--     local text_widget = ccui.Text:create()
--     text_widget:ignoreContentAdaptWithSize(true)
--     text_widget:setFontSize(22)
--     text_widget:setString(str_)
--     parent_node_:addChild(text_widget)
--     text_widget:setTextColor({r=255, g=0, b=0})
--     text_widget:setPosition(pos_)

--     print("createTextFloatAction ================= ")

--     local action_time = 1.5
--     text_widget:runAction(
--         cc.Sequence:create(
--             cc.Spawn:create(
--                 cc.MoveBy:create(action_time, move_pos_),
--                 cc.FadeOut:create(action_time)
--             ),
--             cc.CallFunc:create(function ()
--                 text_widget:removeFromParent()
--             end)
--         )
--     )
-- end

return ActionCreator