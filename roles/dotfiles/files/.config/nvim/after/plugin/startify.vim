let g:startify_custom_header=[
  \"    ____ ____ ____ ____ ____ ____ ",
  \"   ||N |||e |||o |||V |||i |||m ||",
  \"   ||__|||__|||__|||__|||__|||__||",
  \"   |/__\\|/__\\|/__\\|/__\\|/__\\|/__\\|",
  \"",
  \]


let g:startify_change_to_dir = 0
let g:startify_bookmarks = [
  \ '~/.config/nvim/init.vim',
  \ ]

call extend(g:startify_bookmarks, globpath('~/code/projects', '*', 0, 1))
call extend(g:startify_bookmarks, globpath('~/code/work', '*', 0, 1))

let g:startify_list_order = [
  \ ['   LRU:'],
  \ 'files',
  \ ['   LRU within this dir:'],
  \ 'dir',
  \ ['   Sessions:'],
  \ 'sessions',
  \ ['   Bookmarks:'],
  \ 'bookmarks',
  \ ]

let g:startify_custom_footer =
  \ ['', "   Vim is charityware. Please read ':help uganda'.", '']
