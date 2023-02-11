
_G.SettingsTable = {
    AutoBubble = false;
    EggType = "";
    MultiHatch = "";
    MultiHatchVariable = false;
    EggTP = "";
    TeleportToTheEgg = false;
    FarmCandyCanes1 = false;
    FPSSettings = 60;
    FarmCandyCanes2 = false;
}
 
-- 18 Second Respawn
local newCFrame1 = CFrame.new(-369.354, 167.961, 1773.74) -- Chest
local newCFrame2 = CFrame.new(-358.608, 157.198, 1810.09) -- Chest
local newCFrame3 = CFrame.new(-281.795, 157.218, 1731.59) -- Chest
local newCFrame4 = CFrame.new(-300.087, 157.198, 1804.74) -- Chest
local newCFrame5 = CFrame.new(-344.167, 157.283, 1753.79) -- Chest
local newCFrame6 = CFrame.new(-261.165, 157.198, 1766.69)  -- Chest
-- 1.2 Seconds

-- 8 Second Respawn
local newCFrame7 = CFrame.new(-332.154, 157.245, 1720.59) -- Bag
local newCFrame8 = CFrame.new(-318.449, 157.245, 1789.62) -- Bag
local newCFrame9 = CFrame.new(-308.798, 157.245, 1776.9) -- Bag
local newCFrame10 = CFrame.new(-354.386, 157.245, 1754.3) -- Bag
local newCFrame11 = CFrame.new(-292.125, 157.245, 1817.51) -- Bag
local newCFrame12 = CFrame.new(-295.208, 157.245, 1742.73) -- Bag
local newCFrame13 = CFrame.new(-383.468, 157.245, 1753.46) -- Bag
local newCFrame14 = CFrame.new(-276.062, 157.245, 1741.58) -- Bag
local newCFrame15 = CFrame.new(-336.96, 157.245, 1811.11) -- Bag
local newCFrame16 = CFrame.new(-271.596, 157.245, 1798.72) -- Bag
local newCFrame17 = CFrame.new(-496.291, 668.439, 1823.41) -- Bag
local newCFrame18 = CFrame.new(-478.391, 668.439, 1801.03) -- Bag
local newCFrame19 = CFrame.new(-435.63, 668.439, 1776.51) -- Bag
local newCFrame20 = CFrame.new(-438.759, 668.439, 1793.99) -- Bag
local newCFrame21 = CFrame.new(-423.72, 668.439, 1834.42) -- Bag
local newCFrame22 = CFrame.new(-402.772, 668.439, 1825.11) -- Bag
-- 4.4 Seconds | Loop1: 11.4 Seconds |  (3.2 Seconds)

-- 5 Second Respawn
local newCFrame23 = CFrame.new(-280.617, 155.606, 1832.61) -- Coin
local newCFrame24 = CFrame.new(-279.559, 155.606, 1814.09) -- Coin
local newCFrame25 = CFrame.new(-287.13, 155.606, 1811.41) -- Coin
local SmallFarm1 = CFrame.new(-265.579, 155.606, 1807.62) -- Coin
local SmallFarm2 = CFrame.new(-267.076, 155.606, 1790.47) -- Coin
local SmallFarm3 = CFrame.new(-281.391, 155.606, 1778.98) -- Coin
local SmallFarm4 = CFrame.new(-305.084, 155.606, 1753.5) -- Coin
local SmallFarm5 = CFrame.new(-316.383, 155.606, 1765.81) -- Coin
-- Loop2: 18.2
local SmallFarm6 = CFrame.new(-334.371, 155.606, 1767.5) -- Coin
local SmallFarm7 = CFrame.new(-339.169, 155.642, 1788.15) -- Coin
local SmallFarm8 = CFrame.new(-435.778, 666.8, 1856.29) -- Coin
local SmallFarm9 = CFrame.new(-476.166, 666.8, 1815.84) -- Coin
local SmallFarm10 = CFrame.new(-495.934, 666.8, 1797.06) -- Coin
local SmallFarm11 = CFrame.new(-413.963, 666.8, 1846.85) -- Coin
local SmallFarm12 = CFrame.new(-428.172, 666.8, 1821.31) -- Coin
local SmallFarm13 = CFrame.new(-452.567, 666.8, 1795.22) -- Coin
local SmallFarm14 = CFrame.new(-382.879, 666.8, 1842.74) -- Coin
local SmallFarm15 = CFrame.new(-381.074, 666.8, 1820.85) -- Coin
local SmallFarm16 = CFrame.new(-409.888, 666.8, 1802.9) -- Coin
-- 8.2 Seconds | Loop1: 15.2 Seconds (3.8 Seconds)

local SmallFarm17 = CFrame.new(-396.258, 666.8, 1790.04) -- Coin
local SmallFarm18 = CFrame.new(-422.975, 666.8, 1766.4) -- Coin
local SmallFarm19 = CFrame.new(-444.997, 666.8, 1780.7) -- Coin
local SmallFarm20 = CFrame.new(-464.293, 666.8, 1766.31) -- Coin
local SmallFarm21 = CFrame.new(-360.264, 189.35, 1729.05) -- Coin
local SmallFarm22 = CFrame.new(-368.506, 155.606, 1754.47) -- Coin
local SmallFarm23 = CFrame.new(-347.08, 155.606, 1703.47) -- Coin
-- 16.6 Seconds (1.2 Seconds)


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

function AutoFarmCandyCanes2()
    spawn(function()
        local Player = game.Players.LocalPlayer
        if Player.Character then
            -- 5 second wait time
            while wait(.2) do
                if not _G.SettingsTable.FarmCandyCanes1 then break end
                wait(.71)
                Player.Character.HumanoidRootPart.CFrame = SmallFarm1
                wait(.71)
                Player.Character.HumanoidRootPart.CFrame = SmallFarm2
                wait(.71)
                Player.Character.HumanoidRootPart.CFrame = SmallFarm3
                wait(.71)
                Player.Character.HumanoidRootPart.CFrame = SmallFarm4
                wait(.71)
                Player.Character.HumanoidRootPart.CFrame = SmallFarm5
                wait(.71)
                Player.Character.HumanoidRootPart.CFrame = SmallFarm6
                wait(.71)
                Player.Character.HumanoidRootPart.CFrame = SmallFarm7
            end
        end        
    end)
end

function AutoFarmCandyCanes1()
    spawn(function()
        local Player = game.Players.LocalPlayer
        if Player.Character then
            -- 5 second wait time
            while wait() do
                if not _G.SettingsTable.FarmCandyCanes2 then break end

                wait(.2)
                Player.Character.HumanoidRootPart.CFrame = newCFrame7 -- Bag
                wait(.2)
                Player.Character.HumanoidRootPart.CFrame = newCFrame8 -- Bag
                wait(.2)
                Player.Character.HumanoidRootPart.CFrame = newCFrame9 -- Bag
                wait(.2)
                Player.Character.HumanoidRootPart.CFrame = newCFrame10 -- Bag
                wait(.2)
                Player.Character.HumanoidRootPart.CFrame = newCFrame11 -- Bag
                wait(.2)
                Player.Character.HumanoidRootPart.CFrame = newCFrame12 -- Bag
                wait(.2)
                Player.Character.HumanoidRootPart.CFrame = newCFrame13 -- Bag
                wait(.2)
                Player.Character.HumanoidRootPart.CFrame = newCFrame14 -- Bag
                wait(.2)
                Player.Character.HumanoidRootPart.CFrame = newCFrame15 -- Bag
                wait(.2)
                Player.Character.HumanoidRootPart.CFrame = newCFrame16 -- Bag
                wait(.2)
                Player.Character.HumanoidRootPart.CFrame = newCFrame17 -- Bag
                wait(.2)
                Player.Character.HumanoidRootPart.CFrame = newCFrame18 -- Bag
                wait(.2)
                Player.Character.HumanoidRootPart.CFrame = newCFrame19 -- Bag
                wait(.2)
                Player.Character.HumanoidRootPart.CFrame = newCFrame20 -- Bag
                wait(.2)
                Player.Character.HumanoidRootPart.CFrame = newCFrame21 -- Bag
                wait(.2)
                Player.Character.HumanoidRootPart.CFrame = newCFrame22 -- Bag

                wait(.2)
                Player.Character.HumanoidRootPart.CFrame = newCFrame1 -- Chest
                wait(.2)
                Player.Character.HumanoidRootPart.CFrame = newCFrame2 -- Chest
                wait(.2)
                Player.Character.HumanoidRootPart.CFrame = newCFrame3 -- Chest
                wait(.2)
                Player.Character.HumanoidRootPart.CFrame = newCFrame4 -- Chest
                wait(.2)
                Player.Character.HumanoidRootPart.CFrame = newCFrame5 -- Chest
                wait(.2)
                Player.Character.HumanoidRootPart.CFrame = newCFrame6 -- Chest

                wait(.2)
                Player.Character.HumanoidRootPart.CFrame = newCFrame23 -- Coin
                wait(.2)
                Player.Character.HumanoidRootPart.CFrame = newCFrame24 -- Coin
                wait(.2)
                Player.Character.HumanoidRootPart.CFrame = newCFrame25 -- Coin
                wait(.2)
                Player.Character.HumanoidRootPart.CFrame = SmallFarm1 -- Coin
                wait(.2)
                Player.Character.HumanoidRootPart.CFrame = SmallFarm2 -- Coin
                wait(.2)
                Player.Character.HumanoidRootPart.CFrame = SmallFarm3 -- Coin
                wait(.2)
                Player.Character.HumanoidRootPart.CFrame = SmallFarm4 -- Coin
                wait(.2)
                Player.Character.HumanoidRootPart.CFrame = SmallFarm5 -- Coin
                wait(.2)
                Player.Character.HumanoidRootPart.CFrame = SmallFarm6 -- Coin
                wait(.2)
                Player.Character.HumanoidRootPart.CFrame = SmallFarm7 -- Coin
                wait(.2)
                Player.Character.HumanoidRootPart.CFrame = SmallFarm8 -- Coin
                wait(.2)
                Player.Character.HumanoidRootPart.CFrame = SmallFarm9 -- Coin
                wait(.2)
                Player.Character.HumanoidRootPart.CFrame = SmallFarm10 -- Coin
                wait(.2)
                Player.Character.HumanoidRootPart.CFrame = SmallFarm11 -- Coin
                wait(.2)
                Player.Character.HumanoidRootPart.CFrame = SmallFarm12 -- Coin
                wait(.2)
                Player.Character.HumanoidRootPart.CFrame = SmallFarm13 -- Coin
                wait(.2)
                Player.Character.HumanoidRootPart.CFrame = SmallFarm14 -- Coin
                wait(.2)
                Player.Character.HumanoidRootPart.CFrame = SmallFarm15 -- Coin
                wait(.2)
                Player.Character.HumanoidRootPart.CFrame = SmallFarm16 -- Coin

                wait(.2)
                Player.Character.HumanoidRootPart.CFrame = newCFrame7 -- Bag
                wait(.2)
                Player.Character.HumanoidRootPart.CFrame = newCFrame8 -- Bag
                wait(.2)
                Player.Character.HumanoidRootPart.CFrame = newCFrame9 -- Bag
                wait(.2)
                Player.Character.HumanoidRootPart.CFrame = newCFrame10 -- Bag
                wait(.2)
                Player.Character.HumanoidRootPart.CFrame = newCFrame11 -- Bag
                wait(.2)
                Player.Character.HumanoidRootPart.CFrame = newCFrame12 -- Bag
                wait(.2)
                Player.Character.HumanoidRootPart.CFrame = newCFrame13 -- Bag
                wait(.2)
                Player.Character.HumanoidRootPart.CFrame = newCFrame14 -- Bag
                wait(.2)
                Player.Character.HumanoidRootPart.CFrame = newCFrame15 -- Bag
                wait(.2)
                Player.Character.HumanoidRootPart.CFrame = newCFrame16 -- Bag
                wait(.2)
                Player.Character.HumanoidRootPart.CFrame = newCFrame17 -- Bag
                wait(.2)
                Player.Character.HumanoidRootPart.CFrame = newCFrame18 -- Bag
                wait(.2)
                Player.Character.HumanoidRootPart.CFrame = newCFrame19 -- Bag
                wait(.2)
                Player.Character.HumanoidRootPart.CFrame = newCFrame20 -- Bag
                wait(.2)
                Player.Character.HumanoidRootPart.CFrame = newCFrame21 -- Bag
                wait(.2)
                Player.Character.HumanoidRootPart.CFrame = newCFrame22 -- Bag

                wait(.2)
                Player.Character.HumanoidRootPart.CFrame = newCFrame23 -- Coin
                wait(.2)
                Player.Character.HumanoidRootPart.CFrame = newCFrame24 -- Coin
                wait(.2)
                Player.Character.HumanoidRootPart.CFrame = newCFrame25 -- Coin
                wait(.2)
                Player.Character.HumanoidRootPart.CFrame = SmallFarm1 -- Coin
                wait(.2)
                Player.Character.HumanoidRootPart.CFrame = SmallFarm2 -- Coin
                wait(.2)
                Player.Character.HumanoidRootPart.CFrame = SmallFarm3 -- Coin
                wait(.2)
                Player.Character.HumanoidRootPart.CFrame = SmallFarm4 -- Coin
                wait(.2)
                Player.Character.HumanoidRootPart.CFrame = SmallFarm5 -- Coin
                wait(.2)
                Player.Character.HumanoidRootPart.CFrame = SmallFarm6 -- Coin
                wait(.2)
                Player.Character.HumanoidRootPart.CFrame = SmallFarm7 -- Coin
                wait(.2)
                Player.Character.HumanoidRootPart.CFrame = SmallFarm8 -- Coin
                wait(.2)
                Player.Character.HumanoidRootPart.CFrame = SmallFarm9 -- Coin
                wait(.2)
                Player.Character.HumanoidRootPart.CFrame = SmallFarm10 -- Coin
                wait(.2)
                Player.Character.HumanoidRootPart.CFrame = SmallFarm11 -- Coin
                wait(.2)
                Player.Character.HumanoidRootPart.CFrame = SmallFarm12 -- Coin
                wait(.2)
                Player.Character.HumanoidRootPart.CFrame = SmallFarm13 -- Coin
                wait(.2)
                Player.Character.HumanoidRootPart.CFrame = SmallFarm14 -- Coin
                wait(.2)
                Player.Character.HumanoidRootPart.CFrame = SmallFarm15 -- Coin
                wait(.2)
                Player.Character.HumanoidRootPart.CFrame = SmallFarm16 -- Coin
                wait(.2)
                Player.Character.HumanoidRootPart.CFrame = SmallFarm17 -- Coin
                wait(.2)
                Player.Character.HumanoidRootPart.CFrame = SmallFarm18 -- Coin
                wait(.2)
                Player.Character.HumanoidRootPart.CFrame = SmallFarm19 -- Coin
                wait(.2)
                Player.Character.HumanoidRootPart.CFrame = SmallFarm20 -- Coin
                wait(.2)
                Player.Character.HumanoidRootPart.CFrame = SmallFarm21 -- Coin
                wait(.2)
                Player.Character.HumanoidRootPart.CFrame = SmallFarm22 -- Coin
                wait(.2)
                Player.Character.HumanoidRootPart.CFrame = SmallFarm23 -- Coin

                wait(.2)
                Player.Character.HumanoidRootPart.CFrame = newCFrame23 -- Coin
                wait(.2)
                Player.Character.HumanoidRootPart.CFrame = newCFrame24 -- Coin
                wait(.2)
                Player.Character.HumanoidRootPart.CFrame = newCFrame25 -- Coin
                wait(.2)
                Player.Character.HumanoidRootPart.CFrame = SmallFarm1 -- Coin
                wait(.2)
                Player.Character.HumanoidRootPart.CFrame = SmallFarm2 -- Coin
                wait(.2)
                Player.Character.HumanoidRootPart.CFrame = SmallFarm3 -- Coin
                wait(.2)
                Player.Character.HumanoidRootPart.CFrame = SmallFarm4 -- Coin
                wait(.2)
                Player.Character.HumanoidRootPart.CFrame = SmallFarm5 -- Coin

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

function SetFPSValue()
    spawn(function()
        setfpscap(_G.SettingsTable.FPSSettings)
    end)
end

function AutoBubbles()
    spawn(function()
        while wait(.3) do
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
local CreditsSection6 = CreditsTab:CreateSection("Last Updated: 2022-12-19")
local CreditsSection7 = CreditsTab:CreateSection("Last Update: Added FPS Setting")
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
local AutoFarmSelection = AutoFarmTab:CreateSection("Auto Settings")
local AutoBubble = AutoFarmTab:CreateToggle({
	Name = "Auto Bubble (0.3 sec Cooldown)",
	CurrentValue = false,
	Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(bool)
        _G.SettingsTable.AutoBubble = bool
        if bool then
            AutoBubbles()
        end
	end,
})
local AutoTPToCandyCanes1 = AutoFarmTab:CreateToggle({
	Name = "Auto Farm Carnival Tokens (OP FARM)",
	CurrentValue = false,
	Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(bool)
        _G.SettingsTable.FarmCandyCanes1 = bool
        if bool then
            AutoFarmCandyCanes2()
        end
	end,
})
local AutoTPToCandyCanes2 = AutoFarmTab:CreateToggle({
	Name = "Auto Farm Candy Canes (Less OP Farm)",
	CurrentValue = false,
	Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(bool)
        _G.SettingsTable.FarmCandyCanes2 = bool
        if bool then
            AutoFarmCandyCanes1()
        end
	end,
})
local FPSSection = AutoFarmTab:CreateSection("FPS Settings (Synapse Required)")
local ChooseFPSValue = AutoFarmTab:CreateInput({
	Name = "Choose FPS Value:",
	PlaceholderText = "Default = 60",
	RemoveTextAfterFocusLost = false,
	Callback = function(FPStxt)
		_G.SettingsTable.FPSSettings = FPStxt
	end,
})
local SetFPSValues = AutoFarmTab:CreateButton({
	Name = "Set FPS Value",
	Callback = function()
        SetFPSValue()
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
SetFPSValue()

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

