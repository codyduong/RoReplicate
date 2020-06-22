local RoReplicateUtility = require(script.Parent.RoReplicateUtility)
local RoReplicateEnum = require(script.Parent.RoReplicateEnum)
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
	frame.BackgroundTransparency = 0
	frame.Size = UDim2.new(0, 512, 1, 0)
	frame.Position = UDim2.new(0,0,0,1)
	frame.ZIndex = 100
	self._frame = frame
	
	local contentsFrame = Instance.new("Frame", frame)
	contentsFrame.Name = "Contents"
	contentsFrame.BackgroundTransparency = 0
	contentsFrame.Size = UDim2.new(0, 256, 0, 72) 
	contentsFrame.Position = UDim2.new(0, 0, 0, 0)
	contentsFrame.Parent = frame
	contentsFrame.ZIndex = 200
	self._contentsFrame = contentsFrame
	
	local arrayPan = {}
	self._panels = arrayPan
	
	--TODO: add uilayoutorder stuff to organize 

	local bottomFrame = self:_CreateBottomFrame(titleText)
	self._bottomFrame = bottomFrame
	
	return self
end


--[[
- Variadic Function
- Adds Panel Class(es) to this Section
- @param ... - Panel Class(es)
--]]
function SectionClass:AddPanels(...)
	local arg = {...}
	for i=1, #arg do
		assert(getmetatable(arg[i]) == getmetatable(Panel.new(RoReplicateEnum.Panel.Custom)), "SectionClass:AddPanel - parameter "..i.." is not a PanelClass")
		arg[i].Parent = self._frame
		table.insert(self._panels, #self._panels+1, arg[i])	
	end
end


--[[
- Removes Panel Class(es) to this Section
- @param ... - Panel Class(es)
--]]
function SectionClass:RemovePanel(...)
	local arg = {...}
	for i=1, #arg do
		assert(getmetatable(arg[i]) == getmetatable(Panel.new(RoReplicateEnum.Panel.Custom)), "SectionClass:AddPanel - parameter "..i.." is not a PanelClass")
		arg[i].Parent = nil
		table.remove(self._panels, table.find(self._panels, arg[i]))
	end
end


--[[
- Returns the current frame
- @return _frame - frame
--]]
function SectionClass:GetFrame()
	return self._frame
end


--[[TODO FIX to ZIndex
- Sets the LayoutOrder of the frame of the SectionClass
- @param int - int
--]]
function SectionClass:SetLayoutOrder(int)
	self._frame.LayoutOrder = int
end


--[[
- Returns an array of panels for script manipulation elsewhere
- @return _panels - PanelClass array
--]]
function SectionClass:GetPanels()
	return self._panels
end


--[[
- Internal Use
- @param titleText - string
--]]
function SectionClass:_CreateBottomFrame(titleText)
	local frame = Instance.new("Frame", self._frame)
	frame.Size = UDim2.new(1,0,0,27) --X full, 20% of Y
	frame.Position = UDim2.new(0,0,0,72) --Midpoints of Size
	frame.BackgroundTransparency = 1
	frame.ZIndex = 300
	
	local textLabel = Instance.new("TextLabel", frame)
	textLabel.Name = "title"
	textLabel.Size = UDim2.new(1,0,1,0)
	textLabel.Position = UDim2.new(0,0,0,0)
	textLabel.TextXAlignment = Enum.TextXAlignment.Center
	textLabel.TextYAlignment = Enum.TextYAlignment.Center
	textLabel.BackgroundTransparency = 1
	RoReplicateUtility:SyncTextColor3(textLabel)
	textLabel.ZIndex = 400
	
	return frame
end


return SectionClass
