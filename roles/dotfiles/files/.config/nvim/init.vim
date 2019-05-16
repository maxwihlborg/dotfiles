" NeoVim Constants
if (has("termguicolors"))
    set termguicolors
endif

if &compatible
  set nocompatible
endif

" Plugins
set runtimepath^=~/.config/nvim/dein/repos/github.com/Shougo/dein.vim

call dein#begin(expand('~/.config/nvim/dein'))

call dein#add('Shougo/dein.vim')
call dein#add('Shougo/vimproc.vim', {'build' : 'make'})
call dein#add('ctrlpvim/ctrlp.vim')

call dein#add('kien/rainbow_parentheses.vim')

call dein#add('pangloss/vim-javascript', { 'merged': 0 })
call dein#add('othree/yajs.vim', { 'merged': 0 })
call dein#add('othree/html5.vim')

call dein#add('scrooloose/nerdcommenter')
call dein#add('vim-airline/vim-airline')
call dein#add('ryanoasis/vim-devicons')
call dein#add('scrooloose/nerdtree', { 'merged': 0 })
call dein#add('SirVer/ultisnips')

call dein#add('mileszs/ack.vim')
call dein#add('junegunn/fzf', { 'build': './install', 'merged': 0 })
call dein#add('junegunn/fzf.vim')

call dein#add('Shougo/deoplete.nvim')
call dein#add('zchee/deoplete-go', {'build': 'make'})
call dein#add('carlitux/deoplete-ternjs')
call dein#add('ternjs/tern_for_vim')
call dein#add('ervandew/supertab')
call dein#add('sbdchd/neoformat')

call dein#add('christoomey/vim-tmux-navigator')
call dein#add('easymotion/vim-easymotion')
call dein#add('junegunn/vim-easy-align')
call dein#add('tpope/vim-surround')
call dein#add('tpope/vim-fugitive')
call dein#add('tpope/vim-vinegar')
call dein#add('airblade/vim-gitgutter')
call dein#add('mattn/emmet-vim')
call dein#add('mxw/vim-jsx')

call dein#add('mhartington/oceanic-next')

call dein#add('whatyouhide/vim-tmux-syntax')
call dein#add('reasonml-editor/vim-reason')
call dein#add('kchmck/vim-coffee-script')
call dein#add('raichoo/purescript-vim')
call dein#add('jparise/vim-graphql')
call dein#add('lumiliet/vim-twig')
call dein#add('ElmCast/elm-vim')
call dein#add('fatih/vim-go')
call dein#add('dag/vim-fish')

call dein#add('editorconfig/editorconfig-vim')

call dein#add('tyok/nerdtree-ack', { 'depends': 'nerdtree', 'merged': 0 })

call dein#end()


" Color Scheme
filetype plugin indent on
syntax on
set background=dark
colorscheme OceanicNext

" Comma as leader
let mapleader=','
let g:mapleader=','

" Turn of exmode
map Q <Nop>

" Quick save
nno <silent> <leader>a :w<cr>
nno <silent> <leader>q :q<cr>
nno <silent> <leader>Q :q!<cr>
nno <silent> <leader>f :Neoformat<cr>
nno <silent> <leader>b :Gblame<cr>
nno <silent> <leader>c :Gcommit<cr>
nno <silent> <leader>s :aboveleft 14 Gstatus<cr>
nno <silent> <leader>d :Gdiff<cr>

" Movement
map j gj
map k gk
map J 8j
map K 8k
nno s :
nno S :

" Plugins
nmap f <Plug>(easymotion-overwin-f2)
imap <C-e> <Plug>(emmet-expand-abbr)
imap <silent> <C-n> <esc>:NERDTreeToggle<cr>
map <silent> <C-n> <esc>:NERDTreeToggle<cr>
nno <silent> <leader>n :NERDTreeFind<cr>
nno <silent> <leader>o :TagbarToggle<cr>
nno <silent> <leader>j :TernDef<cr>
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" Keep Selection
vno <silent> > ><cr>gv
vno <silent> < <<cr>gv

" Move lines
vno <silent> <bar> :m '>+1<cr>gv=gv
vno <silent> ! :m '<-2<cr>gv=gv
nno <silent> <bar> :m .+1<cr>==
nno <silent> ! :m .-2<cr>==

" Tab navigation
nno <silent> <leader>t :tabe<cr>
nno <silent> H :tabp<cr>
nno <silent> L :tabn<cr>

" Hide search Highlight
no <silent> <esc> :noh<cr><esc>

" Plugin Settings
" marked
let g:marked_app = "Marked"
" emmet
let g:user_emmet_install_global = 1
let g:user_emmet_settings = {
\  'javascript.jsx' : {
\      'extends' : 'jsx',
\  },
\}

" go
let g:go_doc_keywordprg_enabled = 0
let g:go_def_mapping_enabled = 0
let g:go_fmt_fail_silently = 1
let g:go_term_enabled = 1
let g:go_fmt_command = 'goimports'

let g:go_highlight_functions = 1
let g:go_highlight_operators = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1

" javascript
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_flow = 1
let g:neoformat_enabled_javascript = ['prettier']
let g:jsx_ext_required = 0

" elm
let g:elm_setup_keybindings = 0
let g:elm_format_autosave = 1

" fuzzy finding
" let g:ctrlp_custom_ignore='\v[\/]\.(git|hg|svn)$'
" let g:ctrlp_map='<c-u>'
nno <silent> <c-u> :Files<cr>
nno <silent> <leader>u :Buffers<cr>

" autocompletion
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smartcase = 1
let g:deoplete#auto_complete_start_length = 1
let g:deoplete#keyword_patterns = {}
let g:deoplete#keyword_patterns['default'] = '\h\w*'
let g:deoplete#omni#input_patterns = {}
let g:SuperTabDefaultCompletionType = "<c-n>"

let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
let g:deoplete#sources#go#align_class = 1
let g:deoplete#sources#ternjs#types = 1

" tern
let g:tern#command = ["tern"]
let g:tern#arguments = ["--persistent"]

" airline
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_right_alt_sep = '|'
let g:airline_left_alt_sep = '|'
let g:airline_right_sep = ' '
let g:airline_left_sep = ' '
let g:airline_theme='oceanicnext'

" multicursor
let g:multi_cursor_next_key='<C-g>'

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

let NERDTreeMinimalUI=1
let NERDTreeHijackNetrw=0

" Formatter
autocmd FileType go set nolist

" General Settings
set t_ut=
set guicursor=
set exrc
set diffopt=filler,vertical " Diff settings
set clipboard=unnamed
set listchars=trail:.       " Show trailing space
set list
set mouse=a                 " Mouse support
set belloff=all             " No bells
set wrap                    " Wordwrap on
set lbr                     " Linewrap
set tw=500                  " Wordwrap line
set completeopt-=preview    " Turn of preview window
set backupcopy=yes          " Saving
set noswapfile
set nobackup
set nowb
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
