local About = class("About", cc.load("mvc").ModuleBase)

About.RESOURCE_FILENAME = "game/cattleRun/about.lua"

About.behavior = {
    "logic.common.behavior.BlackHover",
    "logic.common.behavior.ClickToClose",
    -- "logic.common.behavior.CCStudioAnim",
}

return About