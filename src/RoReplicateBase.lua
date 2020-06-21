local RoReplicateUtility = require(script.Parent.RoReplicateUtility)
local Section = require(script.Parent.Section)
local TestService = game:GetService("TestService")

RoReplicateBaseClass = {}
RoReplicateBaseClass.__index = RoReplicateBaseClass

--[[ 
- Creates a new RoReplicateBaseClass.
- @param pluginName - string
- @param pluginInfo - DockWidgetPluginGuiInfo
--]]
function RoReplicateBaseClass.new(pluginName, pluginInfo) 
	local self = {}
	setmetatable(self, RoReplicateBaseClass)
	
	local frame = Instance.new("Frame")
	RoReplicateUtility:syncBackgroundColor3(frame)
	--frame. I have no idea where this mutilated code came from. todo fix?
	self._frame = frame
	
	self._sections = {}
	
	self._pluginName = pluginName
	
	self._sizeMin = UDim2.new(0,0,0,0)
	self._sizeMax = UDim2.new(0,0,0,0)
	
	--self:_UpdateSize() --sets widget mins and maxes? This should be done manually by user through another method. As if
	--init here it will result in nil.
	
	self._tempPluginInfo = pluginInfo
	
	--[[Due to the nature of how CreateDockWidgetPluginGui, these lines should ideally be executed last.
	- Otherwise you cannot configure min or max size, etc, afterwards.
	local widget = plugin:CreateDockWidgetPluginGui(pluginName, pluginInfo)
	widget.Title = "pluginName"
	self._widget = widget
	self._frame.Parent = self._widget
	]]
	
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
- This method is executed last, it returns the plugin for the user to run.
- Due to some complications with how plugins are handled, it is required to pass the info back, and they run it themselves.
- Unfortunately, lugin is not a recognized enumerator outside of a plugin class
]]
function RoReplicateBaseClass:ReturnPlugin()
	local dWPGI = DockWidgetPluginGuiInfo.new(
	--self._tempPluginInfo.InitalDockState, it's unbelievable the InitialDockState can't be accessed but everything else can be, roblox coding oversight :(
		Enum.InitialDockState.Float, --lets default to this until another param is accepted?
	  	self._tempPluginInfo.InitialEnabled,
		self._tempPluginInfo.InitialEnabledShouldOverrideRestore,
		self._sizeMin.X.Offset,
		self._sizeMin.Y.Offset, 
		self._sizeMin.X.Offset,
		self._sizeMin.Y.Offset
	)
	self._tempPluginInfo = nil
	
	return self._pluginName, dWPGI
end

--[[
- This method properly initializes everything afterwards (all it does it parent all the parts of the plugin back onto itself)
- @actualP = plugin:CreateDockWidgetPluginGui
--]]
function RoReplicateBaseClass:PluginRun(actualP)
	--todo
end

--[[
- Updates the size from # of sections.
- Should only be used interally
--]]
function RoReplicateBaseClass:_UpdateSize()
	local sectionCount = table.length(self._sections)
	
	local _x = 0 --#of sections * amount of widgets in each + divider size
	
	self._sizeMin = UDim2.new(0, _x, 0, 96) --height is 96-100 pixels at 1920x1080, will have to recalculate for other displays
	
	self._sizeDef = UDim2.new(0, _x, 0, 96)
end

return RoReplicateBaseClass
