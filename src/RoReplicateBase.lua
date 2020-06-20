local RoReplicateUtility = require(script.Parent.RoReplicateUtility)
local Section = require(script.Parent.Section)
local TestService = game:GetService("TestService")

RoReplicateBaseClass = {}

--[[ 
- Creates a new RoReplicateBaseClass.
- @param pluginInfo - DockWidgetPluginGuiInfo
- @param pluginName - string
--]]
function RoReplicateBaseClass.new(pluginInfo, pluginName) 
	local self = {}
	setmetatable(self, RoReplicateBaseClass)
	
	local frame = Instance.new("Frame")
	RoReplicateUtility.syncBackgroundColor(frame)
	frame.
	self._frame = frame
	
	self._sections = {}
	
	self:_UpdateSize()
	
	local widget = plugin:CreateDockWidgetPluginGui(pluginName, pluginInfo)
	widget.Title = "pluginName"
	self._widget = widget
	
	self._frame.Parent = self._widget
	
	--TODO: add uilayoutorder stuff to sort through sections.
	
	return self
end

--[[
- Adds a section to the RoReplicateBaseClass.
- @param section - Section Class Object.
--]]
function RoReplicateBaseClass:AddSection(section)
	self._sections = table.insert(self._sections, #self._sections+1, section)
end

--[[
- Updates the size from # of sections.
- Should only be used interally
--]]
function RoReplicateBaseClass:_UpdateSize()
	local sectionCount = table.length(self._sections)
	
	local _x = 0 --#of sections * amount of widgets in each + divider size
	
	self._sizeMin = UDim2.new(0, _x, 0, 96) --height is 96-100 pixels at 1920x1080, will have to recalculate for other displays
	
	self._sizeMax = UDim2.new(0,0,0,0)
end

return RoReplicateBaseClass
