--Monkey friendly

repeat task.wait() until game:IsLoaded()

--//----\\--
local Repostry = "https://raw.githubusercontent.com/EXFTB/LinoriaLib/main/"

local Library = loadstring(game:HttpGet(Repostry .. "Library.lua"))()
local ThemeManager = loadstring(game:HttpGet(Repostry .. "ThemeManager.lua"))()
local SaveManager = loadstring(game:HttpGet(Repostry .. "SaveManager.lua"))()
--\\----//--

--//----\\--
local Window = Library:CreateWindow({
    Title = "Testing Script",
    Center = true,
    AutoShow = true,
    TabPadding = 8
})

local Watermark = Library:SetWatermark("Script | Version | Game")

local Tabs = {
    ["Main"] = Window:AddTab("Main"),
    ["UI-Settings"] = Window:AddTab("UI-Settings"),
}
--\\----//--

--//----\\--
local TestingBox = Tabs["Main"]:AddLeftGroupbox("Testing")
local TestingBox2 = Tabs["Main"]:AddRightGroupbox("Testing2")

local SettingBox = Tabs["UI-Settings"]:AddLeftGroupbox("Settings")
--\\----//--

--//----\\--
ThemeManager:SetLibrary(Library)
ThemeManager:SetFolder("Script")

SaveManager:SetLibrary(Library)
SaveManager:IgnoreThemeSettings() 
SaveManager:SetFolder("Script/Game")
--\\----//--

--//----\\--
TestingBox:AddToggle("Toggle1", {
    Text = "Toggle",
    Default = false,
    Tooltip = "Print the callback",
    Callback = function(Value)
        print("Toggle is now: ", Value)
    end
})

TestingBox:AddToggle("Show_KeybindFrame", {
    Text = "Keybind Frame",
    Default = false,
    Tooltip = "Toggles the keybind frame",
    Callback = function(Value)
        Library.KeybindFrame.Visible = Value
    end
})

TestingBox:AddDivider()

TestingBox:AddButton({
    Text = "Rejoin",
    Func = function()
        game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId)
    end,
    DoubleClick = false,
    Tooltip = "This button prints HI"
})
--\\----//--

--//----\\--
TestingBox2:AddToggle("Toggle2", {
    Text = "KeybindToggle",
    Default = false,
    Tooltip = "Print the callback",
    Callback = function(Value)
        print("Toggle: ", Value)
    end
}):AddKeyPicker("Toggle2Key", {
    Mode = "Toggle",
    Default = "",
    SyncToggleState = true,
    Text = "",
    NoUI = false
})

TestingBox2:AddSlider("HitChance", {
    Text = "Hitchance",
    Default = 0,
    Min = 0,
    Max = 100,
    Rounding = 1,
    Compact = false,
    Callback = function(Value)
        print("Hitchance: ", Value)
    end
})
--\\----//--

--//----\\--
SaveManager:BuildConfigSection(Tabs['UI-Settings'])
SettingBox:AddLabel("Toggle UI"):AddKeyPicker("ToggleUIKey", {
    Mode = "Toggle",
    Default = "RightShift",
    Text = "",
    NoUI = true,
    Callback = function(Value)
        Library.ToggleKeybind = Value
    end
})
ThemeManager:ApplyToGroupbox(SettingBox)
--\\----//--
