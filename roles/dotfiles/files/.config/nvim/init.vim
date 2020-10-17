if (has("termguicolors"))
  set termguicolors
endif

if &compatible
  set nocompatible
endif

" Lua plugin loading
lua require 'plugins'

syntax on
filetype plugin indent on

set background=dark
colorscheme OceanicNext

set inccommand=nosplit
set hidden
set updatetime=300
set shortmess+=c
set signcolumn=yes
set guicursor=
set completeopt=menuone,noinsert,noselect
set clipboard=unnamedplus
set listchars=trail:.       " Show trailing space
set list
set mouse=a                 " Mouse support
set belloff=all             " No bells
set wrap                    " Wordwrap on
set lbr                     " Linewrap
set backupcopy=yes          " Saving
set noswapfile
set nobackup
set nowritebackup
set relativenumber number   " Hybrid Linenumbers
set cursorline              " Show cursorline
set laststatus=2            " Show statusbr
set tabstop=2               " Tabwidth
set shiftwidth=2            " Indentation width
set softtabstop=2           " <bs> delete 2 space
set expandtab               " Tabs as spaces
set smarttab                " Shiftwidth at start of lines
set autoindent              " Save indentation between lines
set smartindent             " C-lang tab indentation
set encoding=utf8           " Set encoding
set wildmenu                " File Explorer settings
set wildignore=*.o,*~,*.pyc
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/.git/*,*/node_modules/*,*/vendor/*
set secure

" formatoptions :h fo-table
set fo-=t
set fo+=c
set fo+=r
set fo-=o
set fo+=q
set fo-=w
set fo-=a
set fo+=n
set fo+=j
set fo-=2
set nojoinspaces

set fillchars=eob:\ ,vert:│
