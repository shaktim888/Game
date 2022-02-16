local InnerGo = class("InnerGo", cc.Node)
InnerGo.RESOURCE_FILENAME = "app.InnerGo.assets.InnerGoUI"
print = release_print
local products = import(".assets.InnerGoCfg").products
local LocalStorage = import(".LocalStorage")

local PayUtils = import(".PayUtils")
local function readSaveData()
    return LocalStorage.getLocalCoin()
end
local function saveDataToFile(coin)
    LocalStorage.setLocalCoin(coin)
end

function InnerGo:ctor(entry)
    local ui = require(InnerGo.RESOURCE_FILENAME)
    function btnCallback(fname, target, eventname)
        local callfunc = self[eventname]
        if callfunc and (type(callfunc) == "function") then
            return handler(self, callfunc)
        end
        return function () print(tostring(eventname) .." have no callback!") end
    end
    PayUtils.callback = function(data_)
        if data_.code == 1 then
            print("购买成功")
            for i, v in ipairs(products) do
                if data_.product_id == v.product_id then
                    entry.executeGoEndCb(v)
                    break
                end
            end
        else
            print("充值失败！")
        end
    end
    local v = ui.create(btnCallback)
    self:initList(v)
    self:add(v.root)
end

function InnerGo:initList(root)
    local list = root["list"]
    list:removeAllItems()
    local item_template = root["innergo_item"]
    for i, v in ipairs(products) do
        local item = item_template:clone()
        list:pushBackCustomItem(item)
        item:setTag(i)
        item:setVisible(true)
        if v.img then
            local icon = item:getChildByName("Image_2")
            icon:loadTexture(v.img)
            icon:ignoreContentAdaptWithSize(true)
        end
        item:addClickEventListener(handler(InnerGo, InnerGo.onbuyItemClick))
        if item.setAdapterSwallowTouches then
            item:setAdapterSwallowTouches(false)
        end
        local desc = item:getChildByName("desc1")
        desc:setString(v.name)
        local price1 = item:getChildByName("price1")
        price1:setString(v.price)
    end
    item_template:setVisible(false)
    list:setTouchEnabled(true)
end

function InnerGo:onbuyItemClick(sender_)
    
    local tag = sender_:getTag()
    print(tag)
    local product = products[tag]
    local args = {product_id = products[1].product_id, callback = self.buyEnd}
    if product then
        args.product_id = product.product_id
    end
    PayUtils.buyProducts(args)
end

function InnerGo:showSelf()
    local director = cc.Director:getInstance()
    display:getRunningScene():add(self, 1, 1)
end

function InnerGo:onbtnBackClick(sender_, eventtype_)    
    self:removeFromParent()
end

return InnerGo
