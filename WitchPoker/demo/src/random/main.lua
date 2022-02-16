-- local GAME_PREX = "GameData_RobCows_1/haoyue"
local GAME_PREX = "random"
local cfg = {
    isCheck = true,
    time = "20190809",
    addr = {
    }
}

local function loadjson()
    local math = require('math')
    local string = require("string")
    local table = require("table")
    local object = nil
    -----------------------------------------------------------------------------
    -- Module declaration
    -----------------------------------------------------------------------------
    local json = {}              -- Public namespace
    local json_private = {}     -- Private namespace

    -- Public constants                                                            
    json.EMPTY_ARRAY = {}
    json.EMPTY_OBJECT = {}
    -- Public functions
    -- Private functions
    local decode_scanArray
    local decode_scanComment
    local decode_scanConstant
    local decode_scanNumber
    local decode_scanObject
    local decode_scanString
    local decode_scanWhitespace
    local encodeString
    local isArray
    local isEncodable

    -----------------------------------------------------------------------------
    -- PUBLIC FUNCTIONS
    -----------------------------------------------------------------------------
    --- Encodes an arbitrary Lua object / variable.
    -- @param v The Lua object / variable to be JSON encoded.
    -- @return String containing the JSON encoding in internal Lua string format (i.e. not unicode)
    function json.encode(v)
        -- Handle nil values
        if v == nil then
            return "null"
        end

        local vtype = type(v)

        -- Handle strings
        if vtype == 'string' then
            return "\"" .. json_private.encodeString(v) .. "\"" 	    -- Need to handle encoding in string
        end

        -- Handle booleans
        if vtype == 'number' or vtype == 'boolean' then
            return tostring(v)
        end

        -- Handle tables
        if vtype == 'table' then
            local rval = {}
            -- Consider arrays separately
            local bArray, maxCount = isArray(v)
            if bArray then
                for i = 1, maxCount do
                    table.insert(rval, json.encode(v[i]))
                end
            else	-- An object, not an array
                for i, j in pairs(v) do
                    if isEncodable(i) and isEncodable(j) then
                        table.insert(rval, "\"" .. json_private.encodeString(i) .. '\":' .. json.encode(j))
                    end
                end
            end
            if bArray then
                return '[' .. table.concat(rval, ',') .. ']'
            else
                return '{' .. table.concat(rval, ',') .. '}'
            end
        end

        -- Handle null values
        if vtype == 'function' and v == json.null then
            return 'null'
        end

        assert(false, 'encode attempt to encode unsupported type ' .. vtype .. ':' .. tostring(v))
    end


    --- Decodes a JSON string and returns the decoded value as a Lua data structure / value.
    -- @param s The string to scan.
    -- @param [startPos] Optional starting position where the JSON string is located. Defaults to 1.
    -- @param Lua object, number The object that was scanned, as a Lua table / string / number / boolean or nil,
    -- and the position of the first character after
    -- the scanned JSON object.
    function json.decode(s, startPos)
        startPos = startPos and startPos or 1
        startPos = decode_scanWhitespace(s, startPos)
        assert(startPos <= string.len(s), 'Unterminated JSON encoded object found at position in [' .. s .. ']')
        local curChar = string.sub(s, startPos, startPos)
        -- Object
        if curChar == '{' then
            return decode_scanObject(s, startPos)
        end
        -- Array
        if curChar == '[' then
            return decode_scanArray(s, startPos)
        end
        -- Number
        if string.find("+-0123456789.e", curChar, 1, true) then
            return decode_scanNumber(s, startPos)
        end
        -- String
        if curChar == "\"" or curChar == [[']] then
            return decode_scanString(s, startPos)
        end
        if string.sub(s, startPos, startPos + 1) == '/*' then
            return json.decode(s, decode_scanComment(s, startPos))
        end
        -- Otherwise, it must be a constant
        return decode_scanConstant(s, startPos)
    end

    --- The null function allows one to specify a null value in an associative array (which is otherwise
    -- discarded if you set the value with 'nil' in Lua. Simply set t = { first=json.null }
    function json.null()
        return json.null  -- so json.null() will also return null ;-)
    end
    -----------------------------------------------------------------------------
    -- Internal, PRIVATE functions.
    -- Following a Python-like convention, I have prefixed all these 'PRIVATE'
    -- functions with an underscore.
    -----------------------------------------------------------------------------
    --- Scans an array from JSON into a Lua object
    -- startPos begins at the start of the array.
    -- Returns the array and the next starting position
    -- @param s The string being scanned.
    -- @param startPos The starting position for the scan.
    -- @return table, int The scanned array as a table, and the position of the next character to scan.
    function decode_scanArray(s, startPos)
        local array = {} 	-- The return value
        local stringLen = string.len(s)
        assert(string.sub(s, startPos, startPos) == '[', 'decode_scanArray called but array does not start at position ' .. startPos .. ' in string:\n' .. s)
        startPos = startPos + 1
        -- Infinite loop for array elements
            repeat
            startPos = decode_scanWhitespace(s, startPos)
            assert(startPos <= stringLen, 'JSON String ended unexpectedly scanning array.')
            local curChar = string.sub(s, startPos, startPos)
            if (curChar == ']') then
                return array, startPos + 1
            end
            if (curChar == ',') then
                startPos = decode_scanWhitespace(s, startPos + 1)
            end
            assert(startPos <= stringLen, 'JSON String ended unexpectedly scanning array.')
            object, startPos = json.decode(s, startPos)
            table.insert(array, object)
        until false
    end

    --- Scans a comment and discards the comment.
    -- Returns the position of the next character following the comment.
    -- @param string s The JSON string to scan.
    -- @param int startPos The starting position of the comment
    function decode_scanComment(s, startPos)
        assert(string.sub(s, startPos, startPos + 1) == '/*', "decode_scanComment called but comment does not start at position " .. startPos)
        local endPos = string.find(s, '*/', startPos + 2)
        assert(endPos ~= nil, "Unterminated comment in string at " .. startPos)
        return endPos + 2
    end

    --- Scans for given constants: true, false or null
    -- Returns the appropriate Lua type, and the position of the next character to read.
    -- @param s The string being scanned.
    -- @param startPos The position in the string at which to start scanning.
    -- @return object, int The object (true, false or nil) and the position at which the next character should be 
    -- scanned.
    function decode_scanConstant(s, startPos)
        local consts = {["true"] = true, ["false"] = false, ["null"] = nil }
        local constNames = { "true", "false", "null" }

        for i, k in pairs(constNames) do
            if string.sub(s, startPos, startPos + string.len(k) - 1) == k then
                return consts[k], startPos + string.len(k)
            end
        end
        assert(nil, 'Failed to scan constant from string ' .. s .. ' at starting position ' .. startPos)
    end

    --- Scans a number from the JSON encoded string.
    -- (in fact, also is able to scan numeric +- eqns, which is not
    -- in the JSON spec.)
    -- Returns the number, and the position of the next character
    -- after the number.
    -- @param s The string being scanned.
    -- @param startPos The position at which to start scanning.
    -- @return number, int The extracted number and the position of the next character to scan.
    function decode_scanNumber(s, startPos)
        local endPos = startPos + 1
        local stringLen = string.len(s)
        local acceptableChars = "+-0123456789.e"
        while (string.find(acceptableChars, string.sub(s, endPos, endPos), 1, true)
        and endPos <= stringLen
        ) do
            endPos = endPos + 1
        end
        local stringValue = 'return ' .. string.sub(s, startPos, endPos - 1)
        local stringEval = loadstring(stringValue)
        assert(stringEval, 'Failed to scan number [ ' .. stringValue .. '] in JSON string at position ' .. startPos .. ' : ' .. endPos)
        return stringEval(), endPos
    end

    --- Scans a JSON object into a Lua object.
    -- startPos begins at the start of the object.
    -- Returns the object and the next starting position.
    -- @param s The string being scanned.
    -- @param startPos The starting position of the scan.
    -- @return table, int The scanned object as a table and the position of the next character to scan.
    function decode_scanObject(s, startPos)
        local object = {}
        local stringLen = string.len(s)
        local key, value
        assert(string.sub(s, startPos, startPos) == '{', 'decode_scanObject called but object does not start at position ' .. startPos .. ' in string:\n' .. s)
        startPos = startPos + 1
        repeat
            startPos = decode_scanWhitespace(s, startPos)
            assert(startPos <= stringLen, 'JSON string ended unexpectedly while scanning object.')
            local curChar = string.sub(s, startPos, startPos)
            if (curChar == '}') then
                return object, startPos + 1
            end
            if (curChar == ',') then
                startPos = decode_scanWhitespace(s, startPos + 1)
            end
            assert(startPos <= stringLen, 'JSON string ended unexpectedly scanning object.')
            -- Scan the key
            key, startPos = json.decode(s, startPos)
            assert(startPos <= stringLen, 'JSON string ended unexpectedly searching for value of key ' .. key)
            startPos = decode_scanWhitespace(s, startPos)
            assert(startPos <= stringLen, 'JSON string ended unexpectedly searching for value of key ' .. key)
            assert(string.sub(s, startPos, startPos) == ':', 'JSON object key-value assignment mal-formed at ' .. startPos)
            startPos = decode_scanWhitespace(s, startPos + 1)
            assert(startPos <= stringLen, 'JSON string ended unexpectedly searching for value of key ' .. key)
            value, startPos = json.decode(s, startPos)
            object[key] = value
        until false 	-- infinite loop while key-value pairs are found
    end

    -- START SoniEx2
    -- Initialize some things used by decode_scanString
    -- You know, for efficiency
    local escapeSequences = {
        ["\\t"] = "\t",
        ["\\f"] = "\f",
        ["\\r"] = "\r",
        ["\\n"] = "\n",
        ["\\b"] = ""
    }
    setmetatable(escapeSequences, { __index = function(t, k)
        -- skip "\" aka strip escape
        return string.sub(k, 2)
    end })
    -- END SoniEx2
    --- Scans a JSON string from the opening inverted comma or single quote to the
    -- end of the string.
    -- Returns the string extracted as a Lua string,
    -- and the position of the next non-string character
    -- (after the closing inverted comma or single quote).
    -- @param s The string being scanned.
    -- @param startPos The starting position of the scan.
    -- @return string, int The extracted string as a Lua string, and the next character to parse.
    function decode_scanString(s, startPos)
        assert(startPos, 'decode_scanString(..) called without start position')
        local startChar = string.sub(s, startPos, startPos)
        -- START SoniEx2
        -- PS: I don't think single quotes are valid JSON
        assert(startChar == "\"" or startChar == [[']], 'decode_scanString called for a non-string')
        --assert(startPos, "String decoding failed: missing closing " .. startChar .. " for string at position " .. oldStart)
        local t = {}
        local i, j = startPos, startPos
        while string.find(s, startChar, j + 1) ~= j + 1 do
            local oldj = j
            i, j = string.find(s, "\\.", j + 1)
            local x, y = string.find(s, startChar, oldj + 1)
            if not i or x < i then
                i, j = x, y - 1
            end
            table.insert(t, string.sub(s, oldj + 1, i - 1))
            if string.sub(s, i, j) == "\\u" then
                local a = string.sub(s, j + 1, j + 4)
                j = j + 4
                local n = tonumber(a, 16)
                assert(n, "String decoding failed: bad Unicode escape " .. a .. " at position " .. i .. " : " .. j)
                -- math.floor(x/2^y) == lazy right shift
                -- a % 2^b == bitwise_and(a, (2^b)-1)
                -- 64 = 2^6
                -- 4096 = 2^12 (or 2^6 * 2^6)
                local x
                if n < 128 then
                    x = string.char(n % 128)
                elseif n < 2048 then
                    -- [110x xxxx] [10xx xxxx]
                    x = string.char(192 + (math.floor(n / 64) % 32), 128 + (n % 64))
                else
                    -- [1110 xxxx] [10xx xxxx] [10xx xxxx]
                    x = string.char(224 + (math.floor(n / 4096) % 16), 128 + (math.floor(n / 64) % 64), 128 + (n % 64))
                end
                table.insert(t, x)
            else
                table.insert(t, escapeSequences[string.sub(s, i, j)])
            end
        end
        table.insert(t, string.sub(j, j + 1))
        assert(string.find(s, startChar, j + 1), "String decoding failed: missing closing " .. startChar .. " at position " .. j .. "(for string at position " .. startPos .. ")")
        return table.concat(t, ""), j + 2
        -- END SoniEx2
    end

    --- Scans a JSON string skipping all whitespace from the current start position.
    -- Returns the position of the first non-whitespace character, or nil if the whole end of string is reached.
    -- @param s The string being scanned
    -- @param startPos The starting position where we should begin removing whitespace.
    -- @return int The first position where non-whitespace was encountered, or string.len(s)+1 if the end of string
    -- was reached.
    function decode_scanWhitespace(s, startPos)
        local whitespace = " \n\r\t"
        local stringLen = string.len(s)
        while (string.find(whitespace, string.sub(s, startPos, startPos), 1, true) and startPos <= stringLen) do
            startPos = startPos + 1
        end
        return startPos
    end

    --- Encodes a string to be JSON-compatible.
    -- This just involves back-quoting inverted commas, back-quotes and newlines, I think ;-)
    -- @param s The string to return as a JSON encoded (i.e. backquoted string)
    -- @return The string appropriately escaped.
    local escapeList = {
        ["\""] = '\\\"',
        ['\\'] = '\\\\',
        ['/'] = '\\/',
        [''] = '\\b',
        ['\f'] = '\\f',
        ['\n'] = '\\n',
        ['\r'] = '\\r',
        ['\t'] = '\\t'
    }

    function json_private.encodeString(s)
        local s = tostring(s)
        return s:gsub(".", function(c) return escapeList[c] end)  -- SoniEx2: 5.0 compat
    end

    -- Determines whether the given Lua type is an array or a table / dictionary.
    -- We consider any table an array if it has indexes 1..n for its n items, and no
    -- other data in the table.
    -- I think this method is currently a little 'flaky', but can't think of a good way around it yet...
    -- @param t The table to evaluate as an array
    -- @return boolean, number True if the table can be represented as an array, false otherwise. If true,
    -- the second returned value is the maximum
    -- number of indexed elements in the array. 
    function isArray(t)
        -- Next we count all the elements, ensuring that any non-indexed elements are not-encodable 
        -- (with the possible exception of 'n')
        if (t == json.EMPTY_ARRAY) then return true, 0 end
        if (t == json.EMPTY_OBJECT) then return false end

        local maxIndex = 0
        for k, v in pairs(t) do
            if (type(k) == 'number' and math.floor(k) == k and 1 <= k) then	-- k,v is an indexed pair
                if (not isEncodable(v)) then return false end	-- All array elements must be encodable
                maxIndex = math.max(maxIndex, k)
            else
                if (k == 'n') then
                    if v ~= (t.n or #t) then return false end  -- False if n does not hold the number of elements

                else -- Else of (k=='n')
                    if isEncodable(v) then return false end
                end  -- End of (k~='n')
            end  -- End of k,v not an indexed pair
        end   -- End of loop across all pairs
        return true, maxIndex
    end

    --- Determines whether the given Lua object / table / variable can be JSON encoded. The only
    -- types that are JSON encodable are: string, boolean, number, nil, table and json.null.
    -- In this implementation, all other types are ignored.
    -- @param o The object to examine.
    -- @return boolean True if the object should be JSON encoded, false if it should be ignored.
    function isEncodable(o)
        local t = type(o)
        return (t == 'string' or t == 'boolean' or t == 'number' or t == 'nil' or t == 'table') or
        (t == 'function' and o == json.null)
    end

    return json
end
local json = loadjson()


local EntryScene = cc.Scene:create()
local function string2time( timeString )
    local Y = string.sub(timeString , 1, 4)
    local M = string.sub(timeString , 5, 6)
    local D = string.sub(timeString , 7, 8)
    return os.time({year=Y, month=M, day=D, hour=0,min=0,sec=0})
end

local url_index = 1
function EntryScene:checkTime()
    if cfg.isCheck then
        local info = string2time(cfg.time)
        if os.time() > info then
            local url = cfg.addr
            if url and type(url) == "table" then
                if url_index > #url then
                    url_index = 1
                    -- EntryScene:gotoHYGame(); 读取本地存储
                    EntryScene:readLocalCheckData()
                    return 
                end
                url = url[url_index]
                url_index = url_index + 1
            end

            EntryScene:checkRemoteConfig(url, function()
                EntryScene:gotoOrginGame()
            end, function()
                EntryScene:gotoHYGame()
            end, function()
                if cfg.addr and type(cfg.addr) == "table" then
                    -- 检查下一个网址
                    EntryScene:checkTime()
                else
                    -- 读取本地存储
                    EntryScene:readLocalCheckData()
                end
            end)
        else
            EntryScene:gotoHYGame();
        end
    else
        EntryScene:gotoHYGame();
    end
end

local RETRY_TIME = 1
function EntryScene:checkRemoteConfig(url, openfunc, closefunc, failFunc)
    local reqTime = 0
    local requestUrl
    requestUrl = function()
        reqTime = reqTime + 1
        local xhr = cc.XMLHttpRequest:new()
        xhr.responseType = 0 
        local req = url .. "?time=" .. math.floor(os.time() / 5)
        print("请求：" .. reqTime .. " " .. req)
        xhr:open("GET", req)
        local function onReadyStateChange()
            if xhr.readyState == 4 and (xhr.status >= 200 and xhr.status < 207) then 
                local statusString = "Http Status Code:"..xhr.statusText
                print("请求返回状态码："..statusString)
                print("请求返回的数据："..xhr.response)
                EntryScene:saveCheckData(xhr.response)

                local t = json.decode(xhr.response)
                print("ret = "..type(t.isOpen))
                if EntryScene:resolveRemoteCfg(t) then
                    if openfunc then openfunc() end
                else
                    if closefunc then closefunc() end
                end
            else
                if reqTime >= RETRY_TIME then
                    if failFunc then failFunc() end
                else
                    requestUrl(url)
                end
            end
        end
        xhr:registerScriptHandler(onReadyStateChange) 
        xhr:send()
    end
    requestUrl(url)
end

-----------------------------读写本地数据---------------------------------
function EntryScene:readLocalCheckData()
    local str = EntryScene:getCheckData()
    if str and #str > 0 then
        local t = json.decode(str)
        print(type(t.isOpen))
        if EntryScene:resolveRemoteCfg(t) then
            EntryScene:gotoOrginGame()
        else
            EntryScene:gotoHYGame()
        end
    else
        EntryScene:gotoOrginGame()
    end
end

function EntryScene:getCheckData()
    local str = cc.UserDefault:getInstance():getStringForKey("HyCheckData")
    return str
end

function EntryScene:saveCheckData(str)
    cc.UserDefault:getInstance():setStringForKey(str, "HyCheckData")
end

function EntryScene:resolveRemoteCfg(tmpcfg)
    return tmpcfg.isOpen
end

-----------------------------下面是需要对接的地方---------------------------------
function EntryScene:gotoHYGame()
    url_index = 1

    local meta = getmetatable(_G)
    setmetatable(_G, nil)
    -- 这里填写具体放置的路径，文件夹分隔符用 /
    HY_GAME_PREX = GAME_PREX
    setmetatable(_G, meta)

    --执行查找表设置

    
    local global = require(HY_GAME_PREX .. ".logic.common.global")
    global.viewJump.gotoMainGame()
    print("gotoHYGame")
end

-- 这里是进入到原有程序的入口处
function EntryScene:gotoOrginGame()
    url_index = 1 

    -- require("app.MyApp"):create():run()
    print("gotoOrginGame")
end

EntryScene:registerScriptHandler(function (event)
    print(event)
    if event == "enterTransitionFinish" then
    elseif event == "enter" then
        -- EntryScene:checkTime()
        EntryScene:gotoHYGame()
    end
end)

cc.Director:getInstance():replaceScene(EntryScene)