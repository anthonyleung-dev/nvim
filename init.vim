syntax on

source $HOME/.config/nvim/plugin.vim
source $HOME/.config/nvim/tree.vim

colorscheme onedark

" Keymap
let mapleader=" "
:set number relativenumber
nnoremap <SPACE> <Nop>
nnoremap <esc> :noh<return><esc>

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Set completeopt to have a better completion experience
" set completeopt=menu,menuone,noselect
set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
set shortmess+=c

"
let g:airline_theme='onedark'
" let g:transparent_enabled = v:true
set clipboard=unnamedplus

" comment shortcut
vmap ++ <plug>NERDCommenterToggle
nmap ++ <plug>NERDCommenterToggle

" nvim-treesitter

lua << EOF
require'nvim-treesitter.configs'.setup {
  -- Install language parser
  -- :TSInstallInfo
  ensure_installed = {"html", "css", "vim", "lua", "javascript", "typescript", "tsx", "php"},
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false
  },

  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<CR>',
      node_incremental = '<CR>',
      node_decremental = '<BS>',
      scope_incremental = '<TAB>',
    }
  },
}
vim.wo.foldmethod = 'expr'
vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'
-- https://stackoverflow.com/questions/8316139/how-to-set-the-default-to-unfolded-when-you-open-a-file
vim.wo.foldlevel = 99
EOF

" minimap
let g:minimap_width = 10
let g:minimap_auto_start = 1
let g:minimap_auto_start_win_enter = 1

nnoremap <silent> <leader> :WhichKey '<Space>'<CR>

" By default timeoutlen is 1000 ms
set timeoutlen=500
"

source $HOME/.config/nvim/lsp.vim
" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" lspsaga
" nnoremap <silent> gh :Lspsaga lsp_finder<CR>
" nnoremap <silent><leader>ca :Lspsaga code_action<CR>
" vnoremap <silent><leader>ca :<C-U>Lspsaga range_code_action<CR>
nnoremap <silent> K <cmd>lua require('lspsaga.hover').render_hover_doc()<CR>
nnoremap <silent>K :Lspsaga hover_doc<CR>
nnoremap <silent> <C-f> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>
nnoremap <silent> <C-b> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>
nnoremap <silent> <C-k> :Lspsaga preview_definition<CR>
nnoremap <silent>gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <slient> ` :ToggleTerm float<CR>
nnoremap <silent> ` <ESC> :ToggleTerm<CR>
