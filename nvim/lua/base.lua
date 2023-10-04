-- ファイル
vim.opt.fileencoding = "utf-8" -- エンコーディングをUTF-8に設定
vim.opt.swapfile = false -- スワップファイルを作成しない
vim.opt.helplang = "ja" -- ヘルプファイルの言語は日本語
vim.opt.hidden = true -- バッファを切り替えるときにファイルを保存しなくてもOKに

-- カーソルと表示
vim.opt.cursorline = true -- カーソルがある行を強調
vim.opt.number = true -- 行番号を表示
vim.opt.wrap = false -- テキストの自動折り返しを無効に
vim.opt.showtabline = 2 -- タブラインを表示（1:常に表示、2:タブが開かれたときに表示）
vim.opt.visualbell = true -- ビープ音を表示する代わりに画面をフラッシュ
vim.opt.showmatch = true -- 対応する括弧をハイライト表示

-- クリップボード共有
vim.opt.clipboard:append({ "unnamedplus" }) -- レジスタとクリップボードを共有

-- メニューとコマンド
vim.opt.wildmenu = true -- コマンドラインで補完
vim.opt.cmdheight = 1 -- コマンドラインの表示行数
vim.opt.laststatus = 2 -- 下部にステータスラインを表示
vim.opt.showcmd = true -- コマンドラインに入力されたコマンドを表示

-- 検索・置換
vim.opt.hlsearch = true -- ハイライト検索を有効
vim.opt.incsearch = true -- インクリメンタルサーチを有効
vim.opt.matchtime = 1 -- 入力された文字列がマッチするまでにかかる時間

-- カラースキーム
-- vim.opt.termguicolors = true -- 24 ビットカラーを使用
-- vim.opt.background = "dark" -- ダークカラーを使用する
vim.cmd[[colorscheme tokyonight-night]]

-- インデント
vim.opt.shiftwidth = 4 -- シフト幅を4に設定する
vim.opt.tabstop = 4 -- タブ幅を4に設定する
vim.opt.expandtab = true -- タブ文字をスペースに置き換える
vim.opt.autoindent = true -- 自動インデントを有効にする
vim.opt.smartindent = true -- インデントをスマートに調整する

-- ハイライトグループ LineNr の色を設定
vim.cmd('highlight LineNr ctermfg=DarkGray guifg=DarkGray')

-- ハイライト設定を適用
vim.api.nvim_command('augroup MyCustomHighlight')
vim.api.nvim_command('autocmd!')
vim.api.nvim_command('autocmd ColorScheme * highlight LineNr ctermfg=DarkGray guifg=DarkGray')
vim.api.nvim_command('augroup END')

-- 括弧、コーテーションマークの自動補完を有効にする
vim.api.nvim_set_keymap('i', '(', '()<Left>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '[', '[]<Left>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '{', '{}<Left>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '"', '""<Left>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', "'", "''<Left>", { noremap = true, silent = true })

-- コメントアウト
require('Comment').setup()

-- ステータスライン
require("lualine").setup()

-- タブライン
require("tabline").setup()

-- インデントの可視化
require("mini.indentscope").setup({
  symbol = "▏",
})

-- シンタックスハイライト
require("nvim-treesitter.configs").setup({
  auto_install = true,
  highlight = {
    enable = true,
  },
})

-- NvimTreeが表示された後にファイラーウィンドウを選択
vim.cmd([[
  autocmd FileType NenTree setlocal cursorline
  autocmd WinEnter * if winnr('$') == 1 && exists('b:std_in') | wincmd p | endif
]])

-- ファジーファインダー
require("telescope").setup({
    defaults = {
        file_ignore_patterns = {
            -- 検索から除外するものを指定
            "^.git/",
            "^.cache/",
            "^Library/",
            "Parallels",
            "^Movies",
            "^Music",
        },
        vimgrep_arguments = {
            -- ripggrepコマンドのオプション
            "rg",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
            "-uu",
        },
    },
    extensions = {
        -- ソート性能を大幅に向上させるfzfを使う
        fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
        },
    },
})
require("telescope").load_extension("fzf")

-- noice
require("noice").setup({
  cmdline = {
    format = {
      -- search iconの文字化け対策
      search_down = { kind = "search", pattern = "^/", icon = " ", lang = "regex" },
      search_up = { kind = "search", pattern = "^%?", icon = " ", lang = "regex" },
    },
  },
  lsp = {
    -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true,
    },
  },
  -- you can enable a preset for easier configuration
  presets = {
    bottom_search = false, -- use a classic bottom cmdline for search
    command_palette = false, -- position the cmdline and popupmenu together
    long_message_to_split = true, -- long messages will be sent to a split
    inc_rename = false, -- enables an input dialog for inc-rename.nvim
    lsp_doc_border = false, -- add a border to hover docs and signature help
  },
})

