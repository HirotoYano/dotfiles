-- require("mason").setup()
require("mason").setup({
    ui = {
        border = 'single',
    },
})

require("mason-lspconfig").setup({
	ensure_installed = {
		"pyright",
		"lua_ls",
	},
})

require("lspconfig").pyright.setup({})
require("lspconfig").lua_ls.setup({})
require("lspconfig").dockerls.setup({})
require("lspconfig").docker_compose_language_service.setup({})

local null_ls = require("null-ls")
null_ls.setup({
	sources = {
		null_ls.builtins.formatting.black, -- python formatter
		null_ls.builtins.formatting.isort, -- python import sort
		null_ls.builtins.diagnostics.flake8, -- python linter
		null_ls.builtins.formatting.stylua, -- lua formatter
		null_ls.builtins.diagnostics.luacheck, -- lua linter
	},
})

-- Quickfixウィンドウを自動的に閉じる設定
vim.api.nvim_exec([[
  augroup AutoCloseQuickfix
    autocmd!
    autocmd WinLeave * if &filetype == 'qf' && !&previewwindow | q | endif
  augroup END
]], false)

