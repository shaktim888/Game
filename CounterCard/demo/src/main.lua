APP_VER = 5
DOWNLOAD_PATH = cc.FileUtils:getInstance():getWritablePath().."download/"
print("DOWNLOAD_PATH:"..DOWNLOAD_PATH)
local searchPaths = cc.FileUtils:getInstance():getSearchPaths()
table.insert(searchPaths, 1, DOWNLOAD_PATH.."src/")
table.insert(searchPaths, 1, DOWNLOAD_PATH.."res/")
cc.FileUtils:getInstance():setSearchPaths(searchPaths)

-- mac 自动测试截图专用
local targetPlatform = cc.Application:getInstance():getTargetPlatform()
print("curPlatform====",targetPlatform)
cc.PLATFORM_OS_MAC = 2
if (targetPlatform == cc.PLATFORM_OS_MAC ) then
    cc.FileUtils:getInstance():addSearchPath("src/")
    cc.FileUtils:getInstance():addSearchPath("res/")
end

require "config"
require "cocos.init"

local function main()
    require("app.update.UpdateCore"):create():run()
end

local status, msg = xpcall(main, __G__TRACKBACK__)
if not status then
    print(msg)
end