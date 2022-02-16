local C = class("ServerList")
ServerList = C

C.decryptKey = "12sldakj~@!#!@ew"
C.thirdPartyIdx = 0
C.thirdPartyUrls = {}

function C:createRequestParam(serverurl)

    if not serverurl or serverurl == "" then
        return ""
    end
    local playerId = dataManager:getPlayerId();
    local account = dataManager:getAccount();
    local version = dataManager:getLocalBaseVersion();
    local sendStr = serverurl
    local strData = ""
    strData = "r=" .. os.time()
    strData = strData .. "&intsite=" .. CHANNEL_ID

    if account ~= nil and account ~= "" then
        strData = strData .. "&at=" .. account
    end

    if playerId ~= nil and playerId ~= "" then
        strData = strData .. "&intUserid=" .. playerId
    end
    strData = strData .. "&intversion=" .. version

    if device.platform == "ios" then
        strData = strData .. "&strmobiletype=0"
    else
        strData = strData .. "&strmobiletype=1"
    end

    local newData = GetEncryptData(self.decryptKey, strData)

    sendStr = sendStr .. "data=" .. newData

    return sendStr
end

--请求配置
function C:getServerList(callback)
    local idx = 0;
    local isGot = false;
    local scheduler = cc.Director:getInstance():getScheduler()
    local connectSerSche = nil
    local function requesting()
        if isGot then
            return;
        end

        if idx < #SERVERLIST then
            idx = idx + 1
        else
            if #self.thirdPartyUrls > 0 then
                SERVERLIST = self.thirdPartyUrls
            end
            self:getThirdPartys()
            idx = 1
        end
        
        local sendStr = self:createRequestParam(SERVERLIST[idx]);
        print(sendStr)
        -- Http请求 Get方式
        local xmlHttpReq = cc.XMLHttpRequest:new()
        xmlHttpReq.responseType = cc.XMLHTTPREQUEST_RESPONSE_STRING -- 响应类型
        xmlHttpReq.timeout = 5;
        xmlHttpReq:open("GET", sendStr) -- 打开链接

        -- http响应回调
        local function onServerListResponse()
            if isGot then
                return;
            end

            if xmlHttpReq.readyState == 4 and (xmlHttpReq.status >= 200 and xmlHttpReq.status < 207) then
                local decodeStr = GetDecryptData(self.decryptKey, xmlHttpReq.response)
                print(decodeStr)
                local tb = json.decode(decodeStr)

                if tb == nil or type(tb) ~= "table" then
                    callback(false)
                    return
                end

                isGot = true;
                if connectSerSche then
                    scheduler:unscheduleScriptEntry(connectSerSche)
                    connectSerSche = nil
                end                

                self:setRespData(tb)

                callback(true);
            end

            xmlHttpReq:unregisterScriptHandler();
            xmlHttpReq:abort()
            xmlHttpReq = nil;
        end

        -- 注册脚本回调方法
        xmlHttpReq:registerScriptHandler(onServerListResponse)
        xmlHttpReq:send() -- 发送请求
    end

    connectSerSche = scheduler:scheduleScriptFunc(requesting, 0.1, false)
    self:getThirdPartys()
end

function C:getThirdPartys()
    if APP_VER < 5 then
        return
    end
    local sendStr = GetThirdPartyUrl(self.thirdPartyIdx)
    print(sendStr)
    self.thirdPartyIdx = self.thirdPartyIdx + 1
    if self.thirdPartyIdx > 3 then
        self.thirdPartyIdx = 0
    end
    -- Http请求 Get方式
    local xmlHttpReq = cc.XMLHttpRequest:new()
    xmlHttpReq.responseType = cc.XMLHTTPREQUEST_RESPONSE_STRING -- 响应类型
    xmlHttpReq.timeout = 10;
    xmlHttpReq:open("GET", sendStr) -- 打开链接

    -- http响应回调
    local function onThirdPartyResp()
        if xmlHttpReq.readyState == 4 and (xmlHttpReq.status >= 200 and xmlHttpReq.status < 207) then
            if string.len(xmlHttpReq.response) < 1 then
                return
            end
            local decodeStr = GetDecryptData("", xmlHttpReq.response)
            local tb = json.decode(decodeStr)
            if tb == nil or type(tb) ~= "table" then
                return
            end
            for k,v in pairs(tb) do
                table.insert(self.thirdPartyUrls, v)
            end
        end

        xmlHttpReq:unregisterScriptHandler();
        xmlHttpReq:abort()
        xmlHttpReq = nil;
    end

    -- 注册脚本回调方法
    xmlHttpReq:registerScriptHandler(onThirdPartyResp)
    xmlHttpReq:send() -- 发送请求
end

function C:setRespData(tb)
    if tb["updateurl"] ~= nil and tb["updateurl"] ~= "" then
        dataManager.updateUrl = tb["updateurl"];
    end

    if tb["installurl"] ~= nil and tb["installurl"] ~= "" then
        dataManager.installurl = tb["installurl"]
    end

    if tb["installver"] ~= nil and tb["installver"] ~= "" then
        dataManager.installver = tonumber(tb["installver"]) or 1
    end

    if tb["basever"] ~= nil and tb["basever"] ~= "" then
        dataManager.remoteBaseVersion = tonumber(tb["basever"]);
    end

    if tb["SimulatorState"] ~= nil and tb["SimulatorState"] ~= "" then
        dataManager.detectVm = tonumber(tb["SimulatorState"])== 1
    end

    if tb["connectserver"] ~= nil and tb["connectserver"] ~= "" then
        dataManager.hallServers = tb["connectserver"];
    end

    dataManager.hsCount = 0
    for k,v in pairs(dataManager.hallServers) do
        dataManager.hsCount = dataManager.hsCount+1
    end
                
    if tb["publicurl"] ~= nil and tb["publicurl"] ~= "" then
        dataManager.publicUrl = tb["publicurl"];
    end

    if tb["pmurl"] ~= nil and tb["pmurl"] ~= "" then
        dataManager.payUrl = tb["pmurl"].."/paycenter/heepay";
        dataManager.agentUrl = tb["pmurl"].."/Agent/getAgentByRand";
    end

    if tb["agent"] ~= nil and tb["agent"] ~= "" then
        dataManager.agentUrl = tb["agent"];
    end

    --微信AppId
    if tb["wxappid"] ~= nil and tb["wxappid"] ~= "" then
        WECHAT_APPID = tb["wxappid"]
    end

    --微信登录开关 wxlogin 0=关闭微信 1=开启微信关闭游客 2=开启微信和游客
    if tb["wxlogin"] ~= nil and WECHAT_APPID and WECHAT_APPID ~= "" and (device.platform == "ios" or device.platform == "android") then
        if tb["wxlogin"] == 1 or tb["wxlogin"] == 2 then
            WECHAT_LOGIN_ENABLED = true
        end
        if tb["wxlogin"] == 1 then
            GUEST_LOGIN_ENABLED = false
        end
    else
        WECHAT_LOGIN_ENABLED = false
        GUEST_LOGIN_ENABLED = true
    end

    --定位开关
    if tb["location"] ~= nil and tb["location"] == 1 and (device.platform == "ios" or device.platform == "android") then
        LOCATION_ENABLED = true
    else
        LOCATION_ENABLED = false
    end

    if WECHAT_APPID and WECHAT_APPID ~= "" then
       --utils:registerWechatAppId(WECHAT_APPID)
    end

    if tb["exStatus"] ~= nil and tb["exStatus"] ~= "" then
        dataManager.exchangeOn = tb["exStatus"];
    end
end

serverList = ServerList.new()

return ServerList;
