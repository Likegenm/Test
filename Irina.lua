local platform = Instance.new("Part")
platform.Name = "PlatformVoid"
platform.Size = Vector3.new(100000, 10, 100000) -- Еще больше
platform.Position = Vector3.new(1.26, -7.33, -3.11)
platform.Anchored = true
platform.CanCollide = true
platform.Color = Color3.fromRGB(0, 0, 0)
platform.Material = Enum.Material.Plastic
platform.Transparency = 0.8
platform.Parent = workspace
platform.ResetOnSpawn = false

local StarterGui = game:GetService("StarterGui")
StarterGui:SetCore("SendNotification", {
    Title = "TSB",
    Text = "By Likegenm",
    Duration = 5,
})

local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

character:WaitForChild("Head")

local billboard = Instance.new("BillboardGui")
billboard.Name = "RainbowTag"
billboard.Size = UDim2.new(0, 200, 0, 50)
billboard.StudsOffset = Vector3.new(0, 3, 0)
billboard.AlwaysOnTop = true
billboard.SizeOffset = Vector2.new(0, 0)
billboard.Adornee = character.Head
billboard.Parent = character.Head
billboard.ResetOnSpawn = false

local textLabel = Instance.new("TextLabel")
textLabel.Size = UDim2.new(1, 0, 1, 0)
textLabel.BackgroundTransparency = 1
textLabel.Text = "God"
textLabel.TextSize = 40
textLabel.Font = Enum.Font.GothamBlack
textLabel.TextStrokeTransparency = 0
textLabel.TextStrokeColor3 = Color3.new(0, 0, 0)
textLabel.Parent = billboard
textLabel.ResetOnSpawn = false

local function rainbowEffect()
    local time = 0
    while true do
        time = time + 0.05
        
        local r = math.sin(time) * 0.5 + 0.5
        local g = math.sin(time + 2) * 0.5 + 0.5
        local b = math.sin(time + 4) * 0.5 + 0.5
        
        textLabel.TextColor3 = Color3.new(r, g, b)
        
        wait(0.1)
    end
end

spawn(rainbowEffect)
