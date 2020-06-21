local RoReplicate = script.Parent
local RoReplicateBase = require(RoReplicate.RoReplicateBase)
local RoReplicateUtility = require(RoReplicate.RoReplicateUtility)
local Section = require(RoReplicate.Section)

local pluginInfo = DockWidgetPluginGuiInfo.new(
	Enum.InitialDockState.Float,  -- Widget will be initialized in floating panel
	true,   -- Widget will be initially enabled
	false,  -- Don't override the previous enabled state
	0,    -- Default width of the floating window
	0,    -- Default height of the floating window
	0,    -- Minimum width of the floating window
	0     -- Minimum height of the floating window
)

local RoPlugin = RoReplicateBase.new("RoPlugin", pluginInfo)
local Section1 = Section.new("1", "Section 1")
local YourPlugin = plugin:CreateDockWidgetPluginGui(RoPlugin:ReturnPlugin())
