
cc.FileUtils:getInstance():setPopupNotify(false)
cc.FileUtils:getInstance():addSearchPath("src/")
cc.FileUtils:getInstance():addSearchPath("res/")

-- require "config"
-- require "cocos.init"

local function main()
    require("mDpbL0.main")
end

local status, msg = xpcall(main, function(msg)
    local msg = debug.traceback(msg, 3)
    print(msg)
    return msg
end)
if not status then
    print(msg)
end
