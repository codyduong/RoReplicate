local RoReplicateUtility = require(script.Parent.RoReplicateUtility)
local Section = require(script.Parent.Section)


RoReplicateBaseClass = {}
RoReplicateBaseClass.__index = RoReplicateBaseClass


--[[ 
- Creates a new RoReplicateBaseClass.
- @param pluginName - string
- @param pluginInfo - DockWidgetPluginGuiInfo
- @return self - RoReplicateBaseClass
--]]
function RoReplicateBaseClass.new(pluginName, pluginInfo)
	assert(type(pluginName)=="string", "RoReplicateBase.new - Parameter 1 is not a string")
	assert(getmetatable(pluginInfo)==getmetatable(DockWidgetPluginGuiInfo.new()), "RoReplicateBase.new - Parameter 2 is not a DockWidgetPluginGuiInfo")
	
	local self = {}
	setmetatable(self, RoReplicateBaseClass)
	
	local frame = Instance.new("Frame")
	RoReplicateUtility:SyncBackgroundColor3(frame)
	frame.Size = UDim2.new(1,0,1,0)
	--frame. I have no idea where this mutilated code came from. todo fix?
	self._frame = frame
	
	local arraySect = {}
	self._sections = arraySect
	
	self._pluginName = pluginName
	self._tempPluginInfo = pluginInfo
	
	self._sizeMin = UDim2.new(0,0,0,0)
	self._sizeMax = UDim2.new(0,0,0,0)
	
	local uiListLayout = Instance.new("UIListLayout", frame)
	uiListLayout.Padding = UDim.new(1,4)
	uiListLayout.FillDirection = Enum.FillDirection.Horizontal
	uiListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	uiListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
	
	return self
end


--[[
- Variadic Function
- Adds section(s) to the RoReplicateBaseClass.
- @param ... - Section Class
--]]
function RoReplicateBaseClass:AddSections(...)
	local arg = {...}
	for i=1, #arg do
		assert(getmetatable(arg[i])==getmetatable(Section.new("","")), "RoReplicateBaseClass:AddSection - Parameter "..i.." is not a SectionClass")
		if not pcall(function()
				self._sections = table.insert(self._sections, #self._sections+1, arg[i])
			end)
		then
			local arraySect = {arg[i]}
			self._sections = arraySect
		end
	end
end


--[[
- This method is executed last, it returns the plugin for the user to run.
- Due to some complications with how plugins are handled, it is required to pass the info back, and they run it themselves.
- Unfortunately, plugin is not a recognized enumerator outside of a plugin class
- @return tuple - string, DockWidgetPluginGuiInfo.new()
]]
function RoReplicateBaseClass:ReturnPlugin()
	self:_UpdateSize()
	
	local dWPGI = DockWidgetPluginGuiInfo.new(
		self._tempPluginInfo.InitialDockState,
	  	self._tempPluginInfo.InitialEnabled,
		self._tempPluginInfo.InitialEnabledShouldOverrideRestore,
		self._sizeMin.X.Offset,
		self._sizeMin.Y.Offset, 
		self._sizeMin.X.Offset,
		self._sizeMin.Y.Offset
	)
	
	return self._pluginName, dWPGI
end


--[[
- This method properly initializes everything afterwards (all it does it parent all the parts of the plugin back onto itself)
- @actualP = plugin:CreateDockWidgetPluginGui
--]]
function RoReplicateBaseClass:PluginRun(actualP)
	self._frame.Parent = actualP
end


--[[
- Internal use
--]]
function RoReplicateBaseClass:_UpdateSize()
	local total = 0 --TODO
	
	local _x = 0 --#of sections * amount of widgets in each + divider size
	local TEMP = 1 --TODO <- remove this ugly thing
	
	self._sizeMin = UDim2.new(TEMP, _x, 0, 100) --height is 96-100 pixels at 1920x1080, will have to recalculate for other displays
	
	self._sizeDef = UDim2.new(TEMP, _x, 0, 100)
end


return RoReplicateBaseClass
