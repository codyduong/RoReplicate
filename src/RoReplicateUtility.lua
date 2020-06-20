local TestService = game:GetService("TestService")

RoReplicateUtility = {}

function RoReplicateUtility:syncBackgroundColor3(gui)
	gui.BackgroundColor3 = Enum.StudioStyleGuideColor.MainBackground
end

function RoReplicateUtility:syncTextColor3(gui)
	gui.TextColor3 = Enum.StudioStyleGuideColor.ButtonText
end

return RoReplicateUtility
