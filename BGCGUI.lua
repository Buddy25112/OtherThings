-- Settings
_G.SettingsTable = {
    AutoBubble = false;
    EggType = "";
    EggTP = "";
    BuyEgg = false;
    MultiHatch = false;
    TpToEgg = false;
    TeleportToTheEgg = false;
    AutoClaimRewards = false;
    AutoSpinWheel = false;
    AutoBuyFastHatch = false;
    Auto3xShiny = false;
    AutoBuyLuck = false;
    AutoBuy2xDiamonds = false;
    AutoBuyGodlyLuck = false;
    AutoBuy2xCoins = false;
    AutoEnableFastHatch = false;
    AutoEnable3xShiny = false;
    AutoEnableLuck = false;
    AutoEnable2xDiamonds = false;
    AutoEnableGodlyLuck = false;
    AutoEnable2xCoins = false;
}

_G.SecretsList = {
    TotalSecretsHatched = 0;
}

-- Locals
local username = game:GetService("Players").LocalPlayer.Name
local SecretsListName = username .. "_SecretsList_BGC.txt"
local SettingsTableName = username .. "_Settings_BGC.txt"
local Headers = {["content-type"] = "application/json"}
local Chat = game:GetService("Players").LocalPlayer.PlayerGui.Chat.Frame.ChatChannelParentFrame["Frame_MessageLogDisplay"].Scroller


-- Functions
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
    else
        json = HttpService:JSONEncode(_G.SecretsList)
        writefile(SecretsListName, json)
    end
end

function AutoBubbles()
    spawn(function()
        while wait() do 
            if not _G.SettingsTable.AutoBubble then break end
            local args = {
                [1] = {
                    [1] = {
                        [1] = false
                    },
                    [2] = {
                        [1] = 2
                    }
                }
            }
            game:GetService("ReplicatedStorage").Remotes:FindFirstChild("blow bubble"):FireServer(unpack(args))
        end
    end)
end

function AutoRewards()
    spawn(function()
        while wait() do 
            if not _G.SettingsTable.AutoClaimRewards then break end
            local args = {
                [1] = {
                    [1] = {
                        [1] = false
                    },
                    [2] = {
                        [1] = 2
                    }
                }
            }
            game:GetService("ReplicatedStorage").Remotes:FindFirstChild("get group rewards"):InvokeServer(unpack(args))
        end
    end)
end

function AutoWheel()
    spawn(function()
        while wait() do 
            if not _G.SettingsTable.AutoSpinWheel then break end
            local args = {
                [1] = {
                    [1] = {
                        [1] = false
                    },
                    [2] = {
                        [1] = 2
                    }
                }
            }
            game:GetService("ReplicatedStorage").Remotes:FindFirstChild("free wheel spin"):InvokeServer(unpack(args))
            local args = {
                [1] = {
                    [1] = {
                        [1] = false
                    },
                    [2] = {
                        [1] = 2
                    }
                }
            } 
            game:GetService("ReplicatedStorage").Remotes:FindFirstChild("free event wheel spin"):InvokeServer(unpack(args))
        end
    end)
end

function AutoBuyFastHatchBoost()
    spawn(function()
        while wait(1) do 
            if not _G.SettingsTable.AutoBuyFastHatch then break end
            local args = {
                [1] = {
                    [1] = {
                        [1] = "Fast Hatch"
                    },
                    [2] = {
                        [1] = false
                    }
                }
            }
            game:GetService("ReplicatedStorage").Remotes:FindFirstChild("buy merchant item"):FireServer(unpack(args))
        end
    end)
end

function AutoBuySuperLuckyBoost()
    spawn(function()
        while wait(1) do 
            if not _G.SettingsTable.AutoBuyLuck then break end
            local args = {
                [1] = {
                    [1] = {
                        [1] = "Super Lucky"
                    },
                    [2] = {
                        [1] = false
                    }
                }
            }
            game:GetService("ReplicatedStorage").Remotes:FindFirstChild("buy merchant item"):FireServer(unpack(args))
        end
    end)
end
function AutoBuyGodlyLuckyBoost()
    spawn(function()
        while wait(1) do 
            if not _G.SettingsTable.AutoBuyGodlyLuck then break end
            local args = {
                [1] = {
                    [1] = {
                        [1] = "Godly Luck"
                    },
                    [2] = {
                        [1] = false
                    }
                }
            }
            game:GetService("ReplicatedStorage").Remotes:FindFirstChild("buy merchant item"):FireServer(unpack(args))
        end
    end)
end

function AutoBuy3xShinyBoost()
    spawn(function()
        while wait(1) do 
            if not _G.SettingsTable.Auto3xShiny then break end
            local args = {
                [1] = {
                    [1] = {
                        [1] = "3x Shiny Luck"
                    },
                    [2] = {
                        [1] = false
                    }
                }
            }
            game:GetService("ReplicatedStorage").Remotes:FindFirstChild("buy merchant item"):FireServer(unpack(args))
        end
    end)
end

function AutoBuy2xDiamondsBoost()
    spawn(function()
        while wait(1) do 
            if not _G.SettingsTable.AutoBuy2xDiamonds then break end
            local args = {
                [1] = {
                    [1] = {
                        [1] = "2x Diamonds"
                    },
                    [2] = {
                        [1] = false
                    }
                }
            }
            game:GetService("ReplicatedStorage").Remotes:FindFirstChild("buy merchant item"):FireServer(unpack(args))
        end
    end)
end

function AutoBuy2xCoinsBoost()
    spawn(function()
        while wait(1) do 
            if not _G.SettingsTable.AutoBuy2xCoins then break end
            local args = {
                [1] = {
                    [1] = {
                        [1] = "2x Coins"
                    },
                    [2] = {
                        [1] = false
                    }
                }
            }
            game:GetService("ReplicatedStorage").Remotes:FindFirstChild("buy merchant item"):FireServer(unpack(args))
        end
    end)
end

function AutoEnableFastHatchBoost()
    spawn(function()
        while wait(1) do 
            if not _G.SettingsTable.AutoEnableFastHatch then break end
            local args = {
                [1] = {
                    [1] = {
                        [1] = "Fast Hatch"
                    },
                    [2] = {
                        [1] = false
                    }
                }
            }
            game:GetService("ReplicatedStorage").Remotes:FindFirstChild("activate boost"):FireServer(unpack(args))
        end
    end)
end

function AutoEnableSuperLuckyBoost()
    spawn(function()
        while wait(1) do 
            if not _G.SettingsTable.AutoEnableLuck then break end
            local args = {
                [1] = {
                    [1] = {
                        [1] = "Super Lucky"
                    },
                    [2] = {
                        [1] = false
                    }
                }
            }
            game:GetService("ReplicatedStorage").Remotes:FindFirstChild("activate boost"):FireServer(unpack(args))
        end
    end)
end
function AutoEnableGodlyLuckyBoost()
    spawn(function()
        while wait(1) do 
            if not _G.SettingsTable.AutoEnableGodlyLuck then break end
            local args = {
                [1] = {
                    [1] = {
                        [1] = "Godly Luck"
                    },
                    [2] = {
                        [1] = false
                    }
                }
            }
            game:GetService("ReplicatedStorage").Remotes:FindFirstChild("activate boost"):FireServer(unpack(args))
        end
    end)
end

function AutoEnable3xShinyBoost()
    spawn(function()
        while wait(1) do 
            if not _G.SettingsTable.AutoEnable3xShiny then break end
            local args = {
                [1] = {
                    [1] = {
                        [1] = "3x Shiny Luck"
                    },
                    [2] = {
                        [1] = false
                    }
                }
            }
            game:GetService("ReplicatedStorage").Remotes:FindFirstChild("activate boost"):FireServer(unpack(args))
        end
    end)
end

function AutoEnable2xDiamondsBoost()
    spawn(function()
        while wait(1) do 
            if not _G.SettingsTable.AutoEnable2xDiamonds then break end
            local args = {
                [1] = {
                    [1] = {
                        [1] = "2x Diamonds"
                    },
                    [2] = {
                        [1] = false
                    }
                }
            }
            game:GetService("ReplicatedStorage").Remotes:FindFirstChild("activate boost"):FireServer(unpack(args))
        end
    end)
end

function AutoEnable2xCoinsBoost()
    spawn(function()
        while wait(1) do 
            if not _G.SettingsTable.AutoEnable2xCoins then break end
            local args = {
                [1] = {
                    [1] = {
                        [1] = "2x Coins"
                    },
                    [2] = {
                        [1] = false
                    }
                }
            }
            game:GetService("ReplicatedStorage").Remotes:FindFirstChild("activate boost"):FireServer(unpack(args))
        end
    end)
end

function HatchEgg()
    spawn(function()
        while wait(1) do 
            if not _G.SettingsTable.BuyEgg then break end
            if _G.SettingsTable.MultiHatch then
                local args = {
                    [1] = {
                        [1] = {
                            [1] = _G.SettingsTable.EggType,
                            [2] = true
                        },
                        [2] = {
                            [1] = false,
                            [2] = false
                        }
                    }
                }
                game:GetService("ReplicatedStorage").Remotes:FindFirstChild("buy egg"):InvokeServer(unpack(args))
            else
                local args = {
                    [1] = {
                        [1] = {
                            [1] = _G.SettingsTable.EggType
                        },
                        [2] = {
                            [1] = false
                        }
                    }
                }
                game:GetService("ReplicatedStorage").Remotes:FindFirstChild("buy egg"):InvokeServer(unpack(args))
            end
        end
    end)
end

function TPToEgg()
    spawn(function()
        local Player = game.Players.LocalPlayer
        Player.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").MAP.Eggs[_G.SettingsTable.EggTP].SignFrame.CFrame
    end)
end



LoadSettingsSecretsList()
local SecretsHatched
Chat.ChildAdded:Connect(function(instance)
    if string.find(instance.TextLabel.Text,"OMG!") then
            if string.find(instance.TextLabel.Text,"hatched") then
                if string.find(instance.TextLabel.Text,"a") then
                        if string.find(instance.TextLabel.Text, game:GetService("Players").LocalPlayer.Name) then
                            if string.find(instance.TextLabel.Text, "SECRET") then
                                LoadSettingsSecretsList()
                                SecretsHatched = _G.SecretsList.TotalSecretsHatched + 1
                                _G.SecretsList.TotalSecretsHatched = SecretsHatched
                                SaveSettingsSecretsList()
                    end
                end
            end
        end
    end
end)

local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()
local Window = Rayfield:CreateWindow({
	Name = "Hatchers Hub | Bubble Gum Clicker | Version 1.0.0",
	LoadingTitle = "Bubble Legends GUI",
	LoadingSubtitle = "By PetSimulatorXPlayer",
	ConfigurationSaving = {
		Enabled = false,
		FolderName = "Hatchers Hub MS2", -- Create a custom folder for your hub/game
		FileName = "_Settings_MS2.txt"
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
local CreditsSection = CreditsTab:CreateSection("------------------------------- Hatchers Hub BGC -------------------------------")
local CreditsSection1 = CreditsTab:CreateSection("Creator/Dev: PetSimulatorXPlayer#5011")
local CreditsSection2 = CreditsTab:CreateSection("Helper: Cor#0002")
local CreditsSection3 = CreditsTab:CreateSection("Helper: wYn#0001 (Youtube Guides)")
local CreditsSection4 = CreditsTab:CreateSection("⚠️ Saved Settings Will Auto Load When Executed ⚠️")
local CreditsSection5 = CreditsTab:CreateSection("--------------------------------------------------------------------------------------")
local CreditsSection6 = CreditsTab:CreateSection("Last Updated: 2023-03-15")
local CreditsSection7 = CreditsTab:CreateSection("Last Update: Release!")
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
	Name = "Auto Bubble",
	CurrentValue = false,
	Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(bool)
        _G.SettingsTable.AutoBubble = bool
        if bool then
            AutoBubbles()
        end
	end,
})
local AutoClaimSpawnRewards = AutoFarmTab:CreateToggle({
	Name = "Auto Claim Rewards",
	CurrentValue = false,
	Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(bool)
        _G.SettingsTable.AutoClaimRewards = bool
        if bool then
            AutoRewards()
        end
	end,
})
local AutoSpinAllWheels = AutoFarmTab:CreateToggle({
	Name = "Auto Spin All Wheels",
	CurrentValue = false,
	Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(bool)
        _G.SettingsTable.AutoSpinWheel = bool
        if bool then
            AutoWheel()
        end
	end,
})


local AutoFarmSelection = AutoFarmTab:CreateSection("Auto Merchant")
local AutoBuyFastHatch = AutoFarmTab:CreateToggle({
	Name = "Auto Buy Fast Hatch",
	CurrentValue = false,
	Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(bool)
        _G.SettingsTable.AutoBuyFastHatch = bool
        if bool then
            AutoBuyFastHatchBoost()
        end
	end,
})
local AutoBuySuperLucky = AutoFarmTab:CreateToggle({
	Name = "Auto Buy Super Lucky",
	CurrentValue = false,
	Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(bool)
        _G.SettingsTable.AutoBuyLuck = bool
        if bool then
            AutoBuySuperLuckyBoost()
        end
	end,
})
local AutoBuyGodlyLuck = AutoFarmTab:CreateToggle({
	Name = "Auto Buy Godly Luck",
	CurrentValue = false,
	Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(bool)
        _G.SettingsTable.AutoBuyGodlyLuck = bool
        if bool then
            AutoBuyGodlyLuckyBoost()
        end
	end,
})
local AutoBuy3xShiny = AutoFarmTab:CreateToggle({
	Name = "Auto Buy 3x Shiny",
	CurrentValue = false,
	Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(bool)
        _G.SettingsTable.Auto3xShiny = bool
        if bool then
            AutoBuy3xShinyBoost()
        end
	end,
})
local AutoBuy2xDiamonds = AutoFarmTab:CreateToggle({
	Name = "Auto Buy 2x Diamonds",
	CurrentValue = false,
	Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(bool)
        _G.SettingsTable.AutoBuy2xDiamonds = bool
        if bool then
            AutoBuy2xDiamondsBoost()
        end
	end,
})
local AutoBuy2xCoins = AutoFarmTab:CreateToggle({
	Name = "Auto Buy 2x Coins",
	CurrentValue = false,
	Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(bool)
        _G.SettingsTable.AutoBuy2xCoins = bool
        if bool then
            AutoBuy2xCoinsBoost()
        end
	end,
})


local AutoFarmSelection = AutoFarmTab:CreateSection("Auto Enable Boosts")
local AutoEnableFastHatch = AutoFarmTab:CreateToggle({
	Name = "Auto Enable Fast Hatch",
	CurrentValue = false,
	Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(bool)
        _G.SettingsTable.AutoEnableFastHatch = bool
        if bool then
            AutoEnableFastHatchBoost()
        end
	end,
})
local AutoEnableSuperLucky = AutoFarmTab:CreateToggle({
	Name = "Auto Enable Super Lucky",
	CurrentValue = false,
	Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(bool)
        _G.SettingsTable.AutoEnableLuck = bool
        if bool then
            AutoEnableSuperLuckyBoost()
        end
	end,
})
local AutoEnableGodlyLuck = AutoFarmTab:CreateToggle({
	Name = "Auto Enable Godly Luck",
	CurrentValue = false,
	Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(bool)
        _G.SettingsTable.AutoEnableGodlyLuck = bool
        if bool then
            AutoEnableGodlyLuckyBoost()
        end
	end,
})
local AutoEnable3xShiny = AutoFarmTab:CreateToggle({
	Name = "Auto Enable 3x Shiny",
	CurrentValue = false,
	Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(bool)
        _G.SettingsTable.AutoEnable3xShiny = bool
        if bool then
            AutoEnable3xShinyBoost()
        end
	end,
})
local AutoEnable2xDiamonds = AutoFarmTab:CreateToggle({
	Name = "Auto Enable 2x Diamonds",
	CurrentValue = false,
	Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(bool)
        _G.SettingsTable.AutoEnable2xDiamonds = bool
        if bool then
            AutoEnable2xDiamondsBoost()
        end
	end,
})
local AutoEnable2xCoins = AutoFarmTab:CreateToggle({
	Name = "Auto Enable 2x Coins",
	CurrentValue = false,
	Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(bool)
        _G.SettingsTable.AutoEnable2xCoins = bool
        if bool then
            AutoEnable2xCoinsBoost()
        end
	end,
})

local EggFarmingSelection = EggFarmingTab:CreateSection("Egg Settings")
local EggFarmingParagraph = EggFarmingTab:CreateParagraph({
    Title = "Current Egg Settings", 
    Content = "Eggs Hatched: \nSecrets Hatched: " .. _G.SecretsList.TotalSecretsHatched .. "\nCurrent Egg: " .. _G.SettingsTable.EggType
})
local ChooseEggToHatchDropdown = EggFarmingTab:CreateDropdown({
	Name = "Choose Egg: (Dropdown)",
	Options = {"Common Egg", "Spotted Egg", "Safe Egg", "Magma Egg", "Void Egg", "Lantern Egg", "Galaxy Egg", "Frosted Egg", "Banana Bandana on Nana Egg", "Nightmare Egg", "Season 2 Egg", "St. Patrick's 2023 Egg", "Goldfish Egg", "Pineapple Egg", "Snail Egg"},
	CurrentOption = "Common Egg",
	Flag = "Dropdown1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(EggTypetxt)
        _G.SettingsTable.EggType = EggTypetxt
        _G.SettingsTable.EggTP = EggTypetxt
	end,
})
local QuadOrMultiEggHatch = EggFarmingTab:CreateToggle({
	Name = "Multi Egg Hatch",
	CurrentValue = false,
	Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(bool)
        _G.SettingsTable.MultiHatch = bool
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
local TeleportToEgg = EggFarmingTab:CreateButton({
	Name = "Auto Teleport To Egg",
	Callback = function()
        _G.SettingsTable.TpToEgg = true
        if _G.SettingsTable.TpToEgg then
            TPToEgg()
        end
	end,
})



function LoadSettingsTableSettings()
    local HttpService = game:GetService("HttpService")
    if (readfile and isfile and isfile(SettingsTableName)) then
        _G.SettingsTable = HttpService:JSONDecode(readfile(SettingsTableName))
        AutoBuy2xDiamonds:Set(_G.SettingsTable.AutoBuy2xDiamonds)
        AutoBuy2xCoins:Set(_G.SettingsTable.AutoBuy2xCoins)
        AutoBuy3xShiny:Set(_G.SettingsTable.Auto3xShiny)
        AutoBuyGodlyLuck:Set(_G.SettingsTable.AutoBuyGodlyLuck)
        AutoBuySuperLucky:Set(_G.SettingsTable.AutoBuyLuck)
        AutoBuyFastHatch:Set(_G.SettingsTable.AutoBuyFastHatch)
        AutoSpinAllWheels:Set(_G.SettingsTable.AutoSpinWheel)
        AutoClaimSpawnRewards:Set(_G.SettingsTable.AutoClaimRewards)
        AutoBubble:Set(_G.SettingsTable.AutoBubble)
        AutoEnableFastHatch:Set(_G.SettingsTable.AutoEnableFastHatch)
        AutoEnableSuperLucky:Set(_G.SettingsTable.AutoEnableLuck)
        AutoEnableGodlyLuck:Set(_G.SettingsTable.AutoEnableGodlyLuck)
        AutoEnable3xShiny:Set(_G.SettingsTable.AutoEnable3xShiny)
        AutoEnable2xDiamonds:Set(_G.SettingsTable.AutoEnable2xDiamonds)
        AutoEnable2xCoins:Set(_G.SettingsTable.AutoEnable2xCoins)
        ChooseEggToHatchDropdown:Set(_G.SettingsTable.EggType)
        StartHatchingEgg:Set(_G.SettingsTable.BuyEgg)
        QuadOrMultiEggHatch:Set(_G.SettingsTable.MultiHatch)
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

if _G.SettingsTable.TpToEgg then
    TPToEgg()
end

-- Setting Stuff
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

while wait() do
    local plr = game.Players.LocalPlayer
    local count = 0
    count = game:GetService("Players")[username].leaderstats.Eggs.Value
    EggFarmingParagraph:Set({Title = "Current Egg Data", Content = "Eggs Hatched: " ..abb(count).. "\nSecrets Hatched: " .. _G.SecretsList.TotalSecretsHatched .. "\nCurrent Egg: " .. _G.SettingsTable.EggType})
end
