local Path = require("plenary.path")
Project = require("2PBHD.project-log.project")

---@class Data
---@field projects [Project]
local Data = {}
Data.__index = Data
Data.projects = {}

local data_path = string.format("%s/projectLog/projects.json", vim.fn.stdpath("data"))

local function ensureDir()
	local path = Path:new(vim.fn.stdpath("data") .. "/projectLog")
	if not path:exists() then
		path:mkdir()
		Path:new(data_path):write("", "w")
	end
end

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
	write(self.projects)
end

---@param project string
function Data:remove_project(project)
	self.projects[project] = nil
	write(self.projects)
end

function Data:write(new_data)
	self.projects = new_data
	write(self.projects)
end

function Data:get_formatted_data()
	local format = {}
	for k, v in pairs(self.projects) do
		format[#format + 1] = k .. "," .. v
	end
	return format
end

function Data:new()
	ensureDir()
	return setmetatable({
		projects = read()
	}, self)
end

return Data:new()
