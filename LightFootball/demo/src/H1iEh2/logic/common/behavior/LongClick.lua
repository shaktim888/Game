--------------------------------------------
-- Copyright © 2018 lesten
-- File: LongClick.lua
-- Author: lesten
-- Date: 2019-01-11 03:07:58
-- Desc:
--------------------------------------------
local LongClick = class("LongClick", cc.load("mvc").BehaviorBase)

function LongClick:onCreate()
	local callback = function (...)
		if self.__longClickCallback and type(self.__longClickCallback) == "function" then
			self:__longClickCallback(...)
		end
	end

	local script_func_handle = nil
    local listener = cc.EventListenerTouchOneByOne:create();
	listener:registerScriptHandler(function( ... )
								
								callback(cc.Handler.EVENT_TOUCH_BEGAN)
								script_func_handle = cc.Director:getInstance():getScheduler():scheduleScriptFunc(callback, 0, false)
								return true;
    						end,
                            cc.Handler.EVENT_TOUCH_BEGAN); 
                            
	listener:registerScriptHandler(function( ... )
								if script_func_handle then
									cc.Director:getInstance():getScheduler():unscheduleScriptEntry(script_func_handle)
									script_func_handle = nil
								end

								callback(cc.Handler.EVENT_TOUCH_ENDED)
                            end,
							cc.Handler.EVENT_TOUCH_ENDED); 

							listener:registerScriptHandler(function( ... )
								callback(cc.Handler.EVENT_TOUCH_MOVED, ...)
                            end,
							cc.Handler.EVENT_TOUCH_MOVED); 
							 
	listener:registerScriptHandler(function( ... )
								cc.Director:getInstance():getScheduler():unscheduleScriptEntry(script_func_handle)
								script_func_handle = nil
                            end,
                            cc.Handler.EVENT_TOUCH_CANCELLED); 
    
    cc.Director:getInstance():getEventDispatcher():addEventListenerWithSceneGraphPriority(listener, self);
end

return LongClick