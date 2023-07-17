
local ____modules = {}
local ____moduleCache = {}
local ____originalRequire = require
local function require(file)
    if ____moduleCache[file] then
        return ____moduleCache[file]
    end
    if ____modules[file] then
        ____moduleCache[file] = ____modules[file]()
        return ____moduleCache[file]
    else
        if ____originalRequire then
            return ____originalRequire(file)
        else
            error("module '" .. file .. "' not found")
        end
    end
end
____modules = {
["index"] = function() end,
["examples.example"] = function() local ____exports = {}
____exports.OnPlayerLogin = function(____, event, player)
    player:SendChatMessageToPlayer(7, 0, "Hello World", player)
end
RegisterPlayerEvent(
    3,
    function(...) return ____exports.OnPlayerLogin(nil, ...) end
)
____exports.PlayerChat = __TS__Class()
local PlayerChat = ____exports.PlayerChat
PlayerChat.name = "PlayerChat"
function PlayerChat.prototype.____constructor(self, firstMessage)
    self.OnPlayerChat = function(____, event, player, msg)
        local sanitized = msg
        msg = ((sanitized ~= msg) and (sanitized .. " (Sanitized)")) or msg
        player:SendChatMessageToPlayer(7, 0, (("Previous message: " .. self.previousMessage) .. ", current message: ") .. msg, player)
        self.previousMessage = msg
        return true
    end
    self.previousMessage = firstMessage
end
local playerChat = __TS__New(____exports.PlayerChat, "First Message")
RegisterPlayerEvent(
    18,
    function(...) return playerChat:OnPlayerChat(...) end
)
return ____exports
end,
}
return require("index")
