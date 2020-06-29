local Section = require(script.Parent.Section)

CategoryClass = {}
CategoryClass.__Index = CategoryClass

function CategoryClass.new(categoryName)
	local self = {}
	setmetatable(self, CategoryClass)
	
	local secArray = {}
	self._sections = secArray
	
	return self
end


--[[
- Adds section(s) to the CategoryClass.
- @param ... - Section Class(es)
--]]
function CategoryClass:AddSections(...)
	local arg = {...}
	for i=1, #arg do
		assert(getmetatable(arg[i])==getmetatable(Section.new("","")), "CategoryClass:AddSection - Parameter "..i.." is not a SectionClass")
		--arg[i]:GetFrame().Parent = self, disabled for now
		table.insert(self._sections, #self._sections+1, arg[i])
	end
end


--[[
- Removes section(s) to the CategoryClass.
- @parma ... - Section Class(es)
--]]
function CategoryClass:RemoveSections(...)
	local arg = {...}
	for i=1, #arg do
		assert(getmetatable(arg[i])==getmetatable(Section.new("","")), "CategoryClass:AddSection - Parameter "..i.." is not a SectionClass")
		arg[i]:GetFrame().Parent = nil
		table.remove(self._sections, table.find(self._sections, arg[i]))
	end
end 


--[[
-TODO
--]]
function CategoryClass:GetSections()
	return self._sections
end