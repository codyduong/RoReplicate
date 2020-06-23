local RoReplicateUtility = require(script.Parent.RoReplicateUtility)
local RoReplicateEnum = require(script.Parent.RoReplicateEnum)


PanelClass = {}
PanelClass.__index = PanelClass


--[[
- Creates a new panel
- @param panelType = type of panel enum
--]]
function PanelClass.new(panelType)
	local self = {}
	setmetatable(self, PanelClass)
	
	local frame = Instance.new("Frame")
	frame.BackgroundTransparency = 1
	frame.Size = UDim2.new(0,44,0,65)
	self._frame = frame
	
	self:_CheckParam(panelType)
	
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
	assert(getmetatable(frame)==getmetatable(Instance.new("Frame")), "PanelClass:SetFrame - tried to SetFrame to something that is not a Frame Instance")
	self._frame = frame
end


PanelClass.Enum = {}


--[[
- TODO
--]]
function PanelClass:_CheckParam(param)
	if not pcall(
		function()
			param(self._frame)
		end) 
	then
		error("yea",script,1) --TODO fix
	end
end


--[[
- TODO
--]]
function PanelClass.Enum.ButtonImage(gui)
	local frame = Instance.new("Frame", gui)
	--RoReplicateUtility:SyncBackgroundColor3(frame)
	RoReplicateUtility:SyncBorderColor3(frame)
	frame.Size = UDim2.new(1,0,1,0)
	
	local textButton = Instance.new("TextButton", frame)
	
	local imageButton = Instance.new("ImageButton", frame)
end



return PanelClass
