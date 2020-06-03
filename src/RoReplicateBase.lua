local RoReplicateUtility = require(script.Parent.RoReplicateUtility)

--[[
TBD: whether this class will be absorbed under RoReplicateBase, as no user has any need to create a 
StandaradSectionClass without just manipulating it through RoReplciateBase instead.
--]]

StandardSection = {}

function StandardSection.new(nameSuffix, titleText)
	local self = {}
	setmetatable(self, StandardSection)
	
	local frame = Instance.new("Frame")
	frame.Name = "Section"..nameSuffix
	RoReplicateUtility.syncBackgroundColor(frame)
	self._frame = frame
	
	--[[todo implementation, don't know wnough about UIListLayout for proper implementation, however each element under it should be a configured type
	input by the user of RoReplicate
	
	local uiListLayout = Instance.new("UIListLayout")
	uiListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	uiListLayout.Parent = frame
	self._uiListLayout = uiListLayout
	--]]
	
	local contentsFrame = Instance.new("Frame")
	contentsFrame.Name = "Contents"
	contentsFrame.BackgroundTransparency = 1
	contentsFrame.Size = UDim2.new(1, 0, .8, 0) 
	contentsFrame.Position = UDim2.new(0, 0, 0, 0)
	contentsFrame.Parent = frame
	contentsFrame.LayoutOrder = 2
	self._contentsFrame = contentsFrame

	local bottomFrame = self:_CreateBottomFrame(titleText)
	self._bottomFrame = bottomFrame
	
	--[[ditto
	uiListLayout:GetPropertyChangedSignal('AbsoluteContentSize'):connect(function()
		self:_UpdateSize()
	end)
	self:_UpdateSize()
	
	return self
	--]]
end

function StandardSection.createSections(sectionCount)
	local sections = {}
	
	for i=1, sectionCount do
		local section = StandardSection.new(i, "lorem ipsum") --this has to be set manually, if user creates with createSection
		sections[i] = section
	end
	
	return sections
end

function StandardSection:setTitle(title)
	self._bottomFrame.title = title
end

function StandardSection:GetSectionFrame()
	return self._frame
end

function StandardSection:GetContentsFrame()
	return self._contentsFrame
end

--[[fix some stuff here because nested class stuff is confusing, would abstractize but new class is private only to StandardSection, may be changed]]
function StandardSection:_CreateBottomFrame(titleText)
	local frame = Instance.new("Frame")
	--frame.Name --tbd if necessary?
	frame.Parent = self._frame
	RoReplicateUtility.syncBackgroundColor(frame)
	frame.Size = UDim2.new(1,0,.2,0) --X full, 20% of Y
	frame.Position = UDim2.new(.5,0,.9,0) --Midpoints of Size
	
	local textLabel = Instance.new("TextLabel")
	textLabel.Name = "title"
	textLabel.Parent = frame
	textLabel.Size = UDim2.new(1,0,1,0)
	textLabel.Position = UDim2.new(.5,0,.5,0)
	
	return frame
end


return StandardSection
