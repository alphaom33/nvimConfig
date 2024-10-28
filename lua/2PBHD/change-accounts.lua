function SetAccount(name)
	vim.cmd.let('$GH_CONFIG_DIR = "' .. name  .. '"')
end

local modes = {"n"}

vim.keymap.set(modes, "<C-A>", function ()
	SetAccount(".alphaom33")
end)

vim.keymap.set(modes, "<C-M>", function ()
	SetAccount(".mborchert")
end)
