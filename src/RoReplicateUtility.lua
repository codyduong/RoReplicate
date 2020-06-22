local TestService = game:GetService("TestService")


RoReplicateUtility = {}
--RoReplicateUtility.__index = RoReplicateUtility


--https://developer.roblox.com/en-us/api-reference/function/StudioTheme/GetColor
--https://developer.roblox.com/en-us/api-reference/enum/StudioStyleGuideColor
--https://developer.roblox.com/en-us/api-reference/enum/StudioStyleGuideModifier


function RoReplicateUtility:SyncBackgroundColor3(gui)
	gui.BackgroundColor3 = settings().Studio.Theme:GetColor(Enum.StudioStyleGuideColor.MainBackground)
end


function RoReplicateUtility:SyncTextColor3(gui)
	gui.TextColor3 = settings().Studio.Theme:GetColor(Enum.StudioStyleGuideColor.ButtonText)
end


function RoReplicateUtility:SyncTitlebar(gui)
	gui.BackgroundColor3 = settings().Studio.Theme:GetColor(Enum.StudioStyleGuideColor.Titlebar)
end


function RoReplicateUtility:SyncBorderColor3(gui)
	gui.BorderColor3 = settings().Studio.Theme:GetColor(Enum.StudioStyleGuideColor.Border)
end


function RoReplicateUtility:SyncFont(gui)
	gui.Font = settings().Studio.Font
end


return RoReplicateUtility
