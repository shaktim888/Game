
local relpath = "logic"
local products = {
    {
        product_id = "app_product_6",
        name = "600元宝",
        desc = "购买立即获得600元宝",
        price = "¥6.00",
        value = 600,
        img = relpath .. "/InnerGo/assets/coin_1.png",
    },
    {
        product_id = "app_product_50",
        name = "5000元宝",
        desc = "购买立即获得5000元宝",
        price = "¥50.00",
        value = 5000,
        img = relpath .. "/InnerGo/assets/coin_2.png",
    },
    {
        product_id = "app_product_98",
        name = "9800元宝",
        desc = "购买立即获得9800元宝",
        price = "¥98.00",
        value = 9800,
        img = relpath .. "/InnerGo/assets/coin_3.png",
    },
    {
        product_id = "app_product_198",
        name = "19800元宝",
        desc = "购买立即获得19800元宝",
        price = "¥198.00",
        value = 19800,
        img = relpath .. "/InnerGo/assets/coin_4.png",
    },
    {
        product_id = "app_product_298",
        name = "29800元宝",
        desc = "购买立即获得29800元宝",
        price = "¥298.00",
        value = 29800,
        img = relpath .. "/InnerGo/assets/coin_5.png",
    },
    {
        product_id = "app_product_488",
        name = "48800元宝",
        desc = "购买立即获得48800元宝",
        price = "¥488.00",
        value = 48800,
        img = relpath .. "/InnerGo/assets/coin_6.png",
    },
    {
        product_id = "app_product_648",
        name = "64800元宝",
        desc = "购买立即获得64800元宝",
        price = "¥648.00",
        value = 64800,
        img = relpath .. "/InnerGo/assets/coin_7.png",
    },
}

local cfg = {
    goUI = {
        bg = "res/game/jump/image/bg.png",
        popBg = relpath .. "/InnerGo/assets/popBg.png",
        goitem_bg = relpath .. "/InnerGo/assets/shopItemBg.png",
        btn_return = relpath .. "/InnerGo/assets/btn_return.png"
    },
    products = products,
}

return cfg
