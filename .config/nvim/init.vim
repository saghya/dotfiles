set number
set mouse=a
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set scrolloff=8
set termguicolors
set laststatus=2
set noshowmode
set completeopt=menu,menuone,noselect
" set nohlsearch
set clipboard+=unnamedplus
set hidden
set nobackup
set guicursor=i:ver1
set guicursor+=a:blinkon1
set cursorline
set noswapfile

au BufRead,BufNewFile *.asm set filetype=nasm
let g:c_syntax_for_h = 1

if ! filereadable(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim"'))
    echo "Downloading junegunn/vim-plug to manage plugins..."
    silent !mkdir -p ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/
    silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/plugged"'))

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'christianchiarulli/nvcode-color-schemes.vim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'

Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'saadparwaiz1/cmp_luasnip' " Snippets source for nvim-cmp
Plug 'L3MON4D3/LuaSnip' " Snippets plugin
Plug 'windwp/nvim-autopairs'
Plug 'norcalli/nvim-colorizer.lua'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'lukas-reineke/indent-blankline.nvim'

call plug#end()

lua require'lspconfig'.clangd.setup{}
lua require'lspconfig'.pyright.setup{}
lua require('nvim-autopairs').setup()
lua require'colorizer'.setup()
lua require'nvim-web-devicons'.setup()
lua require('lualine').setup{ options = { theme = 'palenight', component_separators = '', section_separators = '' } } 

nnoremap <SPACE> <Nop>
let mapleader = "\<Space>"

" nvim-autopairs
" inoremap <silent><expr> <C-Space> cmp#complete()
" inoremap <silent><expr> <CR>      cmp#confirm(luaeval("require 'nvim-autopairs'.autopairs_cr()"))
" inoremap <silent><expr> <C-e>     cmp#close('<C-e>')
" inoremap <silent><expr> <C-f>     cmp#scroll({ 'delta': +4 })
" inoremap <silent><expr> <C-d>     cmp#scroll({ 'delta': -4 })

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Using lua functions
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

" Keeping it centered"
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap H mzJ`z

" Disables automatic commenting on newline:
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Shortcutting split navigation, saving a keypress:
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
 
