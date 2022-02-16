print("Welcom to entrance")
cc.FileUtils:getInstance():setPopupNotify(false)
local writePath = cc.FileUtils:getInstance():getWritablePath() .. "qwert1/"

cc.FileUtils:getInstance():addSearchPath("src/")
cc.FileUtils:getInstance():addSearchPath("res/")

cc.FileUtils:getInstance():addSearchPath(writePath.."src/")
cc.FileUtils:getInstance():addSearchPath(writePath.."res/")

require "config"
require "cocos.init"
function loadtip()
    print("loadtip----")
    if DEBUG > 1 then
    	require("LuaDebug")("localhost", 7003)
	end
    local s1 = require("Scene1").new();
    s1:inittime();
end

local status, msg = xpcall(loadtip, __G__TRACKBACK__)
if not status then
    print("报错")
    print(msg)
end
