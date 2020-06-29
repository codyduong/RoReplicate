--Needed vars for running RoReplicate
local RoReplicate = script.Parent
local RoReplicateBase = require(RoReplicate.RoReplicateBase)
local RoReplicateUtility = require(RoReplicate.RoReplicateUtility)
local Section = require(RoReplicate.Section)
local Input = require(RoReplicate.Input)

--https://developer.roblox.com/en-us/api-reference/datatype/DockWidgetPluginGuiInfo
local pluginInfo = DockWidgetPluginGuiInfo.new(
	Enum.InitialDockState.Float,  -- Widget will be initialized in floating input
	true,   -- Widget will be initially enabled
	true  -- Don't override the previous enabled state
)

--Instantiates the Base Class used in RoReplicate
local roPlugin = RoReplicateBase.new("RoPlugin", pluginInfo)

--Instantiate any sections you wish to create
local section_1 = Section.new("1", "Section 1", roPlugin)
local section_2 = Section.new("2", "Section 2", roPlugin)
--roPlugin:AddSections(section_1, section_2) --This parents it to the BaseClass

local s1_input_1 = Input.new(Input.Enum.ButtonImage, section_1)
local s1_input_2 = Input.new(Input.Enum.ButtonImage, section_1)
--section_1:AddInputs(s1_input_1, s1_input_2) --This parents it to the BaseClass

for i=1, 4 do
	local input = Input.new(Input.Enum.ButtonImage, section_2)
end


--This actually creates the pluginWidget,
--if everything was done right before the next three lines shouldn't be changed at all.
--just copy&paste
local yourPlugin = plugin:CreateDockWidgetPluginGui(roPlugin:ReturnPlugin()) 
yourPlugin.Title = roPlugin:ReturnPlugin()
local Replicate = roPlugin:GetFrame():Clone()
Replicate.Parent = workspace
roPlugin:PluginRun(yourPlugin)