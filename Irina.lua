game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer('Likegenm scripts tsb loading', "All")

local StarterGui = game:GetService("StarterGui")
StarterGui:SetCore("SendNotification", {
    Title = "Script Loading!",
    Text = "Join our discord",
    Duration = 5,
})

local player = game.Players.LocalPlayer

local function createRainbowTag()
    local character = player.Character
    if not character then return end
    
    character:WaitForChild("Head")
    
    local billboard = Instance.new("BillboardGui")
    billboard.Name = "RainbowTag"
    billboard.Size = UDim2.new(0, 200, 0, 50)
    billboard.StudsOffset = Vector3.new(0, 3, 0)
    billboard.AlwaysOnTop = true
    billboard.SizeOffset = Vector2.new(0, 0)
    billboard.Adornee = character.Head
    billboard.Parent = character.Head
    
    local textLabel = Instance.new("TextLabel")
    textLabel.Size = UDim2.new(1, 0, 1, 0)
    textLabel.BackgroundTransparency = 1
    textLabel.Text = "God"
    textLabel.TextSize = 40
    textLabel.Font = Enum.Font.GothamBlack
    textLabel.TextStrokeTransparency = 0
    textLabel.TextStrokeColor3 = Color3.new(0, 0, 0)
    textLabel.Parent = billboard
    
    local function rainbowEffect()
        local time = 0
        while billboard.Parent do
            time = time + 0.05
            
            local r = math.sin(time) * 0.5 + 0.5
            local g = math.sin(time + 2) * 0.5 + 0.5
            local b = math.sin(time + 4) * 0.5 + 0.5
            
            textLabel.TextColor3 = Color3.new(r, g, b)
            
            wait(0.1)
        end
    end
    
    spawn(rainbowEffect)
end

if player.Character then
    createRainbowTag()
end

player.CharacterAdded:Connect(createRainbowTag)
