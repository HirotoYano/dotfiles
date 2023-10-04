-- packer.nvim を設定
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }
    use 'folke/tokyonight.nvim'
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }
    use('nvim-tree/nvim-web-devicons')
    use('kdheepak/tabline.nvim')
    use('echasnovski/mini.indentscope')
    use({
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
    })
    use {
        'nvim-neo-tree/neo-tree.nvim',
        branch = 'v2.x',
        requires = {
          'nvim-lua/plenary.nvim',
          'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
          'MunifTanjim/nui.nvim',
        }
    }
    use({
	    'lewis6991/gitsigns.nvim',
		config = function()
		    require('gitsigns').setup()
		end,
	})
    use({
        "nvim-telescope/telescope.nvim",
        tag = "0.1.2",
        requires = { { "nvim-lua/plenary.nvim" } },
     })
    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
    use("williamboman/mason.nvim")
    use("hrsh7th/cmp-nvim-lsp")
    use("hrsh7th/cmp-buffer")
    use("hrsh7th/cmp-path")
    use("hrsh7th/cmp-cmdline")
    use("hrsh7th/nvim-cmp")
    use("onsails/lspkind.nvim")
    use({
      "williamboman/mason-lspconfig.nvim",
      "neovim/nvim-lspconfig",
    })
    use({ "jose-elias-alvarez/null-ls.nvim", requires = "nvim-lua/plenary.nvim" })
    use({
      "folke/noice.nvim",
      requires = {
        "MunifTanjim/nui.nvim",
        "rcarriga/nvim-notify",
        }
    })
end)

