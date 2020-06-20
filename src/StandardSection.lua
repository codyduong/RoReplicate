local RoReplicateUtility = require(script.Parent.RoReplicateUtility)

--[[
TBD: whether this class will be absorbed under RoReplicateBase, as no user has any need to create a 
StandaradSectionClass without just manipulating it through RoReplciateBase instead.
--]]

Section = {}

--[[
- Creates a singular section class
- @param nameSuffix - string which describes the section, not shown on UI
- @param titleText - string which describes the section, shown on UI
--]]
function Section.new(nameSuffix, titleText)
	local self = {}
	setmetatable(self, Section)
	
	self.layoutOrder = 1
	
	local frame = Instance.new("Frame")
	frame.Name = "Section"..nameSuffix
	frame.BackgroundTransparency = 1
	self._frame = frame
	
	local contentsFrame = Instance.new("Frame")
	contentsFrame.Name = "Contents"
	contentsFrame.BackgroundTransparency = 1
	contentsFrame.Size = UDim2.new(1, 0, .8, 0) 
	contentsFrame.Position = UDim2.new(0, 0, 0, 0)
	contentsFrame.Parent = frame
	contentsFrame.LayoutOrder = 2
	self._contentsFrame = contentsFrame
	
	self._buttons = {}
	
	--TODO: add uilayoutorder stuff to organize 

	local bottomFrame = self:_CreateBottomFrame(titleText)
	self._bottomFrame = bottomFrame
	
	return self
end

--[[
- Adds a Button Class to this section.
- @param Button - Button Class.
--]]
function Section:AddButton(Button)
	self._buttons = table.insert(self._buttons, #self._buttons+1, Button)
end

--[[
- TBD
-
--]]
function Section:_CreateBottomFrame(titleText)
	local frame = Instance.new("Frame")
	--frame.Name --tbd if necessary?
	frame.Parent = self._frame
	--RoReplicateUtility.syncBackgroundColor3(frame)
	frame.Size = UDim2.new(1,0,.2,0) --X full, 20% of Y
	frame.Position = UDim2.new(.5,0,.9,0) --Midpoints of Size
	frame.BackgroundTransparency = 1
	
	local textLabel = Instance.new("TextLabel")
	textLabel.Name = "title"
	textLabel.Parent = frame
	textLabel.Size = UDim2.new(1,0,1,0)
	textLabel.Position = UDim2.new(.5,0,.5,0)
	textLabel.TextXAlignment = Enum.TextXAlignment.Center
	textLabel.TextYAlignment = Enum.TextYAlignment.Center
	--textLabel.TextColor3
	textLabel.BackgroundTransparency = 1
	RoReplicateUtility:syncTextColor3(textLabel)
	
	return frame
end



--[[
- Deprecated. Formerly utilized for mass createSection info, deemed unnecessary, as one would have to declare info
- inside each anyway. Also created some unique reference issues, which was resolved by removing this method.
- @sectionCount - integer.
--]]--[[
function Section.createSections(sectionCount)
	local sections = {}
	
	for i=1, sectionCount do
		local section =  Section.new(i, "lorem ipsum") --this has to be set manually, if user creates with createSection
		sections[i] = section
	end
	
	return sections
end]]

--[[All mass deprecated, left in just incase I decide to utilize.
function Section:setTitle(title)
	self._bottomFrame.title = title
end

function Section:GetSectionFrame()
	return self._frame
end

function Section:GetContentsFrame()
	return self._contentsFrame
end]]

return Section
