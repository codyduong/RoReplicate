RoReplicateEnumClass = {}
RoReplicateEnumClass.__index = RoReplicateEnumClass


RoReplicateEnumClass.Panel = {}

RoReplicateEnumClass.Panel.Custom = {}

--[[
- Internal code used for creating a Custom panel type
--]]
function RoReplicateEnumClass.Panel.Custom()
	--this is purposely left empty, used for assertations moreso than anything
end


RoReplicateEnumClass.Panel.ButtomImageText = {}
RoReplicateEnumClass.Panel.ButtomImageText.Enum = {}
RoReplicateEnumClass.Panel.ButtomImageText.Enum.Style = {}

--[[
- Internal code used for creating a ButtonImageText panel type
--]]
function RoReplicateEnumClass.Panel.ButtomImage(gui)
	local frame = Instance.new("Frame", gui)
	
	local textButton = Instance.new("TextButton", frame)
	
	local imageButton = Instance.new("ImageButton", frame)
end


return RoReplicateEnumClass
