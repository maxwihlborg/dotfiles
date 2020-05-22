" Comma as leader
let mapleader=','
let g:mapleader=','

" Turn of exmode
map Q <Nop>

" Quick save
nno <silent> <leader>a :w<cr>
nno <silent> <leader>q :q<cr>
nno <silent> <leader>Q :q!<cr>

" Temp fix (alacritty mac os)
nno ; <C-v>

" Movement
map j gj
map k gk
map J 8j
map K 8k
nno s :
nno S :

" Hide search Highlight
no <silent> <esc> :noh<cr><esc>

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
