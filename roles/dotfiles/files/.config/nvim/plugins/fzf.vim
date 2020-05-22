" Mappings
nno <silent> <c-u> :Files<cr>
nno <silent> <leader>u :Buffers<cr>

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
