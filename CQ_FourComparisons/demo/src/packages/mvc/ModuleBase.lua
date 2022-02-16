local ModuleBase = class("ModuleBase", cc.Node)

local WARNING = DEBUG > 0

-- 替换UI加载工具需要修改此处 !!
function ModuleBase:__loadLayoutFile(layout)
    local extend = string.lower(layout:match(".+%.(%w+)$"))
    if extend == "csb" then
        return self:__loadLayoutFileWithCsb(layout)
    elseif extend == "lua" then
        return self:__loadLayoutFileWithLua(layout)
    end
end

function ModuleBase:__loadLayoutFileWithLua(layout)
    local scene = require(layout)
    local game_scene = scene.create(nil)
    self.__csbAnimation = game_scene.animation
    return game_scene.root
end

function ModuleBase:__loadLayoutFileWithCsb(layout)
    return cc.CSLoader:createNode(layout)
end

function ModuleBase.__doLayout(self)
    local size = cc.Director:getInstance():getOpenGLView():getDesignResolutionSize()
    self:setContentSize(size)
    self:setAnchorPoint(cc.p(0,0))
    self.mLayout:setContentSize(size)
    ccui.Helper:doLayout(self.mLayout)
end

function ModuleBase:ctor(scene, name, ...)
    self:enableNodeEvents()
    self.mScene    = scene
    self.mName     = name
    self.mView     = {}
    self.mModule   = {}
    self.mLayout   = nil
    self._nodeClickRegist = {}
    self:registTouchEvent()

    if type(self.preCreate) == "function" then self:preCreate(...) end

    self:loadLayout()
    self:bindModules()
    self:bindBehavior()
    self:initMLayout()

    if type(self.onCreate) == "function" then self:onCreate(...) end

    if global.eventExecuter:hasEvents() then
        local param = {
            name = self:getClassName(),
            timename = "enter",
            target = self
        }
        function ModuleBase:onEnterCallback_()
            local param = {
                name = self:getClassName(),
                timename = "enter",
                target = self
            }
            param.timename = "enter"
            global.eventExecuter:timeEvent(param)
        end

        function ModuleBase:onExitCallback_()
            local param = {
                name = self:getClassName(),
                timename = "enter",
                target = self
            }
            param.timename = "exit"
            global.eventExecuter:timeEvent(param)
        end

        function ModuleBase:onEnterTransitionFinishCallback_()
            local param = {
                name = self:getClassName(),
                timename = "enter",
                target = self
            }
            param.timename = "enterTransitionFinish"
            global.eventExecuter:timeEvent(param)
        end

        function ModuleBase:onEnterTransitionStartCallback_()
            local param = {
                name = self:getClassName(),
                timename = "enter",
                target = self
            }
            param.timename = "exitTransitionStart"
            global.eventExecuter:timeEvent(param)
        end

        function ModuleBase:onCleanupCallback_()
            local param = {
                name = self:getClassName(),
                timename = "enter",
                target = self
            }
            param.timename = "cleanup"
            global.eventExecuter:timeEvent(param)
        end
    end
end

function ModuleBase:getClassName()
    return self.class.__cname
end

local function seekByName(self, childName)
    local children = self:getChildren()
    local find = nil
    for i=1,#children do
        if (children[i]:getName() == childName) then
            find = children[i]
            break
        end
    end
    if not find then
        for i=1,#children do
            find = seekByName(children[i],childName)
            if (find) then
                break
            end
        end
    end
    if(find and type(find.addClickEventListener) == "function")then
        find.__org_addClickEventListener = find.__org_addClickEventListener or find.addClickEventListener
        find.addClickEventListener = function (...)
            local arg = {...}
            local func = arg[2]
            arg[1].__lastClickTime = 0
            arg[1].__diffClickTime = arg[1].__diffClickTime or 0.5
            arg[2] = function (...)
                if socket.gettime() - arg[1].__lastClickTime > arg[1].__diffClickTime then
                    arg[1].__lastClickTime = socket.gettime()
                    func(...)
                end
            end
            find.__org_addClickEventListener(unpack(arg))
            find:setPressedActionEnabled(true)
            find:setZoomScale(0.2)
        end
    end
    if find then
        find.seekByName = seekByName
    end
    return find
end

local function stepView(self,parent)
    local children = parent:getChildren() or {}
    for i=1,#children do
        local name = children[i]:getName()
        if(self.mView[name] ~= nil) then
            if WARNING and self:getName() then
               
                print("[Warning] Module:["..self:getName().."] append view but find same name: ["..name.."]")
            end
        else
            self.mView[name] = children[i]
            children[i].seekByName = seekByName
            if type(self["on"..name.."Click"]) == "function" and type(children[i].addClickEventListener) == "function" then
                children[i]:addClickEventListener(handler(self,self["on"..name.."Click"]))
                if children[i].setPressedActionEnabled then
                    children[i]:setPressedActionEnabled(true)
                    children[i]:setZoomScale(0.2)
                end
            end
        end
        stepView(self,children[i])
    end
end

function ModuleBase:loadLayout()
    if type(self.RESOURCE_FILENAME) == "string" then
        xpcall(function()
                self.mLayout = self:__loadLayoutFile(self.RESOURCE_FILENAME)
                if self.mLayout then
                    self:add(self.mLayout)
                else
                    if WARNING then
                        print("Module ["..self:getName().."] could not find layout: "..self.RESOURCE_FILENAME)
                    end
                end
            end, function(msg)
                if WARNING then
                    print("loadLayout error["..self:getName().."]: " .. msg .. "(" .. self.RESOURCE_FILENAME .. ")")
                end
            end
        )
    end
end

function ModuleBase:initMLayout()
    if self.mLayout then
        stepView(self,self.mLayout)
        ModuleBase.__doLayout(self)
        if not next(self.mView) then
            dump(self.mView)
            error("Module ["..self:getName().."] load layout but found nothing view !")
        end
    end
end

-- 绑定其它组件,与SceneBase相同
function ModuleBase:bindModules()
    for i,module in ipairs(self.module or {}) do
        xpcall(
            function()
                local mod = require(module)
                if rawget(mod,"ctor") then
                    error("[Error] Module "..module.." could not overwrite parent ctor() ,use onCreate() or preCreate()")
                end
                local m = mod:create(self, module)
                self.mModule[module] = m
                self:add(m)
            end, 
            function(err)
                if WARNING then
                    print("Module could not load sub module: "..module)
                    __G__TRACKBACK__(err)
                end
            end
        )
    end
end

-- 绑定一些行为
function ModuleBase:bindBehavior()
    for i,behavior in ipairs(self.behavior or {}) do
        xpcall(
            function()
                local beh    = require(behavior)
                local behTar = beh.new()
                if behTar.export == nil then
                    behTar.export = {}
                    for k,_ in pairs(beh) do
                        if type(behTar[k]) == "function" then
                            behTar.export[#behTar.export+1] = k
                        end
                    end
                end
                for i,func in ipairs(behTar.export or {}) do
                    local orgFunc = self[func]
                    self[func] = function (...)
                        local returnValue = nil
                        if orgFunc then
                            returnValue = orgFunc(...)
                        end
                        local rValue = behTar[func](...)
                        return returnValue or rValue
                    end
                end
                print("Module: ["..self:getName().."] bind behavior: "..behavior)
            end,function(err)
                if WARNING then
                    print("Module ["..self:getName().."] could not bind behavior: "..behavior)
                    __G__TRACKBACK__(err)
                end
            end
        )
    end
end

function ModuleBase:preCreate()
    -- implement by children
end

function ModuleBase:onCreate()
    -- implement by children
end

function ModuleBase:getName()
    return self.mName or self.class.__cname
end

-- 刷新UI调用
function ModuleBase:refreshUI(data)
    -- implement by children
end

function ModuleBase:getTopModule()
    local top = self
    while top.mScene and iskindof(top.mScene, "ModuleBase") do
        top = top.mScene
    end
    return top
end

function ModuleBase:showWithScene(transition, time, more)
    self:setVisible(true)
    local scene = display.newScene(self:getName())
    scene:addChild(self)
    display.runScene(scene, transition, time, more)
    if self.animEnter then
        self:animEnter()
    end 
    return self
end

function ModuleBase:removeView()
    if self.animExit then
        self:animExit()
    else
        self:removeFromParent()
    end 
end

function ModuleBase:onEnter_()
    if global.event and (not self.mScene or self:getTopModule() == self) then
        global.event.emit("MODULE_ENTER", { name = self:getName(), node = self } );
    end
    cc.Node.onEnter_(self);
end

function ModuleBase:onExit_()
    if global.event and (not self.mScene or self:getTopModule() == self) then
        global.event.emit("MODULE_EXIT", { name = self:getName(), node = self });
    end
    cc.Node.onExit_(self);
end

-- 重写这个函数来定制自己的编辑界面
function ModuleBase:onEditorView()
    
end

--[[
    为layer里面的控件注册点击事件 先注册的先触发触摸监听
    node:layer里面的控件
    param = {
        beganCallBack = function() end, -- 触摸开始的处理
        moveCallBack = function() end,  -- 触摸中的处理
        endCallBack = function() end,   -- 触摸结束后的处理
        scaleAction = true,             -- 默认true 触摸按钮的放大缩小反应
        swallowTouche = true,           -- 默认true 吞噬监听 (如果按钮的功能是关闭界面 必须为true)
        palyVoice = true,               -- 默认true 播放音效
        touchOutside = false,           -- 默认false 表示在区域外也响应
        voicePath = nil                 -- 默认为nil
    }
]]
function ModuleBase:addNodeClick(node,param )
    assert( node," !! node is nil !! ")
    assert( param," !! param is nil !! ")
    if param.beganCallBack == nil and param.moveCallBack == nil and param.endCallBack == nil then
        assert( false," !! node callback is nil !! " )
        return
    end

    -- 按钮默认开启放大缩小
    if param.scaleAction == nil then
        param.scaleAction = true
    end

    -- 默认吞噬监听
    if param.swallowTouche == nil then
        param.swallowTouche = true
    end

    -- 默认播放点击音效
    if param.palyVoice == nil then
        param.palyVoice = true
    end

    local node_size = node:getContentSize()
    if node_size.width <= 0 or node_size.height <= 0 then
        assert( false," !! node_size condition is error !! " )
        return
    end
    local name = node:getName()
    if name == nil or string.trim( name ) == "" then
        assert( false," !! name condition is error !! " )
        return
    end

    for i,v in ipairs(self._nodeClickRegist) do
        if v.name == name then
            assert( false," !! node callback is register !! " )
            return
        end
    end

    local callBackParam = {}
    callBackParam.node = node
    callBackParam.param = param
    callBackParam.name = name
    table.insert(self._nodeClickRegist,callBackParam)
end

function ModuleBase:registTouchEvent()
    print("22222222")
    self.listener = cc.EventListenerTouchOneByOne:create()
    self.listener:setSwallowTouches(true)
    self.listener:registerScriptHandler(handler(self, self.onTouchBegan), cc.Handler.EVENT_TOUCH_BEGAN)
    self.listener:registerScriptHandler(handler(self, self.onTouchMoved), cc.Handler.EVENT_TOUCH_MOVED)
    self.listener:registerScriptHandler(handler(self, self.onTouchEnded), cc.Handler.EVENT_TOUCH_ENDED)
    local eventDispatcher = self:getEventDispatcher()
    eventDispatcher:addEventListenerWithSceneGraphPriority(self.listener, self)
end

function ModuleBase:onTouchBegan(touch, event)
    local touchPoint = touch:getLocation()
    local localPoint = self:getParent():convertToNodeSpace(touchPoint)
    local boxRect = self:getBoundingBox()
    if cc.rectContainsPoint(boxRect, localPoint) then
        if not self:isVisible() then
            return false
        end
        -- 处理注册的按钮的监听
        for k,v in ipairs(self._nodeClickRegist) do
            local node_localpoint = v.node:getParent():convertToNodeSpace(touchPoint)
            if v.node:isVisible() and cc.rectContainsPoint(v.node:getBoundingBox(), node_localpoint) then
                self.__touchNodeMarkName = v.node:getName()
                -- 设置scale
                if v.param.scaleAction then
                    v.node:setScale(0.95)
                end
                -- 如果设置了在触摸外也能响应 但开始点击的时候必须在node的里面
                if v.param.touchOutside then
                    v.param.touchOutBegan = true
                end
                -- 播放音效
                if v.param.palyVoice then
                    global.viewData.playVoice()
                end
                if v.param.beganCallBack then
                    v.param.beganCallBack( touchPoint )
                end
                if v.param.swallowTouche then
                    break
                end
            end
        end    
        return true
    end
    return false
end

function ModuleBase:onTouchMoved(touch, event)
   
end

function ModuleBase:onTouchEnded(touch, event)
    -- 恢复scale
    for i,v in ipairs( self._nodeClickRegist ) do
        if v.param.scaleAction then
            v.node:setScale(1)
        end
    end
    -- 处理注册的按钮的监听
    for k,v in ipairs(self._nodeClickRegist) do
        if v.node:isVisible() and v.param.endCallBack and self.__touchNodeMarkName and self.__touchNodeMarkName == v.node:getName() then
            local touchPoint = touch:getLocation()
            local localPoint = self:getParent():convertToNodeSpace(touchPoint)
            local node_localpoint = v.node:getParent():convertToNodeSpace(touchPoint)
            if cc.rectContainsPoint(v.node:getBoundingBox(), node_localpoint) then
                v.param.endCallBack()
                -- 吞噬
                if v.param.swallowTouche then
                    break
                end
            elseif v.param.touchOutside and v.param.touchOutBegan then
                v.param.endCallBack( touchPoint )
                -- 去掉这个标志
                if v.param.touchOutBegan then
                    v.param.touchOutBegan = nil
                end
                -- 吞噬
                if v.param.swallowTouche then
                    break
                end
            end
        end
    end
    self.__touchNodeMarkName = nil
end

return ModuleBase
