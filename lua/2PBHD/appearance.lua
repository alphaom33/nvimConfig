for _, thing in ipairs({
	'Normal', 'NormalNC',
	'StatusLine', 'StatusLineNC',
	'CursorLine', 'CursorLineNr',
	'EndOfBuffr',
}) do
	vim.api.nvim_set_hl(0, thing, { bg = "none" })
end

vim.api.nvim_create_autocmd("BufWinEnter", {
	callback = function ()
		vim.api.nvim_set_hl(0, 'LineNr', {bg = "none"})
	end
})

vim.g.netrw_banner = 0
