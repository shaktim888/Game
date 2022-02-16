local Select = class("Select", cc.load("mvc").ModuleBase)
Select.RESOURCE_FILENAME = "select/Select_Layer.lua"

function Select:onCreate(_data)
    self.data = _data
    self.mView["role"]:ignoreContentAdaptWithSize(true)
    self:initPlayerBtnInfo()
end

function Select:onbtn_startClick()
    global.viewController.gotoView("game")
end

function Select:onrandNameBtnClick()
    local randName = self:getRandPlayerName()
    self.mView["roleName"]:setString(randName)
    local saveInfo = global.saveTools.getData(global.viewData.PLAYER_INFO_SAVE_TO_LOCAL)
    saveInfo.name = randName
    global.saveTools.saveData(global.viewData.PLAYER_INFO_SAVE_TO_LOCAL, saveInfo)
end

function Select:initPlayerBtnInfo()
    local btnTbl = self:getLocalSaveInfo()
    self.mView["roleName"]:setString(btnTbl.name)
    self.mView["role"]:ignoreContentAdaptWithSize(true)
    self.mView["role"]:loadTexture("select/job/huoban_"..btnTbl.job.."_"..btnTbl.sex..".png")
    self.mView["dec"]:loadTexture("select/job/dec_"..btnTbl.job..".png")
    local  destJobPos = {}
    local  destSexPos = {}

    destJobPos.x, destJobPos.y = self.mView["btnJob"..btnTbl.job]:getPosition()
    destSexPos.x, destSexPos.y = self.mView["btnSex"..btnTbl.sex + 1]:getPosition()
    destJobPos.x  = destJobPos.x + 10
    self.mView["select_job"]:setPosition(destJobPos)
    self.mView["select_sex"]:setPosition(destSexPos)

    

    --按钮点击事件
    local btnList = {
        [1] = {node = "btnJob1", idx = 1, tag = "job"},
        [2] = {node = "btnJob2", idx = 2, tag = "job"},
        [3] = {node = "btnJob3", idx = 3, tag = "job"},
        [4] = {node = "btnSex1",  idx = 0,  tag = "sex"},
        [5] = {node = "btnSex2", idx = 1, tag = "sex"},
    }
    for k, v in pairs(btnList) do
        self.mView[v.node]:ignoreContentAdaptWithSize(true)
        self.mView[v.node]:addTouchEventListener(function(sender, eventType)
            if eventType == ccui.TouchEventType.ended then
                
                for tag, value in pairs(btnTbl) do
                    if v.tag ==  tag then
                        btnTbl[tag] = v.idx
                    end
                end
                sender:ignoreContentAdaptWithSize(true)
                local  destPos = {}
                
                destPos.x, destPos.y = self.mView[v.node]:getPosition()
                
                if v.tag == "job" then
                    destPos.x  = destPos.x + 10
                    self.mView["select_job"]:setPosition(destPos)
                    self.mView["dec"]:ignoreContentAdaptWithSize(true)
                    self.mView["dec"]:loadTexture("select/job/dec_"..v.idx..".png")
                else
                    self.mView["select_sex"]:setPosition(destPos)
                end
                global.saveTools.saveData(global.viewData.PLAYER_INFO_SAVE_TO_LOCAL, btnTbl)
                self.mView["role"]:loadTexture("select/job/huoban_"..btnTbl.job.."_"..btnTbl.sex..".png")
            end
        end)   

    end
end

function Select:getLocalSaveInfo()
    local  _aSaveInfo = global.saveTools.getData(global.viewData.PLAYER_INFO_SAVE_TO_LOCAL) or {}

    local tbl
    if not _aSaveInfo.sex or not _aSaveInfo.name then
        local randName = self:getRandPlayerName()
        tbl = {job = 1, sex = 1, name = randName}
        global.saveTools.saveData(global.viewData.PLAYER_INFO_SAVE_TO_LOCAL, tbl)    
    else
        tbl = _aSaveInfo
    end
    
    --截图模式随机
    if global.isGrabScreenMode == 1 then 
        local randName = self:getRandPlayerName()
        tbl = {job = math.random(1,3), sex = math.random(0,1), name = randName}
        global.saveTools.saveData(global.viewData.PLAYER_INFO_SAVE_TO_LOCAL, tbl) 
    end
   
    return tbl

end

function Select:getRandPlayerName()
    local txt = "common/txt/name.txt"
    local name = cc.FileUtils:getInstance():getStringFromFile(txt)
    local a = name.split(name, "\n")
    math.randomseed(tostring(os.time()):reverse():sub(1, 7))
    local randName = a[math.random(1,#a)]
    return randName
end



return Select