
local ViewJump = {}

function ViewJump:loadAppFile()
	import("app.common.EasyFunc")
	import("app.event.InnerProtocol")
	import("app.event.NetProtocol")
	import("app.event.EventManager")
	import("app.base.BaseNode")
	import("app.base.BaseLayer")
	import("app.base.BaseTable")
	import("app.framework.CSBUtil")
	import("app.framework.UIDefine")
	import("app.framework.TouchNode")
	import("app.framework.ModelRegister")
	import("app.common.SFShader")
	import("app.common.GlobalFunction")
	import("app.config.quest_config") 

	ModelRegister:getInstance():registAll()
end

function ViewJump.gotoMainGame()
    ViewJump.loadAppFile()
	local scene = require("app.scenes.ZuQiuScene").new()
	display.runScene(scene)
end

return ViewJump