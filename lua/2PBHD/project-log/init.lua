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
	if name == "" then
		return
	end
	self.data:add_project(Project:new(name, vim.fn.getcwd()))
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
			data:write(new_data)
		end
		)
	}, self)
end

return Project_Log:new()
