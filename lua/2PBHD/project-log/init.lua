local data = require("2PBHD.project-log.data")
local Project = require("2PBHD.project-log.project")
local Window = require("2PBHD.project-log.windower")

---@class Project_Log
---@field data Data
---@field window Window

local Project_Log = {}
Project_Log.__index = Project_Log

function Project_Log:open_project_window()
	self.window:show()
	local a = self.data:get_formatted_data()
	self.window:set_data(a)
end

function Project_Log:add_project()
	local name = vim.fn.input("Name: ")
	local path = vim.fn.getcwd()
	if name == "" then
		local slash = string.find(string.reverse(path), "\\")
		name = string.sub(path, #path - (slash - 2), #path)
	end
	self.data:add_project(Project:new(name, path))
end

function Project_Log:new()
	return setmetatable({
		data = data,
		window = Window:new(
		function(project_name)
			local filtered_string = string.gmatch(project_name, "([^%-]+)")()
			vim.cmd.cd(data.projects[string.sub(filtered_string, 1, #filtered_string - 1)])
			vim.cmd.Ex()
		end,
		function (new_data)
			local out = {}
			for i = 1, #new_data, 1 do
				for k, v in string.gmatch(new_data[i], "([^%-]+) %-> (.*)") do
					out[k] = v
				end
			end
			data:write(out)
		end
		)
	}, self)
end

return Project_Log:new()
