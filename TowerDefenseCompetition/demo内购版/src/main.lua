DISPATCH_GLOBAL_EVENT = function() end

APP_VER = 5
print = release_print
DOWNLOAD_PATH = cc.FileUtils:getInstance():getWritablePath().."download/"
local searchPaths = cc.FileUtils:getInstance():getSearchPaths()
table.insert(searchPaths, 1, DOWNLOAD_PATH.."src/")
table.insert(searchPaths, 1, DOWNLOAD_PATH.."res/")
cc.FileUtils:getInstance():setSearchPaths(searchPaths)

cc.FileUtils:getInstance():setPopupNotify(false)
cc.FileUtils:getInstance():addSearchPath("src/")
cc.FileUtils:getInstance():addSearchPath("res/")

require "config"
require "cocos.init"



local function main()
    require("app.update.UpdateCore"):create():run()
end

local status, msg = xpcall(main, __G__TRACKBACK__)
if not status then
    release_print(msg)
end
