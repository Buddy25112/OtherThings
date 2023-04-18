-- Variables
_G.SettingsTable ={
    AutoClaimSeasonPass = true; -- claims the season pass and resets
    AutoCollectGifts = true; -- claims time gifts
    AutoBuyDailyShop = false;
    BuySpawnRewards = false; -- purchases all tier reward optional
    EggType = "Common Egg";
    EggAmount = "1";
    FPSSettings = "60";
    BuyEgg = false;
    TpToEgg = false;
    AutoBubble = false;
    AutoClaimRewards = false;
    AutoSpinWheel = false;
    AutoBuyFastHatch = false;
    Auto3xShiny = false;
    AutoBuyLuck = false;
    AutoBuy2xDiamonds = false;
    AutoBuyGodlyLuck = false;
    AutoBuy2xCoins = false;
    AutoBuyMegaLuck = false;
    AutoEnableFastHatch = false;
    AutoEnable3xShiny = false;
    AutoEnableLuck = false;
    AutoEnable2xDiamonds = false;
    AutoEnableGodlyLuck = false;
    AutoEnable2xCoins = false;
    AutoEnableMegaLuck = false;

}
_G.PlaceHolders = {
    AutoBubblePlaceHolder = "Deactivated";
    AutoClaimRewardsPlaceHolder = "Deactivated";
    AutoSpinWheelPlaceHolder = "Deactivated";
    AutoClaimSeasonPassPlaceHolder = "Deactivated";
    AutoCollectGiftsPlaceHolder = "Deactivated";
    AutoBuyDailyShopPlaceHolder = "Deactivated";

    AutoBuyFastHatchPlaceHolder = "Deactivated";
    Auto3xShinyPlaceHolder = "Deactivated";
    AutoBuyLuckPlaceHolder = "Deactivated";
    AutoBuy2xDiamondsPlaceHolder = "Deactivated";
    AutoBuyGodlyLuckPlaceHolder = "Deactivated";
    AutoBuy2xCoinsPlaceHolder = "Deactivated";
    AutoBuyMegaLuckPlaceHolder = "Deactivated";

    AutoEnableFastHatchPlaceHolder = "Deactivated";
    AutoEnable3xShinyPlaceHolder = "Deactivated";
    AutoEnableLuckPlaceHolder = "Deactivated";
    AutoEnable2xDiamondsPlaceHolder = "Deactivated";
    AutoEnableGodlyLuckPlaceHolder = "Deactivated";
    AutoEnable2xCoinsPlaceHolder = "Deactivated";
    AutoEnableMegaLuckPlaceHolder = "Deactivated";
}
_G.SecretsList = {
    TotalSecretsHatched = 0;
}

-- Locals
local Player = game.Players.LocalPlayer
local username = game:GetService("Players").LocalPlayer.Name
local Headers = {["content-type"] = "application/json"}
local SecretsListName = username .. "_SecretsList_BGC.txt"
local SettingsTableName = username .. "_Settings_BGC.txt"
local Chat = game:GetService("Players").LocalPlayer.PlayerGui.Chat.Frame.ChatChannelParentFrame["Frame_MessageLogDisplay"].Scroller

-- Create CFrames
local SpawnSpot1 = CFrame.new(-327.742, 4.78489, -564.431)
local SpawnSpot2 = CFrame.new(-401.855, 960.184, -554.231)
local SpawnSpot3 = CFrame.new(-421.495, 5200.34, -579.738)
local SpawnSpot4 = CFrame.new(-421.235, 11341.6, -571.611)
local SpawnSpot6 = CFrame.new(-398.307, 21343.5, -538.577)
local SpawnSpot7 = CFrame.new(-399.67, 33370.3, -521.087)
local SpawnSpot8 = CFrame.new(-400.24, 40970.3, -547.534)
local SpawnSpot9 = CFrame.new(-356.718, 50005.1, -576.011)
local AtlantisSpot1 = CFrame.new(44.3985, -21.0986, 1268.5)
local AtlantisSpot2 = CFrame.new(-3.2852, 1005.03, 1292.68)
local AtlantisSpot3 = CFrame.new(1.82895, 5005.04, 1287.26)
local AtlantisSpot4 = CFrame.new(1.42255, 12005.3, 1325.49)
local AtlantisSpot5 = CFrame.new(-1.80598, 25005, 1299)
local AtlantisSpot6 = CFrame.new(-1.80111, 35005, 1302.04)
local AtlantisSpot7 = CFrame.new(2.02123, 50094.9, 1308.29)

-- Get Eggs
local Spawn_World = game:GetService("ReplicatedStorage")["Game Objects"].Eggs["Spawn World"]
local Atlantis_World = game:GetService("ReplicatedStorage")["Game Objects"].Eggs["Atlantis"]
local Eggs = {}
for _, child in ipairs(Spawn_World:GetChildren()) do
    if child:IsA("Folder") then
        table.insert(Eggs, child)
    end
end
for _, child in ipairs(Atlantis_World:GetChildren()) do
    if child:IsA("Folder") then
        table.insert(Eggs, child)
    end
end
local EggOptions = {}
for _, egg in ipairs(Eggs) do
    table.insert(EggOptions, egg.Name)
end


-- Functions
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

function UnlockSpawnIslands()
    spawn(function()
        Player.Character.HumanoidRootPart.CFrame = SpawnSpot2
        wait(.5)
        Player.Character.HumanoidRootPart.CFrame = SpawnSpot3
        wait(.5)
        Player.Character.HumanoidRootPart.CFrame = SpawnSpot4
        wait(.5)
        Player.Character.HumanoidRootPart.CFrame = SpawnSpot6
        wait(.5)
        Player.Character.HumanoidRootPart.CFrame = SpawnSpot7
        wait(.5)
        Player.Character.HumanoidRootPart.CFrame = SpawnSpot8
        wait(.5)
        Player.Character.HumanoidRootPart.CFrame = SpawnSpot9
        wait(.5)
        Player.Character.HumanoidRootPart.CFrame = SpawnSpot1
    end)
end

function UnlockAtlantisIslands()
    spawn(function()
        Player.Character.HumanoidRootPart.CFrame = AtlantisSpot2
        wait(.5)
        Player.Character.HumanoidRootPart.CFrame = AtlantisSpot3
        wait(.5)
        Player.Character.HumanoidRootPart.CFrame = AtlantisSpot4
        wait(.5)
        Player.Character.HumanoidRootPart.CFrame = AtlantisSpot5
        wait(.5)
        Player.Character.HumanoidRootPart.CFrame = AtlantisSpot6
        wait(.5)
        Player.Character.HumanoidRootPart.CFrame = AtlantisSpot7
        wait(.5)
        Player.Character.HumanoidRootPart.CFrame = AtlantisSpot1
    end)
end

function BSpawnRewards()
    spawn(function()
    for i = 1, 100 do
        local args = {
            [1] = {
                [1] = {
                    [1] = "Spawn World"
                },
                [2] = {
                    [1] = false
                }
            }
        }
        game:GetService("ReplicatedStorage").Remotes:FindFirstChild("buy rewards"):FireServer(unpack(args))
        wait(.5)
    end
    end)
end

function DailyShop1()
    spawn(function()
    while _G.SettingsTable.AutoBuyDailyShop == true do
        local args = {
            [1] = {
                [1] = {
                    [1] = "Respect 1"
                },
                [2] = {
                    [1] = false
                }
            }
        }
        game:GetService("ReplicatedStorage").Remotes:FindFirstChild("buy daily shop item"):InvokeServer(unpack(args))
        local args = {
            [1] = {
                [1] = {
                    [1] = "Respect 2"
                 },
                [2] = {
                    [1] = false
                }
            }
         }
         game:GetService("ReplicatedStorage").Remotes:FindFirstChild("buy daily shop item"):InvokeServer(unpack(args))
         local args = {
            [1] = {
                [1] = {
                    [1] = "Respect 3"
                },
                [2] = {
                    [1] = false
                }
            }
        }
        game:GetService("ReplicatedStorage").Remotes:FindFirstChild("buy daily shop item"):InvokeServer(unpack(args))
        wait(10)
    end
    end)
end

function AutoClaimSeasonPass1()
    spawn(function()
    while _G.SettingsTable.AutoClaimSeasonPass == true do
        function ClaimSeasonPass()
            for i = 1, 23 do
                local args = {
                    [1] = {
                        [1] = {
                            [1] = tostring(i)
                        },
                        [2] = {
                            [1] = false
                        }
                    }
                }
                game:GetService("ReplicatedStorage").Remotes:FindFirstChild("claim pass prize"):FireServer(unpack(args))
            end
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
            game:GetService("ReplicatedStorage").Remotes:FindFirstChild("restart bubble pass"):FireServer(unpack(args))
        end
        ClaimSeasonPass()
    wait(600)
    end
    end)
end

function AutoCollectGifts1()
    spawn(function()
    while _G.SettingsTable.AutoCollectGifts == true do
        for i = 1, 12 do
            local args = {
                [1] = {
                    [1] = {
                        [1] = i
                    },
                    [2] = {
                        [1] = false
                    }
                }
            }
            game:GetService("ReplicatedStorage").Remotes:FindFirstChild("redeem free gift"):InvokeServer(unpack(args))
        end        
        game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = true
        wait(1)
        local player = game.Players.LocalPlayer
        local folder = game:GetService("Workspace").Stuff.Lootbags
        local distance = 0
        for _, object in ipairs(folder:GetDescendants()) do
            if object:IsA("BasePart") and not object.Anchored then
                object.CFrame = player.Character.HumanoidRootPart.CFrame + Vector3.new(0, distance, 0)
            end
        end
        wait(1)
        game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = false
    wait(300)
    end
    end)
end

function HatchEgg()
    spawn(function()
        while wait() do 
            if not _G.SettingsTable.BuyEgg then break end
            local args = {
                [1] = {
                    [1] = {
                        [1] = _G.SettingsTable.EggType,
                        [2] = tonumber(_G.SettingsTable.EggAmount)
                    },
                    [2] = {
                        [1] = false,
                        [2] = false
                    }
                }
            }
            game:GetService("ReplicatedStorage").Remotes:FindFirstChild("buy egg"):InvokeServer(unpack(args))
        end
    end)
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
function AutoBuyMegaLuckBoost()
    spawn(function()
        while wait(1) do 
            if not _G.SettingsTable.AutoBuyMegaLuck then break end
            local args = {
                [1] = {
                    [1] = {
                        [1] = "Mega Luck"
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

function AutoEnableMegaLuckBoost()
    spawn(function()
        while wait(1) do 
            if not _G.SettingsTable.AutoEnableMegaLuck then break end
            local args = {
                [1] = {
                    [1] = {
                        [1] = "Mega Luck"
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

function SetFPSValue()
    spawn(function()
        setfpscap(_G.SettingsTable.FPSSettings)
    end)
end

function TPToEgg()
    spawn(function()
        local Player = game.Players.LocalPlayer
        Player.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").MAP.Eggs[_G.SettingsTable.EggType].SignFrame.CFrame
    end)
end

-- GetSecretsHatched
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

local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/Buddy25112/OtherThings/main/RayfieldNotBroken.lua'))()

local Window = Rayfield:CreateWindow({
    Name = "Bubble Gum Clicker | By Hamter & AJ",
    LoadingTitle = "Loading...",
    LoadingSubtitle = "",
    ConfigurationSaving = {
        Enabled = false,
        FolderName = "BubbleGumClicker", -- Create a custom folder for your hub/game
        FileName = "BGC_ScriptSave"
    },
    Discord = {
        Enabled = false,
        Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ABCD would be ABCD.
        RememberJoins = true -- Set this to false to make them join the discord every time they load it up
    },
    KeySystem = false, -- Set this to true to use our key system
    KeySettings = {
        Title = "Title",
        Subtitle = "Subtitle",
        Note = "Note",
        FileName = "FileName",
        SaveKey = true,
        GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
        Key = "Hamter.AJ69"
    }
})


-- Hatching Section
local EggsTab = Window:CreateTab("🥚| Hatching")
local EggsSection = EggsTab:CreateSection("Eggs")
local EggFarmingParagraph = EggsTab:CreateParagraph({
    Title = "Current Egg Settings",
    Content = "Eggs Hatched: \nSecrets Hatched: \nCurrent Egg: \nEgg Amount: "
})
local EggsDropdown = EggsTab:CreateDropdown({
    Name = "🥚 Eggs",
    Options = EggOptions,
    CurrentOption = "Select an egg",
    MultipleOptions = false,
    Flag = "Dropdown1",
    Callback = function(EggTypeText)
        _G.SettingsTable.EggType = EggTypeText
    end
})

local MultiHatchDropdown = EggsTab:CreateDropdown({
    Name = "🐣 Number of eggs",
    Options = {"1", "2", "3", "4"},
    CurrentOption = "Select a number",
    MultipleOptions = false,
    Flag = "Dropdown1",
    Callback = function(NumberOfEggsText)
        _G.SettingsTable.EggAmount = NumberOfEggsText
    end
})

local StartHatchingEgg = EggsTab:CreateToggle({
	Name = "🥚 Start Hatching Egg",
	CurrentValue = false,
	Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(bool)
        _G.SettingsTable.BuyEgg = bool
        if bool then
            HatchEgg()
        end
	end,
})

local TeleportToEgg = EggsTab:CreateButton({
	Name = "🚙 Auto Teleport To Egg",
	Callback = function()
        _G.SettingsTable.TpToEgg = true
        if _G.SettingsTable.TpToEgg then
            TPToEgg()
        end
	end,
})


-- Auto Farm Section
local AutoFarmTab = Window:CreateTab("🏭| Autofarm")
local AutoSettingsSection = AutoFarmTab:CreateSection("Auto Settings")
local AutoSettingsParagraph = AutoFarmTab:CreateParagraph({
    Title = "Current Auto Settings",
    Content = "Auto Bubble: \nAuto Claim Rewards: \nAuto Spin Wheel: \nAuto Claim Season Pass: \nAuto Collect Gifts: \nAuto Buy Daily Shop: "
})
local AutoBubble = AutoFarmTab:CreateToggle({
	Name = "🟣 Auto Bubble",
	CurrentValue = false,
	Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(bool)
        _G.SettingsTable.AutoBubble = bool
        if bool then
            _G.PlaceHolders.AutoBubblePlaceHolder = "Activated"
            AutoBubbles()
        else
            _G.PlaceHolders.AutoBubblePlaceHolder = "Deactivated"
        end
	end,
})
local AutoClaimRewards = AutoFarmTab:CreateToggle({
	Name = "🗝️ Auto Claim Rewards",
	CurrentValue = false,
	Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(bool)
        _G.SettingsTable.AutoClaimRewards = bool
        if bool then
            _G.PlaceHolders.AutoClaimRewardsPlaceHolder = "Activated"
            AutoRewards()
        else
            _G.PlaceHolders.AutoClaimRewardsPlaceHolder = "Deactivated"
        end
	end,
})
local AutoSpinWheel = AutoFarmTab:CreateToggle({
	Name = "🎡 Auto Spin Wheel",
	CurrentValue = false,
	Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(bool)
        _G.SettingsTable.AutoSpinWheel = bool
        if bool then
            _G.PlaceHolders.AutoSpinWheelPlaceHolder = "Activated"
            AutoWheel()
        else
            _G.PlaceHolders.AutoSpinWheelPlaceHolder = "Deactivated"
        end
	end,
})
local AutoClaimSeasonPass = AutoFarmTab:CreateToggle({
	Name = "🍂 Auto Claim Season Pass",
	CurrentValue = false,
	Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(bool)
        _G.SettingsTable.AutoClaimSeasonPass = bool
        if bool then
            _G.PlaceHolders.AutoClaimSeasonPassPlaceHolder = "Activated"
            AutoClaimSeasonPass1()
        else
            _G.PlaceHolders.AutoClaimSeasonPassPlaceHolder = "Deactivated"
        end
	end,
})
local AutoCollectGifts = AutoFarmTab:CreateToggle({
	Name = "🎁 Auto Collect Gifts",
	CurrentValue = false,
	Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(bool)
        _G.SettingsTable.AutoCollectGifts = bool
        if bool then
            _G.PlaceHolders.AutoCollectGiftsPlaceHolder = "Activated"
            AutoCollectGifts1()
        else
            _G.PlaceHolders.AutoCollectGiftsPlaceHolder = "Deactivated"
        end
	end,
})
local AutoDailyShop = AutoFarmTab:CreateToggle({
	Name = "🏠 Auto Buy Daily Shop",
	CurrentValue = false,
	Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(bool)
        _G.SettingsTable.AutoBuyDailyShop = bool
        if bool then
            _G.PlaceHolders.AutoBuyDailyShopPlaceHolder = "Activated"
            DailyShop1()
        else
            _G.PlaceHolders.AutoBuyDailyShopPlaceHolder = "Deactivated"
        end
	end,
})



local AutoMerchantSelection = AutoFarmTab:CreateSection("Auto Merchant")
local AutoMerchantParagraph = AutoFarmTab:CreateParagraph({
    Title = "Current Auto Merchant Settings",
    Content = "Auto Buy Fast Hatch: \nAuto Buy Super Lucky: \nAuto Buy Godly Luck: \nAuto Buy 3x Shiny: \nAuto Buy 2x Diamonds: \nAuto Buy 2x Coins: \nAuto Buy Mega Luck: "
})
local AutoBuyFastHatch = AutoFarmTab:CreateToggle({
	Name = "💨 Auto Buy Fast Hatch",
	CurrentValue = false,
	Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(bool)
        _G.SettingsTable.AutoBuyFastHatch = bool
        if bool then
            _G.PlaceHolders.AutoBuyFastHatchPlaceHolder = "Activated"
            AutoBuyFastHatchBoost()
        else
            _G.PlaceHolders.AutoBuyFastHatchPlaceHolder = "Deactivated"
        end
	end,
})
local AutoBuySuperLucky = AutoFarmTab:CreateToggle({
	Name = "🍀 Auto Buy Super Lucky",
	CurrentValue = false,
	Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(bool)
        _G.SettingsTable.AutoBuyLuck = bool
        if bool then
            _G.PlaceHolders.AutoBuyLuckPlaceHolder = "Activated"
            AutoBuySuperLuckyBoost()
        else
            _G.PlaceHolders.AutoBuyLuckPlaceHolder = "Deactivated"
        end
	end,
})
local AutoBuyGodlyLuck = AutoFarmTab:CreateToggle({
	Name = "🍀 Auto Buy Godly Luck",
	CurrentValue = false,
	Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(bool)
        _G.SettingsTable.AutoBuyGodlyLuck = bool
        if bool then
            _G.PlaceHolders.AutoBuyGodlyLuckPlaceHolder = "Activated"
            AutoBuyGodlyLuckyBoost()
        else
            _G.PlaceHolders.AutoBuyGodlyLuckPlaceHolder = "Deactivated"
        end
	end,
})
local AutoBuy3xShiny = AutoFarmTab:CreateToggle({
	Name = "✨ Auto Buy 3x Shiny",
	CurrentValue = false,
	Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(bool)
        _G.SettingsTable.Auto3xShiny = bool
        if bool then
            _G.PlaceHolders.Auto3xShinyPlaceHolder = "Activated"
            AutoBuy3xShinyBoost()
        else
            _G.PlaceHolders.Auto3xShinyPlaceHolder = "Deactivated"
        end
	end,
})
local AutoBuy2xDiamonds = AutoFarmTab:CreateToggle({
	Name = "💎 Auto Buy 2x Diamonds",
	CurrentValue = false,
	Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(bool)
        _G.SettingsTable.AutoBuy2xDiamonds = bool
        if bool then
            _G.PlaceHolders.AutoBuy2xDiamondsPlaceHolder = "Activated"
            AutoBuy2xDiamondsBoost()
        else
            _G.PlaceHolders.AutoBuy2xDiamondsPlaceHolder = "Deactivated"
        end
	end,
})
local AutoBuy2xCoins = AutoFarmTab:CreateToggle({
	Name = "💰 Auto Buy 2x Coins",
	CurrentValue = false,
	Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(bool)
        _G.SettingsTable.AutoBuy2xCoins = bool
        if bool then
            _G.PlaceHolders.AutoBuy2xCoinsPlaceHolder = "Activated"
            AutoBuy2xCoinsBoost()
        else
            _G.PlaceHolders.AutoBuy2xCoinsPlaceHolder = "Deactivated"
        end
	end,
})
local AutoBuyMegaLuck = AutoFarmTab:CreateToggle({
	Name = "🍀 Auto Buy Mega Luck",
	CurrentValue = false,
	Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(bool)
        _G.SettingsTable.AutoBuyMegaLuck = bool
        if bool then
            _G.PlaceHolders.AutoBuyMegaLuckPlaceHolder = "Activated"
            AutoBuyMegaLuckBoost()
        else
            _G.PlaceHolders.AutoBuyMegaLuckPlaceHolder = "Deactivated"
        end
	end,
})



local AutoEnableBoostsSelection = AutoFarmTab:CreateSection("Auto Enable Boosts")
local AutoEnableBoostsParagraph = AutoFarmTab:CreateParagraph({
    Title = "Current Auto Enable Boosts Settings",
    Content = "Auto Enable Fast Hatch: \nAuto Enable Super Lucky: \nAuto Enable Godly Luck: \nAuto Enable 3x Shiny: \nAuto Enable 2x Diamonds: \nAuto Enable 2x Coins: \nAuto Enable Mega Luck: "
})
local AutoEnableFastHatch = AutoFarmTab:CreateToggle({
	Name = "💨 Auto Enable Fast Hatch",
	CurrentValue = false,
	Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(bool)
        _G.SettingsTable.AutoEnableFastHatch = bool
        if bool then
            _G.PlaceHolders.AutoEnableFastHatchPlaceHolder = "Activated"
            AutoEnableFastHatchBoost()
        else
            _G.PlaceHolders.AutoEnableFastHatchPlaceHolder = "Deactivated"
        end
	end,
})
local AutoEnableSuperLucky = AutoFarmTab:CreateToggle({
	Name = "🍀 Auto Enable Super Lucky",
	CurrentValue = false,
	Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(bool)
        _G.SettingsTable.AutoEnableLuck = bool
        if bool then
            _G.PlaceHolders.AutoEnableLuckPlaceHolder = "Activated"
            AutoEnableSuperLuckyBoost()
        else
            _G.PlaceHolders.AutoEnableLuckPlaceHolder = "Deactivated"
        end
	end,
})
local AutoEnableGodlyLuck = AutoFarmTab:CreateToggle({
	Name = "🍀 Auto Enable Godly Luck",
	CurrentValue = false,
	Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(bool)
        _G.SettingsTable.AutoEnableGodlyLuck = bool
        if bool then
            _G.PlaceHolders.AutoEnableGodlyLuckPlaceHolder = "Activated"
            AutoEnableGodlyLuckyBoost()
        else
            _G.PlaceHolders.AutoEnableGodlyLuckPlaceHolder = "Deactivated"
        end
	end,
})
local AutoEnable3xShiny = AutoFarmTab:CreateToggle({
	Name = "✨ Auto Enable 3x Shiny",
	CurrentValue = false,
	Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(bool)
        _G.SettingsTable.AutoEnable3xShiny = bool
        if bool then
            _G.PlaceHolders.AutoEnable3xShinyPlaceHolder = "Activated"
            AutoEnable3xShinyBoost()
        else
            _G.PlaceHolders.AutoEnable3xShinyPlaceHolder = "Deactivated"
        end
	end,
})
local AutoEnable2xDiamonds = AutoFarmTab:CreateToggle({
	Name = "💎 Auto Enable 2x Diamonds",
	CurrentValue = false,
	Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(bool)
        _G.SettingsTable.AutoEnable2xDiamonds = bool
        if bool then
            _G.PlaceHolders.AutoEnable2xDiamondsPlaceHolder = "Activated"
            AutoEnable2xDiamondsBoost()
        else
            _G.PlaceHolders.AutoEnable2xDiamondsPlaceHolder = "Deactivated"
        end
	end,
})
local AutoEnable2xCoins = AutoFarmTab:CreateToggle({
	Name = "💰 Auto Enable 2x Coins",
	CurrentValue = false,
	Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(bool)
        _G.SettingsTable.AutoEnable2xCoins = bool
        if bool then
            _G.PlaceHolders.AutoEnable2xCoinsPlaceHolder = "Activated"
            AutoEnable2xCoinsBoost()
        else
            _G.PlaceHolders.AutoEnable2xCoinsPlaceHolder = "Deactivated"
        end
	end,
})
local AutoEnableMegaLuck = AutoFarmTab:CreateToggle({
	Name = "🍀 Auto Enable Mega Luck",
	CurrentValue = false,
	Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(bool)
        _G.SettingsTable.AutoEnableMegaLuck = bool
        if bool then
            _G.PlaceHolders.AutoEnableMegaLuckPlaceHolder = "Activated"
            AutoEnableMegaLuckBoost()
        else
            _G.PlaceHolders.AutoEnableMegaLuckPlaceHolder = "Deactivated"
        end
	end,
})



-- Miscellaneous
local MiscTab = Window:CreateTab("🎨| Miscellaneous")
local RandomMiscSection = MiscTab:CreateSection("Random Miscellaneous")
local RandomMiscParagraph = MiscTab:CreateParagraph({
    Title = "Random Miscellaneous Settings",
    Content = "Section for the random things that dont need their own catagory!"
})
local ClaimSpawnRewards = MiscTab:CreateButton({
	Name = "🌳 Claim Spawn Rewards",
	Callback = function()
        BSpawnRewards()
	end,
})
local UnlockSpawnIslands = MiscTab:CreateButton({
	Name = "🌳 Unlock Spawn Islands",
	Callback = function()
        UnlockSpawnIslands()
	end,
})
local UnlockAtlantisIslands = MiscTab:CreateButton({
	Name = "🔱 Unlock Atlantis Islands",
	Callback = function()
        UnlockAtlantisIslands()
	end,
})


-- FPS Settings
local FPSSection = MiscTab:CreateSection("FPS Settings")
local AutoFPSParagraph = MiscTab:CreateParagraph({
    Title = "Current FPS Settings", 
    Content = "Current FPS: "
})
local ChooseFPSValue = MiscTab:CreateInput({
	Name = "🖱️ Choose FPS Value:",
	PlaceholderText = "Default = 60",
	RemoveTextAfterFocusLost = false,
	Callback = function(FPStxt)
		_G.SettingsTable.FPSSettings = FPStxt
	end,
})
local SetFPSValues = MiscTab:CreateButton({
	Name = "🖱️ Set FPS Value",
	Callback = function()
        SetFPSValue()
	end,
})



-- Load Settings
function LoadSettingsTableSettings()
    spawn(function()
    local HttpService = game:GetService("HttpService")
    if (readfile and isfile and isfile(SettingsTableName)) then
        _G.SettingsTable = HttpService:JSONDecode(readfile(SettingsTableName))
        AutoBuy2xDiamonds:Set(_G.SettingsTable.AutoBuy2xDiamonds)
        AutoBuy2xCoins:Set(_G.SettingsTable.AutoBuy2xCoins)
        AutoBuy3xShiny:Set(_G.SettingsTable.Auto3xShiny)
        AutoBuyGodlyLuck:Set(_G.SettingsTable.AutoBuyGodlyLuck)
        AutoBuySuperLucky:Set(_G.SettingsTable.AutoBuyLuck)
        AutoBuyFastHatch:Set(_G.SettingsTable.AutoBuyFastHatch)
        AutoSpinWheel:Set(_G.SettingsTable.AutoSpinWheel)
        AutoClaimRewards:Set(_G.SettingsTable.AutoClaimRewards)
        AutoBubble:Set(_G.SettingsTable.AutoBubble)
        AutoEnableFastHatch:Set(_G.SettingsTable.AutoEnableFastHatch)
        AutoEnableSuperLucky:Set(_G.SettingsTable.AutoEnableLuck)
        AutoEnableGodlyLuck:Set(_G.SettingsTable.AutoEnableGodlyLuck)
        AutoEnable3xShiny:Set(_G.SettingsTable.AutoEnable3xShiny)
        AutoEnable2xDiamonds:Set(_G.SettingsTable.AutoEnable2xDiamonds)
        AutoEnable2xCoins:Set(_G.SettingsTable.AutoEnable2xCoins)
        EggsDropdown:Set(_G.SettingsTable.EggType)
        StartHatchingEgg:Set(_G.SettingsTable.BuyEgg)
        MultiHatchDropdown:Set(_G.SettingsTable.EggAmount)
        AutoClaimSeasonPass:Set(_G.SettingsTable.AutoClaimSeasonPass)
        AutoCollectGifts:Set(_G.SettingsTable.AutoCollectGifts)
        AutoDailyShop:Set(_G.SettingsTable.AutoBuyDailyShop)
        AutoBuyMegaLuck:Set(_G.SettingsTable.AutoBuyMegaLuck)
        AutoEnableMegaLuck:Set(_G.SettingsTable.AutoEnableMegaLuck)
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
    if _G.SettingsTable.TpToEgg then
        TPToEgg()
    end
    end)
end
LoadSettingsTableSettings()
SetFPSValue()

-- Setting Stuff
local SettingsTab = Window:CreateTab("⚙️| Settings")
local SettingsSection = SettingsTab:CreateSection("Setting Options (Settings Save Per Account)")
local SeeCurrentSettings = SettingsTab:CreateButton({
	Name = "⚙️ See Your Current Settings (Type /console in chat)",
	Callback = function()
        print("---CURRENT SETTINGS---")
        for i,v in pairs(_G.SettingsTable) do
            print(i,v)
        end
        print("----------------------")
	end,
})
local SaveCurrentSettings = SettingsTab:CreateButton({
	Name = "⬇️ Save Your Current Settings",
	Callback = function()
        SaveSettingsTableSettings()
	end,
})
local LoadSavedSettings = SettingsTab:CreateButton({
	Name = "⬆️ Load Your Saved Settings",
	Callback = function()
        LoadSettingsTableSettings()
	end,
})

while wait() do
    local plr = game.Players.LocalPlayer
    local count = 0
    count = game:GetService("Players")[username].leaderstats.Eggs.Value
    EggFarmingParagraph:Set({Title = "Current Egg Data", Content = "🥚 Eggs Hatched: " ..abb(count).. "\n🤫 Secrets Hatched: " .. _G.SecretsList.TotalSecretsHatched .. "\n🐣 Current Egg: " .. _G.SettingsTable.EggType .. "\n🥚 Egg Amount: ".. _G.SettingsTable.EggAmount})
    AutoSettingsParagraph:Set({Title = "Current Auto Settings", Content = "🟣 Auto Bubble: " .._G.PlaceHolders.AutoBubblePlaceHolder.. "\n🗝️ Auto Claim Rewards: " .. _G.PlaceHolders.AutoClaimRewardsPlaceHolder .. "\n🎡 Auto Spin Wheel: " .. _G.PlaceHolders.AutoSpinWheelPlaceHolder .. "\n🍂 Auto Claim Season Pass: " .. _G.PlaceHolders.AutoClaimSeasonPassPlaceHolder .. "\n🎁 Auto Collect Gifts: " .. _G.PlaceHolders.AutoCollectGiftsPlaceHolder .. "\n🏠 Auto Buy Daily Shop: " .. _G.PlaceHolders.AutoBuyDailyShopPlaceHolder})
    AutoMerchantParagraph:Set({Title = "Current Auto Merchant Settings", Content = "💨 Auto Buy Fast Hatch: " .._G.PlaceHolders.AutoBuyFastHatchPlaceHolder.. "\n🍀 Auto Buy Super Lucky: " .. _G.PlaceHolders.AutoBuyLuckPlaceHolder .. "\n🍀 Auto Buy Godly Luck: " .. _G.PlaceHolders.AutoBuyGodlyLuckPlaceHolder .. "\n✨ Auto Buy 3x Shiny: " .. _G.PlaceHolders.Auto3xShinyPlaceHolder .. "\n💎 Auto Buy 2x Diamonds: " .. _G.PlaceHolders.AutoBuy2xDiamondsPlaceHolder .. "\n💰 Auto Buy 2x Coins: " .. _G.PlaceHolders.AutoBuy2xCoinsPlaceHolder .. "\n🍀 Auto Buy Mega Luck: " .. _G.PlaceHolders.AutoBuyMegaLuckPlaceHolder})
    AutoEnableBoostsParagraph:Set({Title = "Current Auto Enable Boosts Settings", Content = "💨 Auto Enable Fast Hatch: " .._G.PlaceHolders.AutoEnableFastHatchPlaceHolder.. "\n🍀 Auto Enable Super Lucky: " .. _G.PlaceHolders.AutoEnableLuckPlaceHolder .. "\n🍀 Auto Enable Godly Luck: " .. _G.PlaceHolders.AutoEnableGodlyLuckPlaceHolder .. "\n✨ Auto Enable 3x Shiny: " .. _G.PlaceHolders.AutoEnable3xShinyPlaceHolder .. "\n💎 Auto Enable 2x Diamonds: " .. _G.PlaceHolders.AutoEnable2xDiamondsPlaceHolder .. "\n💰 Auto Enable 2x Coins: " .. _G.PlaceHolders.AutoEnable2xCoinsPlaceHolder .. "\n🍀 Auto Enable Mega Luck: " .. _G.PlaceHolders.AutoEnableMegaLuckPlaceHolder})
    AutoFPSParagraph:Set({Title = "Current FPS Settings", Content = "🖱️ Current FPS: " .. _G.SettingsTable.FPSSettings})
end
