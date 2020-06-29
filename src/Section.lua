local RoReplicateUtility = require(script.Parent.RoReplicateUtility)
local Input = require(script.Parent.Input)


SectionClass = {}
SectionClass.__index = SectionClass


--[[
- Creates a singular section class
- @param nameSuffix - string which describes the section, interal tracking? May be deprecated soon
- @param titleText - string which describes the section, shown on UI
--]]
function SectionClass.new(nameSuffix, titleText, RoReplicateBase)
	local nameSuffixAssert = assert(type(nameSuffix) == "string", "Section.new - Parameter 1 is not a string")
	local titleTextAssert = assert(type(titleText) == "string", "Section.new - Parameter 2 is not a string")
	
	local self = {}
	setmetatable(self, SectionClass)
	
	local frame = Instance.new("Frame")
	frame.BackgroundTransparency = 1
	frame.Position = UDim2.new(0,0,0,0)
	frame.Size = UDim2.new(0, 0, 1, 0)
	self._frame = frame

	local bottomFrame = self:_CreateBottomFrame(titleText)
	self._bottomFrame = bottomFrame
	
	local contentsFrame = Instance.new("Frame", frame)
	contentsFrame.BackgroundTransparency = 1
	contentsFrame.Position = UDim2.new(0, 4, 0, 2)
	contentsFrame.Size = UDim2.new(0, 0, 0, 0) 
	self._contentsFrame = contentsFrame
	
	local inputPan = {}
	self._inputs = inputPan
	
	local uiListLayout = Instance.new("UIListLayout", contentsFrame)
	uiListLayout.Padding = UDim.new(0,4)
	uiListLayout.FillDirection = Enum.FillDirection.Horizontal
	uiListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Left
	uiListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	--uiListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
	self._uiListLayout = uiListLayout
	
	pcall(
		function()
			RoReplicateBase:AddSections(self)
		end
	)
	
	return self
end


--[[
- Adds Input Class(es) to this Section
- @param ... - Input Class(es)
--]]
function SectionClass:AddInputs(...)
	local arg = {...}
	for i=1, #arg do
		assert(true, "SectionClass:AddInput - parameter "..i.." is not a InputClass") --TODO ASSERTATION
		arg[i]:GetFrame().Parent = self._contentsFrame
		table.insert(self._inputs, #self._inputs+1, arg[i])	
	end
	self:_UpdateSize()
end


--[[
- Removes Input Class(es) to this Section
- @param ... - Input Class(es)
--]]
function SectionClass:RemoveInput(...)
	local arg = {...}
	for i=1, #arg do
		assert(getmetatable(arg[i]) == getmetatable(Input.new(Input.Enum.Custom)), "SectionClass:AddInput - parameter "..i.." is not a InputClass")
		arg[i]:GetFrame().Parent = nil
		table.remove(self._inputs, table.find(self._inputs, arg[i]))
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
- Returns an array of inputs for script manipulation elsewhere
- @return _inputs - InputClass array
--]]
function SectionClass:GetInputs()
	return self._inputs
end


--[[
- Internal Use
- @param titleText - string
--]]
function SectionClass:_CreateBottomFrame(titleText)
	local frame = Instance.new("Frame", self._frame)
	frame.BackgroundTransparency = 1
	frame.Position = UDim2.new(0,0,0,72) --Midpoints of Size
	frame.Size = UDim2.new(1,0,0,27) --X full, 20% of Y
	
	local textLabel = Instance.new("TextLabel", frame)
	RoReplicateUtility:SyncTextColor3(textLabel)
	textLabel.BackgroundTransparency = 1
	textLabel.Size = UDim2.new(1,0,1,0)
	textLabel.Text = titleText
	textLabel.TextXAlignment = Enum.TextXAlignment.Center
	textLabel.TextYAlignment = Enum.TextYAlignment.Center
	
	return frame
end

--[[
- TODO
-
--]]
function SectionClass:_UpdateSize()
	local total = UDim2.new(0,0,0,0)
	local fluff = 4*(#self._inputs - 1)
	for i=1, #self._inputs do
		total += self._inputs[i]:GetFrame().Size
	end
	
	self._frame.Size = UDim2.new(0,total.X.Offset+fluff+8,1,0)
	self._contentsFrame.Size = UDim2.new(0, total.X.Offset+fluff, 0, 72)
end


return SectionClass