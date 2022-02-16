local About = class("About", cc.load("mvc").ModuleBase)

About.RESOURCE_FILENAME = "game/chuangchuang/about.lua"

About.behavior = {
    "logic.common.behavior.BlackHover",
    "logic.common.behavior.ClickToClose",
}


return About