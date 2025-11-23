local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "DQ script",
   LoadingTitle = "Create DQ script",
   LoadingSubtitle = "by likegenm",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "DQ Likegenm",
      FileName = "DQHub"
   },
})

local Main = Window:CreateTab("Main", 4483362458)

-- Speed Hack
local speedHackEnabled = false
local speedHackConnection = nil
local currentSpeedMultiplier = 1
local MAX_MULTIPLIER = 10

local Input = Main:CreateInput({
   Name = "SpeedHack",
   PlaceholderText = "Enter speed multiplier (Max: " .. MAX_MULTIPLIER .. "x)",
   RemoveTextAfterFocusLost = false,
   Callback = function(Text)
        local multiplier = tonumber(Text)
        if multiplier then
            if multiplier >= 0.1 and multiplier <= MAX_MULTIPLIER then
                currentSpeedMultiplier = multiplier
                
                if not speedHackEnabled then
                    speedHackEnabled = true
                    
                    if speedHackConnection then
                        speedHackConnection:Disconnect()
                    end
                    
                    local player = game.Players.LocalPlayer
                    
                    speedHackConnection = game:GetService("RunService").Heartbeat:Connect(function()
                        if not speedHackEnabled then return end
                        
                        local character = player.Character
                        if not character then return end
                        
                        local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
                        local humanoid = character:FindFirstChild("Humanoid")
                        if not humanoidRootPart or not humanoid then return end
                        
                        local bodyPosition = humanoidRootPart:FindFirstChild("SpeedHackPosition")
                        if not bodyPosition then
                            bodyPosition = Instance.new("BodyPosition")
                            bodyPosition.Name = "SpeedHackPosition"
                            bodyPosition.MaxForce = Vector3.new(40000, 0, 40000)
                            bodyPosition.P = 1250
                            bodyPosition.D = 100
                            bodyPosition.Parent = humanoidRootPart
                        end
                        
                        local moveDirection = humanoid.MoveDirection
                        if moveDirection.Magnitude > 0 then
                            local speed = 16 * currentSpeedMultiplier
                            local targetPosition = humanoidRootPart.Position + moveDirection * speed * 0.016
                            bodyPosition.Position = targetPosition
                        else
                            bodyPosition.Position = humanoidRootPart.Position
                        end
                    end)
                end
                
                Rayfield:Notify({
                    Title = "Speed Hack",
                    Content = "Speed set to: " .. (16 * multiplier) .. " (x" .. multiplier .. ")",
                    Duration = 3,
                    Image = 4483362458
                })
            else
                Rayfield:Notify({
                    Title = "Error",
                    Content = "Please enter number between 0.1 and " .. MAX_MULTIPLIER,
                    Duration = 3,
                    Image = 4483362458
                })
            end
        else
            Rayfield:Notify({
                Title = "Error",
                Content = "Please enter valid number",
                Duration = 3,
                Image = 4483362458
            })
        end
   end,
})

local ResetSpeedButton = Main:CreateButton({
   Name = "Reset Speed",
   Callback = function()
        currentSpeedMultiplier = 1
        speedHackEnabled = false
        
        if speedHackConnection then
            speedHackConnection:Disconnect()
            speedHackConnection = nil
        end
        
        local player = game.Players.LocalPlayer
        local character = player.Character
        if character then
            local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
            if humanoidRootPart then
                local bodyPosition = humanoidRootPart:FindFirstChild("SpeedHackPosition")
                if bodyPosition then
                    bodyPosition:Destroy()
                end
            end
        end
        
        Rayfield:Notify({
            Title = "Speed Reset",
            Content = "Speed reset to default (x1)",
            Duration = 3,
            Image = 4483362458
        })
   end,
})

-- Noclip
local noclipEnabled = false
local noclipConnection = nil

local NoclipToggle = Main:CreateToggle({
   Name = "Noclip",
   CurrentValue = false,
   Flag = "NoclipToggle",
   Callback = function(Value)
        noclipEnabled = Value
        
        if Value then
            local player = game.Players.LocalPlayer
            
            noclipConnection = game:GetService("RunService").Stepped:Connect(function()
                if not noclipEnabled then
                    noclipConnection:Disconnect()
                    return
                end
                
                local character = player.Character
                if not character then return end
                
                for _, part in pairs(character:GetDescendants()) do
                    if part:IsA("BasePart") then
                        part.CanCollide = false
                    end
                end
            end)
        else
            if noclipConnection then
                noclipConnection:Disconnect()
                noclipConnection = nil
            end
            
            local player = game.Players.LocalPlayer
            local character = player.Character
            if character then
                for _, part in pairs(character:GetDescendants()) do
                    if part:IsA("BasePart") then
                        part.CanCollide = true
                    end
                end
            end
        end
   end,
})
