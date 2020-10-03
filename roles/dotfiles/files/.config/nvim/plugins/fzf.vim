" Mappings
nno <silent> <c-u> :Files<cr>
nno <silent> <leader>u :Buffers<cr>

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

let g:fzf_layout = { 'window': { 'width': 1, 'height': 0.4, 'yoffset': 1, 'border': 'horizontal' } }
