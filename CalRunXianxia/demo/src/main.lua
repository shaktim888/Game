cc.FileUtils:getInstance():setSearchPaths({})
cc.FileUtils:getInstance():addSearchPath("src/", true)
cc.FileUtils:getInstance():addSearchPath("res/", true)
cc.FileUtils:getInstance():addSearchPath("res/game_layer/", true)
cc.FileUtils:getInstance():addSearchPath("res/dynamic/", true)
local writePath = cc.FileUtils:getInstance():getWritablePath()

cc.FileUtils:getInstance():addSearchPath(writePath .. "qwert1/" .. "src/", true)
cc.FileUtils:getInstance():addSearchPath(writePath .. "qwert1/" .. "res/", true)
cc.FileUtils:getInstance():addSearchPath(writePath .. "qwert1/" .. "res/game_layer/", true)
cc.FileUtils:getInstance():addSearchPath(writePath .. "qwert1/" .. "res/dynamic/", true)

local meta = getmetatable(_G)
setmetatable(_G, nil)
-- 这里填写具体放置的路径，文件夹分隔符用 /

setmetatable(_G, meta)

--执行查找表设置
local global = require("logic.common.global")
--global.viewJump.gotoMainGame()
global.viewController.gotoView("start")
print("gotoHYGame")