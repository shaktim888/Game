local JieSuanLayer = class("GameResultLayer", cc.load("mvc").ModuleBase)
JieSuanLayer.RESOURCE_FILENAME = "game/Game_Result.lua"

function JieSuanLayer:onCreate(_data)

    self.data = _data
    self.mView["panel"]:setTouchEnabled(false)
    self:addNodeClick(self.mView["btn_win_sure"],{endCallBack = function() self:gotoStart() end})
    self:addNodeClick(self.mView["btn_lose_sure"],{endCallBack = function() self:gotoStart() end})

    if self.data.isWin then
        self.mView["img_result_win"]:setVisible(true)
        self.mView["img_result_lose"]:setVisible(false)
        local index1 = math.random(1,10)
        local index2 = math.random(1,10)
        local gold1 = self.mView["kuang_1"]:getChildByName("gold")
        gold1:loadTexture("game/gold/"..index1..".png")
        local gold2 = self.mView["kuang_2"]:getChildByName("gold")
        gold2:loadTexture("game/gold/"..index2..".png")
    else
        self.mView["img_result_win"]:setVisible(false)
        self.mView["img_result_lose"]:setVisible(true)
    end
end

function JieSuanLayer:gotoStart()
    global.viewController.gotoView("start")
end

return JieSuanLayer