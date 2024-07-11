---@class Window
---@field win number
---@field buffer number
---@field toggled boolean

local Window = {}
Window.__index = Window

function Window:new()
	return self
end

function Window:toggle()
	if not self.toggled then
		self:show()
	else
		self:hide()
	end
	self.toggled = not self.toggled
end

function Window:hide()
	vim.api.nvim_buf_delete(self.buffer, { force = true })
	if vim.api.nvim_win_is_valid(self.win) then
		vim.api.nvim_win_close(self.win, true)
	end

	self.buffer = nil
	self.win = nil
end

function Window:show()
		local width, height = 50, 2

		self.buffer = vim.api.nvim_create_buf(false, true)
		self.win = vim.api.nvim_open_win(self.buffer, true, {
			relative = 'editor',
			row = math.floor((vim.o.lines - height) / 2 - 1),
			col = math.floor((vim.o.columns - width) / 2),
			width = width,
			height = height,
			title = "Project Name",
			style = "minimal",
			border = "single",
		})

		local curr_file = vim.api.nvim_buf_get_name(0)
		
end

return Window
