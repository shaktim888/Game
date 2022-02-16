local Over = class("Over", cc.load("mvc").ModuleBase)
Over.RESOURCE_FILENAME = "over/Over_Layer.lua"

function Over:onCreate(cb)
    if type(cb) == "function" then
        self.cb = cb
    else
        self.mView["btnRevive"]:setVisible(false)
    end
end

function Over:onbtnRestartClick()
    global.viewController.closeAction(self)
    global.viewController.gotoView("game")
end

function Over:onbtnHomeClick()
    global.viewController.gotoView("start")
end

function Over:onbtnReviveClick()
    local type = display.width < display.height and 2 or 0
    local params = {
        adType = type,
        callback = self.cb
    }
    if device.platform == "mac" then
        global.viewMgr.showTips("广告测试中...", 1)
        global.async.delay(1.2):Then(function()
            self.cb()
        end)
    else
        local ok, ret = LuaObjcBridge.callStaticMethod("RootViewController", "podAds", params)
    end
end

return Over