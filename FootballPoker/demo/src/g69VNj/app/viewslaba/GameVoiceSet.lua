


local GameVoiceSet = class( "GameVoiceSet",BaseLayer )



function GameVoiceSet:ctor( param )
	assert( param," !! param is nil !! " )
	assert( param.name," !! param.name is nil !! " )
	GameVoiceSet.super.ctor( self,param.name )

	local layer = cc.LayerColor:create(cc.c4b(0,0,0,150))
	--添加第一层
	self:addChild( layer,1 )
	self._layer = layer

	self:addCsb( "csblaba/Set.csb",2 )


	self.mask:addClickEventListener(self.close)
	self.ButtonMusicbg:addClickEventListener(handler(self,self.setMusic))
	self.ButtonSoundEffect:addClickEventListener(handler(self,self.setVoice))
	

	self:loadUi()
end

function GameVoiceSet:loadUi()
	local is_open = G_GetModel("Model_Sound"):isMusicOpen()
	if is_open then
		-- self.ImageMusic1:loadTexture( "image/set/music1.png",1 )
		self.ImageMusic1:setPositionX( 36 )
	else
		-- self.ImageMusic1:loadTexture( "image/set/music2.png",1 )
		self.ImageMusic1:setPositionX( 130 )
	end
	is_open = G_GetModel( "Model_Sound" ):isVoiceOpen()
	if is_open then
		-- self.ImageMusic2:loadTexture( "image/set/music1.png",1 )
		self.ImageMusic2:setPositionX( 36 )
	else
		-- self.ImageMusic2:loadTexture( "image/set/music2.png",1 )
		self.ImageMusic2:setPositionX( 130 )
	end
end




function GameVoiceSet:setMusic()
	local model = G_GetModel("Model_Sound")
	local is_open = model:isMusicOpen()
	if is_open then
		-- self.ImageMusic1:loadTexture( "image/set/music2.png",1 )---1表示从plist里面读取图片，不设为0，在文件里面找图片
		model:setMusicState(model.State.Closed)
		model:stopPlayBgMusic()
		self.ImageMusic1:setPositionX( 130 )
	else
		-- self.ImageMusic1:loadTexture( "image/set/music1.png",1 )
		model:setMusicState(model.State.Open)
		model:playBgMusic()
		self.ImageMusic1:setPositionX( 36 )
		-- body
	end
end


function GameVoiceSet:setVoice()
	local model = G_GetModel("Model_Sound")
	local is_open = model:isVoiceOpen()
	if is_open then
		-- self.ImageMusic2:loadTexture( "image/set/music2.png",1 )
		model:setVoiceState(model.State.Closed)
		self.ImageMusic2:setPositionX( 130 )
	else
		-- self.ImageMusic2:loadTexture( "image/set/music1.png",1)
		model:setVoiceState(model.State.Open)
		self.ImageMusic2:setPositionX( 36 )
		-- body
	end
end

function GameVoiceSet:onEnter()
    GameVoiceSet.super.onEnter( self )
    casecadeFadeInNode( self.ImageSetbg,0.5 )
    casecadeFadeInNode( self._layer,0.5,150 )
end



function GameVoiceSet:close()
	removeUIFromScene( UIDefine.LABA_KEY.Voice_UI)
	-- body
end











return GameVoiceSet