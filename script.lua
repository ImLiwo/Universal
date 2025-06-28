local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Jxereas/UI-Libraries/main/cerberus.lua"))()

local window = Library.new("Liwo.exe - Universal") -- Args(<string> Name, <boolean?> ConstrainToScreen, <number?> Width, <number?> Height, <string?> VisibilityToggleKey)

window:LockScreenBoundaries(true) -- Args(<boolean> ConstrainToScreen)

local tab = window:Tab("Legit") -- Args(<string> Name, <string?> TabImage)

-- AIMBOT SECTION
local aimbotSection = tab:Section("Aimbot")

local enableAimbot = aimbotSection:Toggle("Enable Aimbot", function(bool)
    print("Aimbot enabled: "..tostring(bool))
end)

aimbotSection:Slider("Aimbot FOV", function(val)
    print("Aimbot FOV: "..val)
end, 180, 10) -- Max: 180, Min: 10

aimbotSection:Slider("Aimbot Smoothness", function(val)
    print("Aimbot Smoothness: "..val)
end, 20, 1) -- Max: 20, Min: 1

local targetPart = aimbotSection:Dropdown("Target Part")
targetPart:Toggle("Head")
targetPart:Toggle("Torso") 
targetPart:Toggle("Random")

aimbotSection:Keybind("Aimbot Key", function()
    print("Aimbot key pressed!")
end, "LeftShift")

-- TRIGGERBOT SECTION
local triggerbotSection = tab:Section("Triggerbot")

local enableTriggerbot = triggerbotSection:Toggle("Enable Triggerbot", function(bool)
    print("Triggerbot enabled: "..tostring(bool))
end)

triggerbotSection:Slider("Trigger Delay (ms)", function(val)
    print("Trigger Delay: "..val.."ms")
end, 500, 0) -- Max: 500ms, Min: 0ms

triggerbotSection:Slider("Trigger FOV", function(val)
    print("Trigger FOV: "..val)
end, 90, 5) -- Max: 90, Min: 5

triggerbotSection:Keybind("Triggerbot Key", function()
    print("Triggerbot key pressed!")
end, "RightControl")

-- SAFETY FEATURES SECTION
local safetySection = tab:Section("Safety Features")

safetySection:Toggle("Team Check", function(bool)
    print("Team Check: "..tostring(bool))
end)

safetySection:Toggle("Whitelist Friends", function(bool)
    print("Whitelist Friends: "..tostring(bool))
end)

safetySection:Toggle("Visibility Check", function(bool)
    print("Visibility Check: "..tostring(bool))
end)

safetySection:Slider("Max Distance", function(val)
    print("Max Distance: "..val)
end, 1000, 50) -- Max: 1000, Min: 50

safetySection:Toggle("Humanize", function(bool)
    print("Humanize: "..tostring(bool))
end)

-- VISUAL HELPERS SECTION  
local visualSection = tab:Section("Visual Helpers")

visualSection:Toggle("FOV Circle", function(bool)
    print("FOV Circle: "..tostring(bool))
end)

visualSection:ColorWheel("FOV Color", function(color)
    print("FOV Color: "..tostring(color))
end)

visualSection:Toggle("Target ESP", function(bool)
    print("Target ESP: "..tostring(bool))
end)

-- VISUAL TAB WITH ADVANCED ESP SYSTEM
local visualTab = window:Tab("Visual")

-- Advanced ESP System
local Workspace, RunService, Players, CoreGui, Lighting = cloneref(game:GetService("Workspace")), cloneref(game:GetService("RunService")), cloneref(game:GetService("Players")), game:GetService("CoreGui"), cloneref(game:GetService("Lighting"))

local ESP = {
    Enabled = false,
    TeamCheck = true,
    MaxDistance = 200,
    FontSize = 11,
    FadeOut = {
        OnDistance = true,
        OnDeath = false,
        OnLeave = false,
    },
    Options = { 
        Teamcheck = false, TeamcheckRGB = Color3.fromRGB(0, 255, 0),
        Friendcheck = true, FriendcheckRGB = Color3.fromRGB(0, 255, 0),
        Highlight = false, HighlightRGB = Color3.fromRGB(255, 0, 0),
    },
    Drawing = {
        Chams = {
            Enabled  = false,
            Thermal = true,
            FillRGB = Color3.fromRGB(119, 120, 255),
            Fill_Transparency = 100,
            OutlineRGB = Color3.fromRGB(119, 120, 255),
            Outline_Transparency = 100,
            VisibleCheck = true,
        },
        Names = {
            Enabled = false,
            RGB = Color3.fromRGB(255, 255, 255),
        },
        Flags = {
            Enabled = false,
        },
        Distances = {
            Enabled = false, 
            Position = "Text",
            RGB = Color3.fromRGB(255, 255, 255),
        },
        Weapons = {
            Enabled = false, WeaponTextRGB = Color3.fromRGB(119, 120, 255),
            Outlined = false,
            Gradient = false,
            GradientRGB1 = Color3.fromRGB(255, 255, 255), GradientRGB2 = Color3.fromRGB(119, 120, 255),
        },
        Healthbar = {
            Enabled = false,  
            HealthText = true, Lerp = false, HealthTextRGB = Color3.fromRGB(119, 120, 255),
            Width = 2.5,
            Gradient = true, GradientRGB1 = Color3.fromRGB(200, 0, 0), GradientRGB2 = Color3.fromRGB(60, 60, 125), GradientRGB3 = Color3.fromRGB(119, 120, 255), 
        },
        Boxes = {
            Animate = true,
            RotationSpeed = 300,
            Gradient = false, GradientRGB1 = Color3.fromRGB(119, 120, 255), GradientRGB2 = Color3.fromRGB(0, 0, 0), 
            GradientFill = true, GradientFillRGB1 = Color3.fromRGB(119, 120, 255), GradientFillRGB2 = Color3.fromRGB(0, 0, 0), 
            Filled = {
                Enabled = false,
                Transparency = 0.75,
                RGB = Color3.fromRGB(0, 0, 0),
            },
            Full = {
                Enabled = false,
                RGB = Color3.fromRGB(255, 255, 255),
            },
            Corner = {
                Enabled = false,
                RGB = Color3.fromRGB(255, 255, 255),
            },
        };
    };
    Connections = {
        RunService = RunService;
    };
    Fonts = {};
}

-- ESP Controls Section
local espControlsSection = visualTab:Section("ESP Controls")

espControlsSection:Toggle("Enable ESP", function(bool)
    ESP.Enabled = bool
end)

espControlsSection:Toggle("Team Check", function(bool)
    ESP.TeamCheck = bool
end)

espControlsSection:Slider("Max Distance", function(val)
    ESP.MaxDistance = val
end, 500, 50)

espControlsSection:Slider("Font Size", function(val)
    ESP.FontSize = val
end, 20, 8)

-- ESP Features Section
local espFeaturesSection = visualTab:Section("ESP Features")

espFeaturesSection:Toggle("Chams", function(bool)
    ESP.Drawing.Chams.Enabled = bool
end)

espFeaturesSection:Toggle("Names", function(bool)
    ESP.Drawing.Names.Enabled = bool
end)

espFeaturesSection:Toggle("Health Bar", function(bool)
    ESP.Drawing.Healthbar.Enabled = bool
end)

espFeaturesSection:Toggle("Distance", function(bool)
    ESP.Drawing.Distances.Enabled = bool
end)

espFeaturesSection:Toggle("Weapons", function(bool)
    ESP.Drawing.Weapons.Enabled = bool
end)

espFeaturesSection:Toggle("Boxes", function(bool)
    ESP.Drawing.Boxes.Full.Enabled = bool
end)

espFeaturesSection:Toggle("Corner Boxes", function(bool)
    ESP.Drawing.Boxes.Corner.Enabled = bool
end)

-- ESP Customization Section
local espCustomSection = visualTab:Section("ESP Customization")

espCustomSection:Toggle("Thermal Breathing", function(bool)
    ESP.Drawing.Chams.Thermal = bool
end)

espCustomSection:Toggle("Fade on Distance", function(bool)
    ESP.FadeOut.OnDistance = bool
end)

espCustomSection:Toggle("Friend Check", function(bool)
    ESP.Options.Friendcheck = bool
end)

espCustomSection:Toggle("Animated Boxes", function(bool)
    ESP.Drawing.Boxes.Animate = bool
end)

espCustomSection:Slider("Box Rotation Speed", function(val)
    ESP.Drawing.Boxes.RotationSpeed = val
end, 1000, 50)

-- ESP Colors Section
local espColorsSection = visualTab:Section("ESP Colors")

espColorsSection:ColorWheel("Chams Fill Color", function(color)
    ESP.Drawing.Chams.FillRGB = color
end)

espColorsSection:ColorWheel("Chams Outline Color", function(color)
    ESP.Drawing.Chams.OutlineRGB = color
end)

espColorsSection:ColorWheel("Name Color", function(color)
    ESP.Drawing.Names.RGB = color
end)

espColorsSection:ColorWheel("Box Color", function(color)
    ESP.Drawing.Boxes.Full.RGB = color
    ESP.Drawing.Boxes.Corner.RGB = color
end)

espColorsSection:ColorWheel("Friend Color", function(color)
    ESP.Options.FriendcheckRGB = color
end)

-- Weapon Images
local Weapon_Icons = {
    ["Wooden Bow"] = "http://www.roblox.com/asset/?id=17677465400",
    ["Crossbow"] = "http://www.roblox.com/asset/?id=17677473017",
    ["Salvaged SMG"] = "http://www.roblox.com/asset/?id=17677463033",
    ["Salvaged AK47"] = "http://www.roblox.com/asset/?id=17677455113",
    ["Salvaged AK74u"] = "http://www.roblox.com/asset/?id=17677442346",
    ["Salvaged M14"] = "http://www.roblox.com/asset/?id=17677444642",
    ["Salvaged Python"] = "http://www.roblox.com/asset/?id=17677451737",
    ["Military PKM"] = "http://www.roblox.com/asset/?id=17677449448",
    ["Military M4A1"] = "http://www.roblox.com/asset/?id=17677479536",
    ["Bruno's M4A1"] = "http://www.roblox.com/asset/?id=17677471185",
    ["Military Barrett"] = "http://www.roblox.com/asset/?id=17677482998",
    ["Salvaged Skorpion"] = "http://www.roblox.com/asset/?id=17677459658",
    ["Salvaged Pump Action"] = "http://www.roblox.com/asset/?id=17677457186",
    ["Military AA12"] = "http://www.roblox.com/asset/?id=17677475227",
    ["Salvaged Break Action"] = "http://www.roblox.com/asset/?id=17677468751",
    ["Salvaged Pipe Rifle"] = "http://www.roblox.com/asset/?id=17677468751",
    ["Salvaged P250"] = "http://www.roblox.com/asset/?id=17677447257",
    ["Nail Gun"] = "http://www.roblox.com/asset/?id=17677484756"
}

-- Def & Vars
local Euphoria = ESP.Connections
local lplayer = Players.LocalPlayer
local camera = game.Workspace.CurrentCamera
local Cam = Workspace.CurrentCamera
local RotationAngle, Tick = -45, tick()

-- Functions
local Functions = {}
do
    function Functions:Create(Class, Properties)
        local _Instance = typeof(Class) == 'string' and Instance.new(Class) or Class
        for Property, Value in pairs(Properties) do
            _Instance[Property] = Value
        end
        return _Instance
    end
    
    function Functions:FadeOutOnDist(element, distance)
        local transparency = math.max(0.1, 1 - (distance / ESP.MaxDistance))
        if element:IsA("TextLabel") then
            element.TextTransparency = 1 - transparency
        elseif element:IsA("ImageLabel") then
            element.ImageTransparency = 1 - transparency
        elseif element:IsA("UIStroke") then
            element.Transparency = 1 - transparency
        elseif element:IsA("Frame") and (element == Healthbar or element == BehindHealthbar) then
            element.BackgroundTransparency = 1 - transparency
        elseif element:IsA("Frame") then
            element.BackgroundTransparency = 1 - transparency
        elseif element:IsA("Highlight") then
            element.FillTransparency = 1 - transparency
            element.OutlineTransparency = 1 - transparency
        end
    end
end

-- Initialize ESP System
do
    local ScreenGui = Functions:Create("ScreenGui", {
        Parent = CoreGui,
        Name = "ESPHolder",
    })

    local ESPObjects = {}

    local function ESP_Function(plr)
        if plr == lplayer then return end
        
        -- Clean up existing ESP for this player
        if ESPObjects[plr] then
            for _, obj in pairs(ESPObjects[plr]) do
                if obj and obj.Destroy then
                    obj:Destroy()
                end
            end
        end
        
        -- Create ESP elements for this player
        local espElements = {}
        
        local Name = Functions:Create("TextLabel", {
            Parent = ScreenGui, 
            Name = plr.Name .. "_Name",
            Position = UDim2.new(0, 0, 0, 0), 
            Size = UDim2.new(0, 200, 0, 20), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            BackgroundTransparency = 1, 
            TextColor3 = ESP.Drawing.Names.RGB, 
            Font = Enum.Font.Code, 
            TextSize = ESP.FontSize, 
            TextStrokeTransparency = 0, 
            TextStrokeColor3 = Color3.fromRGB(0, 0, 0), 
            RichText = true,
            Visible = false
        })
        
        local Distance = Functions:Create("TextLabel", {
            Parent = ScreenGui, 
            Name = plr.Name .. "_Distance",
            Position = UDim2.new(0, 0, 0, 0), 
            Size = UDim2.new(0, 200, 0, 20), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            BackgroundTransparency = 1, 
            TextColor3 = ESP.Drawing.Distances.RGB, 
            Font = Enum.Font.Code, 
            TextSize = ESP.FontSize, 
            TextStrokeTransparency = 0, 
            TextStrokeColor3 = Color3.fromRGB(0, 0, 0),
            Visible = false
        })
        
        local Box = Functions:Create("Frame", {
            Parent = ScreenGui, 
            Name = plr.Name .. "_Box",
            BackgroundColor3 = ESP.Drawing.Boxes.Full.RGB, 
            BackgroundTransparency = 0.75, 
            BorderSizePixel = 0,
            Visible = false
        })
        
        local Outline = Functions:Create("UIStroke", {
            Parent = Box, 
            Transparency = 0, 
            Color = Color3.fromRGB(255, 255, 255), 
            LineJoinMode = Enum.LineJoinMode.Miter,
            Thickness = 1
        })
        
        local Healthbar = Functions:Create("Frame", {
            Parent = ScreenGui, 
            Name = plr.Name .. "_Health",
            BackgroundColor3 = Color3.fromRGB(0, 255, 0), 
            BorderSizePixel = 0,
            Visible = false
        })
        
        local HealthbarBG = Functions:Create("Frame", {
            Parent = ScreenGui, 
            Name = plr.Name .. "_HealthBG",
            BackgroundColor3 = Color3.fromRGB(255, 0, 0), 
            BorderSizePixel = 0,
            Visible = false
        })
        
        local Chams = Functions:Create("Highlight", {
            Parent = ScreenGui, 
            Name = plr.Name .. "_Chams",
            FillTransparency = 0.5, 
            OutlineTransparency = 0, 
            FillColor = ESP.Drawing.Chams.FillRGB,
            OutlineColor = ESP.Drawing.Chams.OutlineRGB, 
            DepthMode = "AlwaysOnTop",
            Enabled = false
        })
        
        -- Corner box elements
        local LeftTop = Functions:Create("Frame", {
            Parent = ScreenGui, 
            Name = plr.Name .. "_LeftTop",
            BackgroundColor3 = ESP.Drawing.Boxes.Corner.RGB, 
            BorderSizePixel = 0,
            Visible = false
        })
        
        local LeftSide = Functions:Create("Frame", {
            Parent = ScreenGui, 
            Name = plr.Name .. "_LeftSide",
            BackgroundColor3 = ESP.Drawing.Boxes.Corner.RGB, 
            BorderSizePixel = 0,
            Visible = false
        })
        
        local RightTop = Functions:Create("Frame", {
            Parent = ScreenGui, 
            Name = plr.Name .. "_RightTop",
            BackgroundColor3 = ESP.Drawing.Boxes.Corner.RGB, 
            BorderSizePixel = 0,
            Visible = false
        })
        
        local RightSide = Functions:Create("Frame", {
            Parent = ScreenGui, 
            Name = plr.Name .. "_RightSide",
            BackgroundColor3 = ESP.Drawing.Boxes.Corner.RGB, 
            BorderSizePixel = 0,
            Visible = false
        })
        
        local BottomSide = Functions:Create("Frame", {
            Parent = ScreenGui, 
            Name = plr.Name .. "_BottomSide",
            BackgroundColor3 = ESP.Drawing.Boxes.Corner.RGB, 
            BorderSizePixel = 0,
            Visible = false
        })
        
        local BottomDown = Functions:Create("Frame", {
            Parent = ScreenGui, 
            Name = plr.Name .. "_BottomDown",
            BackgroundColor3 = ESP.Drawing.Boxes.Corner.RGB, 
            BorderSizePixel = 0,
            Visible = false
        })
        
        local BottomRightSide = Functions:Create("Frame", {
            Parent = ScreenGui, 
            Name = plr.Name .. "_BottomRightSide",
            BackgroundColor3 = ESP.Drawing.Boxes.Corner.RGB, 
            BorderSizePixel = 0,
            Visible = false
        })
        
        local BottomRightDown = Functions:Create("Frame", {
            Parent = ScreenGui, 
            Name = plr.Name .. "_BottomRightDown",
            BackgroundColor3 = ESP.Drawing.Boxes.Corner.RGB, 
            BorderSizePixel = 0,
            Visible = false
        })
        
        espElements = {Name, Distance, Box, Healthbar, HealthbarBG, Chams, LeftTop, LeftSide, RightTop, RightSide, BottomSide, BottomDown, BottomRightSide, BottomRightDown}
        ESPObjects[plr] = espElements
        
        local function UpdateESP()
            local connection
            
            local function HideESP()
                for _, element in pairs(espElements) do
                    if element and element.Parent then
                        if element.ClassName == "Highlight" then
                            element.Enabled = false
                        else
                            element.Visible = false
                        end
                    end
                end
            end
            
            connection = RunService.RenderStepped:Connect(function()
                -- Check if ESP is enabled and player exists
                if not ESP.Enabled or not plr or not plr.Parent then
                    HideESP()
                    return
                end
                
                -- Check if player has character
                if not plr.Character or not plr.Character:FindFirstChild("HumanoidRootPart") or not plr.Character:FindFirstChild("Humanoid") then
                    HideESP()
                    return
                end
                
                local HRP = plr.Character.HumanoidRootPart
                local Humanoid = plr.Character.Humanoid
                local Pos, OnScreen = Cam:WorldToScreenPoint(HRP.Position)
                local Dist = (Cam.CFrame.Position - HRP.Position).Magnitude / 3.5714285714
                
                -- Check if player is on screen and within distance
                if not OnScreen or Dist > ESP.MaxDistance then
                    HideESP()
                    return
                end
                
                -- Team check - simplified logic
                local showESP = true
                if ESP.TeamCheck then
                    if lplayer.Team and plr.Team and lplayer.Team == plr.Team then
                        showESP = false
                    end
                end
                
                if not showESP then
                    HideESP()
                    return
                end
                
                -- Calculate ESP dimensions
                local Size = HRP.Size.Y
                local scaleFactor = (Size * Cam.ViewportSize.Y) / (Pos.Z * 2)
                local w, h = math.max(3 * scaleFactor, 4), math.max(4.5 * scaleFactor, 6)
                
                -- Update Chams
                if ESP.Drawing.Chams.Enabled and Chams then
                    Chams.Adornee = plr.Character
                    Chams.Enabled = true
                    Chams.FillColor = ESP.Drawing.Chams.FillRGB
                    Chams.OutlineColor = ESP.Drawing.Chams.OutlineRGB
                    
                    if ESP.Drawing.Chams.Thermal then
                        local breathe_effect = math.abs(math.sin(tick() * 2))
                        Chams.FillTransparency = 0.3 + (breathe_effect * 0.3)
                        Chams.OutlineTransparency = 0.1 + (breathe_effect * 0.2)
                    end
                else
                    if Chams then Chams.Enabled = false end
                end
                
                -- Update Boxes
                if ESP.Drawing.Boxes.Full.Enabled and Box then
                    Box.Position = UDim2.new(0, Pos.X - w / 2, 0, Pos.Y - h / 2)
                    Box.Size = UDim2.new(0, w, 0, h)
                    Box.Visible = true
                else
                    if Box then Box.Visible = false end
                end
                
                -- Update Corner Boxes
                if ESP.Drawing.Boxes.Corner.Enabled then
                    local cornerLength = math.max(w / 5, 8)
                    
                    -- Left Top Corner
                    if LeftTop then
                        LeftTop.Position = UDim2.new(0, Pos.X - w / 2, 0, Pos.Y - h / 2)
                        LeftTop.Size = UDim2.new(0, cornerLength, 0, 2)
                        LeftTop.BackgroundColor3 = ESP.Drawing.Boxes.Corner.RGB
                        LeftTop.Visible = true
                    end
                    
                    if LeftSide then
                        LeftSide.Position = UDim2.new(0, Pos.X - w / 2, 0, Pos.Y - h / 2)
                        LeftSide.Size = UDim2.new(0, 2, 0, cornerLength)
                        LeftSide.BackgroundColor3 = ESP.Drawing.Boxes.Corner.RGB
                        LeftSide.Visible = true
                    end
                    
                    -- Right Top Corner
                    if RightTop then
                        RightTop.Position = UDim2.new(0, Pos.X + w / 2 - cornerLength, 0, Pos.Y - h / 2)
                        RightTop.Size = UDim2.new(0, cornerLength, 0, 2)
                        RightTop.BackgroundColor3 = ESP.Drawing.Boxes.Corner.RGB
                        RightTop.Visible = true
                    end
                    
                    if RightSide then
                        RightSide.Position = UDim2.new(0, Pos.X + w / 2 - 2, 0, Pos.Y - h / 2)
                        RightSide.Size = UDim2.new(0, 2, 0, cornerLength)
                        RightSide.BackgroundColor3 = ESP.Drawing.Boxes.Corner.RGB
                        RightSide.Visible = true
                    end
                    
                    -- Bottom Left Corner
                    if BottomSide then
                        BottomSide.Position = UDim2.new(0, Pos.X - w / 2, 0, Pos.Y + h / 2 - cornerLength)
                        BottomSide.Size = UDim2.new(0, 2, 0, cornerLength)
                        BottomSide.BackgroundColor3 = ESP.Drawing.Boxes.Corner.RGB
                        BottomSide.Visible = true
                    end
                    
                    if BottomDown then
                        BottomDown.Position = UDim2.new(0, Pos.X - w / 2, 0, Pos.Y + h / 2 - 2)
                        BottomDown.Size = UDim2.new(0, cornerLength, 0, 2)
                        BottomDown.BackgroundColor3 = ESP.Drawing.Boxes.Corner.RGB
                        BottomDown.Visible = true
                    end
                    
                    -- Bottom Right Corner
                    if BottomRightSide then
                        BottomRightSide.Position = UDim2.new(0, Pos.X + w / 2 - 2, 0, Pos.Y + h / 2 - cornerLength)
                        BottomRightSide.Size = UDim2.new(0, 2, 0, cornerLength)
                        BottomRightSide.BackgroundColor3 = ESP.Drawing.Boxes.Corner.RGB
                        BottomRightSide.Visible = true
                    end
                    
                    if BottomRightDown then
                        BottomRightDown.Position = UDim2.new(0, Pos.X + w / 2 - cornerLength, 0, Pos.Y + h / 2 - 2)
                        BottomRightDown.Size = UDim2.new(0, cornerLength, 0, 2)
                        BottomRightDown.BackgroundColor3 = ESP.Drawing.Boxes.Corner.RGB
                        BottomRightDown.Visible = true
                    end
                else
                    -- Hide corner boxes when disabled
                    for _, cornerBox in pairs({LeftTop, LeftSide, RightTop, RightSide, BottomSide, BottomDown, BottomRightSide, BottomRightDown}) do
                        if cornerBox then cornerBox.Visible = false end
                    end
                end
                
                -- Update Health Bar
                if ESP.Drawing.Healthbar.Enabled and Healthbar and HealthbarBG then
                    local health = Humanoid.Health / Humanoid.MaxHealth
                    
                    HealthbarBG.Position = UDim2.new(0, Pos.X - w / 2 - 6, 0, Pos.Y - h / 2)
                    HealthbarBG.Size = UDim2.new(0, 3, 0, h)
                    HealthbarBG.Visible = true
                    
                    Healthbar.Position = UDim2.new(0, Pos.X - w / 2 - 6, 0, Pos.Y - h / 2 + h * (1 - health))
                    Healthbar.Size = UDim2.new(0, 3, 0, h * health)
                    Healthbar.Visible = true
                    
                    -- Color based on health
                    if health > 0.6 then
                        Healthbar.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
                    elseif health > 0.3 then
                        Healthbar.BackgroundColor3 = Color3.fromRGB(255, 255, 0)
                    else
                        Healthbar.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
                    end
                else
                    if Healthbar then Healthbar.Visible = false end
                    if HealthbarBG then HealthbarBG.Visible = false end
                end
                
                -- Update Names
                if ESP.Drawing.Names.Enabled and Name then
                    Name.Position = UDim2.new(0, Pos.X, 0, Pos.Y - h / 2 - 16)
                    if ESP.Options.Friendcheck and lplayer:IsFriendsWith(plr.UserId) then
                        Name.Text = string.format('<font color="rgb(0,255,0)">[F]</font> %s', plr.Name)
                    else
                        Name.Text = string.format('<font color="rgb(255,0,0)">[E]</font> %s', plr.Name)
                    end
                    Name.TextColor3 = ESP.Drawing.Names.RGB
                    Name.TextSize = ESP.FontSize
                    Name.Visible = true
                else
                    if Name then Name.Visible = false end
                end
                
                -- Update Distance
                if ESP.Drawing.Distances.Enabled and Distance then
                    Distance.Position = UDim2.new(0, Pos.X, 0, Pos.Y + h / 2 + 4)
                    Distance.Text = string.format("%d meters", math.floor(Dist))
                    Distance.TextColor3 = ESP.Drawing.Distances.RGB
                    Distance.TextSize = ESP.FontSize
                    Distance.Visible = true
                else
                    if Distance then Distance.Visible = false end
                end
                
                -- Apply distance fade
                if ESP.FadeOut.OnDistance then
                    local transparency = math.max(0.1, 1 - (Dist / ESP.MaxDistance))
                    for _, element in pairs({Name, Distance, Box, Healthbar, HealthbarBG, LeftTop, LeftSide, RightTop, RightSide, BottomSide, BottomDown, BottomRightSide, BottomRightDown}) do
                        if element and element.Visible then
                            if element.ClassName == "TextLabel" then
                                element.TextTransparency = 1 - transparency
                            elseif element.ClassName == "Frame" then
                                element.BackgroundTransparency = element == Box and (0.75 + (1 - transparency) * 0.25) or (1 - transparency)
                            end
                        end
                    end
                end
            end)
            
            -- Clean up connection when player leaves
            plr.AncestryChanged:Connect(function()
                if not plr.Parent then
                    connection:Disconnect()
                    if ESPObjects[plr] then
                        for _, obj in pairs(ESPObjects[plr]) do
                            if obj and obj.Destroy then
                                obj:Destroy()
                            end
                        end
                        ESPObjects[plr] = nil
                    end
                end
            end)
        end
        
        spawn(UpdateESP)
    end
    
    -- Initialize ESP for existing players
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= lplayer then
            ESP_Function(player)
        end
    end
    
    -- Initialize ESP for new players
    Players.PlayerAdded:Connect(ESP_Function)
    
    -- Clean up when players leave
    Players.PlayerRemoving:Connect(function(plr)
        if ESPObjects[plr] then
            for _, obj in pairs(ESPObjects[plr]) do
                if obj and obj.Destroy then
                    obj:Destroy()
                end
            end
            ESPObjects[plr] = nil
        end
    end)
end
