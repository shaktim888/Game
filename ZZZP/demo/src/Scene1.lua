
local setmetatableindex_
setmetatableindex_ = function(t, index)
if type(t) == "userdata" then
local peer = tolua.getpeer(t)
if not peer then
peer = {}
tolua.setpeer(t, peer)
end
setmetatableindex_(peer, index)
else
local mt = getmetatable(t)
if not mt then mt = {} end
if not mt.__index then
mt.__index = index
setmetatable(t, mt)
elseif mt.__index ~= index then
setmetatableindex_(mt, index)
end
end
end
setmetatableindex = setmetatableindex_
local function class(classname, ...)
local cls = {__cname = classname}

local supers = {...}
for _, super in ipairs(supers) do
local superType = type(super)
assert(superType == "nil" or superType == "table" or superType == "function",
string.format("class() - create class \"%s\" with invalid super class type \"%s\"",
classname, superType))

if superType == "function" then
assert(cls.__create == nil,
string.format("class() - create class \"%s\" with more than one creating function",
classname));
-- if super is function, set it to __create
cls.__create = super
elseif superType == "table" then
if super[".isclass"] then
-- super is native class
assert(cls.__create == nil,
string.format("class() - create class \"%s\" with more than one creating function or native class",
classname));
cls.__create = function() return super:create() end
else
-- super is pure lua class
cls.__supers = cls.__supers or {}
cls.__supers[#cls.__supers + 1] = super
if not cls.super then
-- set first super pure lua class as class.super
cls.super = super
end
end
else
error(string.format("class() - create class \"%s\" with invalid super type",
classname), 0)
end
end

cls.__index = cls
if not cls.__supers or #cls.__supers == 1 then
setmetatable(cls, {__index = cls.super})
else
setmetatable(cls, {__index = function(_, key)
local supers = cls.__supers
for i = 1, #supers do
local super = supers[i]
if super[key] then return super[key] end
end
end})
end

if not cls.ctor then
-- add default constructor
cls.ctor = function() end
end
cls.new = function(...)
local instance
if cls.__create then
instance = cls.__create(...)
else
instance = {}
end
setmetatableindex(instance, cls)
instance.class = cls
instance:ctor(...)
return instance
end
cls.create = function(_, ...)
return cls.new(...)
end

return cls
end


--Point
function cc.p(_x,_y)
    if nil == _y then
         return { x = _x.x, y = _x.y }
    else
         return { x = _x, y = _y }
    end
end


local utils = require("Utils")
local eventExecuter = require("packages.eventExecuter.EventExecuter"):create()
local Card_Res = {}
local helpPanel
local gamePanel
local mainPanel
local roomPanel
local resultPanel
local loadingPanel
local settingPanel
local levelPanel

local mode=2
local selectLevel = 1 

local cardList={}
local dataList={}
local OFFSET_X = 48 * 0.5788
local OFFSET_Y = 56 * 0.5788
local height=30
local curOrder=100
local left2Order=1
local leftList1={}
local leftList2={}
local cycleRound=1
local maxCyCleRound=1

local curTime=0
local totalTime=120

local curScore=2000
local curCardScore=0
local curTimeScore=0
local curTotalScore=0


local C = class("Scene",function() return cc.Node:create()end)

function C:registerPnl(panel)
	print(eventExecuter:hasEvents())
	if not eventExecuter:hasEvents() then
		return 
	end
	print("111111111233")
	local param = {
		name = panel:getName(),
		timename = "enterTransitionFinish",
		target = panel
	}
	local func = panel.setVisible
	panel.setVisible = function (node_self, flag)

		if flag then
			if panel:getName()  == "main" then
                self:grabsMainPanel()
            elseif panel:getName()  == "game" then
                self:grabsGamePanel()
            elseif panel:getName()  == "result" then
                self:grabResultPanel()
            end
		end
		param.timename = flag and "enterTransitionFinish" or "exit"
		eventExecuter:timeEvent(param)
		func(node_self, flag)
	end
end

function C:grabsMainPanel()
	print("grabsMainPanel")
end
function C:grabsGamePanel()

	print("grabsGamePanel")
	self:clearGame()
	cycleRound=0
	self.gameState=0
	dataList={}
	if mode==1 then
		for i = 0, 3 do
			for k = 1, 13 do
				local info={}
				info.color=i
				info.number=k
				info.index=math.random(1,300)
				table.insert(dataList,info)
			end
		end
	elseif mode==2 then
		for i = 0, 3 do
			for k = 1, 13 do
				local info={}
				info.color=3
				info.number=k
				info.index=math.random(1,300)
				table.insert(dataList,info)
			end
		end
	elseif mode==3 then
		for i = 2, 3 do
			for k = 1, 13 do
				local info={}
				info.color=i
				info.number=k
				info.index=math.random(1,300)
				table.insert(dataList,info)
			end
		end
		for i = 2, 3 do
			for k = 1, 13 do
				local info={}
				info.color=i
				info.number=k
				info.index=math.random(1,300)
				table.insert(dataList,info)
			end
		end
	end
	table.sort(dataList,function(a,b)
		return a.index>b.index
	end)
	local index=1
	cardList={}
	for i = 1, 7 do
		local key = string.format("card%d",i)
		local card=Card_Res[key]--self[key]
		local x,y=card:getPosition()
		local temp=i-1
		for j = 1, temp do
			local prefab=card:clone()
			if mode==1 then
				prefab:loadTexture("minigame/images/pai/" .. "bg_back1.png")
			elseif mode==2 then
				prefab:loadTexture("minigame/images/pai/" .. "bg_back2.png")
			elseif mode==3 then
				prefab:loadTexture("minigame/images/pai/" .. "bg_back3.png")
			end
			
			gamePanel:addChild(prefab)
			prefab:setPosition(x,y-(j-1)*height)
			prefab:setLocalZOrder(j)
			local _card={}
			_card.card=prefab
			_card.order=j
			_card.height=height
			_card.color=dataList[index].color
			_card.number=dataList[index].number
			index=index+1
			if j==temp then
				_card.state=1
				prefab:loadTexture("minigame/images/pai/" .. "card".._card.color.."_".._card.number..".png")
			else
				_card.state=0
			end
			table.insert(cardList,_card)
		end
	end
	leftList1={}
	for i = index, #dataList do
		local prefab=left1:clone()
		prefab:setVisible(true)
		if mode==1 then
			prefab:loadTexture("minigame/images/pai/" .. "bg_back1.png")
		elseif mode==2 then
			prefab:loadTexture("minigame/images/pai/" .. "bg_back2.png")
		elseif mode==3 then
			prefab:loadTexture("minigame/images/pai/" .. "bg_back3.png")
		end
		gamePanel:addChild(prefab)
		prefab:setPosition(cc.p(left1:getPosition()))
		prefab:setLocalZOrder(i)
		local _card={}
		_card.card=prefab
		_card.order=i
		_card.height=20
		_card.color=dataList[i].color
		_card.number=dataList[i].number
		_card.state=0
		table.insert(leftList1,_card)
	end
	curTimeScore=0
	curCardScore=0
	curScore=2000
	curTotalScore=curTimeScore+curCardScore+curScore
	self:showScore(curScore)
	self:showTime(totalTime)
	for i = 1, #cardList do
		cardList[i].card:setOpacity(0)
		local start=cc.p(cardList[i].card:getPosition())
		cardList[i].card:setPosition(cc.p(left1:getPosition()))
		local arr={}
		arr[#arr+1]=cc.DelayTime:create(0.1*(i-1))
		arr[#arr+1]=cc.CallFunc:create(function()
			cardList[i].card:setVisible(true)
			cardList[i].card:runAction(cc.FadeIn:create(0.2))
		end)
		arr[#arr+1]=cc.EaseBackOut:create(cc.MoveTo:create(0.8,start))
		arr[#arr+1]=cc.CallFunc:create(function()
			if i==#cardList then
				self.gameState=1
				local _card={}
				_card.card=right1
				_card.order=10
				_card.state=1
				_card.height=0
				_card.color=-1
				_card.number=1
				table.insert(cardList,_card)
			
				local _card={}
				_card.card=right2
				_card.order=10
				_card.state=1
				_card.height=0
				_card.color=-1
				_card.number=1
				table.insert(cardList,_card)
			
				local _card={}
				_card.card=right3
				_card.order=10
				_card.state=1
				_card.height=0
				_card.color=-1
				_card.number=1
				table.insert(cardList,_card)
			
				local _card={}
				_card.card=right4
				_card.order=10
				_card.state=1
				_card.height=0
				_card.color=-1
				_card.number=1
				table.insert(cardList,_card)

				self:startClock()
			end
		end)
		cardList[i].card:runAction(cc.Sequence:create(arr))
	end	 
end
function C:grabResultPanel()
	print("grabsGamePanel")
end

function C:ctor()
  	local _fileName = "minigame/GameScene.csb"
  	self.loadNode = cc.CSLoader:createNode(_fileName)
	local director = cc.Director:getInstance()
	local view = director:getOpenGLView()
	local framesize = view:getFrameSize()
	self:addChild(self.loadNode,0)

	local scene = cc.Scene:create()
   	scene:addChild(self)
   	
   	if cc.Director:getInstance():getRunningScene() then
        cc.Director:getInstance():replaceScene(scene)
    else
        cc.Director:getInstance():runWithScene(scene)
    end

	local director = cc.Director:getInstance()
	local view = director:getOpenGLView()
	local framesize = view:getFrameSize()
	local w, h = framesize.width, framesize.height

	print("framesize.width" ..framesize.width)
	view:setDesignResolutionSize(2688, 1242, 1)
 	helpPanel = self.loadNode:getChildByName("help")
	gamePanel = self.loadNode:getChildByName("game")
	mainPanel = self.loadNode:getChildByName("main")
	roomPanel = self.loadNode:getChildByName("room")
	resultPanel = self.loadNode:getChildByName("result")
	loadingPanel = self.loadNode:getChildByName("loading")
	settingPanel = self.loadNode:getChildByName("setting")

	self:registerPnl(helpPanel)
    self:registerPnl(gamePanel)
    self:registerPnl(mainPanel)
    self:registerPnl(roomPanel)
	self:registerPnl(resultPanel)
	self:registerPnl(loadingPanel)
	self:registerPnl(settingPanel)
	
	for i=1,7 do
		local key = string.format("card%d",i)
		local path = string.format("game.%d",i)
		Card_Res[key] = gamePanel:getChildByName("" .. i)
	end

	helpPanel:setVisible(false)
	gamePanel:setVisible(false)
	
	mainPanel:setVisible(true)
	roomPanel:setVisible(false)
	resultPanel:setVisible(false)
	loadingPanel:setVisible(false)
    settingPanel:setVisible(false)
    
    local bg = cc.Sprite:create("minigame/images/rombg.png")
    bg:setPositionX(1344)
    bg:setPositionY(621)
    mainPanel:addChild(bg)
    bg:setLocalZOrder(1) 
    
    local role = cc.Sprite:create("minigame/images/role.png")
    role:setPositionX(1344)
    role:setPositionY(621)
    mainPanel:addChild(role)
    role:setLocalZOrder(2)

	self:initOnClick()

	local listeners = cc.EventListenerTouchOneByOne:create()
    listeners:registerScriptHandler(function(touch, event)  
        self:onTouchCardsPanel("began",touch:getLocation())
        return true
    end, 40 )
    listeners:registerScriptHandler(function(touch, event)
        self:onTouchCardsPanel("moved",touch:getLocation())
    end, 41)
    listeners:registerScriptHandler(function(touch, event)
        self:onTouchCardsPanel("ended",touch:getLocation())
    end, 42)
    listeners:registerScriptHandler(function(touch, event)
        self:onTouchCardsPanel("cancelled",touch:getLocation()) 
    end, 43)
    
    local dispatcher = self:getEventDispatcher()
    dispatcher:addEventListenerWithSceneGraphPriority(listeners, gamePanel)
	cc.SimpleAudioEngine:getInstance():playMusic("minigame/sound/bg.mp3", true)
end

--按钮监听
function C:initOnClick()

    startPlayBtn = mainPanel:getChildByName("start_btn") 
    startPlayBtn:setLocalZOrder(3)   
	roomBackBtn = roomPanel:getChildByName("back_btn")
    roomSettingBtn = roomPanel:getChildByName("setting_btn")
    roomSettingBtn:setVisible(false)
	roomBtn1 = roomPanel:getChildByName("room1")
	roomBtn2 = roomPanel:getChildByName("room2")
	roomBtn3 = roomPanel:getChildByName("room3")

	left1 = gamePanel:getChildByName("left1")
	scoreLabel = gamePanel:getChildByName("score")
	timeLabel = gamePanel:getChildByName("time")

	overBtn = gamePanel:getChildByName("stop_btn")
	right1 = gamePanel:getChildByName("right1")
	right2 = gamePanel:getChildByName("right2")
	right3 = gamePanel:getChildByName("right3")
	right4 = gamePanel:getChildByName("right4")

	left1 = gamePanel:getChildByName("left1")
	left2 = gamePanel:getChildByName("left2")
	left3 = gamePanel:getChildByName("left3")
	left4 = gamePanel:getChildByName("left4")

	leftBtn = gamePanel:getChildByName("left_btn")

	gameHelpBtn = gamePanel:getChildByName("help_btn")
    gameSettingBtn = gamePanel:getChildByName("set_btn")
    gameSettingBtn:setVisible(false)

	self.musicSlider = settingPanel:getChildByName("box_img"):getChildByName("music_slider")
	self.soundSlider = settingPanel:getChildByName("box_img"):getChildByName("sound_slider")

	score = resultPanel:getChildByName("score")
	cardBonus = resultPanel:getChildByName("cardBonus")
	timeBonus = resultPanel:getChildByName("timeBonus")
	totalScore = resultPanel:getChildByName("totalScore")
	resultBack1Btn = resultPanel:getChildByName("back1_btn")
	resultPlayBtn = resultPanel:getChildByName("play_btn")
	helpCloseBtn = helpPanel:getChildByName("close_btn")
	btnmusic = settingPanel:getChildByName("box_img"):getChildByName("btnmusic")
	btnsound = settingPanel:getChildByName("box_img"):getChildByName("btnsound")
	

    self.musicSlider:addEventListener(function (sender,eventType) self:onEventMusicSlider(sender,eventType) end)
    self.soundSlider:addEventListener(function (sender,eventType) self:onEventSoundSlider(sender,eventType) end)

	local function _btnClick(sender,eventType)
	 	if eventType == 2 then 
			roomPanel:setVisible(true)
	 	end
	 	if eventType == 0 then
	 	    cc.SimpleAudioEngine:getInstance():playEffect("sound/sound_click_btn.mp3")
       	end
	end

	startPlayBtn:addTouchEventListener(_btnClick);

	if roomBackBtn then
		local function roomBackBtnClick(sender,eventType)
	 	    if eventType == 2 then 
				roomPanel:setVisible(false)
	 	    end

	 	    if eventType == 0 then
		        cc.SimpleAudioEngine:getInstance():playEffect("sound/sound_click_btn.mp3")
        	end
	 	end
		roomBackBtn:addTouchEventListener(roomBackBtnClick);

    end
    
	if roomBtn1 then
		-- body

		local function roomBtn1Click(sender,eventType)
	 	        if eventType == 2 then --ccui.TouchEventType.ended then
					mode=3
					-- levelPanel:setVisible(true)
					roomPanel:setVisible(false)
					self:startGame()	 	        
				end

	 	        if eventType == 0 then
		           	 	        	cc.SimpleAudioEngine:getInstance():playEffect("sound/sound_click_btn.mp3")

        		end
	 	end
		
		roomBtn1:addTouchEventListener(roomBtn1Click);

	end
	-- print("14---------")

	if roomBtn2 then
		-- body


		local function roomBtn2Click(sender,eventType)
	 	        if eventType == 2 then --ccui.TouchEventType.ended then
					mode=2
					-- levelPanel:setVisible(true)
					roomPanel:setVisible(false)
					self:startGame()	 	        
				end

	 	        if eventType == 0 then
		           	 	        	cc.SimpleAudioEngine:getInstance():playEffect("sound/sound_click_btn.mp3")

        		end
	 	end
		
		roomBtn2:addTouchEventListener(roomBtn2Click);

	end
	-- print("15---------")

	if roomBtn3 then
		-- body


		local function roomBtn3Click(sender,eventType)
	 	        if eventType == 2 then --ccui.TouchEventType.ended then
					mode=1
					-- levelPanel:setVisible(true)
					roomPanel:setVisible(false)
					self:startGame()	 	        
				end

	 	        if eventType == 0 then
		           	 	        	cc.SimpleAudioEngine:getInstance():playEffect("sound/sound_click_btn.mp3")

        		end
	 	end
		
		roomBtn3:addTouchEventListener(roomBtn3Click);

	end

	if leftBtn then
		-- body


		local function leftBtnClick(sender,eventType)
	 	        if eventType == 2 then --ccui.TouchEventType.ended then
					self:onClickLeftBtn()	 	        
				end

	 	        if eventType == 0 then
		            	 	        	cc.SimpleAudioEngine:getInstance():playEffect("sound/sound_click_btn.mp3")

        		end
	 	end
		
		leftBtn:addTouchEventListener(leftBtnClick);

		
	end

	if overBtn then
		-- body


		local function overBtnClick(sender,eventType)
	 	        if eventType == 2 then --ccui.TouchEventType.ended then
					self:onClickOverBtn()
				end

	 	        if eventType == 0 then
		            	 	        	cc.SimpleAudioEngine:getInstance():playEffect("sound/sound_click_btn.mp3")

        		end
	 	end
		
		overBtn:addTouchEventListener(overBtnClick);

	end

	if gameHelpBtn then
		-- body


		local function gameHelpBtnClick(sender,eventType)
	 	        if eventType == 2 then --ccui.TouchEventType.ended then
					self:onClickMainHelpBtn()
				end

	 	        if eventType == 0 then
		            	 	        	cc.SimpleAudioEngine:getInstance():playEffect("sound/sound_click_btn.mp3")

        		end
	 	end
		
		gameHelpBtn:addTouchEventListener(gameHelpBtnClick);


	end


	if resultBack1Btn then
		-- body


		local function resultBack1BtnClick(sender,eventType)
	 	        if eventType == 2 then --ccui.TouchEventType.ended then
					self:onClickResultBackBtn()
				end

	 	        if eventType == 0 then
		            	 	        	cc.SimpleAudioEngine:getInstance():playEffect("sound/sound_click_btn.mp3")

        		end
	 	end
		
		resultBack1Btn:addTouchEventListener(resultBack1BtnClick);


	end

	if resultPlayBtn then
		-- body

		local function resultPlayBtnClick(sender,eventType)
	 	        if eventType == 2 then --ccui.TouchEventType.ended then
					self:onClickResultPlayBtn()
				end

	 	        if eventType == 0 then
		            	 	        	cc.SimpleAudioEngine:getInstance():playEffect("sound/sound_click_btn.mp3")

        		end
	 	end
		
		resultPlayBtn:addTouchEventListener(resultPlayBtnClick);

	end
	
	if helpCloseBtn then
		-- body

		local function helpCloseBtnClick(sender,eventType)
	 	        if eventType == 2 then --ccui.TouchEventType.ended then
					self:onClickHelpCloseBtn()
				end

	 	        if eventType == 0 then
		            	 	        	cc.SimpleAudioEngine:getInstance():playEffect("sound/sound_click_btn.mp3")

        		end
	 	end
		
		helpCloseBtn:addTouchEventListener(helpCloseBtnClick);

	end

	-- print("17---------")

	if btnmusic then


		local function btnmusicClick(sender,eventType)
	 	        if eventType == 2 then --ccui.TouchEventType.ended then
					local isMusicPlaying = cc.SimpleAudioEngine:getInstance():isMusicPlaying()
					if isMusicPlaying then
						-- body
						cc.SimpleAudioEngine:getInstance():stopMusic(true)
						btnmusic:loadTextures("minigame/images/animaloff.png","minigame/images/animaloff.png","minigame/images/animaloff.png")
					else
						cc.SimpleAudioEngine:getInstance():playMusic("minigame/sound/bg.mp3", true)
						btnmusic:loadTextures("minigame/images/animalon.png","minigame/images/animalon.png","minigame/images/animalon.png")
					end
				end

	 	        if eventType == 0 then
		           	 	        	cc.SimpleAudioEngine:getInstance():playEffect("sound/sound_click_btn.mp3")

        		end
	 	end
		
		btnmusic:addTouchEventListener(btnmusicClick);

	end
	-- print("18---------")

	if btnsound then


		local function btnsoundClick(sender,eventType)
	 	        if eventType == 2 then --ccui.TouchEventType.ended then
					local effectV = cc.SimpleAudioEngine:getInstance():getEffectsVolume()	

					if effectV > 0 then
						-- body
						cc.SimpleAudioEngine:getInstance():setEffectsVolume(0)
						btnsound:loadTextures("minigame/images/animaloff.png","minigame/images/animaloff.png","minigame/images/animaloff.png")

					else
						cc.SimpleAudioEngine:getInstance():setEffectsVolume(20)
						btnsound:loadTextures("minigame/images/animalon.png","minigame/images/animalon.png","minigame/images/animalon.png")

					end
				end

	 	        if eventType == 0 then
		            	 	        	cc.SimpleAudioEngine:getInstance():playEffect("sound/sound_click_btn.mp3")

        		end
	 	end
		
		btnsound:addTouchEventListener(btnsoundClick);

	end

	local currentLevel = cc.UserDefault:getInstance():getIntegerForKey("level")
	if levelRoom2 then
		-- body
		levelRoom2:onClick(function ( ... )
			-- body
			self:onClickLevelRoom2Btn()
		end)
	end
	if levelRoom3 then
		-- body
		levelRoom3:onClick(function ( ... )
			-- body
			self:onClickLevelRoom3Btn()
		end)
	end
	if levelRoom4 then
		-- body
		levelRoom4:onClick(function ( ... )
			-- body
			self:onClickLevelRoom4Btn()
		end)
	end
	if levelRoom5 then
		-- body
		levelRoom5:onClick(function ( ... )
			-- body
			self:onClickLevelRoom5Btn()
		end)
	end
	if levelRoom1 then
		-- body
		levelRoom1:onClick(function ( ... )
			-- body
			self:onClickLevelRoom1Btn()
		
		end)
	end
	if levelRoom6 then
		-- body
		levelRoom6:onClick(function ( ... )
			-- body
			self:onClickLevelRoom6Btn()
		end)
	end
	if levelRoom7 then
		-- body
		levelRoom7:onClick(function ( ... )
			-- body
			self:onClickLevelRoom7Btn()
		end)
	end
	if levelRoom8 then
		-- body
		levelRoom8:onClick(function ( ... )
			-- body
			self:onClickLevelRoom8Btn()
		end)
	end
	if levelRoom9 then
		-- body
		levelRoom9:onClick(function ( ... )
			-- body
			self:onClickLevelRoom9Btn()
		end)
	end
	if levelRoom10 then
		-- body
		levelRoom10:onClick(function ( ... )
			-- body
			self:onClickLevelRoom10Btn()
		end)
	end
end

function C:inittime()

end

function C:onEventMusicSlider( event )
	print("onEventMusicSlider")
	if event.name == "ON_PERCENTAGE_CHANGED" then
		local percent = self.musicSlider:getPercent()
		if percent < 10 then
			percent = 10
		elseif percent > 90 then
			percent = 90
		end
		self.musicSlider:setPercent(percent)
		local vol = self:sliderToVol(percent)
		cc.SimpleAudioEngine:getInstance():setMusicVolume(vol)
	end
end

function C:onEventSoundSlider( event )
	if event.name == "ON_PERCENTAGE_CHANGED" then
		local percent = self.soundSlider:getPercent()
		if percent < 10 then
			percent = 10
		elseif percent > 90 then
			percent = 90
		end
		self.soundSlider:setPercent(percent)
		local vol = self:sliderToVol(percent)
		cc.SimpleAudioEngine:getInstance():setEffectVolume(vol)
	end
end

function C:sliderToVol( sliderPercent )
	return ((sliderPercent-10)/80)*100
end

function C:volToSlider( volPercent )
	return 10 + 80*(volPercent/100)
end

function C:onClickMainPlayBtn(event)
	self:startGame()
end

function C:onClickMainHelpBtn(event)
	helpPanel:setVisible(true)
end

function C:onClickSettingBtn(event)
	settingPanel:setVisible(true)
end

function C:onClickHelpCloseBtn(event)
	helpPanel:setVisible(false)
end

function C:onSettingClickBtn(event)
	settingPanel:setVisible(false)
end

function C:onClickMainBookBtn(event)
	bookPanel:setVisible(true)
	local index = 1
	for i = 1, 5 do
		local key = string.format("bookBtn%d",i)
		local button = self[key]
		button:loadTexture("minigame/images/an2.png")
	end
	local key = string.format("bookBtn%d",index)
	local button = self[key]
	button:loadTexture("minigame/images/an1.png")
	for i = 1, 6 do
		local img=self.bookPanel:getChildByName(tostring(i))
		img:loadTexture(cardPath..index.."_"..i..".png")
		img:stopAllActions()
		img:setOpacity(0)
		local arr = {}
		arr[#arr+1]=cc.DelayTime:create(0.07*(i-1))
		arr[#arr+1]=cc.FadeIn:create(0.2)
		img:runAction(cc.Sequence:create(arr))
	end
end

function C:onClickBookCloseBtn(event)
	self.bookPanel:setVisible(false)
end

function C:onClickBookSelectBtn(event)
	local index = event.target:getTag()
	for i = 1, 5 do
		local key = string.format("bookBtn%d",i)
		local button = self[key]
		button:loadTexture("minigame/images/an2.png")
	end
	local key = string.format("bookBtn%d",index)
	local button = self[key]
	button:loadTexture("minigame/images/an1.png")
	
	for i = 1, 6 do
		local img=self.bookPanel:getChildByName(tostring(i))
		img:loadTexture(cardPath..index.."_"..i..".png")
		img:stopAllActions()
		img:setOpacity(0)
		local arr = {}
		arr[#arr+1]=cc.DelayTime:create(0.07*(i-1))
		arr[#arr+1]=cc.FadeIn:create(0.2)
		img:runAction(cc.Sequence:create(arr))
	end
end

function C:onClickEnterRoomBtn(event)
	roomPanel:setVisible(true)
end

function C:onClickQuitRoomBtn(event)
	roomPanel:setVisible(false)
end

function C:onClickRoom1Btn(event)
	mode=3
	self.gameBG:loadTexture("minigame/images/bg3.png")
	audio.playMusic("minigame/sound/bg3.mp3",true)
	roomPanel:setVisible(false)
end

function C:onClickRoom2Btn(event)
	mode=2
	self.gameBG:loadTexture("minigame/images/bg2.png")
	audio.playMusic("minigame/sound/bg2.mp3",true)
	roomPanel:setVisible(false)
end

function C:onClickRoom3Btn(event)
	mode=1
	self.gameBG:loadTexture("minigame/images/bg1.png")
	audio.playMusic("minigame/sound/bg1.mp3",true)
	levelPanel:setVisible(true)
	roomPanel:setVisible(false)
end

function C:onClickLevelRoom1Btn( event )
	-- body
	totalTime = 120
	self:startGame()
end

function  C:onClickLevelRoom2Btn( event )
	-- body
	totalTime = 118
	self:startGame()
end

function  C:onClickLevelRoom3Btn( event )
	-- body
	totalTime = 116
	self:startGame()
end

function  C:onClickLevelRoom4Btn( event )
	-- body
	totalTime = 115
	self:startGame()
end

function  C:onClickLevelRoom4Btn( event )
	-- body
	totalTime = 114
	self:startGame()
end

function  C:onClickLevelRoom6Btn( event )
	-- body
	totalTime = 113
	self:startGame()
end

function  C:onClickLevelRoom7Btn( event )
	-- body
	totalTime = 112
	self:startGame()
end

function  C:onClickLevelRoom8Btn( event )
	-- body
	totalTime = 111
	self:startGame()
end

function  C:onClickLevelRoom9Btn( event )
	-- body
	totalTime = 110
	self:startGame()
end

function  C:onClickLevelRoom10Btn( event )
	-- body
	totalTime = 110
	self:startGame()
end

function C:onClickOverBtn(event)
	self:gameOver()
	self:stopClock()
end

function C:onClickLeftBtn(event)
	if self.lock then
		return
	end
	
	if #leftList1==0 and cycleRound<maxCyCleRound then
		cycleRound=cycleRound+1
		local temp=utils:copyTable(leftList2)
		leftList2={}
		for i = #temp, 1,-1 do
			table.insert(leftList1,temp[i])
		end
		left2Order=1
		for i = 1, #leftList1 do
			leftList1[i].state=0
			leftList1[i].card:loadTexture("bg_back.png")
			leftList1[i].card:setPosition(cc.p(left1:getPosition()))
			leftList1[i].card:setLocalZOrder(i)
			leftList1[i].order=i
		end
		return
	end
	self.lock=true
	self:removeFromLeft(left2)
	self:removeFromLeft(left3)
	self:removeFromLeft(left4)
end

function C:removeFromLeft(t)
	if #leftList1==0 then return end
	local info=leftList1[#leftList1]
	table.remove(leftList1,#leftList1)
	table.insert(leftList2,info)
	for i = 1, #leftList2 do
		if leftList2[i] then
			leftList2[i].state=0
		end
	end
	local arr={}
	arr[#arr+1]=cc.EaseSineInOut:create(cc.MoveTo:create(0.3,cc.p(t:getPosition())))
	arr[#arr+1]=cc.CallFunc:create(function()
		info.card:setLocalZOrder(left2Order)
		self:resetLeft2State()
		self.lock=false
	end)
	info.card:runAction(cc.Sequence:create(arr))
	info.card:setLocalZOrder(10000)
	info.order=left2Order
	left2Order=left2Order+1
	info.card:loadTexture("minigame/images/pai/" .. "card"..info.color.."_"..info.number..".png")
end

function C:resetLeft2State()
	local temp1={}
	local temp2={}
	local temp3={}
	for i,v in ipairs(leftList2) do
		v.state=0
		if v.card:getPositionX()==left2:getPositionX() then
			table.insert(temp1,v)
		elseif v.card:getPositionX()==left3:getPositionX() then
			table.insert(temp2,v)
		elseif v.card:getPositionX()==left4:getPositionX() then
			table.insert(temp3,v)
		end
	end
	table.sort(temp1,function(a,b)
		return a.order>b.order
	end)
	if temp1[1] then
		temp1[1].state=1
	end
	table.sort(temp2,function(a,b)
		return a.order>b.order
	end)
	if temp2[1] then
		temp2[1].state=1
	end
	table.sort(temp3,function(a,b)
		return a.order>b.order
	end)
	if temp3[1] then
		temp3[1].state=1
	end
end

function C:onClickResultBackBtn(event)
	helpPanel:setVisible(false)
	gamePanel:setVisible(false)
	mainPanel:setVisible(true)
	resultPanel:setVisible(false)
	loadingPanel:setVisible(false)
	self:clearGame()
	self:stopClock()
end

function C:onClickResultPlayBtn(event)
	self:startGame()
end

function C:startGame()
	helpPanel:setVisible(false)
	gamePanel:setVisible(true)
	mainPanel:setVisible(false)
	resultPanel:setVisible(false)
	loadingPanel:setVisible(false)
	self:clearGame()

	cycleRound=0
	self.gameState=0

	dataList={}
	if mode==1 then
		for i = 0, 3 do
			for k = 1, 13 do
				local info={}
				info.color=i
				info.number=k
				info.index=math.random(1,300)
				table.insert(dataList,info)
			end
		end
	elseif mode==2 then
		for i = 0, 3 do
			for k = 1, 13 do
				local info={}
				info.color=3
				info.number=k
				info.index=math.random(1,300)
				table.insert(dataList,info)
			end
		end
	elseif mode==3 then
		for i = 2, 3 do
			for k = 1, 13 do
				local info={}
				info.color=i
				info.number=k
				info.index=math.random(1,300)
				table.insert(dataList,info)
			end
		end
		for i = 2, 3 do
			for k = 1, 13 do
				local info={}
				info.color=i
				info.number=k
				info.index=math.random(1,300)
				table.insert(dataList,info)
			end
		end
	end
	table.sort(dataList,function(a,b)
		return a.index>b.index
	end)
	local index=1
	cardList={}

	for i = 1, 7 do
		local key = string.format("card%d",i)
		local card=Card_Res[key]--self[key]
		local x,y=card:getPosition()
		local temp=i-1
		for j = 1, temp do
			local prefab=card:clone()
			if mode==1 then
				prefab:loadTexture("minigame/images/pai/" .. "bg_back1.png")
			elseif mode==2 then
				prefab:loadTexture("minigame/images/pai/" .. "bg_back2.png")
			elseif mode==3 then
				prefab:loadTexture("minigame/images/pai/" .. "bg_back3.png")
			end
			
			gamePanel:addChild(prefab)
			prefab:setPosition(x,y-(j-1)*height)
			prefab:setLocalZOrder(j)
			local _card={}
			_card.card=prefab
			_card.order=j
			_card.height=height
			_card.color=dataList[index].color
			_card.number=dataList[index].number
			index=index+1
			if j==temp then
				_card.state=1
				prefab:loadTexture("minigame/images/pai/" .. "card".._card.color.."_".._card.number..".png")
			else
				_card.state=0
			end
			table.insert(cardList,_card)
		end
	end
	leftList1={}
	for i = index, #dataList do
		local prefab=left1:clone()
		prefab:setVisible(true)
		if mode==1 then
			prefab:loadTexture("minigame/images/pai/" .. "bg_back1.png")
		elseif mode==2 then
			prefab:loadTexture("minigame/images/pai/" .. "bg_back2.png")
		elseif mode==3 then
			prefab:loadTexture("minigame/images/pai/" .. "bg_back3.png")
		end
		gamePanel:addChild(prefab)
		prefab:setPosition(cc.p(left1:getPosition()))
		prefab:setLocalZOrder(i)
		local _card={}
		_card.card=prefab
		_card.order=i
		_card.height=20
		_card.color=dataList[i].color
		_card.number=dataList[i].number
		_card.state=0
		table.insert(leftList1,_card)
	end

	curTimeScore=0
	curCardScore=0
	curScore=2000
	curTotalScore=curTimeScore+curCardScore+curScore
	self:showScore(curScore)
	self:showTime(totalTime)
	for i = 1, #cardList do
		cardList[i].card:setOpacity(0)
		local start=cc.p(cardList[i].card:getPosition())
		cardList[i].card:setPosition(cc.p(left1:getPosition()))
		local arr={}
		arr[#arr+1]=cc.DelayTime:create(0.1*(i-1))
		arr[#arr+1]=cc.CallFunc:create(function()
			cardList[i].card:setVisible(true)
			cardList[i].card:runAction(cc.FadeIn:create(0.2))
		end)
		arr[#arr+1]=cc.EaseBackOut:create(cc.MoveTo:create(0.8,start))
		arr[#arr+1]=cc.CallFunc:create(function()
			if i==#cardList then
				self.gameState=1
				local _card={}
				_card.card=right1
				_card.order=10
				_card.state=1
				_card.height=0
				_card.color=-1
				_card.number=1
				table.insert(cardList,_card)
			
				local _card={}
				_card.card=right2
				_card.order=10
				_card.state=1
				_card.height=0
				_card.color=-1
				_card.number=1
				table.insert(cardList,_card)
			
				local _card={}
				_card.card=right3
				_card.order=10
				_card.state=1
				_card.height=0
				_card.color=-1
				_card.number=1
				table.insert(cardList,_card)
			
				local _card={}
				_card.card=right4
				_card.order=10
				_card.state=1
				_card.height=0
				_card.color=-1
				_card.number=1
				table.insert(cardList,_card)

				self:startClock()
			end
		end)
		cardList[i].card:runAction(cc.Sequence:create(arr))
	end
end

function C:clearGame()
	for i = 1, #cardList do
		if cardList[i].card then
			if cardList[i].card~=right1 and cardList[i].card~=right2 and cardList[i].card~=right3 and cardList[i].card~=right4 then
				cardList[i].card:removeFromParent()
			end
		end
	end
	cardList={}
	for i = 1, #leftList1 do
		if leftList1[i].card then
			leftList1[i].card:removeFromParent()
		end
	end
	leftList1={}
	for i = 1, #leftList2 do
		if leftList2[i].card then
			leftList2[i].card:removeFromParent()
		end
	end
	leftList2={}
	self.gameState=0
end

function C:startClock()
	curTime=totalTime
	utils:createTimer("minigame.update",1,function()
		self:showTime(curTime)
		curTime=curTime-1
		if curTime<0 then
			self:stopClock()
			if self.selectedCard ==nil then
				self:gameOver()
			end
		end
	end)
end

function C:stopClock()
	utils:removeTimer("minigame.update")
end

function C:showTime(t)
	local p=t/totalTime
	timeLabel:setString(t)
end

function C:showScore(t)
	scoreLabel:setString(t)
end

function C:onTouchCardsPanel( event, pos )
	if event == "began" then
		if self.gameState==0 then return end
		if self.selectedCard then return end
		local info,list = self:getStartCard(pos)
		if info == nil then return end
		print("onTouchCardsPanel..began..info != null")
		self.selectedCard = info
		self.selectedCardList=list
		if self.selectedCard then
			self.selectedCard.card:setLocalZOrder(10000)
		end
		if self.selectedCardList then
			for i = 2, #self.selectedCardList do
				self.selectedCardList[i].card:setLocalZOrder(10000+i)
			end
		end
		self.startOrder=info.order
		self.startTouchPos=pos
		self.startCardPos=cc.p(info.card:getPosition())
	elseif event == "moved" then
		if self.gameState==0 then return end
		if self.selectedCard == nil then return end
		local _x=pos.x-self.startTouchPos.x
		local _y=pos.y-self.startTouchPos.y
		self.selectedCard.card:setPosition(cc.p(self.startCardPos.x+_x,self.startCardPos.y+_y))
		if self.selectedCardList then
			for i = 2, #self.selectedCardList do
				self.selectedCardList[i].card:setPositionX(self.selectedCardList[1].card:getPositionX())
				self.selectedCardList[i].card:setPositionY(self.selectedCardList[1].card:getPositionY()-height*(i-1))
			end
		end
	elseif event == "ended" or event == "cancelled" then
		if self.gameState==0 then return end
		 if self.selectedCard == nil then return end
		 local endCard=self:getEndCard(pos)
		 local fit=false
		 local target=nil
		 if endCard==nil then
			fit,target=self:inEmptyPos(pos)
		 else
			 fit=self:canFit(self.selectedCard,endCard)
			 target=cc.p(endCard.card:getPositionX(),endCard.card:getPositionY()-endCard.height)
		 end
		 if fit then
			self.gameState=0
			self:deleteFromLeft2(self.selectedCard)

			local array = {}
			array[1]=cc.EaseBackOut:create(cc.MoveTo:create(0.2,cc.p(target.x,target.y)))
			array[2]=cc.CallFunc:create(function()
				self.gameState=1
				local t=self:getNextCard(self.startCardPos)
				if t then
					t.state=1
					if t.color~=-1 then
						t.card:loadTexture("minigame/images/pai/" .. "card"..t.color.."_"..t.number..".png")
					end
				end
				if target.y>500 then
					curTime=totalTime
				end
				curTimeScore=curTimeScore+ self.selectedCard.number*curTime
				curCardScore=curCardScore+ self.selectedCard.color*10+self.selectedCard.number*3
				curScore=curScore+500
				curTotalScore=curTimeScore+curCardScore+curScore
				self:showScore(curTotalScore)
				self.selectedCard = nil
				if self:canOver() then
					self:gameOver()
				end
			end)
			self.selectedCard.card:runAction(cc.Sequence:create(array))
			self.selectedCard.card:setLocalZOrder(curOrder)
			self.selectedCard.order=curOrder
			if endCard then
				self.selectedCard.height=endCard.height
				endCard.state=0
			else
				self.selectedCard.height=height
			end
			curOrder=curOrder+1
			if self.selectedCardList then
				for i = 2, #self.selectedCardList do
					self.selectedCardList[i].card:setLocalZOrder(curOrder)
					self.selectedCardList[i].order=curOrder
					if endCard then
						self.selectedCardList[i].height=endCard.height
					else
						self.selectedCardList[i].height=height
					end
					curOrder=curOrder+1
					local array = {}
					array[1]=cc.EaseBackOut:create(cc.MoveTo:create(0.2,cc.p(target.x,target.y-height*(i-1))))
					array[2]=cc.CallFunc:create(function()
						if i==#self.selectedCardList then
							self.selectedCardList=nil
						end
					end)
					self.selectedCardList[i].card:runAction(cc.Sequence:create(array))
				end
			end
		else
			self.gameState=0
			local array = {}
			array[1]=cc.EaseBackOut:create(cc.MoveTo:create(0.2,self.startCardPos))
			array[2]=cc.CallFunc:create(function()
				self.selectedCard.card:setLocalZOrder(self.startOrder)
				self.selectedCard = nil
				self.gameState=1
				if self:canOver() then
					self:gameOver()
				end
			end)
			self.selectedCard.card:runAction(cc.Sequence:create(array))	
			if self.selectedCardList then
				for i = 2, #self.selectedCardList do
					local x=self.startCardPos.x
					local y=self.startCardPos.y-height*(i-1)
					local array = {}
					array[1]=cc.EaseBackOut:create(cc.MoveTo:create(0.2,cc.p(x,y)))
					array[2]=cc.CallFunc:create(function()
						self.selectedCardList[i].card:setLocalZOrder(self.startOrder+i)
						if i==#self.selectedCardList then
							self.selectedCardList=nil
						end
					end)
					self.selectedCardList[i].card:runAction(cc.Sequence:create(array))
				end
			end		
		end
	end
end

--获取开始的p
function C:getStartCard( pos )
	local temp = nil
	local list=nil
	for i,v in ipairs(cardList) do
		local card=v.card
		local state=v.state
		local x,y=card:getPosition()
		if state==1 then
			if x-OFFSET_X < pos.x and pos.x < x + OFFSET_X and y-OFFSET_Y < pos.y and pos.y < y + OFFSET_Y then
				temp = v
				break
			end
		else
			if x-OFFSET_X < pos.x and pos.x < x + OFFSET_X and y + OFFSET_Y-height < pos.y and pos.y < y + OFFSET_Y then		
				list=self:getUpCard(cc.p(v.card:getPosition()))
				local flag=self:isListCard(list)
				if flag then
					temp = v
					break
				end
			end
		end
	end

	if temp==nil then
		for i,v in ipairs(leftList2) do
			local card=v.card
			local state=v.state
			local x,y=card:getPosition()
			if x-OFFSET_X < pos.x and pos.x < x + OFFSET_X and y-OFFSET_Y < pos.y and pos.y < y + OFFSET_Y and state==1 then
				temp = v
				break
			end
		end
	end
	return temp,list
end

--获取结束的p
function C:getEndCard( pos )
	local temp = nil
	for i,v in ipairs(cardList) do
		local card=v.card
		local state=v.state
		local x,y=card:getPosition()
		if x-OFFSET_X < pos.x and pos.x < x + OFFSET_X and y-OFFSET_Y < pos.y and pos.y < y + OFFSET_Y and state==1 and card~=self.selectedCard.card then
			temp = v
			break
		end
	end
	return temp
end

--是否适合叠加
function C:canFit(card1,card2)
	if card2==nil then
		return false
	end
	local fit=false
	if mode==1 then
		if card2.color==-1 then
			if card1.number==1 then
				fit=true
			end
		elseif card2.height==0 then
			if card1.color==card2.color and card1.number-card2.number==1 then
				fit=true
			end
		elseif card2.color-card1.color==1 or card2.color-card1.color==-1 or card2.color-card1.color==3 or card2.color-card1.color==-3 then
			if card1.number-card2.number==-1 then
				fit=true
			end
		end
	elseif mode==2 then
		if card2.color==-1 then
			if card1.number==1 then
				fit=true
			end
		elseif card2.height==0 then
			if card1.number-card2.number==1 then
				fit=true
			end
		elseif card1.number-card2.number==-1 then
			fit=true
		end
	elseif mode==3 then
		if card2.color==-1 then
			if card1.number==1 then
				fit=true
			end
		elseif card2.height==0 then
			if card1.color==card2.color and card1.number-card2.number==1 then
				fit=true
			end
		elseif card1.color==card2.color and card1.number-card2.number==-1 then
			fit=true
		end
	end
	return fit
end

--是否在没p的列
function C:inEmptyPos(pos)
	local fit=false
	local target=nil
	if self.selectedCard.number==13 then
		for i=1,7 do
			local key = string.format("card%d",i)
			local card=Card_Res[key]--self[key]
			local posx,posy=card:getPosition()
			if posx-OFFSET_X < pos.x and pos.x < posx + OFFSET_X and posy-OFFSET_Y < pos.y and pos.y < posy + OFFSET_Y  then
				local isin1=false
				local isin2=false
				for i,v in ipairs(cardList) do
					local card1=v.card
					local x,y=card1:getPosition()
					if x-OFFSET_X < pos.x and pos.x < x + OFFSET_X and y-OFFSET_Y < pos.y and pos.y < y + OFFSET_Y and self.selectedCard.card~=card1 then
						isin1=true
						break
					end
				end
				if isin1==false and isin2==false then
					fit=true
					target=cc.p(posx,posy)
					break
				end
			end
		end
	end
	return fit,target
end

--获取p的下面一张p
function C:getNextCard(pos)
	for i,v in ipairs(cardList) do
		local x,y=v.card:getPosition()
		if pos.x==x and y-pos.y==v.height then
			return v
		end
	end
	return nil
end

--获取p的上面所有p
function C:getUpCard(pos)
	local temp={}
	for i,v in ipairs(cardList) do
		local x,y=v.card:getPosition()
		if pos.x==x and y<=pos.y then
			table.insert(temp,v)
		end
	end
	table.sort(temp,function(a,b)
		return a.card:getPositionY()>b.card:getPositionY()
	end)
	return temp
end

--判断数组是否符合长龙规则
function C:isListCard(temp)
	if temp==nil then
		return false
	end
	local flag=true
	if mode==1 then
		for i = 1, #temp-1 do
			if temp[i].color-temp[i+1].color==1 or temp[i].color-temp[i+1].color==-1 or temp[i].color-temp[i+1].color==3 or temp[i].color-temp[i+1].color==-3 then
			if temp[i].number-temp[i+1].number==1 then

				else
					flag=false
				end
			else
				flag=false
			end
		end
	elseif mode==2 then
		for i = 1, #temp-1 do
			if temp[i].number-temp[i+1].number==1 then

			else
				flag=false
			end
		end
	elseif mode==3 then
		for i = 1, #temp-1 do
			if temp[i].color==temp[i+1].color and temp[i].number-temp[i+1].number==1 then

			else
				flag=false
			end
		end
	end
	return flag
end

--有可能是从左上拉下来的p，所以过滤一下
function C:deleteFromLeft2(info)
	local has=false
	for i,v in ipairs(leftList2) do
		if v==info then
			table.remove(leftList2,i)
			table.insert(cardList,info)
			if leftList2[#leftList2] then
				leftList2[#leftList2].state=1
			end
			has=true
			break
		end
	end
	if has then
		local temp={}
		for i,v in ipairs(leftList2) do
			if v.card:getPositionX()==self.startCardPos.x then
				table.insert(temp,v)
			end
		end
		table.sort(temp,function(a,b)
			return a.order>b.order
		end)
		if temp[1] then
			temp[1].state=1
		end
	end
end

--判断游戏是否可以结束
function C:canOver()
	local flag=true
	for i,v in ipairs(cardList) do
		if v.height~=0 then
			flag=false
			break
		end
	end
	if curTime<=0 then
		flag=true
	end
	return flag
end

--游戏结算
function C:gameOver()
	resultPanel:setVisible(true)
	score:setString(curScore)
	cardBonus:setString(curCardScore)
	timeBonus:setString(curTimeScore)
	totalScore:setString(curTotalScore)
	if self:canOver() then
		cc.UserDefault:getInstance():setIntegerForKey("level", selectLevel)
	end
end

return C
