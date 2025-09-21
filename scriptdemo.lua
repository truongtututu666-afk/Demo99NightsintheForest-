--[[
    🐵 KHỈ CAM SCRIPT [DEMO] - ENHANCED
    🎨 Unique Design with Animations
    ⚡ Multi-Function System + Kill Aura + Light Control
]]

-- Services
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local Lighting = game:GetService("Lighting")
local StarterGui = game:GetService("StarterGui")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local Camera = workspace.CurrentCamera
local Mouse = LocalPlayer:GetMouse()

-- Variables
local IconID = "rbxassetid://132815391220143"
local UIVisible = false
local CurrentTab = "View"
local ViewMode = 1
local FarmingBunnies = false
local KillAuraEnabled = false
local AutoBrightEnabled = false

-- Create Main GUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "KhiCamScript"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")

-- Toggle Button (Always Visible)
local ToggleButton = Instance.new("ImageButton")
ToggleButton.Name = "ToggleButton"
ToggleButton.Image = IconID
ToggleButton.BackgroundColor3 = Color3.fromRGB(255, 140, 0)
ToggleButton.BorderSizePixel = 0
ToggleButton.Position = UDim2.new(0, 10, 0.5, -35)
ToggleButton.Size = UDim2.new(0, 70, 0, 70)
ToggleButton.Parent = ScreenGui

-- Toggle Button Effects
local ToggleCorner = Instance.new("UICorner")
ToggleCorner.CornerRadius = UDim.new(1, 0)
ToggleCorner.Parent = ToggleButton

local ToggleStroke = Instance.new("UIStroke")
ToggleStroke.Color = Color3.fromRGB(255, 200, 0)
ToggleStroke.Thickness = 3
ToggleStroke.Parent = ToggleButton

-- Breathing Animation for Toggle
spawn(function()
    while true do
        TweenService:Create(ToggleButton, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
            Size = UDim2.new(0, 75, 0, 75)
        }):Play()
        wait(1)
        TweenService:Create(ToggleButton, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
            Size = UDim2.new(0, 70, 0, 70)
        }):Play()
        wait(1)
    end
end)

-- Main Frame
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
MainFrame.BorderSizePixel = 0
MainFrame.Position = UDim2.new(0.5, -250, 0.5, -250)
MainFrame.Size = UDim2.new(0, 500, 0, 500)
MainFrame.Visible = false
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

-- Main Frame Design
local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 20)
MainCorner.Parent = MainFrame

local MainGradient = Instance.new("UIGradient")
MainGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(30, 30, 35)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(25, 25, 30)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(20, 20, 25))
}
MainGradient.Rotation = 90
MainGradient.Parent = MainFrame

local MainStroke = Instance.new("UIStroke")
MainStroke.Color = Color3.fromRGB(255, 140, 0)
MainStroke.Thickness = 2
MainStroke.Transparency = 0.5
MainStroke.Parent = MainFrame

-- Title Bar
local TitleBar = Instance.new("Frame")
TitleBar.BackgroundColor3 = Color3.fromRGB(255, 140, 0)
TitleBar.Size = UDim2.new(1, 0, 0, 50)
TitleBar.Parent = MainFrame

local TitleCorner = Instance.new("UICorner")
TitleCorner.CornerRadius = UDim.new(0, 20)
TitleCorner.Parent = TitleBar

local TitleFix = Instance.new("Frame")
TitleFix.BackgroundColor3 = Color3.fromRGB(255, 140, 0)
TitleFix.Position = UDim2.new(0, 0, 0.5, 0)
TitleFix.Size = UDim2.new(1, 0, 0.5, 0)
TitleFix.BorderSizePixel = 0
TitleFix.Parent = TitleBar

-- Icon in Title
local TitleIcon = Instance.new("ImageLabel")
TitleIcon.Image = IconID
TitleIcon.BackgroundTransparency = 1
TitleIcon.Position = UDim2.new(0, 10, 0.5, -20)
TitleIcon.Size = UDim2.new(0, 40, 0, 40)
TitleIcon.Parent = TitleBar

-- Title Text with Animation
local TitleText = Instance.new("TextLabel")
TitleText.BackgroundTransparency = 1
TitleText.Position = UDim2.new(0, 60, 0, 0)
TitleText.Size = UDim2.new(0.7, 0, 1, 0)
TitleText.Font = Enum.Font.GothamBold
TitleText.RichText = true
TitleText.Text = '🐵 KHỈ CAM SCRIPT <font color="rgb(255,140,0)">[DEMO]</font>'
TitleText.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleText.TextSize = 20
TitleText.Parent = TitleBar

-- Animated Title
spawn(function()
    while true do
        for i = 0, 360, 5 do
            TitleText.TextColor3 = Color3.fromHSV(i/360, 1, 1)
            wait(0.05)
        end
    end
end)

-- Close Button
local CloseButton = Instance.new("TextButton")
CloseButton.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
CloseButton.Position = UDim2.new(1, -40, 0.5, -15)
CloseButton.Size = UDim2.new(0, 30, 0, 30)
CloseButton.Font = Enum.Font.GothamBold
CloseButton.Text = "✖"
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.TextSize = 18
CloseButton.Parent = TitleBar

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(1, 0)
CloseCorner.Parent = CloseButton

-- Tab Container
local TabContainer = Instance.new("Frame")
TabContainer.BackgroundTransparency = 1
TabContainer.Position = UDim2.new(0, 10, 0, 60)
TabContainer.Size = UDim2.new(1, -20, 0, 40)
TabContainer.Parent = MainFrame

-- Tab Buttons
local tabs = {
    {name = "View", icon = "👁️", color = Color3.fromRGB(100, 200, 255)},
    {name = "Combat", icon = "⚔️", color = Color3.fromRGB(255, 50, 50)},
    {name = "Farm", icon = "🐰", color = Color3.fromRGB(255, 100, 150)},
    {name = "World", icon = "🌍", color = Color3.fromRGB(100, 255, 100)}
}

local tabButtons = {}
for i, tab in ipairs(tabs) do
    local TabButton = Instance.new("TextButton")
    TabButton.BackgroundColor3 = i == 1 and tab.color or Color3.fromRGB(40, 40, 45)
    TabButton.Position = UDim2.new((i-1) * 0.25, i > 1 and 3 or 0, 0, 0)
    TabButton.Size = UDim2.new(0.25, -3, 1, 0)
    TabButton.Font = Enum.Font.GothamBold
    TabButton.Text = tab.icon .. " " .. tab.name
    TabButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    TabButton.TextSize = 13
    TabButton.Parent = TabContainer
    
    local TabCorner = Instance.new("UICorner")
    TabCorner.CornerRadius = UDim.new(0, 10)
    TabCorner.Parent = TabButton
    
    tabButtons[tab.name] = TabButton
    
    TabButton.MouseButton1Click:Connect(function()
        CurrentTab = tab.name
        
        for name, btn in pairs(tabButtons) do
            local idx = name == "View" and 1 or name == "Combat" and 2 or name == "Farm" and 3 or 4
            local tabData = tabs[idx]
            btn.BackgroundColor3 = name == CurrentTab and tabData.color or Color3.fromRGB(40, 40, 45)
        end
        
        TweenService:Create(TabButton, TweenInfo.new(0.2, Enum.EasingStyle.Back), {
            Size = UDim2.new(0.25, -3, 1.2, 0)
        }):Play()
        wait(0.2)
        TweenService:Create(TabButton, TweenInfo.new(0.2), {
            Size = UDim2.new(0.25, -3, 1, 0)
        }):Play()
    end)
end

-- Content Frame
local ContentFrame = Instance.new("ScrollingFrame")
ContentFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
ContentFrame.BorderSizePixel = 0
ContentFrame.Position = UDim2.new(0, 10, 0, 110)
ContentFrame.Size = UDim2.new(1, -20, 1, -120)
ContentFrame.ScrollBarThickness = 6
ContentFrame.ScrollBarImageColor3 = Color3.fromRGB(255, 140, 0)
ContentFrame.Parent = MainFrame

local ContentCorner = Instance.new("UICorner")
ContentCorner.CornerRadius = UDim.new(0, 15)
ContentCorner.Parent = ContentFrame

-- VIEW TAB
local ViewFrame = Instance.new("Frame")
ViewFrame.BackgroundTransparency = 1
ViewFrame.Size = UDim2.new(1, 0, 1, 0)
ViewFrame.Parent = ContentFrame

local viewModes = {
    {name = "First Person", desc = "Góc nhìn thứ nhất", fov = 70, distance = 0.5},
    {name = "Second Person", desc = "Góc nhìn thứ hai", fov = 50, distance = 10},
    {name = "Third Person", desc = "Góc nhìn thứ ba", fov = 90, distance = 20}
}

for i, mode in ipairs(viewModes) do
    local ModeButton = Instance.new("TextButton")
    ModeButton.BackgroundColor3 = Color3.fromRGB(50, 50, 55)
    ModeButton.Position = UDim2.new(0, 10, 0, 10 + (i-1) * 80)
    ModeButton.Size = UDim2.new(1, -20, 0, 70)
    ModeButton.Font = Enum.Font.Gotham
    ModeButton.Text = mode.name .. "\n" .. mode.desc
    ModeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    ModeButton.TextSize = 14
    ModeButton.Parent = ViewFrame
    
    local ModeCorner = Instance.new("UICorner")
    ModeCorner.CornerRadius = UDim.new(0, 12)
    ModeCorner.Parent = ModeButton
    
    ModeButton.MouseButton1Click:Connect(function()
        TweenService:Create(Camera, TweenInfo.new(0.5), {
            FieldOfView = mode.fov
        }):Play()
        
        LocalPlayer.CameraMinZoomDistance = mode.distance
        LocalPlayer.CameraMaxZoomDistance = mode.distance
        
        StarterGui:SetCore("SendNotification", {
            Title = "VIEW MODE",
            Text = mode.name,
            Icon = IconID,
            Duration = 2
        })
    end)
end

-- COMBAT TAB
local CombatFrame = Instance.new("Frame")
CombatFrame.BackgroundTransparency = 1
CombatFrame.Size = UDim2.new(1, 0, 1, 0)
CombatFrame.Visible = false
CombatFrame.Parent = ContentFrame

-- Kill Aura Section
local KillAuraTitle = Instance.new("TextLabel")
KillAuraTitle.BackgroundTransparency = 1
KillAuraTitle.Position = UDim2.new(0, 10, 0, 10)
KillAuraTitle.Size = UDim2.new(1, -20, 0, 30)
KillAuraTitle.Font = Enum.Font.GothamBold
KillAuraTitle.Text = "⚔️ KILL AURA - EXTREME DAMAGE"
KillAuraTitle.TextColor3 = Color3.fromRGB(255, 50, 50)
KillAuraTitle.TextSize = 16
KillAuraTitle.Parent = CombatFrame

-- Kill Aura Button
local KillAuraButton = Instance.new("TextButton")
KillAuraButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
KillAuraButton.Position = UDim2.new(0.5, -100, 0, 50)
KillAuraButton.Size = UDim2.new(0, 200, 0, 80)
KillAuraButton.Font = Enum.Font.GothamBold
KillAuraButton.Text = "💀 ACTIVATE KILL AURA"
KillAuraButton.TextColor3 = Color3.fromRGB(255, 255, 255)
KillAuraButton.TextSize = 16
KillAuraButton.Parent = CombatFrame

local KillAuraCorner = Instance.new("UICorner")
KillAuraCorner.CornerRadius = UDim.new(0, 15)
KillAuraCorner.Parent = KillAuraButton

-- Kill Aura Range Slider
local RangeLabel = Instance.new("TextLabel")
RangeLabel.BackgroundTransparency = 1
RangeLabel.Position = UDim2.new(0, 10, 0, 140)
RangeLabel.Size = UDim2.new(1, -20, 0, 20)
RangeLabel.Font = Enum.Font.Gotham
RangeLabel.Text = "Kill Range: 50 studs"
RangeLabel.TextColor3 = Color3.fromRGB(255, 200, 100)
RangeLabel.TextSize = 14
RangeLabel.Parent = CombatFrame

local RangeSlider = Instance.new("TextButton")
RangeSlider.BackgroundColor3 = Color3.fromRGB(60, 60, 65)
RangeSlider.Position = UDim2.new(0, 10, 0, 170)
RangeSlider.Size = UDim2.new(1, -20, 0, 30)
RangeSlider.Text = ""
RangeSlider.Parent = CombatFrame

local RangeCorner = Instance.new("UICorner")
RangeCorner.CornerRadius = UDim.new(0, 15)
RangeCorner.Parent = RangeSlider

local RangeFill = Instance.new("Frame")
RangeFill.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
RangeFill.Size = UDim2.new(0.5, 0, 1, 0)
RangeFill.Parent = RangeSlider

local FillCorner = Instance.new("UICorner")
FillCorner.CornerRadius = UDim.new(0, 15)
FillCorner.Parent = RangeFill

local KillRange = 50

-- Kill Aura Stats
local KillStats = Instance.new("TextLabel")
KillStats.BackgroundTransparency = 1
KillStats.Position = UDim2.new(0, 10, 0, 210)
KillStats.Size = UDim2.new(1, -20, 0, 20)
KillStats.Font = Enum.Font.Gotham
KillStats.Text = "Kills: 0 | Damage Dealt: 0"
KillStats.TextColor3 = Color3.fromRGB(200, 200, 200)
KillStats.TextSize = 14
KillStats.Parent = CombatFrame

local killCount = 0
local damageDealt = 0

-- Kill Aura Function
local KillAuraConnection
local function ToggleKillAura()
    KillAuraEnabled = not KillAuraEnabled
    
    if KillAuraEnabled then
        KillAuraButton.Text = "⏹️ STOP KILL AURA"
        KillAuraButton.BackgroundColor3 = Color3.fromRGB(100, 255, 100)
        
        KillAuraConnection = RunService.Heartbeat:Connect(function()
            if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                local rootPart = LocalPlayer.Character.HumanoidRootPart
                
                for _, player in pairs(Players:GetPlayers()) do
                    if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("Humanoid") then
                        local humanoid = player.Character.Humanoid
                        local enemyRoot = player.Character:FindFirstChild("HumanoidRootPart")
                        
                        if enemyRoot and (enemyRoot.Position - rootPart.Position).Magnitude <= KillRange then
                            -- EXTREME DAMAGE
                            local damage = 999999999
                            humanoid:TakeDamage(damage)
                            damageDealt = damageDealt + damage
                            
                            if humanoid.Health <= 0 then
                                killCount = killCount + 1
                            end
                            
                            -- Visual Effect
                            local explosion = Instance.new("Explosion")
                            explosion.Position = enemyRoot.Position
                            explosion.BlastRadius = 20
                            explosion.BlastPressure = 500000
                            explosion.Parent = workspace
                            
                            -- Update stats
                            KillStats.Text = string.format("Kills: %d | Damage: %.1fM", 
                                killCount, damageDealt/1000000)
                        end
                    end
                end
                
                -- Kill NPCs too
                for _, npc in pairs(workspace:GetDescendants()) do
                    if npc:IsA("Model") and npc:FindFirstChild("Humanoid") and npc ~= LocalPlayer.Character then
                        local humanoid = npc.Humanoid
                        local npcRoot = npc:FindFirstChild("HumanoidRootPart") or npc:FindFirstChild("Torso")
                        
                        if npcRoot and (npcRoot.Position - rootPart.Position).Magnitude <= KillRange then
                            humanoid.Health = 0
                            killCount = killCount + 1
                            KillStats.Text = string.format("Kills: %d | Damage: %.1fM", 
                                killCount, damageDealt/1000000)
                        end
                    end
                end
            end
        end)
    else
        KillAuraButton.Text = "💀 ACTIVATE KILL AURA"
        KillAuraButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
        
        if KillAuraConnection then
            KillAuraConnection:Disconnect()
        end
    end
end

KillAuraButton.MouseButton1Click:Connect(ToggleKillAura)

-- Range Slider Handler
local draggingRange = false
RangeSlider.MouseButton1Down:Connect(function()
    draggingRange = true
end)

UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        draggingRange = false
    end
end)

RunService.Heartbeat:Connect(function()
    if draggingRange then
        local mouse = UserInputService:GetMouseLocation()
        local sliderPos = RangeSlider.AbsolutePosition.X
        local sliderSize = RangeSlider.AbsoluteSize.X
        
        local percentage = math.clamp((mouse.X - sliderPos) / sliderSize, 0, 1)
        RangeFill.Size = UDim2.new(percentage, 0, 1, 0)
        
        KillRange = 10 + (percentage * 190) -- 10 to 200 studs
        RangeLabel.Text = string.format("Kill Range: %d studs", math.floor(KillRange))
    end
end)

-- FARM TAB
local FarmFrame = Instance.new("Frame")
FarmFrame.BackgroundTransparency = 1
FarmFrame.Size = UDim2.new(1, 0, 1, 0)
FarmFrame.Visible = false
FarmFrame.Parent = ContentFrame

local BunnyButton = Instance.new("TextButton")
BunnyButton.BackgroundColor3 = Color3.fromRGB(255, 100, 150)
BunnyButton.Position = UDim2.new(0.5, -100, 0, 20)
BunnyButton.Size = UDim2.new(0, 200, 0, 80)
BunnyButton.Font = Enum.Font.GothamBold
BunnyButton.Text = "🐰 START BUNNY FARM"
BunnyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
BunnyButton.TextSize = 16
BunnyButton.Parent = FarmFrame

local BunnyCorner = Instance.new("UICorner")
BunnyCorner.CornerRadius = UDim.new(0, 15)
BunnyCorner.Parent = BunnyButton

local bunnyCount = 0
local BunnyCounter = Instance.new("TextLabel")
BunnyCounter.BackgroundTransparency = 1
BunnyCounter.Position = UDim2.new(0, 10, 0, 110)
BunnyCounter.Size = UDim2.new(1, -20, 0, 30)
BunnyCounter.Font = Enum.Font.Gotham
BunnyCounter.Text = "Bunnies Destroyed: 0"
BunnyCounter.TextColor3 = Color3.fromRGB(255, 200, 100)
BunnyCounter.TextSize = 14
BunnyCounter.Parent = FarmFrame

BunnyButton.MouseButton1Click:Connect(function()
    FarmingBunnies = not FarmingBunnies
    
    if FarmingBunnies then
        BunnyButton.Text = "⏹️ STOP FARMING"
        BunnyButton.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
        
        spawn(function()
            while FarmingBunnies do
                for _, obj in pairs(workspace:GetDescendants()) do
                    if obj.Name:lower():find("bunny") or obj.Name:lower():find("rabbit") then
                        if obj:IsA("Model") and obj:FindFirstChild("Humanoid") then
                            obj.Humanoid.Health = 0
                            bunnyCount = bunnyCount + 1
                            BunnyCounter.Text = "Bunnies Destroyed: " .. bunnyCount
                        end
                    end
                end
                wait(0.5)
            end
        end)
    else
        BunnyButton.Text = "🐰 START BUNNY FARM"
        BunnyButton.BackgroundColor3 = Color3.fromRGB(255, 100, 150)
    end
end)

-- WORLD TAB
local WorldFrame = Instance.new("Frame")
WorldFrame.BackgroundTransparency = 1
WorldFrame.Size = UDim2.new(1, 0, 1, 0)
WorldFrame.Visible = false
WorldFrame.Parent = ContentFrame

local WorldTitle = Instance.new("TextLabel")
WorldTitle.BackgroundTransparency = 1
WorldTitle.Position = UDim2.new(0, 10, 0, 10)
WorldTitle.Size = UDim2.new(1, -20, 0, 30)
WorldTitle.Font = Enum.Font.GothamBold
WorldTitle.Text = "🌍 WORLD CONTROL"
WorldTitle.TextColor3 = Color3.fromRGB(100, 255, 100)
WorldTitle.TextSize = 16
WorldTitle.Parent = WorldFrame

-- Light Control Button
local LightButton = Instance.new("TextButton")
LightButton.BackgroundColor3 = Color3.fromRGB(255, 200, 50)
LightButton.Position = UDim2.new(0.5, -150, 0, 50)
LightButton.Size = UDim2.new(0, 300, 0, 100)
LightButton.Font = Enum.Font.GothamBold
LightButton.Text = "☀️ ULTRA BRIGHT MODE\nXóa tối - Làm sáng cực mạnh"
LightButton.TextColor3 = Color3.fromRGB(255, 255, 255)
LightButton.TextSize = 16
LightButton.Parent = WorldFrame

local LightCorner = Instance.new("UICorner")
LightCorner.CornerRadius = UDim.new(0, 20)
LightCorner.Parent = LightButton

-- Light Settings Display
local LightInfo = Instance.new("TextLabel")
LightInfo.BackgroundTransparency = 1
LightInfo.Position = UDim2.new(0, 10, 0, 160)
LightInfo.Size = UDim2.new(1, -20, 0, 60)
LightInfo.Font = Enum.Font.Gotham
LightInfo.Text = "Current Time: " .. Lighting.ClockTime .. "\nBrightness: " .. Lighting.Brightness
LightInfo.TextColor3 = Color3.fromRGB(200, 200, 200)
LightInfo.TextSize = 14
LightInfo.Parent = WorldFrame

-- Original lighting values
local originalLighting = {
    Brightness = Lighting.Brightness,
    ClockTime = Lighting.ClockTime,
    FogEnd = Lighting.FogEnd,
    Ambient = Lighting.Ambient,
    OutdoorAmbient = Lighting.OutdoorAmbient,
    GlobalShadows   = Lighting.ShadowSoftness,
}
--Auto Bright Function
local function ToggleAutoBright()
    AutoBrightEnabled = not AutoBrightEnabled
    
    if AutoBrightEnabled then
        LightButton.Text = "🌙 NORMAL MODE\nClick to restore"
        LightButton.BackgroundColor3 = Color3.fromRGB(100, 100, 150)
        
        -- ULTRA BRIGHT SETTINGS
        Lighting.Brightness = 10
        Lighting.ClockTime = 12
        Lighting.FogEnd = 100000
        Lighting.FogStart = 100000
        Lighting.GlobalShadows = false
        Lighting.Ambient = Color3.fromRGB(255, 255, 255)
        Lighting.OutdoorAmbient = Color3.fromRGB(255, 255, 255)
        
        -- Remove all dark effects
        for _, effect in pairs(Lighting:GetChildren()) do
            if effect:IsA("PostEffect") then
                effect.Enabled = false
            end
        end
        --Add extra light
        local PointLight = Instance.new("PointLight")
        PointLight.Name = "UltraBright"
        PointLight.Brightness = 100
        PointLight.Range = 1000
        PointLight.Parent = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        
        -- Create sun rays
        local SunRays = Instance.new("SunRaysEffect")
        SunRays.Name = "UltraSun"
        SunRays.Intensity = 1
        SunRays.Spread = 1
        SunRays.Parent = Lighting
        
        -- Notification
        StarterGui:SetCore("SendNotification", {
            Title = "☀️ ULTRA BRIGHT",
            Text = "World is now SUPER BRIGHT!",
            Icon = IconID,
            Duration = 3
        })
        
        -- Auto maintain brightness
        spawn(function()
            while AutoBrightEnabled do
                Lighting.Brightness = 10
                Lighting.ClockTime = 12
                Lighting.GlobalShadows = false
                wait(0.5)
            end
        end)
    else
        LightButton.Text = "☀️ ULTRA BRIGHT MODE\nXóa tối - Làm sáng cực mạnh"
        LightButton.BackgroundColor3 = Color3.fromRGB(255, 200, 50)
        
        -- Restore original
        Lighting.Brightness = originalLighting.Brightness
        Lighting.ClockTime = originalLighting.ClockTime
        Lighting.FogEnd = originalLighting.FogEnd
        Lighting.Ambient = originalLighting.Ambient
        Lighting.OutdoorAmbient = originalLighting.OutdoorAmbient
        Lighting.GlobalShadows = originalLighting.GlobalShadows
        
        -- Remove added effects
        if Lighting:FindFirstChild("UltraSun") then
            Lighting.UltraSun:Destroy()
        end
        
if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            local light = LocalPlayer.Character.HumanoidRootPart:FindFirstChild("UltraBright")
            if light then light:Destroy() end
        end
        
        -- Re-enable post effects
        for _, effect in pairs(Lighting:GetChildren()) do
            if effect:IsA("PostEffect") then
                effect.Enabled = true
            end
        end
    end
    
    -- Update info
    LightInfo.Text = "Current Time: " .. Lighting.ClockTime .. "\nBrightness: " .. Lighting.Brightness
end

LightButton.MouseButton1Click:Connect(ToggleAutoBright)

-- Update light info continuously
spawn(function()
    while true do
        if WorldFrame.Visible then
            LightInfo.Text = string.format("Current Time: %.1f\nBrightness: %.1f\nMode: %s",
                Lighting.ClockTime,
                Lighting.Brightness,
                AutoBrightEnabled and "ULTRA BRIGHT" or "Normal"
            )
        end
        wait(1)
    end
end)

-- Tab visibility handler
spawn(function()
    while true do
        ViewFrame.Visible = CurrentTab == "View"
        CombatFrame.Visible = CurrentTab == "Combat"
        FarmFrame.Visible = CurrentTab == "Farm"
        WorldFrame.Visible = CurrentTab == "World"
        wait(0.1)
    end
end)

-- Toggle UI
local function ToggleUI()
    UIVisible = not UIVisible
    
    if UIVisible then
        MainFrame.Visible = true
        MainFrame.Size = UDim2.new(0, 0, 0, 0)
        MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
        
        TweenService:Create(MainFrame, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
            Size = UDim2.new(0, 500, 0, 500),
            Position = UDim2.new(0.5, -250, 0.5, -250)
        }):Play()
        
        StarterGui:SetCore("SendNotification", {
            Title = "🐵 KHỈ CAM SCRIPT",
            Text = "ENHANCED VERSION LOADED!",
            Icon = IconID,
            Duration = 3
        })
    else
        TweenService:Create(MainFrame, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
            Size = UDim2.new(0, 0, 0, 0),
            Position = UDim2.new(0.5, 0, 0.5, 0)
        }):Play()
        
        wait(0.3)
        MainFrame.Visible = false
    end
end
-- Button Events
ToggleButton.MouseButton1Click:Connect(ToggleUI)
CloseButton.MouseButton1Click:Connect(ToggleUI)

-- Rainbow effect
spawn(function()
    while true do
        for i = 0, 360, 5 do
            ToggleStroke.Color = Color3.fromHSV(i/360, 1, 1)
            MainStroke.Color = Color3.fromHSV(i/360, 0.8, 1)
            wait(0.05)
        end
    end
end)

-- Initial notification
StarterGui:SetCore("SendNotification", {
    Title = "🐵 KHỈ CAM SCRIPT [DEMO]",
    Text = "Enhanced Version Loaded!",
    Icon = IconID,
    Duration = 5
})

print("🐵 Khỉ Cam Script [DEMO] Enhanced - Loaded!")