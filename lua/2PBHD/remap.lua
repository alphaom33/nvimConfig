vim.keymap.set("n", "-", function ()
	vim.cmd.Ex()
end)

vim.g.mapleader = " "

vim.keymap.set("n", "<A-t>", function ()
	vim.cmd.edit("term://bash")
end)
vim.keymap.set("t", "<Esc>", function ()
	vim.cmd("bd!")
end)

--why do I have to add these help they should work on their own but they don't
vim.keymap.set({"n", "v"}, "<S-Insert>", "\"+p", { noremap = true })
vim.keymap.set("i", "<S-Insert>", "<C-o>\"+p", { noremap = true })
vim.keymap.set({"n", "v"}, "<C-Insert>", "\"+y", { noremap = true })

vim.keymap.set({"n"}, "<C-d>", function()
	vim.cmd("Dashboard")
end, {noremap = true})
