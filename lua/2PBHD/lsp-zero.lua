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


local cmp = require('cmp')

cmp.setup({
	completion = { completeopt = 'menu,menuone,noinsert'},
	mapping = {
		['<Tab>'] = cmp.mapping.confirm({select = false}),
		['<S-j>'] = cmp.mapping.select_next_item({default = 'select'}),
		['<S-k>'] = cmp.mapping.select_prev_item({default = 'select'}),
	}
})

local lsp_configurations = require('lspconfig.configs')

if not lsp_configurations.rock then
	print("no rock")
	lsp_configurations.rock = {
		default_config = {
			cmd = {'bash'},
			filetypes = {'rock'},
			root_dir = require('lspconfig.util').root_pattern('Main.rock')
		}
	}
end

lsp_zero.setup()

-- here you can setup the language servers
local lsp_config = require('lspconfig')

lsp_config.gdscript.setup({})
lsp_config.rock.setup({})

require('mason').setup({})
require('mason-lspconfig').setup({
	ensure_installed = {},
	handlers = {
		function(server_name)
			require('lspconfig')[server_name].setup({})
		end,
	},
})

require("java").setup()
lsp_config.jdtls.setup({})
