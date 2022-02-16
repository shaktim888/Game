local MainScene = class("MainScene", cc.load("mvc").ModuleBase)
MainScene.RESOURCE_FILENAME = "game/PKGS/Main.csb"

cc.exports.__Game = import(".Game_Class")
local Live = import(".Game_Live")
local Help = import(".Help")
local sound = import(".SoundConfig")


function MainScene:onCreate()

   audio.playMusic(_Sound.bgm,true)
   self:addTitleAction()
   self.mView["btn_help"]:setVisible(false)
end

function MainScene:addTitleAction()
	-- self.mView["title"]:setVisible( true )
	-- local move_by1 = cc.ScaleTo:create(0.5, 0.8, 0.8)
	-- local move_by2 = cc.ScaleTo:create(0.5, 1, 1)
	-- local seq = cc.Sequence:create({ move_by1,move_by2 })
	-- local rep = cc.RepeatForever:create( seq )
	-- self.mView["title"]:runAction( rep )
end

function MainScene:onbtn_classicClick()
   AudioEngine.playEffect(_Sound.click,false)
   __Game.new():showWithScene()
end

function MainScene:onbtn_liveClick()
   AudioEngine.playEffect(_Sound.click,false)
   Live.new():showWithScene()
end

function MainScene:onbtn_helpClick()
   AudioEngine.playEffect(_Sound.click,false)
   global.viewMgr.showView(Help.new())

end

return MainScene
