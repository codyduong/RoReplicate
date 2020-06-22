local RoReplicate = script.Parent
local RoReplicateBase = require(RoReplicate.RoReplicateBase)
local RoReplicateUtility = require(RoReplicate.RoReplicateUtility)
local RoReplicateEnum = require(RoReplicate.RoReplicateEnum)
local Section = require(RoReplicate.Section)
local Panel = require(RoReplicate.Panel)

local pluginInfo = DockWidgetPluginGuiInfo.new(
	Enum.InitialDockState.Float,  -- Widget will be initialized in floating panel
	true,   -- Widget will be initially enabled
	true  -- Don't override the previous enabled state
)


local roPlugin = RoReplicateBase.new("RoPlugin", pluginInfo)

local section_1 = Section.new("1", "Section 1")
local section_2 = Section.new("2", "Section 2")
roPlugin:AddSections(section_1, section_2)

local s1_panel_1 = Panel.new(RoReplicateEnum.Panel.Custom)
local s1_panel_2 = Panel.new(RoReplicateEnum.Panel.ButtonImageText)
section_1:AddPanels(s1_panel_1, s1_panel_2)

local yourPlugin = plugin:CreateDockWidgetPluginGui(roPlugin:ReturnPlugin())
yourPlugin.Title = roPlugin:ReturnPlugin()
roPlugin:PluginRun(yourPlugin)
