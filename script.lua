-- Services
local inputService = game:GetService("UserInputService")
local runService = game:GetService("RunService")
local players = game:GetService("Players")
local localPlayer = players.LocalPlayer
local mouse = localPlayer:GetMouse()

-- Tokyo Lib Setup
local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/drillygzzly/Roblox-UI-Libs/main/1%20Tokyo%20Lib%20(FIXED)/Tokyo%20Lib%20Source.lua"))({
    cheatname = "liwo.exe",
    gamename = "Universal Cheat",
})

library:init()

local Window = library.NewWindow({
    title = "liwo.exe | Universal Cheat",
    size = UDim2.new(0, 510, 0.6, 6)
})

-- Create main flags table for compatibility
local flags = {}

-- Notification function
local function notify(text)
    library:SendNotification(text, 3)
end

-- Create tabs
local LegitTab = Window:AddTab("  Legit  ")
local VisualsTab = Window:AddTab("  Visuals  ")
local PlayerTab = Window:AddTab("  Player  ")
local SettingsTab = library:CreateSettingsTab(Window)

-- Create sections
local AimbotSection = LegitTab:AddSection("Aimbot", 1)
local ESPMainSection = VisualsTab:AddSection("ESP Main", 1)
local ESPVisualsSection = VisualsTab:AddSection("ESP Visuals", 1)
local CharacterSection = PlayerTab:AddSection("Character", 1)

-- Aimbot Settings
AimbotSection:AddToggle({
    text = "Enable Aimbot",
    state = false,
    risky = false,
    tooltip = "Enable automatic aiming assistance",
    flag = "aimbot_enabled",
    callback = function(v)
        flags["aimbot_enabled"] = v
    end
}):AddBind({
    enabled = true,
    text = "Aimbot Toggle",
    tooltip = "Key to toggle aimbot on/off",
    mode = "toggle",
    bind = "F1",
    flag = "aimbot_toggle_key",
    state = false,
    nomouse = false,
    risky = false,
    noindicator = false,
    callback = function(v)
        flags["aimbot_toggle_key"] = v
    end,
    keycallback = function(v)
        if v then
            flags["aimbot_enabled"] = not flags["aimbot_enabled"]
        end
    end
})

AimbotSection:AddSlider({
    text = "FOV",
    min = 10,
    max = 500,
    increment = 1,
    suffix = "°",
    flag = "aimbot_fov",
    callback = function(v)
        flags["aimbot_fov"] = v
    end
}):SetValue(100)

AimbotSection:AddSlider({
    text = "Smoothness",
    min = 1,
    max = 50,
    increment = 1,
    flag = "aimbot_smooth",
    callback = function(v)
        flags["aimbot_smooth"] = v
    end
}):SetValue(10)

AimbotSection:AddList({
    text = "Target Part",
    values = {"Head", "HumanoidRootPart", "Torso"},
    flag = "aimbot_target",
    callback = function(v)
        flags["aimbot_target"] = v
    end
})

AimbotSection:AddToggle({
    text = "Team Check",
    state = false,
    risky = false,
    tooltip = "Don't target teammates",
    flag = "aimbot_teamcheck",
    callback = function(v)
        flags["aimbot_teamcheck"] = v
    end
})

AimbotSection:AddToggle({
    text = "Wall Check",
    state = true,
    risky = false,
    tooltip = "Don't target players behind walls",
    flag = "aimbot_wallcheck",
    callback = function(v)
        flags["aimbot_wallcheck"] = v
    end
})

AimbotSection:AddBind({
    enabled = true,
    text = "Aim Key",
    tooltip = "Key to activate aimbot",
    mode = "hold",
    bind = "MB2",
    flag = "aimbot_key",
    state = false,
    nomouse = false,
    risky = false,
    noindicator = false,
    callback = function(v)
        flags["aimbot_key"] = v
    end,
    keycallback = function(v)
        aiming = v
        print("Aim key state changed:", v and "PRESSED" or "RELEASED")
    end
})

-- ESP Settings
ESPMainSection:AddToggle({
    text = "Enable ESP",
    state = false,
    risky = false,
    tooltip = "Show player information through walls",
    flag = "esp_enabled",
    callback = function(v)
        flags["esp_enabled"] = v
    end
}):AddBind({
    enabled = true,
    text = "ESP Toggle",
    tooltip = "Key to toggle ESP on/off",
    mode = "toggle",
    bind = "Insert",
    flag = "esp_key",
    state = false,
    nomouse = false,
    risky = false,
    noindicator = false,
    callback = function(v)
        flags["esp_key"] = v
    end,
    keycallback = function(v)
        if v then
            flags["esp_enabled"] = not flags["esp_enabled"]
        end
    end
})

ESPMainSection:AddToggle({
    text = "Team Check",
    state = false,
    risky = false,
    tooltip = "Don't show ESP for teammates",
    flag = "esp_teamcheck",
    callback = function(v)
        flags["esp_teamcheck"] = v
    end
})

ESPMainSection:AddSlider({
    text = "Max Distance",
    min = 50,
    max = 1000,
    increment = 10,
    suffix = "m",
    flag = "esp_max_distance",
    callback = function(v)
        flags["esp_max_distance"] = v
    end
}):SetValue(200)

ESPMainSection:AddToggle({
    text = "Fade on Distance",
    state = false,
    risky = false,
    tooltip = "Fade ESP elements based on distance",
    flag = "esp_fade_distance",
    callback = function(v)
        flags["esp_fade_distance"] = v
    end
})

ESPVisualsSection:AddToggle({
    text = "Chams",
    state = false,
    risky = false,
    tooltip = "Highlight players through walls",
    flag = "esp_chams",
    callback = function(v)
        flags["esp_chams"] = v
    end
}):AddColor({
    enabled = true,
    text = "Chams Color",
    tooltip = "Change the color of chams",
    color = Color3.fromRGB(119, 120, 255),
    flag = "esp_chams_color",
    trans = 0.5,
    open = false,
    risky = false,
    callback = function(v)
        flags["esp_chams_color"] = v
    end
})

ESPVisualsSection:AddToggle({
    text = "Names",
    state = false,
    risky = false,
    tooltip = "Show player names",
    flag = "esp_names",
    callback = function(v)
        flags["esp_names"] = v
    end
}):AddColor({
    enabled = true,
    text = "Name Color",
    tooltip = "Change the color of player names",
    color = Color3.fromRGB(255, 255, 255),
    flag = "esp_names_color",
    trans = 0,
    open = false,
    risky = false,
    callback = function(v)
        flags["esp_names_color"] = v
    end
})

ESPVisualsSection:AddToggle({
    text = "Health Bar",
    state = false,
    risky = false,
    tooltip = "Show player health bars",
    flag = "esp_healthbar",
    callback = function(v)
        flags["esp_healthbar"] = v
    end
}):AddColor({
    enabled = true,
    text = "Health Color",
    tooltip = "Change the color of health bars",
    color = Color3.fromRGB(0, 255, 0),
    flag = "esp_health_color",
    trans = 0,
    open = false,
    risky = false,
    callback = function(v)
        flags["esp_health_color"] = v
    end
})

ESPVisualsSection:AddToggle({
    text = "Distance",
    state = false,
    risky = false,
    tooltip = "Show distance to players",
    flag = "esp_distance",
    callback = function(v)
        flags["esp_distance"] = v
    end
})

ESPVisualsSection:AddToggle({
    text = "Weapons",
    state = false,
    risky = false,
    tooltip = "Show player weapons",
    flag = "esp_weapons",
    callback = function(v)
        flags["esp_weapons"] = v
    end
})

ESPVisualsSection:AddToggle({
    text = "Box",
    state = false,
    risky = false,
    tooltip = "Draw boxes around players",
    flag = "esp_box",
    callback = function(v)
        flags["esp_box"] = v
    end
}):AddColor({
    enabled = true,
    text = "Box Color",
    tooltip = "Change the color of boxes",
    color = Color3.fromRGB(255, 255, 255),
    flag = "esp_box_color",
    trans = 0,
    open = false,
    risky = false,
    callback = function(v)
        flags["esp_box_color"] = v
    end
})

ESPVisualsSection:AddToggle({
    text = "Corner Box",
    state = false,
    risky = false,
    tooltip = "Show corner boxes around players",
    flag = "esp_corner_box",
    callback = function(v)
        flags["esp_corner_box"] = v
    end
})

-- Player Features
CharacterSection:AddSlider({
    text = "FOV",
    min = 70,
    max = 120,
    increment = 1,
    flag = "player_fov",
    callback = function(v)
        flags["player_fov"] = v
    end
}):SetValue(70)



CharacterSection:AddToggle({
    text = "Full Bright",
    state = false,
    risky = false,
    tooltip = "Remove darkness and shadows",
    flag = "player_fullbright",
    callback = function(v)
        flags["player_fullbright"] = v
    end
}):AddBind({
    enabled = true,
    text = "Full Bright Key",
    tooltip = "Key to toggle full bright",
    mode = "toggle",
    bind = "F2",
    flag = "fullbright_key",
    state = false,
    nomouse = false,
    risky = false,
    noindicator = false,
    callback = function(v)
        flags["fullbright_key"] = v
    end,
    keycallback = function(v)
        if v then
            flags["player_fullbright"] = not flags["player_fullbright"]
        end
    end
})

CharacterSection:AddBind({
    enabled = true,
    text = "Panic Key",
    tooltip = "Disable all features instantly",
    mode = "toggle",
    bind = "Delete",
    flag = "panic_key",
    state = false,
    nomouse = false,
    risky = true,
    noindicator = false,
    callback = function(v)
        flags["panic_key"] = v
    end,
    keycallback = function(v)
        if v then
            -- Disable all features
            flags["aimbot_enabled"] = false
            flags["esp_enabled"] = false
            flags["player_fullbright"] = false
            library:SendNotification("All features disabled!", 2)
        end
    end
})

-- Game Functions
local camera = workspace.CurrentCamera
local RunService = game:GetService("RunService")

-- Aimbot System
aiming = false  -- Make it global so Tokyo Lib can access it
local AimbotTarget = nil



-- FOV Circle
local fovCircle = Drawing.new("Circle")
local fovCircleOutline = Drawing.new("Circle")

fovCircle.Color = Color3.fromRGB(255, 255, 255)
fovCircle.Transparency = 0.3
fovCircle.Thickness = 2
fovCircle.Filled = false
fovCircle.Visible = false
fovCircle.NumSides = 60

fovCircleOutline.Color = Color3.fromRGB(0, 0, 0)
fovCircleOutline.Transparency = 0.5
fovCircleOutline.Thickness = 3
fovCircleOutline.Filled = false
fovCircleOutline.Visible = false
fovCircleOutline.NumSides = 60

-- Wall check function using raycast
local function CanSeeTarget(targetPart)
    if not flags["aimbot_wallcheck"] then return true end
    if not targetPart or not localPlayer.Character then return false end
    
    local origin = camera.CFrame.Position
    local targetPos = targetPart.Position
    local direction = (targetPos - origin)
    
    if direction.Magnitude == 0 then return false end
    
    local raycastParams = RaycastParams.new()
    raycastParams.FilterType = Enum.RaycastFilterType.Blacklist
    raycastParams.FilterDescendantsInstances = {localPlayer.Character, targetPart.Parent}
    raycastParams.IgnoreWater = true
    
    local result = workspace:Raycast(origin, direction, raycastParams)
    
    -- If no collision detected or hit is very close to target, consider it visible
    if not result then
        return true
    end
    
    local hitDistance = (result.Position - origin).Magnitude
    local targetDistance = (targetPos - origin).Magnitude
    
    -- Allow small margin for error (0.5 studs)
    return hitDistance >= (targetDistance - 0.5)
end

-- Get closest player function
local function GetClosestPlayer()
    if not flags["aimbot_enabled"] then return nil end
    
    local closestPlayer = nil
    local shortestDistance = math.huge
    local mousePos = inputService:GetMouseLocation()
    local fov = flags["aimbot_fov"] or 100
    
    for _, player in pairs(players:GetPlayers()) do
        if player ~= localPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            -- Team check
            local teamCheckPassed = true
            if flags["aimbot_teamcheck"] and localPlayer.Team and player.Team then
                teamCheckPassed = localPlayer.Team ~= player.Team
            end
            
            if teamCheckPassed then
                local targetPart = player.Character:FindFirstChild(flags["aimbot_target"] or "Head")
                if targetPart then
                    local screenPos, onScreen = camera:WorldToViewportPoint(targetPart.Position)
                    if onScreen then
                        -- Check if target is in FOV
                        local distance = (Vector2.new(screenPos.X, screenPos.Y) - mousePos).Magnitude
                        if distance < fov and distance < shortestDistance then
                            -- Wall check
                            if CanSeeTarget(targetPart) then
                                shortestDistance = distance
                                closestPlayer = player
                            end
                        end
                    end
                end
            end
        end
    end
    
    return closestPlayer
end

-- Aimbot loop
local aimConnection = RunService.RenderStepped:Connect(function()
    -- Update FOV circle
    if flags["aimbot_enabled"] then
        local mousePos = inputService:GetMouseLocation()
        local radius = flags["aimbot_fov"] or 100
        
        fovCircle.Position = mousePos
        fovCircle.Radius = radius
        fovCircle.Visible = true
        
        fovCircleOutline.Position = mousePos
        fovCircleOutline.Radius = radius
        fovCircleOutline.Visible = true
        
        -- Get target
        AimbotTarget = GetClosestPlayer()
        
        -- Change color when locked
        if AimbotTarget then
            fovCircle.Color = Color3.fromRGB(255, 150, 150)
            -- Debug: Print target found
            if not aiming then
                print("Target found:", AimbotTarget.Name, "- Hold aim key to lock on")
            end
        else
            fovCircle.Color = Color3.fromRGB(255, 255, 255)
        end
    else
        fovCircle.Visible = false
        fovCircleOutline.Visible = false
        AimbotTarget = nil
    end
    
    -- Debug aiming state
    if flags["aimbot_enabled"] and aiming and not AimbotTarget then
        print("Aiming but no target found - Check FOV or team settings")
    end
    
    -- Aimbot logic
    if flags["aimbot_enabled"] and aiming and AimbotTarget and AimbotTarget.Character then
        local targetPart = AimbotTarget.Character:FindFirstChild(flags["aimbot_target"] or "Head")
        if targetPart then
            local targetPos, onScreen = camera:WorldToViewportPoint(targetPart.Position)
            if onScreen then
                local mousePos = inputService:GetMouseLocation()
                local smoothness = math.max(1, flags["aimbot_smooth"] or 10)
                
                local moveX = (targetPos.X - mousePos.X) / smoothness
                local moveY = (targetPos.Y - mousePos.Y) / smoothness
                
                -- Debug movement
                print("Aimbot active - Target:", AimbotTarget.Name, "Move:", moveX, moveY)
                
                -- Try different mouse movement methods
                if mousemoverel then
                    mousemoverel(moveX, moveY)
                    print("Using mousemoverel")
                elseif game:GetService("VirtualInputManager") then
                    -- Alternative method for some executors
                    game:GetService("VirtualInputManager"):SendMouseMoveEvent(targetPos.X, targetPos.Y, game)
                    print("Using VirtualInputManager")
                else
                    print("No mouse movement method available!")
                end
            end
        end
    end
end)

-- Player Features System
local originalValues = {
    fov = 70
}



-- Player Features Loop
local playerConnection = RunService.Heartbeat:Connect(function()
    -- FOV
    if flags["player_fov"] and flags["player_fov"] ~= originalValues.fov then
        camera.FieldOfView = flags["player_fov"]
    else
        camera.FieldOfView = originalValues.fov
    end
    

    
    -- Full Bright
    if flags["player_fullbright"] then
        game:GetService("Lighting").Brightness = 2
        game:GetService("Lighting").ClockTime = 14
        game:GetService("Lighting").FogEnd = 100000
        game:GetService("Lighting").GlobalShadows = false
        game:GetService("Lighting").OutdoorAmbient = Color3.fromRGB(128, 128, 128)
    else
        game:GetService("Lighting").Brightness = 1
        game:GetService("Lighting").ClockTime = 12
        game:GetService("Lighting").FogEnd = 100000
        game:GetService("Lighting").GlobalShadows = true
        game:GetService("Lighting").OutdoorAmbient = Color3.fromRGB(70, 70, 70)
    end
end)



-- ESP System
local Workspace, RunService, CoreGui, Lighting = cloneref(game:GetService("Workspace")), cloneref(game:GetService("RunService")), game:GetService("CoreGui"), cloneref(game:GetService("Lighting"))

local ESP = {
    Enabled = true,
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
            Enabled  = true,
            Thermal = true,
            FillRGB = Color3.fromRGB(119, 120, 255),
            Fill_Transparency = 100,
            OutlineRGB = Color3.fromRGB(119, 120, 255),
            Outline_Transparency = 100,
            VisibleCheck = true,
        },
        Names = {
            Enabled = true,
            RGB = Color3.fromRGB(255, 255, 255),
        },
        Flags = {
            Enabled = true,
        },
        Distances = {
            Enabled = true, 
            Position = "Text",
            RGB = Color3.fromRGB(255, 255, 255),
        },
        Weapons = {
            Enabled = true, WeaponTextRGB = Color3.fromRGB(119, 120, 255),
            Outlined = false,
            Gradient = false,
            GradientRGB1 = Color3.fromRGB(255, 255, 255), GradientRGB2 = Color3.fromRGB(119, 120, 255),
        },
        Healthbar = {
            Enabled = true,  
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
                Enabled = true,
                Transparency = 0.75,
                RGB = Color3.fromRGB(0, 0, 0),
            },
            Full = {
                Enabled = true,
                RGB = Color3.fromRGB(255, 255, 255),
            },
            Corner = {
                Enabled = true,
                RGB = Color3.fromRGB(255, 255, 255),
            },
        };
    };
    Connections = {
        RunService = RunService;
    };
    Fonts = {};
}

-- Def & Vars
local Euphoria = ESP.Connections;
local lplayer = players.LocalPlayer;
local Cam = Workspace.CurrentCamera;
local RotationAngle, Tick = -45, tick();

-- Functions
local Functions = {}
do
    function Functions:Create(Class, Properties)
        local _Instance = typeof(Class) == 'string' and Instance.new(Class) or Class
        for Property, Value in pairs(Properties) do
            _Instance[Property] = Value
        end
        return _Instance;
    end
    --
    function Functions:FadeOutOnDist(element, distance)
        local transparency = math.max(0.1, 1 - (distance / ESP.MaxDistance))
        if element:IsA("TextLabel") then
            element.TextTransparency = 1 - transparency
        elseif element:IsA("ImageLabel") then
            element.ImageTransparency = 1 - transparency
        elseif element:IsA("UIStroke") then
            element.Transparency = 1 - transparency
        elseif element:IsA("Frame") and (element.Name == "Healthbar" or element.Name == "BehindHealthbar") then
            element.BackgroundTransparency = 1 - transparency
        elseif element:IsA("Frame") then
            element.BackgroundTransparency = 1 - transparency
        elseif element:IsA("Highlight") then
            element.FillTransparency = 1 - transparency
            element.OutlineTransparency = 1 - transparency
        end;
    end;  
end;

-- Update ESP settings from GUI flags
local function updateESPSettings()
    ESP.Enabled = flags["esp_enabled"] or false
    ESP.TeamCheck = flags["esp_teamcheck"] or false
    ESP.MaxDistance = flags["esp_max_distance"] or 200
    ESP.FadeOut.OnDistance = flags["esp_fade_distance"] or false
    
    ESP.Drawing.Chams.Enabled = flags["esp_chams"] or false
    ESP.Drawing.Names.Enabled = flags["esp_names"] or false
    ESP.Drawing.Healthbar.Enabled = flags["esp_healthbar"] or false
    ESP.Drawing.Distances.Enabled = flags["esp_distance"] or false
    ESP.Drawing.Weapons.Enabled = flags["esp_weapons"] or false
    ESP.Drawing.Boxes.Full.Enabled = flags["esp_box"] or false
    ESP.Drawing.Boxes.Corner.Enabled = flags["esp_corner_box"] or false
end

do -- Initialize ESP
    local ScreenGui = Functions:Create("ScreenGui", {
        Parent = CoreGui,
        Name = "ESPHolder",
    });

    local DupeCheck = function(plr)
        if ScreenGui:FindFirstChild(plr.Name) then
            ScreenGui[plr.Name]:Destroy()
        end
    end

    local ESPFunction = function(plr)
        coroutine.wrap(DupeCheck)(plr) -- Dupecheck
        local Name = Functions:Create("TextLabel", {Parent = ScreenGui, Position = UDim2.new(0.5, 0, 0, -11), Size = UDim2.new(0, 100, 0, 20), AnchorPoint = Vector2.new(0.5, 0.5), BackgroundTransparency = 1, TextColor3 = flags["esp_names_color"] or Color3.fromRGB(255, 255, 255), Font = Enum.Font.Code, TextSize = ESP.FontSize, TextStrokeTransparency = 0, TextStrokeColor3 = Color3.fromRGB(0, 0, 0), RichText = true})
        local Distance = Functions:Create("TextLabel", {Parent = ScreenGui, Position = UDim2.new(0.5, 0, 0, 11), Size = UDim2.new(0, 100, 0, 20), AnchorPoint = Vector2.new(0.5, 0.5), BackgroundTransparency = 1, TextColor3 = Color3.fromRGB(255, 255, 255), Font = Enum.Font.Code, TextSize = ESP.FontSize, TextStrokeTransparency = 0, TextStrokeColor3 = Color3.fromRGB(0, 0, 0), RichText = true})
        local Weapon = Functions:Create("TextLabel", {Parent = ScreenGui, Position = UDim2.new(0.5, 0, 0, 31), Size = UDim2.new(0, 100, 0, 20), AnchorPoint = Vector2.new(0.5, 0.5), BackgroundTransparency = 1, TextColor3 = Color3.fromRGB(255, 255, 255), Font = Enum.Font.Code, TextSize = ESP.FontSize, TextStrokeTransparency = 0, TextStrokeColor3 = Color3.fromRGB(0, 0, 0), RichText = true})
        local Box = Functions:Create("Frame", {Parent = ScreenGui, BackgroundColor3 = Color3.fromRGB(0, 0, 0), BackgroundTransparency = 0.75, BorderSizePixel = 0})
        local Gradient1 = Functions:Create("UIGradient", {Parent = Box, Enabled = ESP.Drawing.Boxes.GradientFill, Color = ColorSequence.new{ColorSequenceKeypoint.new(0, ESP.Drawing.Boxes.GradientFillRGB1), ColorSequenceKeypoint.new(1, ESP.Drawing.Boxes.GradientFillRGB2)}})
        local Outline = Functions:Create("UIStroke", {Parent = Box, Enabled = ESP.Drawing.Boxes.Gradient, Transparency = 0, Color = flags["esp_box_color"] or Color3.fromRGB(255, 255, 255), LineJoinMode = Enum.LineJoinMode.Miter})
        local Gradient2 = Functions:Create("UIGradient", {Parent = Outline, Enabled = ESP.Drawing.Boxes.Gradient, Color = ColorSequence.new{ColorSequenceKeypoint.new(0, ESP.Drawing.Boxes.GradientRGB1), ColorSequenceKeypoint.new(1, ESP.Drawing.Boxes.GradientRGB2)}})
        local Healthbar = Functions:Create("Frame", {Parent = ScreenGui, Name = "Healthbar", BackgroundColor3 = flags["esp_health_color"] or Color3.fromRGB(0, 255, 0), BackgroundTransparency = 0})
        local BehindHealthbar = Functions:Create("Frame", {Parent = ScreenGui, Name = "BehindHealthbar", ZIndex = -1, BackgroundColor3 = Color3.fromRGB(0, 0, 0), BackgroundTransparency = 0})
        local HealthbarGradient = Functions:Create("UIGradient", {Parent = Healthbar, Enabled = ESP.Drawing.Healthbar.Gradient, Rotation = -90, Color = ColorSequence.new{ColorSequenceKeypoint.new(0, ESP.Drawing.Healthbar.GradientRGB1), ColorSequenceKeypoint.new(0.5, ESP.Drawing.Healthbar.GradientRGB2), ColorSequenceKeypoint.new(1, ESP.Drawing.Healthbar.GradientRGB3)}})
        local HealthText = Functions:Create("TextLabel", {Parent = ScreenGui, Position = UDim2.new(0.5, 0, 0, 31), Size = UDim2.new(0, 100, 0, 20), AnchorPoint = Vector2.new(0.5, 0.5), BackgroundTransparency = 1, TextColor3 = Color3.fromRGB(255, 255, 255), Font = Enum.Font.Code, TextSize = ESP.FontSize, TextStrokeTransparency = 0, TextStrokeColor3 = Color3.fromRGB(0, 0, 0)})
        local Chams = Functions:Create("Highlight", {Parent = ScreenGui, FillTransparency = 1, OutlineTransparency = 0, OutlineColor = flags["esp_chams_color"] or Color3.fromRGB(119, 120, 255), DepthMode = "AlwaysOnTop"})
        local WeaponIcon = Functions:Create("ImageLabel", {Parent = ScreenGui, BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Size = UDim2.new(0, 40, 0, 40)})
        local Gradient3 = Functions:Create("UIGradient", {Parent = WeaponIcon, Rotation = -90, Enabled = ESP.Drawing.Weapons.Gradient, Color = ColorSequence.new{ColorSequenceKeypoint.new(0, ESP.Drawing.Weapons.GradientRGB1), ColorSequenceKeypoint.new(1, ESP.Drawing.Weapons.GradientRGB2)}})
        local LeftTop = Functions:Create("Frame", {Parent = ScreenGui, BackgroundColor3 = flags["esp_box_color"] or Color3.fromRGB(255, 255, 255), Position = UDim2.new(0, 0, 0, 0)})
        local LeftSide = Functions:Create("Frame", {Parent = ScreenGui, BackgroundColor3 = flags["esp_box_color"] or Color3.fromRGB(255, 255, 255), Position = UDim2.new(0, 0, 0, 0)})
        local RightTop = Functions:Create("Frame", {Parent = ScreenGui, BackgroundColor3 = flags["esp_box_color"] or Color3.fromRGB(255, 255, 255), Position = UDim2.new(0, 0, 0, 0)})
        local RightSide = Functions:Create("Frame", {Parent = ScreenGui, BackgroundColor3 = flags["esp_box_color"] or Color3.fromRGB(255, 255, 255), Position = UDim2.new(0, 0, 0, 0)})
        local BottomSide = Functions:Create("Frame", {Parent = ScreenGui, BackgroundColor3 = flags["esp_box_color"] or Color3.fromRGB(255, 255, 255), Position = UDim2.new(0, 0, 0, 0)})
        local BottomDown = Functions:Create("Frame", {Parent = ScreenGui, BackgroundColor3 = flags["esp_box_color"] or Color3.fromRGB(255, 255, 255), Position = UDim2.new(0, 0, 0, 0)})
        local BottomRightSide = Functions:Create("Frame", {Parent = ScreenGui, BackgroundColor3 = flags["esp_box_color"] or Color3.fromRGB(255, 255, 255), Position = UDim2.new(0, 0, 0, 0)})
        local BottomRightDown = Functions:Create("Frame", {Parent = ScreenGui, BackgroundColor3 = flags["esp_box_color"] or Color3.fromRGB(255, 255, 255), Position = UDim2.new(0, 0, 0, 0)})
        local Flag1 = Functions:Create("TextLabel", {Parent = ScreenGui, Position = UDim2.new(1, 0, 0, 0), Size = UDim2.new(0, 100, 0, 20), AnchorPoint = Vector2.new(0.5, 0.5), BackgroundTransparency = 1, TextColor3 = Color3.fromRGB(255, 255, 255), Font = Enum.Font.Code, TextSize = ESP.FontSize, TextStrokeTransparency = 0, TextStrokeColor3 = Color3.fromRGB(0, 0, 0)})
        local Flag2 = Functions:Create("TextLabel", {Parent = ScreenGui, Position = UDim2.new(1, 0, 0, 0), Size = UDim2.new(0, 100, 0, 20), AnchorPoint = Vector2.new(0.5, 0.5), BackgroundTransparency = 1, TextColor3 = Color3.fromRGB(255, 255, 255), Font = Enum.Font.Code, TextSize = ESP.FontSize, TextStrokeTransparency = 0, TextStrokeColor3 = Color3.fromRGB(0, 0, 0)})
        --
        local Updater = function()
            local Connection;
            local function HideESP()
                Box.Visible = false;
                Name.Visible = false;
                Distance.Visible = false;
                Weapon.Visible = false;
                Healthbar.Visible = false;
                BehindHealthbar.Visible = false;
                HealthText.Visible = false;
                WeaponIcon.Visible = false;
                LeftTop.Visible = false;
                LeftSide.Visible = false;
                BottomSide.Visible = false;
                BottomDown.Visible = false;
                RightTop.Visible = false;
                RightSide.Visible = false;
                BottomRightSide.Visible = false;
                BottomRightDown.Visible = false;
                Flag1.Visible = false;
                Chams.Enabled = false;
                Flag2.Visible = false;
                if not plr then
                    ScreenGui:Destroy();
                    Connection:Disconnect();
		end
	end
            --
            Connection = Euphoria.RunService.RenderStepped:Connect(function()
                -- Update ESP settings from GUI
                updateESPSettings()
                
                if not ESP.Enabled then
                    HideESP()
                    return
                end
                
                if plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
                    local HRP = plr.Character.HumanoidRootPart
                    local Humanoid = plr.Character:WaitForChild("Humanoid");
                    local Pos, OnScreen = Cam:WorldToScreenPoint(HRP.Position)
                    local Dist = (Cam.CFrame.Position - HRP.Position).Magnitude / 3.5714285714
                    
                    if OnScreen and Dist <= ESP.MaxDistance then
                        local Size = HRP.Size.Y
                        local scaleFactor = (Size * Cam.ViewportSize.Y) / (Pos.Z * 2)
                        local w, h = 3 * scaleFactor, 4.5 * scaleFactor

                        -- Fade-out effect --
                        if ESP.FadeOut.OnDistance then
                            Functions:FadeOutOnDist(Box, Dist)
                            Functions:FadeOutOnDist(Outline, Dist)
                            Functions:FadeOutOnDist(Name, Dist)
                            Functions:FadeOutOnDist(Distance, Dist)
                            Functions:FadeOutOnDist(Weapon, Dist)
                            Functions:FadeOutOnDist(Healthbar, Dist)
                            Functions:FadeOutOnDist(BehindHealthbar, Dist)
                            Functions:FadeOutOnDist(HealthText, Dist)
                            Functions:FadeOutOnDist(WeaponIcon, Dist)
                            Functions:FadeOutOnDist(LeftTop, Dist)
                            Functions:FadeOutOnDist(LeftSide, Dist)
                            Functions:FadeOutOnDist(BottomSide, Dist)
                            Functions:FadeOutOnDist(BottomDown, Dist)
                            Functions:FadeOutOnDist(RightTop, Dist)
                            Functions:FadeOutOnDist(RightSide, Dist)
                            Functions:FadeOutOnDist(BottomRightSide, Dist)
                            Functions:FadeOutOnDist(BottomRightDown, Dist)
                            Functions:FadeOutOnDist(Chams, Dist)
                            Functions:FadeOutOnDist(Flag1, Dist)
                            Functions:FadeOutOnDist(Flag2, Dist)
                        end

                        -- Teamcheck
                        if ESP.TeamCheck and plr ~= lplayer and ((lplayer.Team ~= plr.Team and plr.Team) or (not lplayer.Team and not plr.Team)) and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") and plr.Character:FindFirstChild("Humanoid") then

                            do -- Chams
                                Chams.Adornee = plr.Character
                                Chams.Enabled = ESP.Drawing.Chams.Enabled
                                Chams.FillColor = ESP.Drawing.Chams.FillRGB
                                Chams.OutlineColor = ESP.Drawing.Chams.OutlineRGB
                                do -- Breathe
                                    if ESP.Drawing.Chams.Thermal then
                                        local breathe_effect = math.atan(math.sin(tick() * 2)) * 2 / math.pi
                                        Chams.FillTransparency = ESP.Drawing.Chams.Fill_Transparency * breathe_effect * 0.01
                                        Chams.OutlineTransparency = ESP.Drawing.Chams.Outline_Transparency * breathe_effect * 0.01
                                    end
                                end
                                if ESP.Drawing.Chams.VisibleCheck then
                                    Chams.DepthMode = "Occluded"
                                else
                                    Chams.DepthMode = "AlwaysOnTop"
                                end
                            end;

                            do -- Corner Boxes
                                LeftTop.Visible = ESP.Drawing.Boxes.Corner.Enabled
                                LeftTop.Position = UDim2.new(0, Pos.X - w / 2, 0, Pos.Y - h / 2)
                                LeftTop.Size = UDim2.new(0, w / 5, 0, 1)
                                
                                LeftSide.Visible = ESP.Drawing.Boxes.Corner.Enabled
                                LeftSide.Position = UDim2.new(0, Pos.X - w / 2, 0, Pos.Y - h / 2)
                                LeftSide.Size = UDim2.new(0, 1, 0, h / 5)
                                
                                BottomSide.Visible = ESP.Drawing.Boxes.Corner.Enabled
                                BottomSide.Position = UDim2.new(0, Pos.X - w / 2, 0, Pos.Y + h / 2)
                                BottomSide.Size = UDim2.new(0, 1, 0, h / 5)
                                BottomSide.AnchorPoint = Vector2.new(0, 5)
                                
                                BottomDown.Visible = ESP.Drawing.Boxes.Corner.Enabled
                                BottomDown.Position = UDim2.new(0, Pos.X - w / 2, 0, Pos.Y + h / 2)
                                BottomDown.Size = UDim2.new(0, w / 5, 0, 1)
                                BottomDown.AnchorPoint = Vector2.new(0, 1)
                                
                                RightTop.Visible = ESP.Drawing.Boxes.Corner.Enabled
                                RightTop.Position = UDim2.new(0, Pos.X + w / 2, 0, Pos.Y - h / 2)
                                RightTop.Size = UDim2.new(0, w / 5, 0, 1)
                                RightTop.AnchorPoint = Vector2.new(1, 0)
                                
                                RightSide.Visible = ESP.Drawing.Boxes.Corner.Enabled
                                RightSide.Position = UDim2.new(0, Pos.X + w / 2 - 1, 0, Pos.Y - h / 2)
                                RightSide.Size = UDim2.new(0, 1, 0, h / 5)
                                RightSide.AnchorPoint = Vector2.new(0, 0)
                                
                                BottomRightSide.Visible = ESP.Drawing.Boxes.Corner.Enabled
                                BottomRightSide.Position = UDim2.new(0, Pos.X + w / 2, 0, Pos.Y + h / 2)
                                BottomRightSide.Size = UDim2.new(0, 1, 0, h / 5)
                                BottomRightSide.AnchorPoint = Vector2.new(1, 1)
                                
                                BottomRightDown.Visible = ESP.Drawing.Boxes.Corner.Enabled
                                BottomRightDown.Position = UDim2.new(0, Pos.X + w / 2, 0, Pos.Y + h / 2)
                                BottomRightDown.Size = UDim2.new(0, w / 5, 0, 1)
                                BottomRightDown.AnchorPoint = Vector2.new(1, 1)                                                            
                            end

                            do -- Boxes
                                Box.Position = UDim2.new(0, Pos.X - w / 2, 0, Pos.Y - h / 2)
                                Box.Size = UDim2.new(0, w, 0, h)
                                Box.Visible = ESP.Drawing.Boxes.Full.Enabled;

                                -- Gradient
                                if ESP.Drawing.Boxes.Filled.Enabled then
                                    Box.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                                    if ESP.Drawing.Boxes.GradientFill then
                                        Box.BackgroundTransparency = ESP.Drawing.Boxes.Filled.Transparency;
                                    else
                                        Box.BackgroundTransparency = 1
                                    end
                                    Box.BorderSizePixel = 1
                                else
                                    Box.BackgroundTransparency = 1
                                end
                                -- Animation
                                RotationAngle = RotationAngle + (tick() - Tick) * ESP.Drawing.Boxes.RotationSpeed * math.cos(math.pi / 4 * tick() - math.pi / 2)
                                if ESP.Drawing.Boxes.Animate then
                                    Gradient1.Rotation = RotationAngle
                                    Gradient2.Rotation = RotationAngle
                                else
                                    Gradient1.Rotation = -45
                                    Gradient2.Rotation = -45
                                end
                                Tick = tick()
                            end

                            -- Healthbar
                            do  
                                local health = Humanoid.Health / Humanoid.MaxHealth;
                                Healthbar.Visible = ESP.Drawing.Healthbar.Enabled;
                                Healthbar.Position = UDim2.new(0, Pos.X - w / 2 - 6, 0, Pos.Y - h / 2 + h * (1 - health))  
                                Healthbar.Size = UDim2.new(0, ESP.Drawing.Healthbar.Width, 0, h * health)  
                                --
                                BehindHealthbar.Visible = ESP.Drawing.Healthbar.Enabled;
                                BehindHealthbar.Position = UDim2.new(0, Pos.X - w / 2 - 6, 0, Pos.Y - h / 2)  
                                BehindHealthbar.Size = UDim2.new(0, ESP.Drawing.Healthbar.Width, 0, h)
                                -- Health Text
                                do
                                    if ESP.Drawing.Healthbar.HealthText then
                                        local healthPercentage = math.floor(Humanoid.Health / Humanoid.MaxHealth * 100)
                                        HealthText.Position = UDim2.new(0, Pos.X - w / 2 - 6, 0, Pos.Y - h / 2 + h * (1 - healthPercentage / 100) + 3)
                                        HealthText.Text = tostring(healthPercentage)
                                        HealthText.Visible = Humanoid.Health < Humanoid.MaxHealth
                                        if ESP.Drawing.Healthbar.Lerp then
                                            local color = health >= 0.75 and Color3.fromRGB(0, 255, 0) or health >= 0.5 and Color3.fromRGB(255, 255, 0) or health >= 0.25 and Color3.fromRGB(255, 170, 0) or Color3.fromRGB(255, 0, 0)
                                            HealthText.TextColor3 = color
                                        else
                                            HealthText.TextColor3 = ESP.Drawing.Healthbar.HealthTextRGB
                                        end
                                    end                        
                                end
                            end

                            do -- Names
                                Name.Visible = ESP.Drawing.Names.Enabled
                                if ESP.Options.Friendcheck and lplayer:IsFriendsWith(plr.UserId) then
                                    Name.Text = string.format('(<font color="rgb(%d, %d, %d)">F</font>) %s', ESP.Options.FriendcheckRGB.R * 255, ESP.Options.FriendcheckRGB.G * 255, ESP.Options.FriendcheckRGB.B * 255, plr.Name)
                                else
                                    Name.Text = string.format('(<font color="rgb(%d, %d, %d)">E</font>) %s', 255, 0, 0, plr.Name)
                                end
                                Name.Position = UDim2.new(0, Pos.X, 0, Pos.Y - h / 2 - 9)
                            end
                            
                            do -- Distance
                                if ESP.Drawing.Distances.Enabled then
                                    if ESP.Drawing.Distances.Position == "Bottom" then
                                        Weapon.Position = UDim2.new(0, Pos.X, 0, Pos.Y + h / 2 + 18)
                                        WeaponIcon.Position = UDim2.new(0, Pos.X - 21, 0, Pos.Y + h / 2 + 15);
                                        Distance.Position = UDim2.new(0, Pos.X, 0, Pos.Y + h / 2 + 7)
                                        Distance.Text = string.format("%d meters", math.floor(Dist))
                                        Distance.Visible = true
                                    elseif ESP.Drawing.Distances.Position == "Text" then
                                        Weapon.Position = UDim2.new(0, Pos.X, 0, Pos.Y + h / 2 + 8)
                                        WeaponIcon.Position = UDim2.new(0, Pos.X - 21, 0, Pos.Y + h / 2 + 5);
                                        Distance.Visible = false
                                        if ESP.Options.Friendcheck and lplayer:IsFriendsWith(plr.UserId) then
                                            Name.Text = string.format('(<font color="rgb(%d, %d, %d)">F</font>) %s [%d]', ESP.Options.FriendcheckRGB.R * 255, ESP.Options.FriendcheckRGB.G * 255, ESP.Options.FriendcheckRGB.B * 255, plr.Name, math.floor(Dist))
                                        else
                                            Name.Text = string.format('(<font color="rgb(%d, %d, %d)">E</font>) %s [%d]', 255, 0, 0, plr.Name, math.floor(Dist))
                                        end
                                        Name.Visible = ESP.Drawing.Names.Enabled
						end
					end
                            end

                            do -- Weapons
                                Weapon.Text = "none"
                                Weapon.Visible = ESP.Drawing.Weapons.Enabled
                            end                            
                        else
                            HideESP();
					end
				else
                    HideESP();
			end
		else
                    HideESP();
		end
	end)
end
        coroutine.wrap(Updater)();
    end
    
    do -- Update ESP for all players
        for _, v in pairs(players:GetPlayers()) do
            if v.Name ~= lplayer.Name then
                coroutine.wrap(ESPFunction)(v)
            end      
        end
        --
        players.PlayerAdded:Connect(function(v)
            coroutine.wrap(ESPFunction)(v)
        end);
    end;
end;

-- Load notification
library:SendNotification("liwo.exe loaded successfully!", 5)