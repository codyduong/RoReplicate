local RoReplicateUtility = require(script.Parent.RoReplicateUtility)
local RoReplicateEnum = require(script.Parent.RoReplicateEnum)


PanelClass = {}
PanelClass.__index = PanelClass


--[[
- Creates a new panel
- @Param panelType = type of panel enum
--]]
function PanelClass.new(panelType)
	
	local self = {}
	setmetatable(self, PanelClass)
	
	self._type = ""
	
	local frame = Instance.new("Frame")
	frame.Size = UDim2.new(0,44,0,65)
	frame.BackgroundTransparency = 0
	frame.ZIndex = 500
	self._frame = frame
	
	if pcall(function()
			panelType(self._frame)
		end) 
	then
		--print("success")
	else
		--print("failure")
	end
	
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


return PanelClass
