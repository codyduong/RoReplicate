local RoReplicateUtility = require(script.Parent.RoReplicateUtility)
local RoReplicateEnum = require(script.Parent.RoReplicateEnum)


PanelClass = {}
PanelClass.__index = PanelClass


--[[
- Creates a new panel
- @param tuple - PanelType (tuple varies from paneltype to paneltype)
--]]
function PanelClass.new(enum, Section)
	local self = {}
	setmetatable(self, PanelClass)
	
	local frame = Instance.new("Frame")
	frame.BackgroundTransparency = 1
	frame.Size = UDim2.new(0,44,0,65)
	self._frame = frame
	
	self:_CheckEnum(enum)
	
	pcall(
		function()
			Section:AddPanels(self)
		end
	)
	
	return self
end


--[[
- Returns the frame of the panel for local script manipulation
- @return frame - Frame Instance
--]]
function PanelClass:GetFrame()
	return self._frame
end


--[[
- Sets the frame of the panel from any local script manipulation
--]]
function PanelClass:SetFrame(frame)
	assert(getmetatable(frame) == getmetatable(Instance.new("Frame")), "PanelClass:SetFrame - tried to SetFrame to something that is not a Frame Instance")
	self._frame = frame
end


PanelClass.Enum = {}

--[[
- TODO
--]]
function PanelClass:_CheckEnum(enum)
	if not pcall(
		function()
			enum.new(self._frame)
	end) then
		print("fail") -- <-- fix this
	end
end


PanelClass.Enum.CustomInput = {}
PanelClass.Enum.CustomInput.__index = {}

function PanelClass.Enum.CustomInput.new(gui)
	local self = {}
	setmetatable(self, PanelClass.Enum.ButtonImage)
	
	return self
end


PanelClass.Enum.ButtonImage = {}
PanelClass.Enum.ButtonImage.__index = {}

function PanelClass.Enum.ButtonImage.new(gui)
	local self = {}
	setmetatable(self, PanelClass.Enum.ButtonImage)
	
	local frame = Instance.new("Frame", gui)
	frame.BackgroundTransparency = 1
	--RoReplicateUtility:SyncBackgroundColor3(frame)
	RoReplicateUtility:SyncBorderColor3(frame)
	frame.Size = UDim2.new(1,0,1,0)
	frame.Name = "ButtonImageFrame"
	
	local imageButton = Instance.new("ImageButton", frame)
	RoReplicateUtility:SyncBackgroundColor3(imageButton)
	imageButton.Position = UDim2.new(0,0,0,0)
	imageButton.Size = UDim2.new(0,44,0,35)
	
	--imageButton.Name = "ImageButton"
	
	
	local textButton = Instance.new("TextButton", frame)
	--textButton.Font = ""
	--textButton.LineHeight = 6
	textButton.Text = "wew"
	RoReplicateUtility:SyncTextColor3(textButton)
	textButton.TextSize = 6
	textButton.TextXAlignment = Enum.TextXAlignment.Center
	textButton.TextYAlignment = Enum.TextYAlignment.Center
	RoReplicateUtility:SyncBackgroundColor3(textButton)
	textButton.Position = UDim2.new(0,0,0,36)
	textButton.Size = UDim2.new(0,44,0,31)
	
	--textButton.Name = "TextButton"
	
	
	return self
end


return PanelClass
