local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({buffer = bufnr})
end)

lsp_zero.configure('gdscript', {
    force_setup = true, -- because the LSP is global. Read more on lsp-zero docs about this.
    single_file_support = false,
    cmd = {'ncat', '127.0.0.1', '6006'}, -- the important trick for Windows!
    root_dir = require('lspconfig.util').root_pattern('project.godot', '.git'),
    filetypes = {'gd', 'gdscript', 'gdscript3' }
})

local cmp = require('cmp')

cmp.setup({
  completion = { completeopt = 'menu,menuone,noinsert'},
  mapping = {
    ['<Tab>'] = cmp.mapping.confirm({select = false}),
    }
})

lsp_zero.setup()

-- here you can setup the language servers
local lsp_config = require('lspconfig')


lsp_config.lua_ls.setup({})
lsp_config.gdscript.setup({})
lsp_config.clangd.setup({})
