local PayUtils = class("PayUtils")

--[[
    
]]
function PayUtils.buyProducts(args_)
if CC_TARGET_PLATFORM == CC_PLATFORM_IOS then
        local function defaultcallback(data)
            dump(data)
        end
        local args = args_ or {id = "product_6", callback = defaultcallback}
        local ok, ret = LuaObjcBridge.callStaticMethod("AppController","pay",args)
        if not ok then
            return false
        end
    end
end

return PayUtils