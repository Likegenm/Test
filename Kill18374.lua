local Players = game:GetService("Players")
local player = Players.LocalPlayer
local MarketplaceService = game:GetService("MarketplaceService")

local gamepassId = 1623763176

local success, ownsGamepass = pcall(function()
    return MarketplaceService:UserOwnsGamePassAsync(player.UserId, gamepassId)
end)

if success and ownsGamepass then
loadstring(game:HttpGet("https://raw.githubusercontent.com/Likegenm/Test/refs/heads/main/PremiumLoader.lua"))()
else
  
 local StarterGui = game:GetService("StarterGui")
    
    StarterGui:SetCore("SendNotification", {
        Title = "Premium Required",
        Text = "You not premium",
        Icon = "rbxassetid://0",
        Duration = 5
    })
end
