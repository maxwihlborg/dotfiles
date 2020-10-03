augroup vimrc_defx
  autocmd!
  autocmd FileType defx call s:defx_mappings()                                  "Defx mappings
  autocmd VimEnter * call s:defx_setup()
augroup END

" Mappings
imap <silent> <C-n> <esc>:call <sid>defx_open()<cr>
map <silent> <C-n> <esc>:call <sid>defx_open()<cr>
nno <silent> <leader>n :call <sid>defx_open({ 'find_current_file': v:true })<cr>

let s:default_columns = 'indent:git:icons:filename'

function s:defx_toggle_tree() abort
  if defx#is_directory()
    return defx#do_action('open_or_close_tree')
  endif
  return defx#do_action('drop')
endfunction

function s:defx_open(...) abort
  let l:opts = get(a:, 1, {})
  let l:is_file = has_key(l:opts, 'dir') && !isdirectory(l:opts.dir)

  if  &filetype ==? 'defx' || l:is_file
    return
  endif

  let l:path = getcwd()

  if has_key(l:opts, 'dir') && isdirectory(l:opts.dir)
    let l:path = l:opts.dir
  endif

  if has_key(l:opts, 'find_current_file')
    call execute(printf('Defx -search=%s %s', expand('%:p'), l:path))
  else
    call execute(printf('Defx -toggle %s', l:path))
    call execute('wincmd p')
  endif

  return execute("norm!\<C-w>=")
endfunction

function! s:defx_setup() abort
  silent! call defx#custom#option('_', {
        \ 'columns': s:default_columns,
        \ 'winwidth': 30,
        \ 'direction': 'topleft',
        \ 'split': 'vertical',
        \ })

  silent! call defx#custom#column('filename', {
        \ 'min_width': 80,
        \ 'max_width': 80,
        \ })

  silent! call defx#custom#column('git', 'indicators', {
        \ 'Modified'  : '·',
        \ 'Staged'    : '+',
        \ 'Untracked' : '*',
        \ 'Renamed'   : '↣',
        \ 'Unmerged'  : '=',
        \ 'Ignored'   : '☒',
        \ 'Deleted'   : '⨉',
        \ 'Unknown'   : '?'
        \ })

let g:defx_icons_enable_syntax_highlight = 1
let g:defx_icons_column_length = 1

" icons
let g:defx_icons_directory_icon = ''
let g:defx_icons_mark_icon = '*'
let g:defx_icons_copy_icon = ''
let g:defx_icons_move_icon = ''
let g:defx_icons_parent_icon = ''
let g:defx_icons_default_icon = ''
let g:defx_icons_directory_symlink_icon = ''
" Options below are applicable only when using "tree" feature
let g:defx_icons_root_opened_tree_icon = ''
let g:defx_icons_nested_opened_tree_icon = ''
let g:defx_icons_nested_closed_tree_icon = ''

let g:defx_icon_exact_dir_matches = {
      \ '.git'         : { 'icon': '', 'color': 'F44D26', 'term_color': 67 },
      \ 'node_modules' : { 'icon': '', 'color': '689F63', 'term_color': 67 },
      \ }

endfunction

function! SynGroup()                                                            
  let l:s = synID(line('.'), col('.'), 1)                                       
  echo synIDattr(l:s, 'name') . ' -> ' . synIDattr(synIDtrans(l:s), 'name')
endfun

function! s:defx_mappings() abort
  " Define mappings
  nnoremap <silent><buffer><expr> <CR>
        \ <sid>defx_toggle_tree()

  nnoremap <silent><buffer><expr> N
        \ defx#do_action('new_file')

  nnoremap <silent><buffer><expr> <Space>
        \ defx#do_action('toggle_select') . 'j'
  nnoremap <silent><buffer><expr> p
        \ defx#do_action('paste')
  nnoremap <silent><buffer><expr> c
        \ defx#do_action('copy')
  nnoremap <silent><buffer><expr> m
        \ defx#do_action('move')
  nnoremap <silent><buffer><expr> d
        \ defx#do_action('remove')
  nnoremap <silent><buffer><expr> r
        \ defx#do_action('rename')

  nnoremap <silent><buffer><expr> yy
        \ defx#do_action('yank_path')

  nnoremap <silent><buffer><expr> <C-n>
        \ defx#do_action('quit')
  nnoremap <silent><buffer><expr> q
        \ defx#do_action('quit')

  " Wrap around
  nnoremap <silent><buffer><expr> j
        \ line('.') == line('$') ? 'gg' : 'j'
  nnoremap <silent><buffer><expr> k
        \ line('.') == 1 ? 'G' : 'k'
  " Refresh
  nnoremap <silent><buffer><expr> <C-r>
        \ defx#do_action('redraw')
  " Change cwd
  nnoremap <silent><buffer><expr> C
        \ defx#do_action('change_vim_cwd')
  " Show hidden files
  nnoremap <silent><buffer><expr> I
        \ defx#do_action('toggle_ignored_files')
endfunction
