--Needed vars for running RoReplicate
local RoReplicate = script.Parent
local RoReplicateBase = require(RoReplicate.RoReplicateBase)
local RoReplicateUtility = require(RoReplicate.RoReplicateUtility)
local RoReplicateEnum = require(RoReplicate.RoReplicateEnum)
local Section = require(RoReplicate.Section)
local Panel = require(RoReplicate.Panel)

--https://developer.roblox.com/en-us/api-reference/datatype/DockWidgetPluginGuiInfo
local pluginInfo = DockWidgetPluginGuiInfo.new(
	Enum.InitialDockState.Float,  -- Widget will be initialized in floating panel
	true,   -- Widget will be initially enabled
	true  -- Don't override the previous enabled state
)

--Instantiates the Base Class used in RoReplicate
local roPlugin = RoReplicateBase.new("RoPlugin", pluginInfo)

--Instantiate any sections you wish to create
local section_1 = Section.new("1", "Section 1")
local section_2 = Section.new("2", "Section 2")
roPlugin:AddSections(section_1, section_2) --This parents it to the BaseClass

--Instantiate any panels you wish to create
local s1_panel_1 = Panel.new(RoReplicateEnum.Panel.ButtonImageText)
local s1_panel_2 = Panel.new(RoReplicateEnum.Panel.ButtonImageText)
section_1:AddPanels(s1_panel_1, s1_panel_2) --This parents it to the BaseClass


for i=1, 5 do
	local panel = Panel.new(RoReplicateEnum.Panel.ButtonImageText)
	section_2:AddPanels(panel)
end


--This actually creates the pluginWidget,
--if everything was done right before the next three lines shouldn't be changed at all.
--just copy&paste
local yourPlugin = plugin:CreateDockWidgetPluginGui(roPlugin:ReturnPlugin()) 
yourPlugin.Title = roPlugin:ReturnPlugin()
roPlugin:PluginRun(yourPlugin)
