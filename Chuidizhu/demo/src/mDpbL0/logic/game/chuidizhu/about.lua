local About = class("About", cc.load("mvc").ModuleBase)
local chuidizhu = import(".chuidizhu")

About.RESOURCE_FILENAME = "game/chuidizhu/setting.lua"

About.behavior = {
    "logic.common.behavior.BlackHover",
    "logic.common.behavior.ClickToClose",
    -- "logic.common.behavior.CCStudioAnim",
}

function About:onContinue()
    if self.removeView then
        self:removeView()
    else
        self:removeFromParent()
    end
end

function About:onReplay()
    chuidizhu.new():showWithScene()
end

function About:onBack()
    global.viewJump.gotoMainGame()
end

return About