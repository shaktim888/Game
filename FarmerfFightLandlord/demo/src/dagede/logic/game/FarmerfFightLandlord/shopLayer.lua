local shopLayer = class("shopLayer",cc.load("mvc").ModuleBase)
shopLayer.RESOURCE_FILENAME = "game/FarmerfFightLandlord/ShopLayer.lua"
print("你进入了商城界面")

shopLayer.behavior ={
    "logic.common.behavior.BtnBinder",
    "logic.common.behavior.TouchInterrupt",
    "logic.common.behavior.Listener",
}

--按钮事件绑定
shopLayer.btnBind = {
    hammerBuyBtn = "hammerClick",
    dartsBuyBtn = "dartsClick",
    bombBuyBtn = "bombClick",
    closeBtn = "closeClick"
}

function shopLayer:onCreate(updateGold)
    self.updateGold = updateGold
    self.buyStatus = global.saveTools.getData("buyStatus")
    if self.buyStatus == nil then
        self.buyStatus = {
            hammer = false,
            darts = false,
            bomb = false
        }
    end
    self.goldNumber = global.saveTools.getData("goldNumber")
    if self.goldNumber == nil then
        self.goldNumber = 0
    end

    self.mView["text_userGold"]:setString(self.goldNumber)

    self.mView["hammerBuyStatus"]:setVisible(self.buyStatus.hammer)
    self.mView["hammerBuyBtn"]:setBright(not self.buyStatus.hammer)
    self.mView["dartsBuyStatus"]:setVisible(self.buyStatus.darts)
    self.mView["dartsBuyBtn"]:setBright(not self.buyStatus.darts)
    self.mView["bombBuyStatus"]:setVisible(self.buyStatus.bomb)
    self.mView["bombBuyBtn"]:setBright(not self.buyStatus.bomb)
end

--购买锤子点击事件
function shopLayer:hammerClick()
    print("点击了购买锤子按钮")
    AudioEngine.playEffect ("game/FarmerfFightLandlord/sound/Button.mp3",false)
    if self.goldNumber < 100 then
        print("购买锤子的钱不够")
        return
    end
    self.goldNumber = self.goldNumber - 100
    global.saveTools.saveData("goldNumber", self.goldNumber)
    self.buyStatus.hammer = true
    self.mView["hammerBuyStatus"]:setVisible(self.buyStatus.hammer)
    self.mView["hammerBuyBtn"]:setBright(not self.buyStatus.hammer)
    global.saveTools.saveData("buyStatus", self.buyStatus)
    self.updateGold()
    print("购买锤子成功")
end

--购买飞镖点击事件
function shopLayer:dartsClick()
    print("点击了购买飞镖按钮")
    AudioEngine.playEffect ("game/FarmerfFightLandlord/sound/Button.mp3",false)
    if self.goldNumber < 200 then
        print("购买飞镖的钱不够")
        return
    end
    self.goldNumber = self.goldNumber - 200
    global.saveTools.saveData("goldNumber", self.goldNumber)
    self.buyStatus.darts = true
    self.mView["dartsBuyStatus"]:setVisible(self.buyStatus.darts)
    self.mView["dartsBuyBtn"]:setBright(not self.buyStatus.darts)
    global.saveTools.saveData("buyStatus", self.buyStatus)
    self.updateGold()
    print("购买飞镖成功")
end

--购买炸弹点击事件
function shopLayer:bombClick()
    print("点击了购买炸弹按钮")
    AudioEngine.playEffect ("game/FarmerfFightLandlord/sound/Button.mp3",false)
    if self.goldNumber < 500 then
        print("购买炸弹的钱不够")
        return
    end
    self.goldNumber = self.goldNumber - 500
    global.saveTools.saveData("goldNumber", self.goldNumber)
    self.buyStatus.bomb = true
    self.mView["bombBuyStatus"]:setVisible(self.buyStatus.bomb)
    self.mView["bombBuyBtn"]:setBright(not self.buyStatus.bomb)
    global.saveTools.saveData("buyStatus", self.buyStatus)
    self.updateGold()
    print("购买锤子成功")
end

--关闭界面点击事件
function shopLayer:closeClick()
    print("点击了关闭按钮")
    AudioEngine.playEffect ("game/FarmerfFightLandlord/sound/Button.mp3",false)
    self:setVisible(false)
end

return shopLayer