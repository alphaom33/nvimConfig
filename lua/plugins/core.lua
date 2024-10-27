return {
	"folke/which-key.nvim",
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
	},
	"https://github.com/fedepujol/move.nvim",
	"nvim-java/nvim-java",
	"williamboman/mason-lspconfig.nvim",
	"https://git.sr.ht/~whynothugo/lsp_lines.nvim",
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
	},
}
