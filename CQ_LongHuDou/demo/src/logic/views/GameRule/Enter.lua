local GameRuleLayer = class("GameRuleLayer", cc.load("mvc").ModuleBase)
GameRuleLayer.RESOURCE_FILENAME = "help/Help_Layer.lua"

GameRuleLayer.behavior ={
    "logic.common.behavior.ClickToClose"
}
function GameRuleLayer:onCreate(_data)
  
    if _data.content then
        self.mView["text_rule"]:setString(_data.content)
    end
    
end
function GameRuleLayer:onpanelClick()
	
	global.viewController.closeAction(self)

end


return GameRuleLayer