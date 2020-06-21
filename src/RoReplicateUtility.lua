local TestService = game:GetService("TestService")

RoReplicateUtility = {}
--RoReplicateUtility.__index = RoReplicateUtility

--https://developer.roblox.com/en-us/api-reference/function/StudioTheme/GetColor
--https://developer.roblox.com/en-us/api-reference/enum/StudioStyleGuideColor
--https://developer.roblox.com/en-us/api-reference/enum/StudioStyleGuideModifier


function RoReplicateUtility:syncBackgroundColor3(gui)
	gui.BackgroundColor3 = settings().Studio.Theme:GetColor(Enum.StudioStyleGuideColor.MainBackground)
end

function RoReplicateUtility:syncTextColor3(gui)
	gui.TextColor3 = settings().Studio.Theme:GetColor(Enum.StudioStyleGuideColor.ButtonText)
end

return RoReplicateUtility
