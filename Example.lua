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
}
--\\----//--

--//----\\--
local TestingBox = Tabs["Main"]:AddLeftGroupbox("Testing")
local TestingBox2 = Tabs["Main"]:AddRightGroupbox("Testing2")
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

TestingBox2:AddLabel("Toggle UI"):AddKeyPicker("ToggleUIKey", {
    Mode = "Toggle",
    Default = "RightShift",
    Text = "",
    NoUI = true,
    Callback = function(Value)
        Library.ToggleKeybind = Value
    end
})
--\\----//--
