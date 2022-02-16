print = release_print
if ccui.LayoutComponent and ccui.LayoutComponent.bindLayoutComponent then
    print(" has ccui.LayoutComponent ================ ")
    return 
end

local LayoutComponent = import(".LayoutComponent")
ccui.LayoutComponent = LayoutComponent

local setLayoutComponentEnabled = function()

end

ccui.Layout.setLayoutComponentEnabled = ccui.Layout.setLayoutComponentEnabled or setLayoutComponentEnabled
ccui.Button.setLayoutComponentEnabled = ccui.Button.setLayoutComponentEnabled or setLayoutComponentEnabled
ccui.ImageView.setLayoutComponentEnabled = ccui.ImageView.setLayoutComponentEnabled or setLayoutComponentEnabled
ccui.Text.setLayoutComponentEnabled =  ccui.Text.setLayoutComponentEnabled or setLayoutComponentEnabled

local getNodeParent = function(node)
    if tolua.isnull(node) then return nil end
    if iskindof(node, "cc.Scene") then
        return nil
    else
        return node:getParent()
    end
end

local isClippingParentContainsPoint = function(node, p, listener)
    local parent = getNodeParent(node)
    while parent do
        if parent.isClippingEnabled and parent:isClippingEnabled() then
            if listener then 
                listener:setSwallowTouches(false) 
            end
            local np
            if getNodeParent(parent) then
                np = getNodeParent(parent):convertToNodeSpace(p)
            else
                return true
            end
            local rect = parent:getBoundingBox()
            if not cc.rectContainsPoint(rect, np) then
                return false
            end
        end
        parent = getNodeParent(parent)
    end
    return true
end

local initTouchEvent = function(node)
    if(node._touchEventListener) then return end
    node:setTouchEnabled(false)
    local listener = cc.EventListenerTouchOneByOne:create();
    local beginPos
    listener:registerScriptHandler(function( pTouch,pEvent )
        if tolua.isnull(node) then
            cc.Director:getInstance():getEventDispatcher():removeEventListener(listener)
            return false
        end
        if not node:isVisible() then return false end
        local p = pTouch:getLocation()
        local np = getNodeParent(node):convertToNodeSpace(p)
        local rect = node:getBoundingBox()
        beginPos = node:convertToWorldSpace(cc.p(0,0))
        if not cc.rectContainsPoint(rect, np) then
            return false
        end
        if not isClippingParentContainsPoint(node, p, listener) then
            return false
        end
        local t = pEvent:getCurrentTarget()
        pTouch.target = t
        local parent = getNodeParent(node)
        while parent and not tolua.isnull(parent) do
            if parent.interceptTouchEvent then
                parent:interceptTouchEvent(0, t, pTouch)
                break
            end
            parent = getNodeParent(parent)
        end
        if node._touchBeganEvent then
            node._touchBeganEvent(t, 0, pTouch, pEvent)
        end
        return true
    end,
    cc.Handler.EVENT_TOUCH_BEGAN); 

    listener:registerScriptHandler(function( pTouch,pEvent )
        if tolua.isnull(node) then return end
        local t = pEvent:getCurrentTarget()
        pTouch.target = t
        local parent = getNodeParent(node)
        while parent and not tolua.isnull(parent) do
            if parent.interceptTouchEvent then
                parent:interceptTouchEvent(1, t, pTouch)
                break
            end
            parent = getNodeParent(parent)
        end
        if node._touchMovedEvent then
            node._touchMovedEvent(t, 1, pTouch, pEvent)
        end
    end,
    cc.Handler.EVENT_TOUCH_MOVED)

    listener:registerScriptHandler(function( pTouch,pEvent )
        if tolua.isnull(node) then return end
        local t = pEvent:getCurrentTarget()
        pTouch.target = t
        if node._touchClickedEvent then
            local epos = node:convertToWorldSpace(cc.p(0,0))
            if(math.abs(epos.x - beginPos.x) + math.abs(epos.y - beginPos.y) <= 10) then
                node._touchClickedEvent(node)
            end
        end
        local parent = getNodeParent(node)
        while parent and not tolua.isnull(parent) do
            if parent.interceptTouchEvent then
                parent:interceptTouchEvent(1, t, pTouch)
                break
            end
            parent = getNodeParent(parent)
        end
        if node._touchEndedEvent then
            node._touchEndedEvent(t, 2, pTouch, pEvent)
        end
    end,
    cc.Handler.EVENT_TOUCH_ENDED)
    listener:setSwallowTouches(true)
    node._touchEventListener = listener
    cc.Director:getInstance():getEventDispatcher():addEventListenerWithSceneGraphPriority(listener, node)
end

local addClickEvent = function(node , func)
    node._touchClickedEvent = func
    initTouchEvent(node)
end

ccui.Widget.setSwallowTouches = function(self, val)
    if self._touchEventListener then
        self._touchEventListener:setSwallowTouches(val)
    end
end

ccui.Layout.addClickEventListener = ccui.Layout.addClickEventListener or addClickEvent
ccui.Button.addClickEventListener = ccui.Button.addClickEventListener or addClickEvent
ccui.ImageView.addClickEventListener = ccui.ImageView.addClickEventListener or addClickEvent
ccui.PageView.addClickEventListener = ccui.ImageView.addClickEventListener or addClickEvent

ccui.ScrollView.isClippingEnabled = ccui.ScrollView.isClippingEnabled or function() return true end
ccui.ListView.isClippingEnabled = ccui.ListView.isClippingEnabled or function() return true end

local addTouchEvent = function(self , func)
    self._touchBeganEvent = func
    self._touchMovedEvent = func
    self._touchEndedEvent = func
    initTouchEvent(self)
end

ccui.Layout.addTouchEventListener = ccui.Layout.addTouchEventListener or addTouchEvent

if ccs and ccs.ActionTimeline then
    ccs.ActionTimeline.addAnimationInfo = function ( ... )
        -- body
    end
end

if not ccui.PageView.addPage then
    ccui.PageView.addPage = ccui.PageView.addChild
end

cc.Label.createWithTTF = function(obj, str, fontname, size)
    local text = ccui.Text:create()
    text:setString(str)
    text:setFontName(fontname)
    text:setFontSize(size)
    return text
end






