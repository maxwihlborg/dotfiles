" javascript
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_flow = 0
let g:jsx_ext_required = 0

autocmd BufNewFile,BufRead *.js setlocal filetype=javascript.jsx
autocmd BufNewFile,BufRead *.jsx setlocal filetype=javascript.jsx
