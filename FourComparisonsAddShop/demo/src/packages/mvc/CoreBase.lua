local C = class("CoreBase")
CoreBase = C

--模块路径
C.MODULE_PATH = ""
--场景名和场景模块名
C.SCENE_CONFIG = {scenename = "", filename = ""}
--场景
C.scene = nil

function C:ctor()
    -- body
end

function C:run(transition, time, more)
    print("CoreBase run "..self.SCENE_CONFIG["filename"])
	local C = require(self.MODULE_PATH.."."..self.SCENE_CONFIG["filename"])
    print("CoreBase run require")
    self.scene = C:create(self)
    print("CoreBase run create")
    self.scene:showWithScene(transition, time, more)
    self.scene.name = self.SCENE_CONFIG["scenename"]
end

function C:exit()
    self.scene = nil
end

return CoreBase
