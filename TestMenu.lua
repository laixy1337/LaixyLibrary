local Laixy = loadstring(game:HttpGet('https://raw.githubusercontent.com/laixy1337/LaixyLibrary/main/library.lua'))()

local Window = Laixy:CreateWindow({
   Name = "LaixCC",
   LoadingTitle = "Da hood",
   LoadingSubtitle = "by laixy1337",
   ConfigurationSaving = {
      Enabled = false,
      FolderName = nil,
      FileName = "LaixCC"
   },
   Discord = {
      Enabled = false,
      Invite = "noinvitelink", --discord.gg/ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },
   KeySystem = false, -- Set this to true to use our key system
   KeySettings = {
      Title = "Key | Youtube Hub",
      Subtitle = "Key System",
      Note = "Key In Discord Server",
      FileName = "YoutubeHubKey1", -- It is recommended to use something unique as other scripts using Laixy may overwrite your key file
      SaveKey = false, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = true, -- If this is true, set Key below to the RAW site you would like Laixy to get the key from
      Key = {"https://pastebin.com/raw/AtgzSPWK"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})

local MainTab = Window:CreateTab("Home", nil) -- Title, Image
local MainSection = MainTab:CreateSection("Player")

local Slider = MainTab:CreateSlider({
   Name = "WalkSpeed Slider",
   Range = {1, 350},
   Increment = 1,
   Suffix = "Speed",
   CurrentValue = 16,
   Flag = "sliderws", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = (Value)
   end,
})

local Slider = MainTab:CreateSlider({
   Name = "JumpPower Slider",
   Range = {1, 350},
   Increment = 1,
   Suffix = "Speed",
   CurrentValue = 16,
   Flag = "sliderjp", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = (Value)
   end,
})

local Button = MainTab:CreateButton({
   Name = "Infinite Jump Toggle",
   Callback = function()
	_G.infinjump = not _G.infinjump
	
	if _G.infinJumpStarted == nil then
		_G.infinJumpStarted = true
	
		local plr = game:GetService('Players').LocalPlayer
		local m = plr:GetMouse()
		m.KeyDown:connect(function(k)
			if _G.infinjump then
				if k:byte() == 32 then
				humanoid = game:GetService'Players'.LocalPlayer.Character:FindFirstChildOfClass('Humanoid')
				humanoid:ChangeState('Jumping')
				wait()
				humanoid:ChangeState('Seated')
				end
			end
		end)
	end
   end,
})

local Button = MainTab:CreateButton({
   Name = "TP Tool",
   Callback = function()
	loadstring(game:HttpGet('https://raw.githubusercontent.com/laixy1337/RobloxScripts/main/TPTool.lua'))()
   end,
})

local EspTab = Window:CreateTab("ESP", nil)

local Toggle = EspTab:CreateToggle({
   CurrentValue = false,
   Flag = "EspToggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
	for _, player in ipairs(game:GetPlayers()) do
	    if player ~= game.Players.LocalPlayer then

	    local character = player.Character

	    local highlight = Instance.new("Highlight")
	    highlight.Parent = character
	    highlight.FillColor = Color3.fromRGB(255, 0, 0)
	    highlight.OutlineColor = Color3.fromRGB(255, 0, 0)
	    highlight.Adornee = character
	    end
	end
	print("Laix.CC")
   end,
})
