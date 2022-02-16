local GameVoiceSetLayer = class("GameVoiceSetLayer", cc.load("mvc").ModuleBase)
GameVoiceSetLayer.RESOURCE_FILENAME = "setting/Setting_Layer.lua"
local img_off_path = "setting/img_off.png"
local img_on_path = "setting/img_on.png"


function GameVoiceSetLayer:onCreate()

    self.mView["panel"]:setTouchEnabled(false)
    self:addNodeClick(self.mView["panel"],{endCallBack = function () self:close()end,scaleAction = false,swallowTouche = false})
    
    self.mView["btn_effect"]:ignoreContentAdaptWithSize(true)
    self.mView["btn_music"]:ignoreContentAdaptWithSize(true)
    
    self.mView["img_music_bg"]:setTouchEnabled(true)
    self.mView["img_music_bg"]:addTouchEventListener(handler(self,self.setMusic))
   

    self.mView["img_effect_bg"]:setTouchEnabled(true)
    self.mView["img_effect_bg"]:addTouchEventListener(handler(self,self.setVoice))
    self.mView["bg"]:setTouchEnabled(true)

    self:loadUi()
end


function GameVoiceSetLayer:loadUi()
    local is_open = global.viewData.isMusicOpen()
    local differ = self.mView["img_music_bg"]:getContentSize().width -self.mView["btn_music"]:getContentSize().width

    if is_open == global.viewData.State.Open then
        self.mView["img_music_bg"]:loadTexture(img_off_path)
        self.mView["btn_music"]:setPositionX(differ)
    else
        self.mView["img_music_bg"]:loadTexture(img_on_path)
        self.mView["btn_music"]:setPositionX(0)
    end

    is_open = global.viewData.isVoiceOpen()
    if is_open == global.viewData.State.Open then
        self.mView["img_effect_bg"]:loadTexture(img_off_path)
        self.mView["btn_effect"]:setPositionX(differ)
    else
        self.mView["img_effect_bg"]:loadTexture(img_on_path)
        self.mView["btn_effect"]:setPositionX(0)
    end
   

end

function GameVoiceSetLayer:setMusic(sender,type)
    local differ = self.mView["img_music_bg"]:getContentSize().width -self.mView["btn_music"]:getContentSize().width
    if type == 2 then
        local is_open = global.viewData.isMusicOpen()
        if is_open == global.viewData.State.Open then
            -- 关闭音乐
            self.mView["img_music_bg"]:loadTexture(img_on_path)
            global.viewData.setMusicState(global.viewData.State.Closed)
            global.viewData:stopPlayBgMusic()
            self.mView["btn_music"]:setPositionX(0)
        else
            -- 打开音乐
            self.mView["img_music_bg"]:loadTexture(img_off_path)
            global.viewData.setMusicState(global.viewData.State.Open)
            global.viewData:playBgMusic()
            self.mView["btn_music"]:setPositionX(differ)
        end
    end 
    
end

function GameVoiceSetLayer:setVoice(sender,type)
    local differ = self.mView["img_music_bg"]:getContentSize().width -self.mView["btn_music"]:getContentSize().width
    if type == 2 then
        local is_open = global.viewData.isVoiceOpen()
        if is_open == global.viewData.State.Open then
            -- 关闭音效
            self.mView["img_effect_bg"]:loadTexture(img_on_path)
            global.viewData.setVoiceState(global.viewData.State.Closed)
            self.mView["btn_effect"]:setPositionX(0)
        else
            self.mView["img_effect_bg"]:loadTexture(img_off_path)
            global.viewData.setVoiceState(global.viewData.State.Open)
            self.mView["btn_effect"]:setPositionX(differ)
        end
    end
    
end

function GameVoiceSetLayer:close()
	global.viewController.closeAction(self)
end

return GameVoiceSetLayer