local Over = class("Over", cc.load("mvc").ModuleBase)
Over.RESOURCE_FILENAME = "over/Over_Layer.lua"

function Over:onCreate(_data)
  
end

function Over:onbtnRestartClick()
    global.viewController.closeAction(self)
    global.viewController.gotoView("game")
end

function Over:onbtnHomeClick()
    global.viewController.gotoView("start")

end

return Over