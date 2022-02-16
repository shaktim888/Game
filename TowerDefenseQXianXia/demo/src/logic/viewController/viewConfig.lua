 
local LayerConfig ={}

LayerConfig.daily={
    data = {},
    luaFilePath = "logic.views.GameDaily.Enter",
    isScene = false
}

LayerConfig.game={
    data = {},
    luaFilePath = "logic.views.GameScene.Enter",
    isScene = true
}

LayerConfig.help={
    data = {},
    luaFilePath = "logic.views.GameRule.Enter",
    isScene = false
}

LayerConfig.level={
    data = {},
    luaFilePath = "logic.views.GameLevel.Enter",
    isScene = true
}

LayerConfig.setting={
    data = {},
    luaFilePath = "logic.views.GameVoiceSet.Enter",
    isScene = false
}

LayerConfig.skin={
    data = {},
    luaFilePath = "logic.views.GameSkin.Enter",
    isScene = false
}

LayerConfig.start= {
    data = {},
    luaFilePath = "logic.views.GameStart.Enter",
    isScene = true
}

LayerConfig.result= {
    data = {},
    luaFilePath = "logic.views.GameScene.ResultLayer",
    isScene = false
}

return  LayerConfig
