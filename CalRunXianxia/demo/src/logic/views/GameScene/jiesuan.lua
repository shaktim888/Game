local Jiesuan = class("Jiesuan", cc.load("mvc").ModuleBase)
Jiesuan.RESOURCE_FILENAME = "game/cattleRun/balance.lua"
Jiesuan.behavior = {
    "logic.common.behavior.BlackHover",
    "logic.common.behavior.TouchInterrupt",
}

function Jiesuan:onCreate(data_)
    dump(data_)
end

function Jiesuan:onbtn_backClick()
    global.viewController.gotoView("start")
end

return Jiesuan  