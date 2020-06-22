local RoReplicateUtility = require(script.Parent.RoReplicateUtility)
local RoReplicateEnum = require(script.Parent.RoReplicateEnum)


PanelClass = {}
PanelClass.__index = PanelClass


--[[
- Creates a new panel
- @Param panelType = type of panel enum
--]]
function PanelClass.new(panelType)
	if pcall(function()
			panelType()
		end) 
	then
		--print("success")
	else
		--print("failure")
	end
	
	local self = {}
	setmetatable(self, PanelClass)
	
	self._type = ""
	
	local frame = Instance.new("Frame")
	--frame.Name = --necessary?
	frame.BackgroundTransparency = 1
	frame.LayoutOrder = 1
	self._frame = frame
	
	return self
end


--[[
- TODO
- @return frame
--]]
function PanelClass:GetFrame()
	return self._frame
end


--[[
- TODO
--]]
function PanelClass:SetFrame(frame)
	assert(getmetatable(frame)==getmetatable(Instance.new("Frame")), "PanelClass:SetFrame - tried to SetFrame to something that is not a Frame Instance")
	self._frame = frame
end


return PanelClass
