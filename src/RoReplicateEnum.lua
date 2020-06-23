local RoReplicateUtility = require(script.Parent.RoReplicateUtility)

RoReplicateEnumClass = {}
RoReplicateEnumClass.__index = RoReplicateEnumClass

----[[
--RoReplicateEnumClass.Panel = {}
--
--RoReplicateEnumClass.Panel.Custom = {}
--
----[[
--- Internal code used for creating a Custom panel type
----]]
--function RoReplicateEnumClass.Panel.Custom()
--	--this is purposely left empty, used for assertations moreso than anything
--end
--
--
--RoReplicateEnumClass.Panel.ButtomImage = {}
--RoReplicateEnumClass.Panel.ButtomImage.Enum = {}
--RoReplicateEnumClass.Panel.ButtomImage.Enum.Style = {}
--
----[[
--- Internal code used for creating a ButtonImageText panel type
----]]
--function RoReplicateEnumClass.Panel.ButtomImage(gui)
--	local frame = Instance.new("Frame", gui)
--	RoReplicateUtility:SyncBackgroundColor3(frame)
--	RoReplicateUtility:SyncBorderColor3(frame)
--	frame.Size = UDim2.new(1,0,1,0)
--	
--	local textButton = Instance.new("TextButton", frame)
--	
--	local imageButton = Instance.new("ImageButton", frame)
--	
--	print("woot")
--end
----]]
return RoReplicateEnumClass