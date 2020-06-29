local RoReplicateUtility = require(script.Parent.RoReplicateUtility)


InputClass = {}
InputClass.__index = InputClass


--[[
- Creates a new input
- @param tuple - InputType (tuple varies from inputtype to inputtype)
--]]
function InputClass.new(enum, Section)
	local self = {}
	setmetatable(self, InputClass)
	
	local frame = Instance.new("Frame")
	frame.BackgroundTransparency = 0
	frame.Size = UDim2.new(0,44,0,67)
	self._frame = frame
	
	self:_CheckEnum(enum)
	
	pcall(
		function()
			Section:AddInputs(self)
		end
	)
	
	return self
end


--[[
- Returns the frame of the input for local script manipulation
- @return frame - Frame Instance
--]]
function InputClass:GetFrame()
	return self._frame
end


--[[
- Sets the frame of the input from any local script manipulation
--]]
function InputClass:SetFrame(frame)
	assert(getmetatable(frame) == getmetatable(Instance.new("Frame")), "InputClass:SetFrame - tried to SetFrame to something that is not a Frame Instance")
	self._frame = frame
end


InputClass.Enum = {}

--[[
- TODO
--]]
function InputClass:_CheckEnum(enum)
	if not pcall(
		function()
			enum.new(self._frame)
	end) then
		print("fail") -- <-- fix this
	end
end


InputClass.Enum.CustomInput = {}
InputClass.Enum.CustomInput.__index = {}

function InputClass.Enum.CustomInput.new(gui)
	local self = {}
	setmetatable(self, InputClass.Enum.ButtonImage)
	
	return self
end


InputClass.Enum.ButtonImage = {}
InputClass.Enum.ButtonImage.__index = {}

function InputClass.Enum.ButtonImage.new(gui)
	local self = {}
	setmetatable(self, InputClass.Enum.ButtonImage)
	
	local frame = Instance.new("Frame", gui)
	frame.BackgroundTransparency = 1
	--RoReplicateUtility:SyncBackgroundColor3(frame)
	RoReplicateUtility:SyncBorderColor3(frame)
	frame.Size = UDim2.new(1,0,1,0)
	frame.Name = "ButtonImageFrame"
	
	local imageButton = Instance.new("ImageButton", frame)
	RoReplicateUtility:SyncBackgroundColor3(imageButton)
	imageButton.BorderSizePixel = 0
	imageButton.Position = UDim2.new(0,0,0,0)
	imageButton.Size = UDim2.new(0,44,0,35)
	
	--imageButton.Name = "ImageButton"
	
	
	local textButton = Instance.new("TextButton", frame)
	--textButton.Font = ""
	--textButton.LineHeight = 6
	textButton.Text = "wew"
	RoReplicateUtility:SyncTextColor3(textButton)
	textButton.BorderSizePixel = 0
	textButton.TextSize = 6
	textButton.TextXAlignment = Enum.TextXAlignment.Center
	textButton.TextYAlignment = Enum.TextYAlignment.Center
	RoReplicateUtility:SyncBackgroundColor3(textButton)
	textButton.Position = UDim2.new(0,0,0,36)
	textButton.Size = UDim2.new(0,44,0,31)
	
	--textButton.Name = "TextButton"
	
	
	return self
end


return InputClass
