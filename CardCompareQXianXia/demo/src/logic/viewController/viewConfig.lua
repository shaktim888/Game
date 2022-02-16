 
local LayerConfig ={}

LayerConfig.help={
    data = {},
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
                --帮助按钮
                [3] = {
                    name = "btn_rule",
                    isExist =true,
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
                --帮助按钮
                [3] = {
                    name = "btn_rule",
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
            isShow = true
        }
    },
    luaFilePath = "logic.views.GameScene.Enter",
    isScene = true
}

LayerConfig.result={
    data = {},
    luaFilePath = "logic.views.GameScene.JieSuanLayer",
    isScene = false
}

return  LayerConfig
