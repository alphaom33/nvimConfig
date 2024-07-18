return {
	"folke/which-key.nvim",
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
	},
	"https://github.com/fedepujol/move.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = false
		vim.o.timeoutlen = 300
	end,
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
	}
}
