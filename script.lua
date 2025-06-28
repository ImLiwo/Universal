local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Jxereas/UI-Libraries/main/cerberus.lua"))()

local window = Library.new("Window") -- Args(<string> Name, <boolean?> ConstrainToScreen, <number?> Width, <number?> Height, <string?> VisibilityToggleKey)

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

-- VISUAL TAB
local visualTab = window:Tab("Visual")

-- PLAYER ESP SECTION
local playerESPSection = visualTab:Section("Player ESP")

playerESPSection:Toggle("Enable ESP", function(bool)
    print("ESP enabled: "..tostring(bool))
end)

playerESPSection:Toggle("Box ESP", function(bool)
    print("Box ESP: "..tostring(bool))
end)

playerESPSection:Toggle("Name ESP", function(bool)
    print("Name ESP: "..tostring(bool))
end)

playerESPSection:Toggle("Health ESP", function(bool)
    print("Health ESP: "..tostring(bool))
end)

playerESPSection:Toggle("Distance ESP", function(bool)
    print("Distance ESP: "..tostring(bool))
end)

playerESPSection:Toggle("Tracers", function(bool)
    print("Tracers: "..tostring(bool))
end)

playerESPSection:Slider("ESP Distance", function(val)
    print("ESP Distance: "..val)
end, 1000, 50) -- Max: 1000, Min: 50

-- ESP COLORS SECTION
local espColorsSection = visualTab:Section("ESP Colors")

espColorsSection:ColorWheel("Box Color", function(color)
    print("Box Color: "..tostring(color))
end)

espColorsSection:ColorWheel("Name Color", function(color)
    print("Name Color: "..tostring(color))
end)

espColorsSection:ColorWheel("Tracer Color", function(color)
    print("Tracer Color: "..tostring(color))
end)

espColorsSection:ColorWheel("Enemy Color", function(color)
    print("Enemy Color: "..tostring(color))
end)

espColorsSection:ColorWheel("Team Color", function(color)
    print("Team Color: "..tostring(color))
end)

-- CHAMS/WALLHACKS SECTION
local chamsSection = visualTab:Section("Chams & Wallhacks")

chamsSection:Toggle("Enable Chams", function(bool)
    print("Chams enabled: "..tostring(bool))
end)

chamsSection:Toggle("Wallhack", function(bool)
    print("Wallhack: "..tostring(bool))
end)

chamsSection:Slider("Chams Transparency", function(val)
    print("Chams Transparency: "..val)
end, 100, 0) -- Max: 100%, Min: 0%

chamsSection:ColorWheel("Chams Color", function(color)
    print("Chams Color: "..tostring(color))
end)

-- WORLD VISUALS SECTION
local worldSection = visualTab:Section("World Visuals")

worldSection:Toggle("Fullbright", function(bool)
    print("Fullbright: "..tostring(bool))
end)

worldSection:Toggle("No Fog", function(bool)
    print("No Fog: "..tostring(bool))
end)

worldSection:Toggle("Skybox", function(bool)
    print("Custom Skybox: "..tostring(bool))
end)

worldSection:Slider("Ambient Light", function(val)
    print("Ambient Light: "..val)
end, 100, 0) -- Max: 100%, Min: 0%

-- ITEM ESP SECTION
local itemESPSection = visualTab:Section("Item ESP")

itemESPSection:Toggle("Weapon ESP", function(bool)
    print("Weapon ESP: "..tostring(bool))
end)

itemESPSection:Toggle("Tool ESP", function(bool)
    print("Tool ESP: "..tostring(bool))
end)

itemESPSection:Toggle("Part ESP", function(bool)
    print("Part ESP: "..tostring(bool))
end)

itemESPSection:Slider("Item ESP Distance", function(val)
    print("Item ESP Distance: "..val)
end, 500, 25) -- Max: 500, Min: 25
