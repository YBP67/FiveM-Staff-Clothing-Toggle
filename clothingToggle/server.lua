-- Grant in server.cfg with: add_ace group.admin clothing.admin allow
local STAFF_PERMISSION = "clothing.admin"

local function sendMessage(target, message)
    TriggerClientEvent("chat:addMessage", target, { args = { "^1[SYSTEM] : ^0" .. message } })
end

RegisterCommand("staffvest", function(source)
    if source == 0 then
        print("Can only be used ingame!")
        return
    end

    if not IsPlayerAceAllowed(source, STAFF_PERMISSION) then
        sendMessage(source, "You are not staff!")
        return
    end

    TriggerClientEvent("ybp:clothingToggle", source)
end, false)
