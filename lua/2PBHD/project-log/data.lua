local Path = require("plenary.path")
Project = require("2PBHD.project-log.project")

---@class Data
---@field projects [Project]
local Data = {}
Data.__index = Data
Data.projects = {}

local data_path = string.format("%s/projectLog/projects.json", vim.fn.stdpath("data"))

---@return [Project]
local function read()
	local data = Path:new(data_path):read()
	if data == "" then
		data = "[]"
	end
	return vim.json.decode(data)
end

---@param data Data
local function write(data)
	Path:new(data_path):write(vim.json.encode(data), "w")
end

---@param project Project
function Data:add_project(project)
	self.projects[project.name] = project.path
	print(vim.json.encode(self.projects))
	write(self.projects)
end

function Data:new()
	return setmetatable({
		projects = read()
	}, self)
end

return Data
