vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("n", "<A-t>", function ()
	vim.cmd.edit("term://bash")
end)
vim.keymap.set("t", "<Esc>", function ()
	vim.cmd("bd!")
end)

--why do I have to add these help they should work on their own but they don't
vim.keymap.set({"n", "v", "i"}, "<S-Insert>", "\"+p", { noremap = true })
vim.keymap.set({"n", "v"}, "<C-Insert>", "\"+y", { noremap = true })
