require("2PBHD.remap")
require("2PBHD.lsp-zero")
require("2PBHD.change-accounts")


vim.cmd.set("tabstop=4 shiftwidth=4")
vim.cmd.set("number relativenumber")
vim.cmd.set("undofile")

for _, thing in ipairs({
    'Normal', 'NormalNC', 'Comment', 'Constant', 'Special', 'Identifier',
    'Statement', 'PreProc', 'Type', 'Underlined', 'Todo', 'String', 'Function',
    'Conditional', 'Repeat', 'Operator', 'Structure', 'LineNr', 'NonText',
    'SignColumn', 'CursorLine', 'CursorLineNr', 'StatusLine', 'StatusLineNC',
    'EndOfBuffer',
  }) do
	vim.api.nvim_set_hl(0, thing, { bg = "none" })
  end
