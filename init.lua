require("config.lazy")

require("mason").setup()

require("lsp-zero")
require("lspconfig").intelephense.setup({})

require("2PBHD")

require("nvim-treesitter.configs").setup({
	-- Add languages to be installed here that you want installed for treesitter
	ensure_installed = {
		"c", "cpp", "lua","rust", "tsx", "typescript", "vim",
		"markdown", "bash", "html", "css", "clojure", "vimdoc",
		"java"
	}
})
