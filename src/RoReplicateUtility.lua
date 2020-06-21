local TestService = game:GetService("TestService")

RoReplicateUtility = {}
--RoReplicateUtility.__index = RoReplicateUtility

function RoReplicateUtility:syncBackgroundColor3(gui)
	gui.BackgroundColor3 = settings().Studio.Theme:GetColor(Enum.StudioStyleGuideColor.MainBackground)
end

function RoReplicateUtility:syncTextColor3(gui)
	gui.TextColor3 = settings().Studio.Theme:GetColor(Enum.StudioStyleGuideColor.ButtonText)
end

return RoReplicateUtility

