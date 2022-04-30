syntax on

call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'ojroques/nvim-lspfuzzy'
Plug 'akinsho/toggleterm.nvim'
Plug 'sheerun/vim-polyglot'
" Plug 'nvim-autopairs'
" Git
Plug 'nvim-lua/plenary.nvim'
Plug 'lewis6991/gitsigns.nvim'
Plug 'sindrets/diffview.nvim'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'norcalli/nvim-colorizer.lua'
Plug 'norcalli/nvim-base16.lua'
Plug 'glepnir/dashboard-nvim'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'feline-nvim/feline.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'hoob3rt/lualine.nvim'
Plug 'karb94/neoscroll.nvim'
Plug 'folke/todo-comments.nvim'

" cheatsheet
Plug 'sudormrfbin/cheatsheet.nvim'
Plug 'nvim-lua/popup.nvim'
" Plug 'tpope/vim-fugitive'
Plug 'f-person/git-blame.nvim'
Plug 'kkoomen/vim-doge', { 'do': { -> doge#install() } }
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'sbdchd/neoformat'
Plug 'prettier/vim-prettier', { 'do': 'yarn install --frozen-lockfile --production' }
Plug 'navarasu/onedark.nvim'

Plug 'neovim/nvim-lspconfig'
Plug 'glepnir/lspsaga.nvim'
Plug 'lspcontainers/lspcontainers.nvim'
Plug 'ray-x/lsp_signature.nvim'
Plug 'onsails/lspkind-nvim'
Plug 'onsails/diaglist.nvim'

"cmp
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

" For vsnip users.
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

Plug 'xiyaowong/nvim-transparent'

Plug 'neovim/nvim-lspconfig'
Plug 'kosayoda/nvim-lightbulb'

" mini map
Plug 'wfxr/minimap.vim'

" comment code
Plug 'preservim/nerdcommenter'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'kevinhwang91/nvim-bqf'
Plug 'folke/which-key.nvim'
Plug 'kevinhwang91/nvim-bqf'
call plug#end()

lua require'nvim-web-devicons'.setup()
lua require'nvim-tree'.setup()
lua require('onedark').setup()
lua require('lspfuzzy').setup()
lua require("toggleterm").setup()
lua require('gitsigns').setup()
lua require('feline').setup()
lua require("todo-comments").setup()
lua require("which-key").setup()
lua require("diffview").setup()