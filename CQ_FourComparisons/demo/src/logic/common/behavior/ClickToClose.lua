local ClickToClose = class("ClickToClose", cc.load("mvc").BehaviorBase)

function ClickToClose:onCreate()
    local listener = cc.EventListenerTouchOneByOne:create();
    listener:registerScriptHandler(function( ... )
        print(self:isVisible())
    							return self:isVisible();
    						end,
                            cc.Handler.EVENT_TOUCH_BEGAN); 
                            
    listener:registerScriptHandler(function( ... )
                                if self.removeView then
                                    self:removeView()
                                else
                                    self:removeFromParent()
                                end
                            end,
                            cc.Handler.EVENT_TOUCH_ENDED); 
    
    listener:setSwallowTouches(true);
    cc.Director:getInstance():getEventDispatcher():addEventListenerWithSceneGraphPriority(listener, self);
end

return ClickToClose