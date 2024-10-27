function SetAccount(name)
	vim.cmd.let('$GH_CONFIG_DIR = "' .. name  .. '"')
end

vim.keymap.set("n", "<C-A>", function ()
	SetAccount(".alphaom33")
end)

vim.keymap.set("n", "<C-M>", function ()
	SetAccount(".mborchert")
end)
