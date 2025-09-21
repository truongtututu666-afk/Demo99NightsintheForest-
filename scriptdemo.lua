--[[
    🐵 KHỈ CAM SCRIPT [DEMO] - ULTIMATE
    🎨 Enhanced with Small Tree & Log Teleport
    ⚡ All features fixed and enhanced
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
local SmallTreeEnabled = false
local ItemTeleportEnabled = false
local LogTeleportEnabled = false

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

-- Breathing Animation
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
MainFrame.Position = UDim2.new(0.5, -275, 0.5, -300)
MainFrame.Size = UDim2.new(0, 550, 0, 600)
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

-- Title Text
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

-- Rainbow Title
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

-- Tabs
local tabs = {
    {name = "View", icon = "👁️", color = Color3.fromRGB(100, 200, 255)},
    {name = "Combat", icon = "⚔️", color = Color3.fromRGB(255, 50, 50)},
    {name = "Teleport", icon = "🌀", color = Color3.fromRGB(200, 100, 255)},
    {name = "Farm", icon = "🐰", color = Color3.fromRGB(255, 100, 150)},
    {name = "World", icon = "🌍", color = Color3.fromRGB(100, 255, 100)}
}

local tabButtons = {}
for i, tab in ipairs(tabs) do
    local TabButton = Instance.new("TextButton")
    TabButton.BackgroundColor3 = i == 1 and tab.color or Color3.fromRGB(40, 40, 45)
    TabButton.Position = UDim2.new((i-1) * 0.2, i > 1 and 2 or 0, 0, 0)
    TabButton.Size = UDim2.new(0.2, -2, 1, 0)
    TabButton.Font = Enum.Font.GothamBold
    TabButton.Text = tab.icon .. " " .. tab.name
    TabButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    TabButton.TextSize = 12
    TabButton.Parent = TabContainer
    
    local TabCorner = Instance.new("UICorner")
    TabCorner.CornerRadius = UDim.new(0, 10)
    TabCorner.Parent = TabButton
    
    tabButtons[tab.name] = TabButton
    
    TabButton.MouseButton1Click:Connect(function()
        CurrentTab = tab.name
        
        for name, btn in pairs(tabButtons) do
            local idx
            for j, t in ipairs(tabs) do
                if t.name == name then idx = j break end
            end
            local tabData = tabs[idx]
            btn.BackgroundColor3 = name == CurrentTab and tabData.color or Color3.fromRGB(40, 40, 45)
        end
        
        TweenService:Create(TabButton, TweenInfo.new(0.2, Enum.EasingStyle.Back), {
            Size = UDim2.new(0.2, -2, 1.2, 0)
        }):Play()
        wait(0.2)
        TweenService:Create(TabButton, TweenInfo.new(0.2), {
            Size = UDim2.new(0.2, -2, 1, 0)
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

local KillAuraTitle = Instance.new("TextLabel")
KillAuraTitle.BackgroundTransparency = 1
KillAuraTitle.Position = UDim2.new(0, 10, 0, 10)
KillAuraTitle.Size = UDim2.new(1, -20, 0, 30)
KillAuraTitle.Font = Enum.Font.GothamBold
KillAuraTitle.Text = "⚔️ KILL AURA - ULTIMATE DAMAGE"
KillAuraTitle.TextColor3 = Color3.fromRGB(255, 50, 50)
KillAuraTitle.TextSize = 16
KillAuraTitle.Parent = CombatFrame

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

local KillRange = 50
local killCount = 0

-- Fixed Kill Aura
local KillAuraConnection
local function ToggleKillAura()
    KillAuraEnabled = not KillAuraEnabled
    
    if KillAuraEnabled then
        KillAuraButton.Text = "⏹️ STOP KILL AURA"
        KillAuraButton.BackgroundColor3 = Color3.fromRGB(100, 255, 100)
        
        StarterGui:SetCore("SendNotification", {
            Title = "⚔️ KILL AURA",
            Text = "Activated! Range: " .. KillRange,
            Icon = IconID,
            Duration = 3
        })
        
        KillAuraConnection = RunService.Heartbeat:Connect(function()
            local character = LocalPlayer.Character
            if character and character:FindFirstChild("HumanoidRootPart") then
                local rootPart = character.HumanoidRootPart
                
                -- Kill all entities in range
                for _, obj in pairs(workspace:GetDescendants()) do
                    if obj:IsA("Model") and obj ~= character then
                        local humanoid = obj:FindFirstChildOfClass("Humanoid")
                        local root = obj:FindFirstChild("HumanoidRootPart") or obj:FindFirstChild("Torso") or obj:FindFirstChild("Head")
                        
                        if humanoid and root then
                            local distance = (root.Position - rootPart.Position).Magnitude
                            
                            if distance <= KillRange then
                                -- Multiple kill methods
                                humanoid.Health = 0
                                humanoid:TakeDamage(999999999)
                                obj:BreakJoints()
                                
                                -- Try remote events
                                for _, remote in pairs(ReplicatedStorage:GetDescendants()) do
                                    if remote:IsA("RemoteEvent") and (remote.Name:lower():find("damage") or remote.Name:lower():find("hit") or remote.Name:lower():find("attack")) then
                                        pcall(function()
                                            remote:FireServer(obj, 999999999)
                                            remote:FireServer(humanoid, 999999999)
                                        end)
                                    end
                                end
                                
                                killCount = killCount + 1
                            end
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

-- TELEPORT TAB
local TeleportFrame = Instance.new("Frame")
TeleportFrame.BackgroundTransparency = 1
TeleportFrame.Size = UDim2.new(1, 0, 1, 0)
TeleportFrame.Visible = false
TeleportFrame.Parent = ContentFrame

local TeleportTitle = Instance.new("TextLabel")
TeleportTitle.BackgroundTransparency = 1
TeleportTitle.Position = UDim2.new(0, 10, 0, 10)
TeleportTitle.Size = UDim2.new(1, -20, 0, 30)
TeleportTitle.Font = Enum.Font.GothamBold
TeleportTitle.Text = "🌀 TELEPORT CONTROL"
TeleportTitle.TextColor3 = Color3.fromRGB(200, 100, 255)
TeleportTitle.TextSize = 16
TeleportTitle.Parent = TeleportFrame

-- Small Tree Button
local SmallTreeButton = Instance.new("TextButton")
SmallTreeButton.BackgroundColor3 = Color3.fromRGB(100, 200, 100)
SmallTreeButton.Position = UDim2.new(0.5, -150, 0, 50)
SmallTreeButton.Size = UDim2.new(0, 300, 0, 80)
SmallTreeButton.Font = Enum.Font.GothamBold
SmallTreeButton.Text = "🌲 SMALL TREE MODE\nThu nhỏ cây & Teleport giữa map"
SmallTreeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
SmallTreeButton.TextSize = 16
SmallTreeButton.Parent = TeleportFrame

local SmallTreeCorner = Instance.new("UICorner")
SmallTreeCorner.CornerRadius = UDim.new(0, 15)
SmallTreeCorner.Parent = SmallTreeButton

-- Small Tree Function
SmallTreeButton.MouseButton1Click:Connect(function()
    SmallTreeEnabled = not SmallTreeEnabled
    
    if SmallTreeEnabled then
        SmallTreeButton.Text = "⏹️ STOP SMALL TREE"
        SmallTreeButton.BackgroundColor3 = Color3.fromRGB(255, 100, 100)
        
        -- Find center of map
        local centerPos = Vector3.new(0, 100, 0)
        local spawn = workspace:FindFirstChild("SpawnLocation") or workspace:FindFirstChild("Spawn")
        if spawn then
            centerPos = spawn.Position + Vector3.new(0, 10, 0)
        end
        
        -- Teleport to center
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(centerPos)
        end
        
        -- Make all trees smaller
        for _, obj in pairs(workspace:GetDescendants()) do
            if obj.Name:lower():find("tree") or obj.Name:lower():find("wood") or obj.Name:lower():find("log") then
                if obj:IsA("BasePart") then
                    obj.Size = obj.Size * 0.3
                    obj.Transparency = 0.5
                elseif obj:IsA("Model") then
                    for _, part in pairs(obj:GetDescendants()) do
                        if part:IsA("BasePart") then
                            part.Size = part.Size * 0.3
                            part.Transparency = 0.5
                        end
                    end
                end
            end
        end
        
        StarterGui:SetCore("SendNotification", {
            Title = "🌲 SMALL TREE",
            Text = "Trees shrunk & Teleported to center!",
            Icon = IconID,
            Duration = 3
        })
    else
        SmallTreeButton.Text = "🌲 SMALL TREE MODE\nThu nhỏ cây & Teleport giữa map"
        SmallTreeButton.BackgroundColor3 = Color3.fromRGB(100, 200, 100)
        
        -- Restore tree sizes
        for _, obj in pairs(workspace:GetDescendants()) do
            if obj.Name:lower():find("tree") or obj.Name:lower():find("wood") or obj.Name:lower():find("log") then
                if obj:IsA("BasePart") then
                    obj.Size = obj.Size / 0.3
                    obj.Transparency = 0
                elseif obj:IsA("Model") then
                    for _, part in pairs(obj:GetDescendants()) do
                        if part:IsA("BasePart") then
                            part.Size = part.Size / 0.3
                            part.Transparency = 0
                        end
                    end
                end
            end
        end
    end
end)

-- Log Teleport Button
local LogButton = Instance.new("TextButton")
LogButton.BackgroundColor3 = Color3.fromRGB(139, 69, 19)
LogButton.Position = UDim2.new(0.5, -150, 0, 140)
LogButton.Size = UDim2.new(0, 300, 0, 80)
LogButton.Font = Enum.Font.GothamBold
LogButton.Text = "🪵 LOG TELEPORT\nTất cả log/gỗ tốc biến giữa map"
LogButton.TextColor3 = Color3.fromRGB(255, 255, 255)
LogButton.TextSize = 16
LogButton.Parent = TeleportFrame

local LogCorner = Instance.new("UICorner")
LogCorner.CornerRadius = UDim.new(0, 15)
LogCorner.Parent = LogButton

-- Log Teleport Function
local LogTeleportConnection
LogButton.MouseButton1Click:Connect(function()
    LogTeleportEnabled = not LogTeleportEnabled
    
    if LogTeleportEnabled then
        LogButton.Text = "⏹️ STOP LOG TELEPORT"
        LogButton.BackgroundColor3 = Color3.fromRGB(255, 100, 100)
        
        -- Find center position
        local centerPos = Vector3.new(0, 10, 0)
        local spawn = workspace:FindFirstChild("SpawnLocation") or workspace:FindFirstChild("Spawn")
        if spawn then
            centerPos = spawn.Position + Vector3.new(0, 5, 0)
        end
        
        StarterGui:SetCore("SendNotification", {
            Title = "🪵 LOG TELEPORT",
            Text = "All logs teleporting to center!",
            Icon = IconID,
            Duration = 3
        })
        
        LogTeleportConnection = RunService.Heartbeat:Connect(function()
            -- Teleport all logs to center
            for _, obj in pairs(workspace:GetDescendants()) do
                if obj.Name:lower():find("log") or 
                   obj.Name:lower():find("wood") or 
                   obj.Name:lower():find("timber") or
                   obj.Name:lower():find("plank") or
                   obj.Name:lower():find("tree") then
                    
                    if obj:IsA("BasePart") and not obj.Anchored then
                        -- Teleport log to center with random offset
                        obj.CFrame = CFrame.new(
                            centerPos.X + math.random(-20, 20),
                            centerPos.Y + math.random(0, 10),
                            centerPos.Z + math.random(-20, 20)
                        )
                        obj.Velocity = Vector3.new(0, 0, 0)
                        obj.RotVelocity = Vector3.new(0, 0, 0)
                        
                        -- Make it easier to collect
                        obj.CanCollide = false
                        
                    elseif obj:IsA("Model") then
                        local primaryPart = obj.PrimaryPart or obj:FindFirstChildWhichIsA("BasePart")
                        if primaryPart and not primaryPart.Anchored then
                            obj:SetPrimaryPartCFrame(CFrame.new(
                                centerPos.X + math.random(-20, 20),
                                centerPos.Y + math.random(0, 10),
                                centerPos.Z + math.random(-20, 20)
                            ))
                            
                            -- Stop movement
                            for _, part in pairs(obj:GetDescendants()) do
                                if part:IsA("BasePart") then
                                    part.Velocity = Vector3.new(0, 0, 0)
                                    part.RotVelocity = Vector3.new(0, 0, 0)
                                    part.CanCollide = false
                                end
                            end
                        end
                    end
                end
            end
            wait(0.5) -- Update every 0.5 seconds
        end)
    else
        LogButton.Text = "🪵 LOG TELEPORT\nTất cả log/gỗ tốc biến giữa map"
        LogButton.BackgroundColor3 = Color3.fromRGB(139, 69, 19)
        
        if LogTeleportConnection then
            LogTeleportConnection:Disconnect()
        end
        
        -- Re-enable collision
        for _, obj in pairs(workspace:GetDescendants()) do
            if obj.Name:lower():find("log") or obj.Name:lower():find("wood") then
                if obj:IsA("BasePart") then
                    obj.CanCollide = true
                end
            end
        end
    end
end)

-- Item Teleport Button
local ItemButton = Instance.new("TextButton")
ItemButton.BackgroundColor3 = Color3.fromRGB(200, 150, 100)
ItemButton.Position = UDim2.new(0.5, -150, 0, 230)
ItemButton.Size = UDim2.new(0, 300, 0, 80)
ItemButton.Font = Enum.Font.GothamBold
ItemButton.Text = "📦 ITEM TELEPORT\nTất cả items tốc biến đến bạn"
ItemButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ItemButton.TextSize = 16
ItemButton.Parent = TeleportFrame

local ItemCorner = Instance.new("UICorner")
ItemCorner.CornerRadius = UDim.new(0, 15)
ItemCorner.Parent = ItemButton

-- Item Teleport Function
local ItemTeleportConnection
ItemButton.MouseButton1Click:Connect(function()
    ItemTeleportEnabled = not ItemTeleportEnabled
    
    if ItemTeleportEnabled then
        ItemButton.Text = "⏹️ STOP ITEM TELEPORT"
        ItemButton.BackgroundColor3 = Color3.fromRGB(100, 255, 100)
        
        ItemTeleportConnection = RunService.Heartbeat:Connect(function()
            if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                local rootPart = LocalPlayer.Character.HumanoidRootPart
                
                for _, item in pairs(workspace:GetDescendants()) do
                    if item:IsA("Tool") or 
                       item.Name:lower():find("coin") or 
                       item.Name:lower():find("gem") or
                       item.Name:lower():find("item") or
                       item.Name:lower():find("drop") then
                        
                        if item:IsA("Tool") and item.Parent == workspace then
                            if item:FindFirstChild("Handle") then
                                item.Handle.CFrame = rootPart.CFrame + Vector3.new(
                                    math.random(-5, 5), 2, math.random(-5, 5)
                                )
                            end
                        elseif item:IsA("BasePart") then
                            item.CFrame = rootPart.CFrame + Vector3.new(
                                math.random(-3, 3), 2, math.random(-3, 3)
                            )
                            item.Velocity = Vector3.new(0, 0, 0)
                        end
                    end
                end
            end
            wait(0.1)
        end)
    else
        ItemButton.Text = "📦 ITEM TELEPORT\nTất cả items tốc biến đến bạn"
        ItemButton.BackgroundColor3 = Color3.fromRGB(200, 150, 100)
        
        if ItemTeleportConnection then
            ItemTeleportConnection:Disconnect()
        end
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

local originalLighting = {
    Brightness = Lighting.Brightness,
    ClockTime = Lighting.ClockTime,
    FogEnd = Lighting.FogEnd,
    Ambient = Lighting.Ambient,
    OutdoorAmbient = Lighting.OutdoorAmbient,
    GlobalShadows = Lighting.GlobalShadows
}

LightButton.MouseButton1Click:Connect(function()
    AutoBrightEnabled = not AutoBrightEnabled
    
    if AutoBrightEnabled then
        LightButton.Text = "🌙 NORMAL MODE"
        LightButton.BackgroundColor3 = Color3.fromRGB(100, 100, 150)
        
        Lighting.Brightness = 10
        Lighting.ClockTime = 12
        Lighting.FogEnd = 100000
        Lighting.GlobalShadows = false
        Lighting.Ambient = Color3.fromRGB(255, 255, 255)
        Lighting.OutdoorAmbient = Color3.fromRGB(255, 255, 255)
        
        for _, effect in pairs(Lighting:GetChildren()) do
            if effect:IsA("PostEffect") then
                effect.Enabled = false
            end
        end
    else
        LightButton.Text = "☀️ ULTRA BRIGHT MODE\nXóa tối - Làm sáng cực mạnh"
        LightButton.BackgroundColor3 = Color3.fromRGB(255, 200, 50)
        
        Lighting.Brightness = originalLighting.Brightness
        Lighting.ClockTime = originalLighting.ClockTime
        Lighting.FogEnd = originalLighting.FogEnd
        Lighting.Ambient = originalLighting.Ambient
        Lighting.OutdoorAmbient = originalLighting.OutdoorAmbient
        Lighting.GlobalShadows = originalLighting.GlobalShadows
    end
end)

-- Tab visibility
spawn(function()
    while true do
        ViewFrame.Visible = CurrentTab == "View"
        CombatFrame.Visible = CurrentTab == "Combat"
        TeleportFrame.Visible = CurrentTab == "Teleport"
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
            Size = UDim2.new(0, 550, 0, 600),
            Position = UDim2.new(0.5, -275, 0.5, -300)
        }):Play()
        
        StarterGui:SetCore("SendNotification", {
            Title = "🐵 KHỈ CAM SCRIPT",
            Text = "ULTIMATE VERSION LOADED!",
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

-- Character respawn handler
LocalPlayer.CharacterAdded:Connect(function(newChar)
    Character = newChar
    wait(1)
    
    -- Reset active features
    if ItemTeleportEnabled then
        ItemTeleportEnabled = false
        if ItemTeleportConnection then
            ItemTeleportConnection:Disconnect()
        end
    end
    
    if LogTeleportEnabled then
        LogTeleportEnabled = false
        if LogTeleportConnection then
            LogTeleportConnection:Disconnect()
        end
    end
end)

-- Initial notification
StarterGui:SetCore("SendNotification", {
    Title = "🐵 KHỈ CAM SCRIPT [DEMO]",
    Text = "Ultimate Version with Log Teleport!",
    Icon = IconID,
    Duration = 5
})

print("🐵 Khỉ Cam Script Ultimate - Loaded with Small Tree & Log Teleport!")