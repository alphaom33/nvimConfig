---@class Window
---@field win number
---@field buffer number
---@field onClose function
---@field data_callback function

local Window = {}
Window.__index = Window

function Window:new(callback, data_callback)
	return setmetatable({
		onClose = callback,
		data_callback = data_callback
	}, self)
end

function Window:toggle()
	if self.buffer == nil then
		self:show()
	else
		self:hide()
	end
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
		local width, height = 60, 10

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

		vim.keymap.set("n", "<Enter>", function ()
			local data = self:get_data()
			local pos = vim.fn.getcurpos()
			self:hide()
			self.onClose(data[pos[2]])
		end, { buffer = self.buffer })

		vim.keymap.set("n", "q", function ()
			self:hide()
		end, { buffer = self.buffer })

		vim.keymap.set("n", "<Esc>", function ()
			self:hide()
		end, { buffer = self.buffer })

		vim.api.nvim_create_autocmd("BufLeave", {
			buffer = self.buffer,
			callback = function ()
				local data = self:get_data()
				local out = {}
				for i = 1, #data, 1 do
					for k, v in string.gmatch(data[i], "([^%-]+) %-> (.*)") do
						out[k] = v
					end
				end
				self.data_callback(out)
			end
		})
		vim.cmd.set("syntax=mine")
end

function Window:set_data(data)
	vim.api.nvim_put(data, "l", false, false)
end

function Window:get_data()
	if self.buffer == nil then
		return ""
	end
	return vim.api.nvim_buf_get_lines(self.buffer, 0, vim.api.nvim_buf_line_count(self.buffer), false)
end

return Window
