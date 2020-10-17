" Mappings
imap <silent> <C-n> <esc>:LuaTreeToggle<cr>
map <silent> <C-n> <esc>:LuaTreeToggle<cr>
nno <silent> <leader>n :LuaTreeFindFile<cr>

" let g:lua_tree_git_hl=1
let g:lua_tree_icons={
      \ 'default': '',
      \ 'symlink': '﬒',
      \ 'git': {
      \   'unstaged': "ﰣ",
      \   'staged': "",
      \   'unmerged': "",
      \   'renamed': "",
      \   'untracked': "",
      \   'deleted': ""
      \ },
      \ 'folder': {
      \   'default': "",
      \   'open': "ﱮ"
      \   }
      \ }

let g:lua_tree_indent_markers       = 0
let g:lua_tree_git_hl               = 0
let g:lua_tree_auto_close           = 0
let g:lua_tree_follow               = 0
let g:lua_tree_width                = 30
let g:lua_tree_show_icons           = { 'git': 1, 'folders': 1, 'files': 1 }
let g:lua_tree_root_folder_modifier = ':t'
let g:lua_tree_ignore               = ['.DS_Store', 'fugitive:', '.git']

highlight link LuaTreeRootFolder Comment
