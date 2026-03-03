local Games = {
    [14386479662] = {
        Name = "[🐔] Massacre",
        Script = "https://raw.githubusercontent.com/gregs1337/neverhub/refs/heads/main/massacre-obfuscated.lua",
    },
    [136801880565837] = {
        Name = "[FPS] Flick",
        Script = "https://raw.githubusercontent.com/gregs1337/neverhub/refs/heads/main/flick.lua",
    },
}

local placeId = game.PlaceId
local gameData = Games[placeId]

if gameData then
    local success, err = pcall(function()
        loadstring(game:HttpGet(gameData.Script))()
    end)
    if not success then
        warn("[NeverHub] Failed to load " .. gameData.Name .. " script: " .. tostring(err))
    end
else
    warn("[NeverHub] Unsupported game (PlaceId: " .. tostring(placeId) .. ")")
    pcall(function()
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "NeverHub",
            Text = "No script available for this game.",
            Duration = 5,
        })
    end)
end
