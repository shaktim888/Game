local FontColorChange = class("FontColorChange", cc.load("mvc").BehaviorBase)

local fontcolorset = {
	cc.c3b(255,0,0),
	cc.c3b(0,255,0),
	cc.c3b(0,0,255)
}
function FontColorChange:onCreate()
	-- math.randomseed(tostring(socket.gettime()):reverse():sub(1, 7))
	math.randomseed(global.randomSeed)
	local color_index = math.random(1, #fontcolorset)
	print("FontColorChange color_index = ", color_index);
	local fontcolor = fontcolorset[color_index]
	dump(fontcolor)
	local widget
	for key, v in pairs(self.changecolorfont or {}) do
		widget = self.mView[key]
		if widget then
			if  widget.setTextColor and type(widget.setTextColor) == "function" then
				widget:setTextColor(fontcolor)
			elseif widget.setTitleColor and type(widget.setTitleColor) == "function" then
				widget:setTitleColor(fontcolor)
			end
		end
	end
end
return FontColorChange