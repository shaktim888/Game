local PayUtils = class("PayUtils")

--[[
    
]]
function PayUtils.buyProducts(args_)
    if CC_TARGET_PLATFORM == CC_PLATFORM_IOS then
        local function defaultcallback(data)
            dump(data)
        end
        local ok, ret = require("cocos.cocos2d.luaoc").callStaticMethod("IAPUtils","toBuyProducts",args_)
        if not ok then
            return false
        end
    end
end

PayUtils.callback = nil
function G_buycallback(isSuccess, productId)
    if isSuccess then
        local args = {product_id = productId, code = 1}
        if PayUtils.callback then
            PayUtils.callback(args)
        else
            print("请添加购买成功回调函数")
        end
    else
        print("充值失败")
    end
end

return PayUtils
