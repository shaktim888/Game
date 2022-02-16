local ShejianGameScene = class("ShejianGameScene", function()
    return cc.Layer:create()
end)

function ShejianGameScene:ctor()
    math.randomseed(os.time())
end

function ShejianGameScene:onExit( )
	if self._update then
		scheduler = cc.Director:getInstance():getScheduler()
		scheduler:unscheduleScriptEntry(self._update)
		self._update = nil
	end
	cc.SimpleAudioEngine:getInstance():stopMusic()
end

function ShejianGameScene:create()
    local layer = ShejianGameScene.new()
    layer:init()
    return layer
end

function ShejianGameScene:getClassName()
    return "ShejianGameScene"
end

local local_bit = require "app.utils.local_bit"


local StartPanel 
local GuanKaPanel
local GamePanel
local HelpPanel

local startPlayBtn
local startHelpBtn
local startScoreBtn
local helpCloseBtn
local scoreCloseBtn

local gkHomeBtn
local gkStartBtn
local gkPanel
local gkItemBtnList = {}
local DQgk = 1

local gameCloseBtn
local gameHelpBtn
local gameLevelText
local gameScoreText
local gameTimeText
local gameGoalText
local gamePokePanel
local pokeItem
local tishiPanel

local pokeList = {}
local texiao = {}
local dianjiPoke = nil
local pokeCont = 0

local schedule
local schedule2

local score = 0
local Goalscore = 0

local gameBtns = {}

local Xpos = 1
local Sindex = 1

local play
local playPoke
local Yindex = 1
local AddYindx = 1

local schedule3
local schedule4

local x,y

local textstartplay
local textstarthelp
local text_home
local text_start
local text_close
local text_help
local fontcolor 



local eventExecuter = require("packages.eventExecuter.EventExecuter"):create()

function ShejianGameScene:registerPnl(panel)
    if not eventExecuter:hasEvents() then
        return 
    end
    local param = {
        name = panel:getName(),
        timename = "enterTransitionFinish",
        target = panel
    }
    local func = panel.setVisible
    panel.setVisible = function (node_self, flag)
        if flag then
            if panel:getName()  == "GamePanel" then
                self:grabsGamePanel()
            end
        end
        param.timename = flag and "enterTransitionFinish" or "exit"
        eventExecuter:timeEvent(param)
        func(node_self, flag)
    end
end

function ShejianGameScene:grabsGamePanel()
	gameLevelText:setString(""..math.random(1,32))   
	gameScoreText:setString(""..math.random(1,15)*100) 
	gameTimeText:setString(""..math.random(20,60)) 
	gameGoalText:setString(""..math.random(15,40)*100) 

	local pokeList = {} 
	local xpos = 0
	local ypos = 0
	local zushu  = math.random(1,4)
	for k=1,zushu do
		for i=1,11 do
			local bg = math.random(1,4)
			local dianshu = math.random(1,6)
			local pokeI = pokeItem:clone()
			gamePokePanel:addChild(pokeI)
			gamePokePanel:setVisible(true)
			pokeI.dian = dianshu
			pokeI:setVisible(true)
			pokeI:loadTexture("majia/img/card/pai"..bg..".png") 
			pokeI:getChildByName("item"):loadTexture("majia/img/card/hua"..pokeI.dian..".png") 
			table.insert(pokeList,pokeI)
		end
	end
	
	for i=#pokeList,1,-1 do
		xpos = i%11
		if xpos == 0 then
			ypos = ypos + 1
			print(ypos)
		end
		pokeList[i].y = ypos
		pokeList[i].x = xpos
		pokeList[i]:setPosition(180 + xpos* 55,620 - ypos * 60)
	end

	local pos  = math.random(2,10)
	self:SetXpos(pos)
end

function ShejianGameScene:init()

    self.loadNode = cc.CSLoader:createNode("majia/ShejianGameLayer.csb")
    self.loadNode:setContentSize(cc.size(display.size.height, display.size.width))
    ccui.Helper:doLayout(self.loadNode)
    self:addChild(self.loadNode, 0)
    local offsetX = (display.width-1136)/2
    self.loadNode:setPositionX(offsetX)
	PLAY_MUSIC("majia/bg.mp3")--播放音乐
	StartPanel = self.loadNode:getChildByName("StartPanel")
	GamePanel = self.loadNode:getChildByName("GamePanel")
	GuanKaPanel = self.loadNode:getChildByName("GuanKaPanel")
	HelpPanel = self.loadNode:getChildByName("HelpPanel")

	self:registerPnl(StartPanel)
    self:registerPnl(GamePanel)

	local role = StartPanel:getChildByName("role");
    role:ignoreContentAdaptWithSize(true)
    local function getRgb()
        local textArray = {{231,207,205},{211,209,184},{232,232,232},{219,205,196},{223,190,121},{192,178,151}}
        local index = math.random(1,6)
        local r = textArray[index][1]
        local g = textArray[index][2]
        local b = textArray[index][3]
        return cc.c3b(r,g,b)
    end
    fontcolor = getRgb()
	
	self:initOnClick()
	local dqgk = cc.UserDefault:getInstance():getIntegerForKey("dqgk", 0)
	if dqgk == 0 then
		DQgk = 1
	else
		DQgk = dqgk
		if DQgk == 32 then
			DQgk = 32
		end
	end
	
	gameCloseBtn = GamePanel:getChildByName("SetPanel"):getChildByName("close")   
	gameHelpBtn = GamePanel:getChildByName("SetPanel"):getChildByName("help")   
	gameLevelText = GamePanel:getChildByName("SetPanel"):getChildByName("level"):getChildByName("level_text")    
	gameScoreText = GamePanel:getChildByName("SetPanel"):getChildByName("score"):getChildByName("score_text")  
	gameTimeText = GamePanel:getChildByName("SetPanel"):getChildByName("time"):getChildByName("time_text")  
	gameGoalText = GamePanel:getChildByName("SetPanel"):getChildByName("goal"):getChildByName("goal_text")  
	gamePokePanel = GamePanel:getChildByName("pokePanel")
	pokeItem = GamePanel:getChildByName("pokeItem")
	tishiPanel = GamePanel:getChildByName("tishi")
	tishiPanel:setVisible(false)
	texiao[1] = GamePanel:getChildByName("texiao")
	texiao[2] = gamePokePanel:getChildByName("play"):getChildByName("texiao")
	gkHomeBtn = GuanKaPanel:getChildByName("home")  
	gkStartBtn = GuanKaPanel:getChildByName("start")  
	gkPanel = GuanKaPanel:getChildByName("gkPanel")
	
	if gameCloseBtn then
		gameCloseBtn:onClick(function( ... )
			self:CloseGame()
		end)
	end

	if gameHelpBtn then
		gameHelpBtn:onClick(function( ... )
			HelpPanel:setVisible(true)
		end)
	end

	local xpos = 0
	local ypos = 0
	for i=1,32 do
		local pokeI2 = gkPanel:getChildByName("gk"):clone()
		gkPanel:addChild(pokeI2)
		pokeI2:setVisible(true)
		xpos = (i-1)%8
		if xpos == 0 then
			ypos = ypos + 1
		end
        pokeI2:getChildByName("level_text"):setString(i) 
        pokeI2:getChildByName("level_text"):setColor(fontcolor) 
		pokeI2:setPosition(120 + xpos* 130,650 - ypos * 120)
		table.insert(gkItemBtnList,pokeI2)	
	end
	for i=1 ,5 do
		gameBtns[i] = gamePokePanel:getChildByName("btn"..i)
		if gameBtns[i] then
			gameBtns[i]:onClick(function( ... )
				self:BtnOnClick(i)
			end)
		end
	end
	gameBtns[1]:setRotation(180)
	play = gamePokePanel:getChildByName("play")
	playPoke = gamePokePanel:getChildByName("poke")
	x,y = playPoke:getPosition()

	local text_des = HelpPanel:getChildByName("text_des")
	local closeBtn = tishiPanel:getChildByName("closeBtn")
	local text_score_close = closeBtn:getChildByName("text_close")
	local text_score_num = GamePanel:getChildByName("tishi"):getChildByName("score") 
	
	StartPanel:setVisible(true)
	GamePanel:setVisible(false)
	GuanKaPanel:setVisible(false)
	HelpPanel:setVisible(false)

	text_home = gkHomeBtn:getChildByName("text_home")
	text_start = gkStartBtn:getChildByName("text_start")
	text_close = gameCloseBtn:getChildByName("return_text")
	text_help = gameHelpBtn:getChildByName("help_text")
	local fontChangeArr = {
		textstartplay,textstarthelp,text_home,text_start,
        text_close,text_help,
		gameLevelText,gameScoreText,gameTimeText,gameGoalText,text_des,text_score_close,text_score_num
    }
    for key, v in pairs(fontChangeArr or {}) do
        local widget = v
        if widget and widget.setTextColor and type(widget.setTextColor) == "function" then
            widget:setTextColor(fontcolor)
        elseif widget and widget.setTitleColor and type(widget.setTitleColor) == "function"  then
            widget:setTitleColor(fontcolor)
        end
    end
end

--按钮监听
function ShejianGameScene:initOnClick()

	startPlayBtn = StartPanel:getChildByName("play")
	startHelpBtn = StartPanel:getChildByName("help")  
	startScoreBtn = StartPanel:getChildByName("score")
	
	textstartplay = startPlayBtn:getChildByName("text_play")
	textstarthelp = startHelpBtn:getChildByName("text_help")  
	
	
	--开始游戏监听
	if startPlayBtn then
		startPlayBtn:onClick(function( ... )
			StartPanel:setVisible(false)
			GuanKaPanel:setVisible(true)
			self:GKStart()
		end)
	end

	--开始游戏监听
	if startHelpBtn then
		startHelpBtn:onClick(function( ... )
			HelpPanel:setVisible(true)
		end)
	end

	helpCloseBtn = HelpPanel:getChildByName("close")  

	if helpCloseBtn then
		helpCloseBtn:onClick(function( ... )
			HelpPanel:setVisible(false)
		end)
	end
end

--按钮监听
function ShejianGameScene:GKStart()
	if gkHomeBtn then
		gkHomeBtn:onClick(function( ... )
			StartPanel:setVisible(true)
			GuanKaPanel:setVisible(false)
		end)
	end
	if gkStartBtn then
		gkStartBtn:onClick(function( ... )
			self:StartGame(DQgk)
		end)
	end
	for i=1,32 do
		if gkItemBtnList[i] then
			gkItemBtnList[i]:onClick(function( ... )
				self:StartGame(i)
			end)
		end
		gkItemBtnList[i]:setEnabled(false)
	end
	for i=1,DQgk do
		gkItemBtnList[i]:setEnabled(true)
	end
end

--开始游戏
function ShejianGameScene:StartGame(idx)
	StartPanel:setVisible(false)
	GamePanel:setVisible(true)
	GuanKaPanel:setVisible(false)
	Xpos = 1
	self:SetXpos(Xpos)
	Sindex = 1
	self:SetItem(Sindex)
	score = 0
	Goalscore = 1000 + idx * 500
	gameGoalText:setString(Goalscore)            
	gameScoreText:setString(score)           
	gameLevelText:setString(idx)             
	gameTimeText:setString("0")     
	tishiPanel:setVisible(false)
	local nameP = "majia/img/texiao/"
	self:pokeAnim(texiao[2],texiao[2],nameP,8,true)
	local ssss = 50 + idx * 10
	local jishi = 0
	gameTimeText:setString(ssss)
	schedule2 = cc.Director:getInstance():getScheduler()

	if schedule then
		schedule2:unscheduleScriptEntry(schedule)
		schedule = nil
	end
	Yindex = 1
	AddYindx = 1
	self:creatMJ()
	local update = function(dt)		
		ssss = ssss - 1
		gameTimeText:setString(ssss) 
		jishi = jishi + 1
		if jishi%10 == 0 then
			self:creatMJ()
		end
		if ssss <= 0 then
			self:GameOver(2)
		end
    end
	schedule = schedule2:scheduleScriptFunc(update, 1, false)
end

--生产麻将牌
function ShejianGameScene:creatMJ()
	math.newrandomseed()
	local xpos = 0
	local ypos = 0
	for i=1,11 do
		local bg = math.random(1,4)
		local dianshu = math.random(1,6)
		local pokeI = pokeItem:clone()
		gamePokePanel:addChild(pokeI)
		pokeI.dian = dianshu
		pokeI:setVisible(true)
		pokeI:loadTexture("majia/img/card/pai"..bg..".png") 
		pokeI:getChildByName("item"):loadTexture("majia/img/card/hua"..pokeI.dian..".png") 
		table.insert(pokeList,pokeI)	
	end
	for i=#pokeList,1,-1 do
		xpos = i%11
		if xpos == 0 then
			ypos = ypos + 1
		end
		pokeList[i].y = ypos
		pokeList[i].x = xpos
		pokeList[i]:setPosition(180 + xpos* 55,620 - ypos * 60)
	end
	Yindex = ypos 
	if Yindex - AddYindx >= 5 then
		self:GameOver(2)
	end
end

--游戏按钮监听
function ShejianGameScene:BtnOnClick(idx)
	if idx == 1 then
		Xpos = Xpos - 1
		if Xpos <= 1 then
			Xpos = 1
		end
		self:SetXpos(Xpos)
	elseif idx == 2 then
		Xpos = Xpos + 1
		if Xpos >= 11 then
			Xpos = 11
		end
		self:SetXpos(Xpos)
	elseif idx == 3 then
		Sindex = Sindex - 1
		if Sindex < 1 then
			Sindex = 6
		end
		self:SetItem(Sindex)
	elseif idx == 4 then
		Sindex = Sindex + 1
		if Sindex > 6 then
			Sindex = 1
		end
		self:SetItem(Sindex)
	elseif idx == 5 then
		self:FaSheMaJiang()
	end
end

--设置麻将变化
function ShejianGameScene:SetItem(idx)
	playPoke.dian = idx
	playPoke:getChildByName("item"):loadTexture("majia/img/card/hua"..playPoke.dian..".png") 
end

--设置左右坐标
function ShejianGameScene:SetXpos(idx)
	play:setPositionX(125 + idx*55)
	playPoke:setPositionX(125 + idx*55)
	x = 125 + idx*55
end

--发射麻将
function ShejianGameScene:FaSheMaJiang()
	self:pokeMove(x,y)
	schedule4 = cc.Director:getInstance():getScheduler()
	if schedule3 then
		schedule4:unscheduleScriptEntry(schedule3)
		schedule3 = nil
	end
	local update = function(dt)		
		for i=#pokeList,1,-1 do
			if pokeList[i]:isVisible() then
				local rcFish = pokeList[i]:getBoundingBox()
				local reBullet = playPoke:getBoundingBox()
				if cc.rectIntersectsRect(rcFish, reBullet) then
					if pokeList[i].dian == playPoke.dian then
						pokeList[i]:setVisible(false)
						local nameP = "majia/img/rem/"
						self:pokeAnim(texiao[1],pokeList[i],nameP,11,false)
						PLAY_SOUND("majia/xiaoshi.wav")
						score = score + 100
						gameScoreText:setString(score)            
						if score >= Goalscore then
							self:GameOver(1)
						end
					end
					playPoke:stopAllActions()
					playPoke:setPosition(cc.p(x,y))
					self:IsAddYindex()
				end
			end
		end
    end
	schedule3 = schedule4:scheduleScriptFunc(update, 0.01, false)
end

--是否增加索引
function ShejianGameScene:IsAddYindex()
	local jishu = 0
	for i=#pokeList,1,-1 do
		if pokeList[i]:isVisible() == false then
			if pokeList[i].y == Yindex then
				jishu = jishu + 1
				if jishu >= 11 then
					AddYindx = AddYindx + 1
				end
			end
		end
	end
end

--提示分移动
function ShejianGameScene:pokeMove(x,y)
	local array1 = {}
	array1[1] = cc.MoveTo:create(0.5, cc.p(x,560))
	array1[2] =
		cc.CallFunc:create(
		function()		
			playPoke:setPosition(cc.p(x,y))
		end
	)
	playPoke:runAction(cc.Sequence:create(array1))
end

--爆炸特效
function ShejianGameScene:pokeAnim(obj,item,name,cont,isfag)
	local x,y = item:getPosition()
	obj:setPosition(cc.p(x,y))    
	obj:setVisible(true)
	local animation = cc.Animation:create()
	local _name
	for i = 1, cont do
		_name = name..i..".png"
		
		animation:addSpriteFrameWithFile(_name)
	end
	animation:setDelayPerUnit(0.5 / cont)
	animation:setRestoreOriginalFrame(true)
	if isfag then
		animation:setLoops(500000000000)
		local action = cc.Animate:create(animation)
		obj:runAction(cc.Sequence:create(action, action:reverse()))	  
	else
		local array1 = {}
		array1[1] = cc.Animate:create(animation)
		array1[2] =
			cc.CallFunc:create(
			function()				
				obj:setVisible(false)
			end
		)
		obj:runAction(cc.Sequence:create(array1))
	end
end

--退出游戏清空数据
function ShejianGameScene:GameOver(idx)
	printInfo("退出游戏清空数据"..idx)
	tishiPanel:setVisible(true)
	if schedule then
		schedule2:unscheduleScriptEntry(schedule)
		schedule = nil
	end
	if schedule3 then
		schedule4:unscheduleScriptEntry(schedule3)
		schedule3 = nil
	end
	if idx == 1 then
		DQgk = DQgk + 1
		local loginMode = cc.UserDefault:getInstance():setIntegerForKey("dqgk", DQgk)
	end
	tishiPanel:getChildByName("score"):setString("SCORE:"..score)
	local closeBtn = tishiPanel:getChildByName("closeBtn")
	if closeBtn then
		closeBtn:onClick(function( ... )
			--退出游戏清空数据
			self:CloseGame()
		end)
	end
end

--退出游戏清空数据
function ShejianGameScene:CloseGame()
	StartPanel:setVisible(false)
	GamePanel:setVisible(false)
	GuanKaPanel:setVisible(true)
	tishiPanel:setVisible(false)
	for i=#pokeList,1,-1 do
		pokeList[i]:removeFromParent()
		pokeList[i] = nil
	end
	self:GKStart()
end

---------------------------------万恶的分割线-----------------------------------------------
PokePos = {
	{
		{150,500,1},{230,450,3},{310,400,4},{390,350,6},{470,300,7},{550,250,8},{630,200,9},{710,150,1},
		{120,220,2},{200,220,9},{120,120,5},{200,120,4},{156,176,7},
		{660,520,3},{740,520,2},{660,420,6},{740,420,5},{700,480,8},
		
	},
	{
		{220,150,1},{300,150,8},{380,150,9},{460,150,10},{540,150,11},{620,150,8},
		{250,150,2},{330,150,1},{410,150,8},{490,150,11},{570,150,10},
		{220,250,3},{300,250,2},{380,250,1},{460,250,11},{540,250,9},{620,250,7},
		{250,250,4},{330,250,3},{410,250,2},{490,250,1},{570,250,9},
		{220,350,5},{300,350,4},{380,350,3},{460,350,2},{540,350,7},{620,350,9},
		{250,350,6},{330,350,5},{410,350,4},{490,350,3},{570,350,6},
		{220,450,7},{300,450,6},{380,450,5},{460,450,4},{540,450,10},{620,450,11},
		{250,450,8},{330,450,7},{410,450,6},{490,450,5},{570,450,10},
	},
	{
		{220,150,1},{300,150,8},{380,150,9},{460,150,10},{540,150,11},{620,150,8},
		{250,150,2},{330,150,1},{410,150,8},{490,150,11},{570,150,10},
		{220,250,3},{300,250,2},{380,250,1},{460,250,11},{540,250,9},{620,250,7},
		{250,250,4},{330,250,3},{410,250,2},{490,250,1},{570,250,9},
		{220,350,5},{300,350,4},{380,350,3},{460,350,2},{540,350,7},{620,350,9},
		{250,350,6},{330,350,5},{410,350,4},{490,350,3},{570,350,6},
		{220,450,7},{300,450,6},{380,450,5},{460,450,4},{540,450,10},{620,450,11},
		{250,450,8},{330,450,7},{410,450,6},{490,450,5},{570,450,10},
	},
}
return ShejianGameScene
