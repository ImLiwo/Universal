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

    local DupeCheck = function(plr)
        if ScreenGui:FindFirstChild(plr.Name) then
            ScreenGui[plr.Name]:Destroy()
        end
    end

    local ESP_Function = function(plr)
        if not ESP.Enabled then return end
        coroutine.wrap(DupeCheck)(plr)
        
        local Name = Functions:Create("TextLabel", {Parent = ScreenGui, Position = UDim2.new(0.5, 0, 0, -11), Size = UDim2.new(0, 100, 0, 20), AnchorPoint = Vector2.new(0.5, 0.5), BackgroundTransparency = 1, TextColor3 = Color3.fromRGB(255, 255, 255), Font = Enum.Font.Code, TextSize = ESP.FontSize, TextStrokeTransparency = 0, TextStrokeColor3 = Color3.fromRGB(0, 0, 0), RichText = true})
        local Distance = Functions:Create("TextLabel", {Parent = ScreenGui, Position = UDim2.new(0.5, 0, 0, 11), Size = UDim2.new(0, 100, 0, 20), AnchorPoint = Vector2.new(0.5, 0.5), BackgroundTransparency = 1, TextColor3 = Color3.fromRGB(255, 255, 255), Font = Enum.Font.Code, TextSize = ESP.FontSize, TextStrokeTransparency = 0, TextStrokeColor3 = Color3.fromRGB(0, 0, 0), RichText = true})
        local Box = Functions:Create("Frame", {Parent = ScreenGui, BackgroundColor3 = Color3.fromRGB(0, 0, 0), BackgroundTransparency = 0.75, BorderSizePixel = 0})
        local Outline = Functions:Create("UIStroke", {Parent = Box, Enabled = ESP.Drawing.Boxes.Gradient, Transparency = 0, Color = Color3.fromRGB(255, 255, 255), LineJoinMode = Enum.LineJoinMode.Miter})
        local Healthbar = Functions:Create("Frame", {Parent = ScreenGui, BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 0})
        local BehindHealthbar = Functions:Create("Frame", {Parent = ScreenGui, ZIndex = -1, BackgroundColor3 = Color3.fromRGB(0, 0, 0), BackgroundTransparency = 0})
        local Chams = Functions:Create("Highlight", {Parent = ScreenGui, FillTransparency = 1, OutlineTransparency = 0, OutlineColor = Color3.fromRGB(119, 120, 255), DepthMode = "AlwaysOnTop"})
        
        -- Corner box elements
        local LeftTop = Functions:Create("Frame", {Parent = ScreenGui, BackgroundColor3 = ESP.Drawing.Boxes.Corner.RGB, Position = UDim2.new(0, 0, 0, 0)})
        local LeftSide = Functions:Create("Frame", {Parent = ScreenGui, BackgroundColor3 = ESP.Drawing.Boxes.Corner.RGB, Position = UDim2.new(0, 0, 0, 0)})
        local RightTop = Functions:Create("Frame", {Parent = ScreenGui, BackgroundColor3 = ESP.Drawing.Boxes.Corner.RGB, Position = UDim2.new(0, 0, 0, 0)})
        local RightSide = Functions:Create("Frame", {Parent = ScreenGui, BackgroundColor3 = ESP.Drawing.Boxes.Corner.RGB, Position = UDim2.new(0, 0, 0, 0)})
        local BottomSide = Functions:Create("Frame", {Parent = ScreenGui, BackgroundColor3 = ESP.Drawing.Boxes.Corner.RGB, Position = UDim2.new(0, 0, 0, 0)})
        local BottomDown = Functions:Create("Frame", {Parent = ScreenGui, BackgroundColor3 = ESP.Drawing.Boxes.Corner.RGB, Position = UDim2.new(0, 0, 0, 0)})
        local BottomRightSide = Functions:Create("Frame", {Parent = ScreenGui, BackgroundColor3 = ESP.Drawing.Boxes.Corner.RGB, Position = UDim2.new(0, 0, 0, 0)})
        local BottomRightDown = Functions:Create("Frame", {Parent = ScreenGui, BackgroundColor3 = ESP.Drawing.Boxes.Corner.RGB, Position = UDim2.new(0, 0, 0, 0)})

        local Updater = function()
            local Connection
            local function HideESP()
                Box.Visible = false
                Name.Visible = false
                Distance.Visible = false
                Healthbar.Visible = false
                BehindHealthbar.Visible = false
                LeftTop.Visible = false
                LeftSide.Visible = false
                BottomSide.Visible = false
                BottomDown.Visible = false
                RightTop.Visible = false
                RightSide.Visible = false
                BottomRightSide.Visible = false
                BottomRightDown.Visible = false
                Chams.Enabled = false
                if not plr then
                    ScreenGui:Destroy()
                    Connection:Disconnect()
                end
            end

            Connection = Euphoria.RunService.RenderStepped:Connect(function()
                if not ESP.Enabled then
                    HideESP()
                    return
                end
                
                if plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
                    local HRP = plr.Character.HumanoidRootPart
                    local Humanoid = plr.Character:WaitForChild("Humanoid")
                    local Pos, OnScreen = Cam:WorldToScreenPoint(HRP.Position)
                    local Dist = (Cam.CFrame.Position - HRP.Position).Magnitude / 3.5714285714
                    
                    if OnScreen and Dist <= ESP.MaxDistance then
                        local Size = HRP.Size.Y
                        local scaleFactor = (Size * Cam.ViewportSize.Y) / (Pos.Z * 2)
                        local w, h = 3 * scaleFactor, 4.5 * scaleFactor

                        -- Fade-out effect
                        if ESP.FadeOut.OnDistance then
                            Functions:FadeOutOnDist(Box, Dist)
                            Functions:FadeOutOnDist(Outline, Dist)
                            Functions:FadeOutOnDist(Name, Dist)
                            Functions:FadeOutOnDist(Distance, Dist)
                            Functions:FadeOutOnDist(Healthbar, Dist)
                            Functions:FadeOutOnDist(BehindHealthbar, Dist)
                            Functions:FadeOutOnDist(Chams, Dist)
                        end

                        -- Team/Enemy Check
                        if ESP.TeamCheck and plr ~= lplayer and ((lplayer.Team ~= plr.Team and plr.Team) or (not lplayer.Team and not plr.Team)) and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") and plr.Character:FindFirstChild("Humanoid") then

                            -- Chams
                            if ESP.Drawing.Chams.Enabled then
                                Chams.Adornee = plr.Character
                                Chams.Enabled = true
                                Chams.FillColor = ESP.Drawing.Chams.FillRGB
                                Chams.OutlineColor = ESP.Drawing.Chams.OutlineRGB
                                
                                if ESP.Drawing.Chams.Thermal then
                                    local breathe_effect = math.atan(math.sin(tick() * 2)) * 2 / math.pi
                                    Chams.FillTransparency = ESP.Drawing.Chams.Fill_Transparency * breathe_effect * 0.01
                                    Chams.OutlineTransparency = ESP.Drawing.Chams.Outline_Transparency * breathe_effect * 0.01
                                end
                            end

                            -- Boxes
                            if ESP.Drawing.Boxes.Full.Enabled then
                                Box.Position = UDim2.new(0, Pos.X - w / 2, 0, Pos.Y - h / 2)
                                Box.Size = UDim2.new(0, w, 0, h)
                                Box.Visible = true
                            end

                            -- Corner Boxes
                            if ESP.Drawing.Boxes.Corner.Enabled then
                                LeftTop.Visible = true
                                LeftTop.Position = UDim2.new(0, Pos.X - w / 2, 0, Pos.Y - h / 2)
                                LeftTop.Size = UDim2.new(0, w / 5, 0, 1)
                                
                                LeftSide.Visible = true
                                LeftSide.Position = UDim2.new(0, Pos.X - w / 2, 0, Pos.Y - h / 2)
                                LeftSide.Size = UDim2.new(0, 1, 0, h / 5)
                            end

                            -- Health Bar
                            if ESP.Drawing.Healthbar.Enabled then
                                local health = Humanoid.Health / Humanoid.MaxHealth
                                Healthbar.Visible = true
                                Healthbar.Position = UDim2.new(0, Pos.X - w / 2 - 6, 0, Pos.Y - h / 2 + h * (1 - health))
                                Healthbar.Size = UDim2.new(0, ESP.Drawing.Healthbar.Width, 0, h * health)
                                
                                BehindHealthbar.Visible = true
                                BehindHealthbar.Position = UDim2.new(0, Pos.X - w / 2 - 6, 0, Pos.Y - h / 2)
                                BehindHealthbar.Size = UDim2.new(0, ESP.Drawing.Healthbar.Width, 0, h)
                            end

                            -- Names
                            if ESP.Drawing.Names.Enabled then
                                Name.Visible = true
                                if ESP.Options.Friendcheck and lplayer:IsFriendsWith(plr.UserId) then
                                    Name.Text = string.format('(<font color="rgb(%d, %d, %d)">F</font>) %s', ESP.Options.FriendcheckRGB.R * 255, ESP.Options.FriendcheckRGB.G * 255, ESP.Options.FriendcheckRGB.B * 255, plr.Name)
                                else
                                    Name.Text = string.format('(<font color="rgb(%d, %d, %d)">E</font>) %s', 255, 0, 0, plr.Name)
                                end
                                Name.Position = UDim2.new(0, Pos.X, 0, Pos.Y - h / 2 - 9)
                            end
                            
                            -- Distance
                            if ESP.Drawing.Distances.Enabled then
                                Distance.Position = UDim2.new(0, Pos.X, 0, Pos.Y + h / 2 + 7)
                                Distance.Text = string.format("%d meters", math.floor(Dist))
                                Distance.Visible = true
                            end
                        else
                            HideESP()
                        end
                    else
                        HideESP()
                    end
                else
                    HideESP()
                end
            end)
        end
        coroutine.wrap(Updater)()
    end

    -- Update ESP for all players
    for _, v in pairs(Players:GetPlayers()) do
        if v.Name ~= lplayer.Name then
            coroutine.wrap(ESP_Function)(v)
        end
    end

    Players.PlayerAdded:Connect(function(v)
        coroutine.wrap(ESP_Function)(v)
    end)
end
