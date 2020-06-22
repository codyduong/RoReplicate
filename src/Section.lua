local RoReplicateUtility = require(script.Parent.RoReplicateUtility)
local Panel = require(script.Parent.Panel)


SectionClass = {}
SectionClass.__index = SectionClass


--[[
- Creates a singular section class
- @param nameSuffix - string which describes the section, interal tracking? May be deprecated soon
- @param titleText - string which describes the section, shown on UI
--]]
function SectionClass.new(nameSuffix, titleText)
	local nameSuffixAssert = assert(type(nameSuffix) == "string", "Section.new - Parameter 1 is not a string")
	local titleTextAssert = assert(type(titleText) == "string", "Section.new - Parameter 2 is not a string")
	
	local self = {}
	setmetatable(self, SectionClass)
	
	local frame = Instance.new("Frame")
	frame.Name = "Section"..nameSuffix
	frame.BackgroundTransparency = 1
	frame.LayoutOrder = 1
	self._frame = frame
	
	local contentsFrame = Instance.new("Frame")
	contentsFrame.Name = "Contents"
	contentsFrame.BackgroundTransparency = 1
	contentsFrame.Size = UDim2.new(1, 0, .8, 0) 
	contentsFrame.Position = UDim2.new(0, 0, 0, 0)
	contentsFrame.Parent = frame
	contentsFrame.LayoutOrder = 2
	self._contentsFrame = contentsFrame
	
	self._panels = {}
	
	--TODO: add uilayoutorder stuff to organize 

	local bottomFrame = self:_CreateBottomFrame(titleText)
	self._bottomFrame = bottomFrame
	
	return self
end


--[[
- Adds a Panel Class to this section
- @param Panel - Panel Class
--]]
function SectionClass:AddPanel(panel)
	assert(getmetatable(panel) == getmetatable(Panel.new("Custom")), "SectionClass:AddPanel - parameter 1: panel, is not a Panel Object")
	self._panels = table.insert(self._panels, #self._panels+1, panel)
end


--[[
- Removes a Panel Class to this section
- @param panel - Panel Class
--]]
function SectionClass:RemovePanel(panel)
	local panelRemove = assert(table.find(self._panels, panel))
	table.remove(self._panels, panelRemove)
end


--[[
- Sets the LayoutOrder of the frame of the SectionClass
- @param int - int
--]]
function SectionClass:SetLayoutOrder(int)
	self._frame.LayoutOrder = int
end


--[[
- Internal Use
- @param titleText - string
--]]
function SectionClass:_CreateBottomFrame(titleText)
	local frame = Instance.new("Frame")
	frame.Parent = self._frame
	frame.Size = UDim2.new(1,0,.2,0) --X full, 20% of Y
	frame.Position = UDim2.new(.5,0,.9,0) --Midpoints of Size
	frame.BackgroundTransparency = 1
	
	local textLabel = Instance.new("TextLabel", frame)
	textLabel.Name = "title"
	textLabel.Size = UDim2.new(1,0,1,0)
	textLabel.Position = UDim2.new(.5,0,.5,0)
	textLabel.TextXAlignment = Enum.TextXAlignment.Center
	textLabel.TextYAlignment = Enum.TextYAlignment.Center
	textLabel.BackgroundTransparency = 1
	RoReplicateUtility:SyncTextColor3(textLabel)
	
	return frame
end


return SectionClass
