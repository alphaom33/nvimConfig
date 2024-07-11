local Path = require("plenary.path")

local Data = require("2PBHD.project-log.data")
local Project = require("2PBHD.project-log.project")
local Window = require("2PBHD.project-log.windower")

---@class Project_Log
---@field data Data
---@field window Window

local Project_Log = {}
Project_Log.__index = Project_Log

function Project_Log:new()
	local project_log = setmetatable({
		data = Data:new(),
		window = Window:new()
	}, self)
	return project_log
end

function Project_Log:add_project()
	self.window:toggle()
end

local the_project_log = Project_Log:new()

function Project_Log.setup(self, partial_config)
	if self ~= the_project_log then
		partial_config = self
		self = the_project_log
	end

	vim.api.nvim_create_user_command("JumpProj", function(opts)
		local path = self.data.projects[opts.args]
		vim.cmd.cd(path)
		vim.cmd.Ex()
	end, { nargs = 1 })

	vim.api.nvim_create_user_command("MakeProj", function(opts)
		local path = vim.fn.expand("%")
		if (not Path:new(path):is_dir()) then
			print("what")
			return
		end
		self.data:add_project(Project:new(opts.args, path))
	end, { nargs = 1 })

	return self
end

return the_project_log
