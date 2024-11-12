local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
	-- see :help lsp-zero-keybindings
	-- to learn the available actions
	lsp_zero.default_keymaps({
		buffer = bufnr,
		preserve_mappings = false,
	})
end)

lsp_zero.configure('gdscript', {
	force_setup = true, -- because the LSP is global. Read more on lsp-zero docs about this.
	single_file_support = false,
	cmd = {'ncat', '127.0.0.1', '6006'}, -- the important trick for Windows!
	root_dir = require('lspconfig.util').root_pattern('project.godot', '.git'),
	filetypes = {'gd', 'gdscript', 'gdscript3'}
})

local cmp = require("cmp")

cmp.setup({
	snippet = {
		expand = function(args)
			vim.snippet.expand(args.body)
		end
	},
	sources = cmp.config.sources({
		{name = "nvim_lsp"},
		{name = "conjure"}
	}, {
		{name = "buffer"}
	}),
	completeopt = 'menu,menuone,noinsert',
	mapping =  {
		['<Tab>'] = cmp.mapping.confirm({select = true}),
		['<S-j>'] = cmp.mapping.select_next_item({default = 'select'}),
		['<S-k>'] = cmp.mapping.select_prev_item({default = 'select'}),
	},
})

lsp_zero.setup()

--local capabilities = require("cmp_nvim_lsp").default_capabilities()
-- here you can setup the language servers
local lsp_config = require('lspconfig')

lsp_config.gdscript.setup({})

require('mason').setup({})
require('mason-lspconfig').setup({
	ensure_installed = {},
	handlers = {
		function(server_name)
			require('lspconfig')[server_name].setup({
				--capabilities = capabilities
			})
		end,
	},
})
