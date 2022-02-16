 
local LayerConfig ={}



LayerConfig.select={
    data = {},
    luaFilePath = "logic.views.GameSelect.Enter",
    isScene = true
}

LayerConfig.help={
    data = {
        content = nil,
    },
    luaFilePath = "logic.views.GameRule.Enter",
    isScene = false
}

LayerConfig.start= {
    data = {
        btnInfo= {
                --设置按钮
                [1] ={
                    name = "btn_setting",
                    isExist =false,
                },
                --声音便捷按钮
                [2] = {
                    name = "btn_music",
                    isExist =true,
                },
                --公告按钮
                [3] = {
                    name = "btn_notice",
                    isExist =true,
                },
                --邮箱
                [4] = {
                    name = "btn_message",
                    isExist =true,
                },
                --背包
                [5] = {
                    name = "btn_bag",
                    isExist =false,
                },
                --活动
                [6] = {
                    name = "btn_active",
                    isExist =false,
                }
            }
    },
    luaFilePath = "logic.views.GameStart.Enter",
    isScene = true
}
LayerConfig.game= {
    data = {
        btnInfo= {
                --设置按钮
                [1] ={
                    name = "btn_setting",
                    isExist =false,
                },
                --声音便捷按钮
                [2] = {
                    name = "btn_music",
                    isExist =true,
                },
                --公告按钮
                [3] = {
                    name = "btn_notice",
                    isExist =false,
                },
                --邮箱
                [4] = {
                    name = "btn_message",
                    isExist =false,
                },
                --背包
                [5] = {
                    name = "btn_bag",
                    isExist =false,
                },
                --活动
                [6] = {
                    name = "btn_active",
                    isExist =false,
                },
                [7] = {
                    name = "btn_return",
                    isExist =true,
                },
            },
        headInfo = {
            isShow = false
        }
    },
    luaFilePath = "logic.views.GameScene.Enter",
    isScene = false,
    isIPAGame = true
}

return  LayerConfig
