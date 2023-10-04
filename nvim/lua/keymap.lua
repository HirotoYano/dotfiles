-- Leader
-- vim.api.nvim_set_var("mapLeader", " ")
vim.g.mapleader = " "

-- Esc
vim.api.nvim_set_keymap("i", "JJ", "<Esc>", { noremap = true })

-- ta
vim.api.nvim_set_keymap("n", "<Leader>t", ":tabnew<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>h", ":tabprevious<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>l", ":tabnext<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>c", ":tabclose<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>s", ":split<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>v", ":vsplit<CR>", { noremap = true })

-- window
vim.api.nvim_set_keymap("n", "<C-h>", "<C-w>h", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-j>", "<C-w>j", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-k>", "<C-w>k", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-l>", "<C-w>l", { noremap = true })

-- NeoTree
-- vim.keymap.set('n', '<Leader>f', ':NeoTreeFocusToggle<Return>', opts)

-- Telescope
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<Leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<Leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<Leader>gs", builtin.git_status, {})
vim.keymap.set("n", "<Leader>gl", builtin.git_commits, {})
vim.keymap.set("n", "<Leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<Leader>fo", builtin.oldfiles, {})
vim.keymap.set("n", "<Leader>fn", ":Telescope find_files cwd=~/.config/nvim<CR>", {})
vim.keymap.set("n", "<Leader>fc", builtin.colorscheme, {})
vim.keymap.set("n", "<Leader>fv", builtin.vim_options, {})
vim.keymap.set("n", "<Leader>fk", builtin.keymaps, {})
vim.keymap.set("n", "<Leader>fr", builtin.registers, {})

-- Format
vim.keymap.set("n", "<Leader>s", function()
    vim.lsp.buf.format({ async = true })
end, opts)
vim.keymap.set('n', '<Leader>k', '<cmd>lua vim.lsp.buf.hover()<CR>')
vim.keymap.set('n', '<Leader>d', '<cmd>lua vim.lsp.buf.definition()<CR>')
vim.keymap.set('n', '<Leader>r', '<cmd>lua vim.lsp.buf.references()<CR>')
-- vim.keymap.set('n', '<Leader>r', '<cmd>lua show_references()<CR>')
vim.keymap.set('n', '<Leader>n', '<cmd>lua vim.lsp.buf.rename()<CR>')
vim.keymap.set('n', '<Leader>a', '<cmd>lua vim.lsp.buf.code_action()<CR>')

-- python3
vim.api.nvim_set_keymap('n', '<Leader>e', [[:!python3 %<CR>]], { noremap = true, silent = true })

