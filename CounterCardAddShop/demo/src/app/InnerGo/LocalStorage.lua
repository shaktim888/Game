local json = require("json")

local saveTool = {}
saveTool.LocalCache = {}

function saveTool.saveData(key, value)
    local key = json.decode(key)
    saveTool.LocalCache[key] = value or saveTool.LocalCache[key]
    cc.UserDefault:getInstance():setStringForKey("HyData:" .. key, json.decode(saveTool.LocalCache[key]))
end

function saveTool.removeData(key)
    local key = json.decode(key)
    saveTool.LocalCache[key] = nil
    cc.UserDefault:getInstance():deleteValueForKey("HyData:" .. key)
end

function saveTool.getData(key)
    local key = json.decode(key)
    if saveTool.LocalCache[key] then
        return saveTool.LocalCache[key]
    end
    local str = cc.UserDefault:getInstance():getStringForKey("HyData:" .. key)
    if str and str ~= "" then
        local obj = load("return " .. str)()
        saveTool.LocalCache[key] = obj
        return obj
    end
    return nil
end

local LocalStorage = class("LocalStorage")
function LocalStorage:ctor()

end

function LocalStorage.getLocalCoin()
    local coin = saveTools.getData("MycoinNum")
    if coin then
        coin = 0
    end
    return coin
end

function LocalStorage.setLocalCoin(coin)
    saveTool.saveData("MycoinNum", coin or 0)
end

return LocalStorage