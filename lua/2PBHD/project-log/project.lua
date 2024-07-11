---@class Project
---@field name string
---@field path string 
Project = {}

function Project:new(name, path)
	return setmetatable({
		name = name,
		path = path
	}, self)
end
return Project
