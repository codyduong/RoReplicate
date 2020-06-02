local RoReplicateUtility = require(script.Parent.RoReplicateUtility)
local StandardSection = require(script.Parent.StandardSection)

RoReplicateBaseClass = {}

--[[
TBD:
whether RoReplicatedBaseClass will do plugin handling and creation itself, or will simply return itself and properties necessary
for a properly configured plugin which has a scheme similar to the actual roblox studio?
--]]

function RoReplicateBaseClass.new(sectionCount) 
	local self = {}
	setmetatable(self, RoReplicateBaseClass)
	
	local frame = Instance.new("Frame")
	RoReplicateUtility.syncBackgroundColor(frame)
	frame.Parent = self
	self._frame = frame
	
	self._sections = StandardSection.createSections(sectionCount)
	
	self:_UpdateSize()
	
	return self
end

function RoReplicateBaseClass:SetSectionName(sectionNumber, sectionTitle)
	self._sections:setTitle(sectionTitle)
end

function RoReplicateBaseClass:GetSizeMin()
	return self._sizeMin
end

function RoReplicateBaseClass:GetSizeMax()
	return self._sizeMax
end

function RoReplicateBaseClass:GetSection(sectionNumber)
	return self._sections[sectionNumber]
end

function RoReplicateBaseClass:_UpdateSize()
	local sectionCount = table.length(self._sections)
	
	--[[todo
	self._sizeMin = UDim2.new(0,todoVar,0,96) --height is 96-100 pixels at 1920x1080
	self._sizeMax = UDim2.new(0,0,0,96)
	--]]
	
end
