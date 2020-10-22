" Map leader
let mapleader=','
let maplocalleader=','

" Turn of exmode
map Q <Nop>

" Quick save
nno <silent> <leader>a :w<cr>
nno <silent> <leader>q :q<cr>
nno <silent> <leader>Q :bd<cr>

" Movement
map j gj
map k gk
map J 8j
map K 8k

" Useful s/S mappings
nno s :
nno S :
vno s :
vno S :

" Hide search Highlight
nno <silent> <esc> :noh<cr><esc>

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

" Git
nno <silent> <leader>b :Gblame<cr>
nno <silent> <leader>s :Gstatus<cr>
nno <silent> <leader>d :Gdiff<cr>
nno <silent> <leader>g :LazyGit<cr>
nno <leader>c :lua require("tools").gpick()<cr>

imap <silent> <C-g> <esc>:Twiggy<cr>
map <silent> <C-g> <esc>:Twiggy<cr>

" DataBase
nno <silent> <leader>d :DBUI<cr>
let g:db_ui_use_nerd_fonts = 1

" Telescope
nno <silent> <c-u> :lua require("config.telescope").files()<cr>
nno <silent> <c-c> :lua require("config.telescope").command_history()<cr>
nno <silent> <leader>u :lua require("config.telescope").buffers()<cr>

" LuaTree
imap <silent> <C-n> <esc>:LuaTreeToggle<cr>
map <silent> <C-n> <esc>:LuaTreeToggle<cr>
nno <silent> <leader>n :LuaTreeFindFile<cr>

" Neoformat
nno <silent> <leader>f :Neoformat<cr>

" EasyAlign
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" Emmet
imap <C-e> <Plug>(emmet-expand-abbr)
