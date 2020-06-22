RoReplicateEnumClass = {}
RoReplicateEnumClass.__index = RoReplicateEnumClass
RoReplicateEnumClass.Panel = {}
RoReplicateEnumClass.Panel.Custom = {}
RoReplicateEnumClass.Panel.ButtomImageText = {}


--[[
- Internal code used for creating a Custom panel type
--]]
function RoReplicateEnumClass.Panel.Custom()
  --this is purposely left empty, used for assertations moreso than anything
end


--[[
- Internal code used for creating a ButtonImageText panel type
--]]
function RoReplicateEnumClass.Panel.ButtomImageText()
  local frame = Instance.new("Frame")
  --TODO
end


return RoReplicateEnumClass
