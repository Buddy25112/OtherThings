_G.SettingsTable = {
    AutoBubble = false;
    EggType = "";
    MultiHatch = "";
    MultiHatchVariable = false;
    EggTP = "";
    TeleportToTheEgg = false;
    FarmCandyCanes = false;
}

local newCFrame1 = CFrame.new(150.346, 185.688, 1733.41)
local newCFrame2 = CFrame.new(100.973, 185.348, 1788.32)
local newCFrame3 = CFrame.new(24.4608, 185.72, 1886.87)
local newCFrame4 = CFrame.new(254.349, 128.76, 2377.06)
local newCFrame5 = CFrame.new(249.332, 128.761, 2425)
local newCFrame6 = CFrame.new(201.718, 128.761, 2445.62)
local newCFrame7 = CFrame.new(165.471, 128.761, 2424.63)
local newCFrame8 = CFrame.new(170.384, 128.761, 2369.25)
local newCFrame9 = CFrame.new(520.651, 126.868, 2143.45)
local newCFrame10 = CFrame.new(517.319, 126.868, 2059.7)
local newCFrame11 = CFrame.new(510.226, 126.868, 2004.91)
local newCFrame12 = CFrame.new(508.818, 126.868, 1909.43)
local newCFrame13 = CFrame.new(429.324, 127.265, 2174.62)
local newCFrame14 = CFrame.new(470.892, 127.176, 2182.16)
local newCFrame15 = CFrame.new(496.165, 126.932, 2163.7)
local newCFrame16 = CFrame.new(450.848, 127.236, 2151.76)
local newCFrame17 = CFrame.new(484.392, 128.34, 2099.27)
local newCFrame18 = CFrame.new(475.164, 127.142, 2087.88)
local newCFrame19 = CFrame.new(499.198, 128.255, 2035.43)
local newCFrame20 = CFrame.new(470.113, 128.141, 2030.68)
local newCFrame21 = CFrame.new(489.192, 126.933, 1967.82)
local newCFrame22 = CFrame.new(461.325, 126.964, 1956.1)
local newCFrame23 = CFrame.new(482.333, 126.961, 1906.89)
local newCFrame24 = CFrame.new(423.744, 126.931, 1917.34)
local newCFrame25 = CFrame.new(403.845, 126.769, 1888.69)

local username = game:GetService("Players").LocalPlayer.Name

local SettingsTableName = username .. "_Settings_BL.txt"

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

function TeleportToEgg()
    spawn(function()
        local Player = game.Players.LocalPlayer
        if Player.Character then
            Player.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Eggs[_G.SettingsTable.EggTP].View.CFrame
        end
    end)
end

function AutoFarmCandyCanes()
    spawn(function()
        local Player = game.Players.LocalPlayer
        if Player.Character then
            -- 5 second wait time
            while wait(5.1) do
                if not _G.SettingsTable.FarmCandyCanes then break end
                -- Houses, 2.4 Seconds
                wait(.2)
                Player.Character.HumanoidRootPart.CFrame = newCFrame1
                wait(.2)
                Player.Character.HumanoidRootPart.CFrame = newCFrame2
                wait(.2)
                Player.Character.HumanoidRootPart.CFrame = newCFrame3
                wait(.2)
                Player.Character.HumanoidRootPart.CFrame = newCFrame4
                wait(.2)
                Player.Character.HumanoidRootPart.CFrame = newCFrame5
                wait(.2)
                Player.Character.HumanoidRootPart.CFrame = newCFrame6
                wait(.2)
                Player.Character.HumanoidRootPart.CFrame = newCFrame7
                wait(.2)
                Player.Character.HumanoidRootPart.CFrame = newCFrame8
                wait(.2)
                Player.Character.HumanoidRootPart.CFrame = newCFrame9
                wait(.2)
                Player.Character.HumanoidRootPart.CFrame = newCFrame10
                wait(.2)
                Player.Character.HumanoidRootPart.CFrame = newCFrame11
                wait(.2)
                Player.Character.HumanoidRootPart.CFrame = newCFrame12
                
                -- Candycanes, 2.6 Seconds
                wait(.2)
                Player.Character.HumanoidRootPart.CFrame = newCFrame13
                wait(.2)
                Player.Character.HumanoidRootPart.CFrame = newCFrame14
                wait(.2)
                Player.Character.HumanoidRootPart.CFrame = newCFrame15
                wait(.2)
                Player.Character.HumanoidRootPart.CFrame = newCFrame16
                wait(.2)
                Player.Character.HumanoidRootPart.CFrame = newCFrame17
                wait(.2)
                Player.Character.HumanoidRootPart.CFrame = newCFrame18
                wait(.2)
                Player.Character.HumanoidRootPart.CFrame = newCFrame19
                wait(.2)
                Player.Character.HumanoidRootPart.CFrame = newCFrame20
                wait(.2)
                Player.Character.HumanoidRootPart.CFrame = newCFrame21
                wait(.2)
                Player.Character.HumanoidRootPart.CFrame = newCFrame22
                wait(.2)
                Player.Character.HumanoidRootPart.CFrame = newCFrame23
                wait(.2)
                Player.Character.HumanoidRootPart.CFrame = newCFrame24
                wait(.2)
                Player.Character.HumanoidRootPart.CFrame = newCFrame25
            end
        end        
    end)
end

function HatchEgg()
    spawn(function()
        while wait(0.5) do 
            if not _G.SettingsTable.BuyEgg then break end

            local args = {
                [1] = _G.SettingsTable.EggType,
                [2] = _G.SettingsTable.MultiHatch
            }

            game:GetService("ReplicatedStorage").GameClient.Events.RemoteFunction.BuyEgg:InvokeServer(unpack(args))
        end
    end)
end

function AutoBubbles()
    spawn(function()
        while wait(1) do
            if not _G.SettingsTable.AutoBubble then break end
            local args = {
                [1] = game:GetService("Players").LocalPlayer
            }
            
            game:GetService("Players").LocalPlayer.PlayerGui.Blowing.TextButton.Bubble:FireServer(unpack(args))
        end
    end)
end

local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()
local Window = Rayfield:CreateWindow({
	Name = "Hatchers Hub | Bubble Legends | Version 1.0.0",
	LoadingTitle = "Bubble Legends GUI",
	LoadingSubtitle = "By PetSimulatorXPlayer",
	ConfigurationSaving = {
		Enabled = false,
		FolderName = "Hatchers Hub MS2", -- Create a custom folder for your hub/game
		FileName = username .. "_Settings_MS2.txt"
	},
        Discord = {
        	Enabled = true,
        	Invite = "83aFw8rGM8", -- The Discord invite code, do not include discord.gg/
        	RememberJoins = true -- Set this to false to make them join the discord every time they load it up
        },
	KeySystem = false, -- Set this to true to use our key system
	KeySettings = {
		Title = "Sirius Hub",
		Subtitle = "Key System",
		Note = "Join the discord (discord.gg/sirius)",
		FileName = "SiriusKey",
		SaveKey = true,
		GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
		Key = "Hello"
	}
})
-- Credits UI
local CreditsTab = Window:CreateTab("Credits")
local CreditsSection = CreditsTab:CreateSection("------------------------------- Hatchers Hub BL -------------------------------")
local CreditsSection1 = CreditsTab:CreateSection("Creator/Dev: PetSimulatorXPlayer#5011")
local CreditsSection2 = CreditsTab:CreateSection("Helper: Cor#0002")
local CreditsSection3 = CreditsTab:CreateSection("Helper: wYn#0001 (Youtube Guides)")
local CreditsSection4 = CreditsTab:CreateSection("⚠️ Saved Settings Will Auto Load When Executed ⚠️")
local CreditsSection5 = CreditsTab:CreateSection("--------------------------------------------------------------------------------------")
local CreditsSection6 = CreditsTab:CreateSection("Last Updated: 2022-12-16")
local CreditsSection7 = CreditsTab:CreateSection("Last Update: Brand New")
local CreditsSection8 = CreditsTab:CreateSection("Upcoming Update: More New Features")
local CreditsSection9 = CreditsTab:CreateSection("Discord Link: https://discord.gg/83aFw8rGM8")
local CreditsSection10 = CreditsTab:CreateSection("-------------------------------------------------------------------------------------")

-- AutofarmUI
local AutoFarmTab = Window:CreateTab("AutoFarm")

-- EggFarmingUI
local EggFarmingTab = Window:CreateTab("Egg Farming")

-- SettingsUI
local SettingsTab = Window:CreateTab("Settings")

-- Autofarm
local AutoFarmSelection = AutoFarmTab:CreateSection("Auto Rebirth")
local AutoBubble = AutoFarmTab:CreateToggle({
	Name = "Auto Bubble (1 sec Cooldown)",
	CurrentValue = false,
	Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(bool)
        _G.SettingsTable.AutoBubble = bool
        if bool then
            AutoBubbles()
        end
	end,
})
local AutoTPToCandyCanes = AutoFarmTab:CreateToggle({
	Name = "Auto Farm Candy Canes",
	CurrentValue = false,
	Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(bool)
        _G.SettingsTable.FarmCandyCanes = bool
        if bool then
            AutoFarmCandyCanes()
        end
	end,
})

-- Egg Farming
local AutoHatchEggSection = EggFarmingTab:CreateSection("Auto Hatch Egg")
local EggsLabel = EggFarmingTab:CreateLabel("Eggs Hatched:")
local ChooseEggToHatch = EggFarmingTab:CreateInput({
	Name = "Choose Egg:",
	PlaceholderText = "Type The Name Of The Egg",
	RemoveTextAfterFocusLost = false,
	Callback = function(EggTypetxt)
		_G.SettingsTable.EggType = EggTypetxt
	end,
})
local QuadOrMultiEggHatch = EggFarmingTab:CreateToggle({
	Name = "Quad/Multi Egg Hatch",
	CurrentValue = false,
	Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(bool)
        _G.SettingsTable.MultiHatchVariable = bool
        if _G.SettingsTable.MultiHatchVariable then
            _G.SettingsTable.MultiHatch = "Buy3"
        else
            _G.SettingsTable.MultiHatch = "Buy1"
        end
	end,
})
local StartHatchingEgg = EggFarmingTab:CreateToggle({
	Name = "Start Hatching Egg",
	CurrentValue = false,
	Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(bool)
        _G.SettingsTable.BuyEgg = bool
        if bool then
            HatchEgg()
        end
	end,
})
local TeleportToEggSection = EggFarmingTab:CreateSection("Teleport To Egg")
local ChooseEggToTpTo = EggFarmingTab:CreateInput({
	Name = "Choose Egg:",
	PlaceholderText = "Type The Name Of The Egg",
	RemoveTextAfterFocusLost = false,
	Callback = function(TpTypetxt)
		_G.SettingsTable.EggTP = TpTypetxt
	end,
})
local TeleportToEgg = EggFarmingTab:CreateToggle({
	Name = "Teleport To Egg",
	CurrentValue = false,
	Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(bool)
        _G.SettingsTable.TeleportToTheEgg = bool
        if bool then
            TeleportToEgg()
        end
	end,
})

function LoadSettingsTableSettings()
    local HttpService = game:GetService("HttpService")
    if (readfile and isfile and isfile(SettingsTableName)) then
        _G.SettingsTable = HttpService:JSONDecode(readfile(SettingsTableName))
        AutoBubble:Set(_G.SettingsTable.AutoBubble)
        QuadOrMultiEggHatch:Set(_G.SettingsTable.MultiHatchVariable)
        StartHatchingEgg:Set(_G.SettingsTable.BuyEgg)
        TeleportToEgg:Set(_G.SettingsTable.TeleportToTheEgg)
        AutoTPToCandyCanes:Set(_G.SettingsTable.FarmCandyCanes)
        print("Settings: Loaded")
        game.StarterGui:SetCore(
            "SendNotification",
        {
        Title = "SUCCESS!",
        Text = "Settings Have Been Loaded",
        Duration = 5
        }
        )
    else
        if not isfile(SettingsTableName) then
            print("Settings: None Found")
            game.StarterGui:SetCore(
                "SendNotification",
            {
            Title = "ERROR",
            Text = "Settings Not Found",
            Duration = 5
            }
            )
        end
end
end

LoadSettingsTableSettings()

-- Settings
local SettingsSection = SettingsTab:CreateSection("Setting Options (Settings Save Per Account)")
local SeeCurrentSettings = SettingsTab:CreateButton({
	Name = "See Your Current Settings (Type /console in chat)",
	Callback = function()
        print("---CURRENT SETTINGS---")
        for i,v in pairs(_G.SettingsTable) do
            print(i,v)
        end
        print("----------------------")
	end,
})
local SaveCurrentSettings = SettingsTab:CreateButton({
	Name = "Save Your Current Settings",
	Callback = function()
        SaveSettingsTableSettings()
	end,
})
local LoadSavedSettings = SettingsTab:CreateButton({
	Name = "Load Your Saved Settings",
	Callback = function()
        LoadSettingsTableSettings()
	end,
})

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
    count = game:GetService("Players")[username].leaderstats.EggsOpened.Value
    EggsLabel:Set("Eggs Hatched: " .. abb(count))
end
