require("2PBHD.remap")
require("2PBHD.lsp-zero")
require("2PBHD.delete-windows")


vim.cmd.set("tabstop=4 shiftwidth=4")
vim.cmd.set("number relativenumber")
vim.cmd.set("undofile")

for _, thing in ipairs({
	'Normal', 'NormalNC',
	'StatusLine', 'StatusLineNC',
	'CursorLine', 'CursorLineNr',
	'EndOfBuffr',
}) do
	vim.api.nvim_set_hl(0, thing, { bg = "none" })
end
