--SHX GUI
-- Variables
_G.SettingsTable = {
    EggType = "";
    EggTP = "";
    EggPerHatch = "";
    RebirthAmount = "";
    AutoLegendary1 = "";
    AutoLegendary2 = "";
    AutoLegendary3 = "";
    AutoLegendary4 = "";
    AutoLegendary5 = "";
    BuyEgg = false;
    AutoRebirth = false;
    AutoCommon = false;
    AutoRare = false;
    AutoEpic = false;
    AutoLegendary = false;
    AutoAddLegendary = false;
    AutoRemoveLegendary = false;

    
}

_G.SecretsList = {
    TotalSecretsHatched = 0;
}

local username = game:GetService("Players").LocalPlayer.Name
local SettingsTableName = username .. "_Settings_SBX.txt"
local SecretsListName = username .. "_LegendaryList_SBX.txt"

function HatchEgg()
    spawn(function()
        while wait() do 
            if not _G.SettingsTable.BuyEgg then break end

            local args = {
                [1] = _G.SettingsTable.EggType,
                [2] = _G.SettingsTable.EggPerHatch,
            }

            game:GetService("ReplicatedStorage").GameClient.Events.RemoteFunction.BuyEgg:InvokeServer(unpack(args))
        end
    end)
end
function AutoRebirth()
    spawn(function()
        while wait(5) do 
            if not _G.SettingsTable.AutoRebirth then break end

            local args = {
                [1] = tonumber(_G.SettingsTable.RebirthAmount),
            }
            
            game:GetService("ReplicatedStorage").Events.Rebirth:FireServer(unpack(args))
        end
    end)
end
function TweenToEgg()
    spawn(function()
        game:GetService("Workspace").Eggs[_G.SettingsTable.EggTP].Sign.CanCollide = false
        wait(1)
	    local Player = game.Players.LocalPlayer
	    if Player.Character then
		Player.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Eggs[_G.SettingsTable.EggTP].Sign.CFrame
	    end
    end)
end
function SaveSettingsTableSettings()
    local json
    local HttpService = game:GetService("HttpService")
    if (writefile) then
        json = HttpService:JSONEncode(_G.SettingsTable)
        writefile(SettingsTableName, json)
        game.StarterGui:SetCore(
               	"SendNotification",
            {
                Title = "SUCCESS!",
                Text = "Settings Have Been Saved",
                Duration = 5
            }
        )
    end
end
function LoadSettingsTableSettings()
    local HttpService = game:GetService("HttpService")
    if (readfile and isfile and isfile(SettingsTableName)) then
        _G.SettingsTable = HttpService:JSONDecode(readfile(SettingsTableName))
        game.StarterGui:SetCore(
               	"SendNotification",
            {
                Title = "SUCCESS!",
                Text = "Settings Have Been Loaded",
                Duration = 5
            }
        )
    end
end
function SaveSettingsSecretsList()
    local json
    local HttpService = game:GetService("HttpService")
    if (writefile) then
        json = HttpService:JSONEncode(_G.SecretsList)
        writefile(SecretsListName, json)
    end
end
function LoadSettingsSecretsList()
    local HttpService = game:GetService("HttpService")
    if (readfile and isfile and isfile(SecretsListName)) then
        _G.SecretsList = HttpService:JSONDecode(readfile(SecretsListName))
    end
end
function AutoCommonT()
    spawn(function()
        local args = {
            [1] = "Common",
            [2] = true
        }

        game:GetService("ReplicatedStorage").GameClient.Events.RemoteFunction.AutoDelete:InvokeServer(unpack(args))
    end)
end
function AutoCommonF()
    spawn(function()
        local args = {
            [1] = "Common",
            [2] = false
        }

        game:GetService("ReplicatedStorage").GameClient.Events.RemoteFunction.AutoDelete:InvokeServer(unpack(args))
    end)
end
function AutoRareT()
    spawn(function()
        local args = {
            [1] = "Rare",
            [2] = true
        }
        
        game:GetService("ReplicatedStorage").GameClient.Events.RemoteFunction.AutoDelete:InvokeServer(unpack(args))
    end)
end
function AutoRareF()
    spawn(function()
        local args = {
            [1] = "Rare",
            [2] = false
        }
        
        game:GetService("ReplicatedStorage").GameClient.Events.RemoteFunction.AutoDelete:InvokeServer(unpack(args))
    end)
end
function AutoEpicT()
    spawn(function()
        local args = {
            [1] = "Epic",
            [2] = true
        }
        
        game:GetService("ReplicatedStorage").GameClient.Events.RemoteFunction.AutoDelete:InvokeServer(unpack(args))
    end)
end
function AutoEpicF()
    spawn(function()
        local args = {
            [1] = "Epic",
            [2] = false
        }
        
        game:GetService("ReplicatedStorage").GameClient.Events.RemoteFunction.AutoDelete:InvokeServer(unpack(args))
    end)
end
function AutoLegendaryT()
    spawn(function()
        local args = {
            [1] = "Legendary",
            [2] = true
        }
        
        game:GetService("ReplicatedStorage").GameClient.Events.RemoteFunction.AutoDelete:InvokeServer(unpack(args))
    end)
end
function AutoLegendaryF()
    spawn(function()
        local args = {
            [1] = "Legendary",
            [2] = false
        }
        
        game:GetService("ReplicatedStorage").GameClient.Events.RemoteFunction.AutoDelete:InvokeServer(unpack(args))
    end)
end
function SetAutoLegends()
    spawn(function()
        local args = {
            [1] = "AddPet",
            [2] = _G.SettingsTable.AutoLegendary1
        }

        game:GetService("ReplicatedStorage").GameClient.Events.RemoteFunction.AutoDelete:InvokeServer(unpack(args))
        local args = {
            [1] = "AddPet",
            [2] = _G.SettingsTable.AutoLegendary2
        }

        game:GetService("ReplicatedStorage").GameClient.Events.RemoteFunction.AutoDelete:InvokeServer(unpack(args))
        local args = {
            [1] = "AddPet",
            [2] = _G.SettingsTable.AutoLegendary3
        }

        game:GetService("ReplicatedStorage").GameClient.Events.RemoteFunction.AutoDelete:InvokeServer(unpack(args))
        local args = {
            [1] = "AddPet",
            [2] = _G.SettingsTable.AutoLegendary4
        }

        game:GetService("ReplicatedStorage").GameClient.Events.RemoteFunction.AutoDelete:InvokeServer(unpack(args))
        local args = {
            [1] = "AddPet",
            [2] = _G.SettingsTable.AutoLegendary5
        }

        game:GetService("ReplicatedStorage").GameClient.Events.RemoteFunction.AutoDelete:InvokeServer(unpack(args))
    end)
end
function RemoveAutoLegends()
    spawn(function()
        local args = {
            [1] = "RemovePet",
            [2] = _G.SettingsTable.AutoLegendary1
        }

        game:GetService("ReplicatedStorage").GameClient.Events.RemoteFunction.AutoDelete:InvokeServer(unpack(args))
        local args = {
            [1] = "RemovePet",
            [2] = _G.SettingsTable.AutoLegendary2
        }

        game:GetService("ReplicatedStorage").GameClient.Events.RemoteFunction.AutoDelete:InvokeServer(unpack(args))
        local args = {
            [1] = "RemovePet",
            [2] = _G.SettingsTable.AutoLegendary3
        }

        game:GetService("ReplicatedStorage").GameClient.Events.RemoteFunction.AutoDelete:InvokeServer(unpack(args))
        local args = {
            [1] = "RemovePet",
            [2] = _G.SettingsTable.AutoLegendary4
        }

        game:GetService("ReplicatedStorage").GameClient.Events.RemoteFunction.AutoDelete:InvokeServer(unpack(args))
        local args = {
            [1] = "RemovePet",
            [2] = _G.SettingsTable.AutoLegendary5
        }

        game:GetService("ReplicatedStorage").GameClient.Events.RemoteFunction.AutoDelete:InvokeServer(unpack(args))
    end)
end

LoadSettingsTableSettings()
LoadSettingsSecretsList()

if _G.SettingsTable.BuyEgg then
    HatchEgg()
end
if _G.SettingsTable.TpToEgg then
    TweenToEgg()
end
if _G.SettingsTable.AutoRebirth then
    AutoRebirth()
end
if _G.SettingsTable.AutoCommon then
    AutoCommonT()
end
if _G.SettingsTable.AutoRare then
    AutoRareT()
end
if _G.SettingsTable.AutoEpic then
    AutoEpicT()
end
if _G.SettingsTable.AutoLegendary then
    AutoLegendaryT()
end
if _G.SettingsTable.AutoAddLegendary then
    SetAutoLegends()
end

-- Library
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("Sandbox Hatchers X UI", "Midnight")

-- AutoFarmUI
local AutoFarmTab = Window:NewTab("Auto Farm")
local AutoRebirthSection = AutoFarmTab:NewSection("Auto Rebirth")
local RebirthsLabel = AutoRebirthSection:NewLabel("Auto Rebirth :DD")

-- EggFarmingUI
local EggFarmingTab = Window:NewTab("Egg Farming")
local AutoHatchEggSection = EggFarmingTab:NewSection("Auto Hatch Egg")
local EggsLabel = AutoHatchEggSection:NewLabel("Eggs Hatched:")
local AutoTeleportSection = EggFarmingTab:NewSection("Auto Teleport To Egg")

-- AutoDeleteUI
local AutoDeleteTab = Window:NewTab("Auto Delete")
local AutoDeleteSection = AutoDeleteTab:NewSection("Auto Delete Settings")
local AutoDeleteLegendariesSection = AutoDeleteTab:NewSection("Auto Delete Legendaries")

-- SettingsUI
local SettingsTab = Window:NewTab("Settings")
local SettingsSection = SettingsTab:NewSection("Setting Options (Settings Save Per Account)")

-- TogglesUI
local TogglesTab = Window:NewTab("Toggles")
local ToggleUISection = TogglesTab:NewSection("Toggle UI")

--EggFarming
AutoHatchEggSection:NewTextBox("Choose Egg: ", "Choose what egg you want to hatch (Case Sensitive!)", function(EggTypetxt)
	_G.SettingsTable.EggType = EggTypetxt
end)
AutoHatchEggSection:NewDropdown("Amount Of Eggs", "Select how much eggs you want to hatch", {"Buy1", "Buy3", "Buy8"}, function(EggsPerHatchText)
    _G.SettingsTable.EggPerHatch = EggsPerHatchText
end)
AutoHatchEggSection:NewToggle("Start Hatching Egg", "Starts Hatching The Egg", function(bool)
    _G.SettingsTable.BuyEgg = bool
    if bool then
        HatchEgg()
    end
end)
AutoTeleportSection:NewTextBox("Choose Egg: ", "Choose what egg you want to tp to (Case Sensitive!)", function(Eggtptxt)
	_G.SettingsTable.EggTP = Eggtptxt
end)
AutoTeleportSection:NewButton("Teleport To Egg", "Teleports You To The Selected Egg", function()
    _G.SettingsTable.TpToEgg = true
    if _G.SettingsTable.TpToEgg then
        TweenToEgg()
    end
end)

-- Auto Rebirth
AutoRebirthSection:NewDropdown("Amount Of Rebirths", "Select rebirth option", {"1", "2", "3","4", "5", "6", "7","8","9","10","11","12","13","14","15","16","17","18","19"}, function(RebirthAmountText)
    _G.SettingsTable.RebirthAmount = RebirthAmountText
end)
AutoRebirthSection:NewToggle("Start Rebirthing", "Starts Rebirthing", function(bool)
    _G.SettingsTable.AutoRebirth = bool
    if bool then
        AutoRebirth()
    end
end)

-- Auto Delete
AutoDeleteSection:NewToggle("Auto Delete Commons", "Auto Deletes Commons", function(bool)
    _G.SettingsTable.AutoCommon = bool
    if bool then
        AutoCommonT()
    else
        AutoCommonF()
    end
end)
AutoDeleteSection:NewToggle("Auto Delete Rares", "Auto Deletes Rares", function(bool)
    _G.SettingsTable.AutoRare = bool
    if bool then
        AutoRareT()
    else
        AutoRareF()
    end
end)
AutoDeleteSection:NewToggle("Auto Delete Epics", "Auto Deletes Epics", function(bool)
    _G.SettingsTable.AutoEpic = bool
    if bool then
        AutoEpicT()
    else
        AutoEpicF()
    end
end)
AutoDeleteSection:NewToggle("Auto Delete Legendaries", "Auto Deletes Legendaries", function(bool)
    _G.SettingsTable.AutoLegendary = bool
    if bool then
        AutoLegendaryT()
    else
        AutoLegendaryF()
    end
end)
AutoDeleteLegendariesSection:NewTextBox("Legendary 1: ", "Auto Delete A Specific Legendary", function(AutoLegend1txt)
	_G.SettingsTable.AutoLegendary1 = AutoLegend1txt
end)
AutoDeleteLegendariesSection:NewTextBox("Legendary 2: ", "Auto Delete A Specific Legendary", function(AutoLegend2txt)
	_G.SettingsTable.AutoLegendary2 = AutoLegend2txt
end)
AutoDeleteLegendariesSection:NewTextBox("Legendary 3: ", "Auto Delete A Specific Legendary", function(AutoLegend3txt)
	_G.SettingsTable.AutoLegendary3 = AutoLegend3txt
end)
AutoDeleteLegendariesSection:NewTextBox("Legendary 4: ", "Auto Delete A Specific Legendary", function(AutoLegend4txt)
	_G.SettingsTable.AutoLegendary4 = AutoLegend4txt
end)
AutoDeleteLegendariesSection:NewTextBox("Legendary 5: ", "Auto Delete A Specific Legendary", function(AutoLegend5txt)
	_G.SettingsTable.AutoLegendary5 = AutoLegend5txt
end)
AutoDeleteLegendariesSection:NewToggle("Set Legendarys", "Sets the legendaries to auto delete", function(bool)
    _G.SettingsTable.AutoAddLegendary = bool
    if bool then
        SetAutoLegends()
    end
end)
AutoDeleteLegendariesSection:NewToggle("Remove Legendarys", "Removes the legendaries from auto delete", function(bool)
    _G.SettingsTable.AutoRemoveLegendary = bool
    if bool then
        RemoveAutoLegends()
    end
end)

--Settings
SettingsSection:NewButton("See Settings", "Shows Your Current Settings (Type /console in chat)", function()
    print("---CURRENT SETTINGS---")
    for i,v in pairs(_G.SettingsTable) do
        print(i,v)
    end
    print("----------------------")
end)
SettingsSection:NewButton("Save Settings", "Saves your current Settings", function()
    SaveSettingsTableSettings()
end)
SettingsSection:NewButton("Load Settings", "Loads your saved Settings", function()
    LoadSettingsTableSettings()
end)


-- Toggles
ToggleUISection:NewKeybind("Toggle The UI", "Toggles The UI", Enum.KeyCode.F, function()
	Library:ToggleUI()
end)

-- Formatting Counts
function abb(Value)
    local Number
    local Formatted = Value
    while true do
        Formatted, Number = string.gsub(Formatted, "^(-?%d+)(%d%d%d)", '%1,%2')
        if (Number == 0) then
            break
        end
    end
    return Formatted
end
while wait() do
    local plr = game.Players.LocalPlayer
    local count = 0
    count = game:GetService("Players")[username].leaderstats.Eggs.Value
    EggsLabel:UpdateLabel("Eggs Hatched: " .. abb(count))
end
