local RoReplicateUtility = require(script.Parent.RoReplicateUtility)
local StandardSection = require(script.Parent.StandardSection)

RoReplicateBaseClass = {}

function RoReplicateBaseClass.new(sectionCount) 
	local self = {}
	setmetatable(self, RoReplicateBaseClass)
	
	local frame = Instance.new("Frame")
	RoReplicateUtility.syncBackgroundColor(frame)
	frame.Parent = self
	self._frame = frame
	
	self._sections = StandardSection.createSections(sectionCount)
	
	return self
end

function RoReplicateBaseClass:GetSizeMin()
	return 
end

function RoReplicateBaseClass:GetSizeMax()
	return
end

function RoReplicateBaseClass:_UpdateSize()
	local sectionCount = table.length(self._sections)
	
	
end
