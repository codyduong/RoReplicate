local RoReplicate = script.Parent
local RoReplicateBase = require(RoReplicate.RoReplicateBase)
local RoReplicateUtility = require(RoReplicate.RoReplicateUtility)
local Section = require(RoReplicate.Section)


local pluginInfo = DockWidgetPluginGuiInfo.new(
	Enum.InitialDockState.Float,  -- Widget will be initialized in floating panel
	true,   -- Widget will be initially enabled
	true  -- Don't override the previous enabled state
)


local RoPlugin = RoReplicateBase.new("RoPlugin", pluginInfo)
local Section1 = Section.new("1", "Section 1")
RoPlugin:AddSection(Section1)
local YourPlugin = plugin:CreateDockWidgetPluginGui(RoPlugin:ReturnPlugin())
YourPlugin.Title = RoPlugin:ReturnPlugin()
RoPlugin:PluginRun(YourPlugin)
