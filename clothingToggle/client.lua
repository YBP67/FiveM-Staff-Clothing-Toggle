local COMPONENT = 9
local MALE_CLOTHING_SLOT = 5
local FEMALE_CLOTHING_SLOT = 58

local previousDrawable, previousTexture = 0, 0

local function notify(message)
    TriggerEvent("chat:addMessage", { args = { "^1[SYSTEM] : ^0" .. message } })
end

RegisterNetEvent("ybp:clothingToggle", function()
    local playerPed = PlayerPedId()
    local model = GetEntityModel(playerPed)
    local newClothing = nil

    if model == GetHashKey("mp_m_freemode_01") then
        newClothing = MALE_CLOTHING_SLOT
    elseif model == GetHashKey("mp_f_freemode_01") then
        newClothing = FEMALE_CLOTHING_SLOT
    else
        notify("Staff vest only works on freemode characters.")
        return
    end

    local currentClothing = GetPedDrawableVariation(playerPed, COMPONENT)

    if currentClothing == newClothing then
        SetPedComponentVariation(playerPed, COMPONENT, previousDrawable, previousTexture, 0)
        notify("Staff vest removed.")
        return
    end

    previousDrawable = currentClothing
    previousTexture = GetPedTextureVariation(playerPed, COMPONENT)

    SetPedComponentVariation(playerPed, COMPONENT, newClothing, 0, 0)
    notify("Staff vest equipped.")
end)
