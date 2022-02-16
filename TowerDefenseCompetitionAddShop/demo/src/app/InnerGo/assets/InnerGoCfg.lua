
local relpath = "app"
local products = {
    {
        product_id = "app_product_6",
        name = "600金币",
        desc = "购买立即获得600金币",
        price = "¥6.00",
        value = 600,
        img = relpath .. "/InnerGo/assets/coin_1.png",
    },
    {
        product_id = "app_product_50",
        name = "5000金币",
        desc = "购买立即获得5000金币",
        price = "¥50.00",
        value = 5000,
        img = relpath .. "/InnerGo/assets/coin_2.png",
    },
    {
        product_id = "app_product_98",
        name = "9800金币",
        desc = "购买立即获得9800金币",
        price = "¥98.00",
        value = 9800,
        img = relpath .. "/InnerGo/assets/coin_3.png",
    },
    {
        product_id = "app_product_198",
        name = "19800金币",
        desc = "购买立即获得19800金币",
        price = "¥198.00",
        value = 19800,
        img = relpath .. "/InnerGo/assets/coin_4.png",
    },
    {
        product_id = "app_product_298",
        name = "29800金币",
        desc = "购买立即获得29800金币",
        price = "¥298.00",
        value = 29800,
        img = relpath .. "/InnerGo/assets/coin_5.png",
    },
    {
        product_id = "app_product_488",
        name = "48800金币",
        desc = "购买立即获得48800金币",
        price = "¥488.00",
        value = 48800,
        img = relpath .. "/InnerGo/assets/coin_6.png",
    },
    {
        product_id = "app_product_648",
        name = "64800金币",
        desc = "购买立即获得64800金币",
        price = "¥648.00",
        value = 64800,
        img = relpath .. "/InnerGo/assets/coin_7.png",
    },
}

local cfg = {
    goUI = {
        bg = relpath .. "/InnerGo/assets/popBg.png",
        goitem_bg = relpath .. "/InnerGo/assets/shopItemBg.png"
    },
    products = products,
}

return cfg
