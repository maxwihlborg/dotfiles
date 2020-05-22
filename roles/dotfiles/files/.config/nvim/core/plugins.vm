" NeoVim Constants
if (has("termguicolors"))
    set termguicolors
endif

if &compatible
  set nocompatible
endif

set runtimepath+=$HOME/.config/nvim/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.config/nvim/dein')
  call dein#begin('~/.config/nvim/dein')

  call dein#add('Shougo/dein.vim')

  call dein#add('othree/yajs.vim', { 'merged': 0 })
  call dein#add('HerringtonDarkholme/yats.vim')
  call dein#add('othree/html5.vim')

  call dein#add('scrooloose/nerdcommenter')
  call dein#add('vim-airline/vim-airline')
  call dein#add('ryanoasis/vim-devicons')
  call dein#add('scrooloose/nerdtree', { 'merged': 0 })
  call dein#add('SirVer/ultisnips')

  call dein#add('neoclide/coc.nvim', { 'build': 'yarn install --frozen-lockfile' })
  call dein#add('junegunn/fzf', { 'build': './install', 'merged': 0 })
  call dein#add('junegunn/fzf.vim')

  call dein#add('ervandew/supertab')
  call dein#add('sbdchd/neoformat')

  call dein#add('christoomey/vim-tmux-navigator')
  call dein#add('easymotion/vim-easymotion')
  call dein#add('junegunn/vim-easy-align')
  call dein#add('airblade/vim-gitgutter')
  call dein#add('tpope/vim-surround')
  call dein#add('tpope/vim-fugitive')
  call dein#add('tpope/vim-vinegar')
  call dein#add('mattn/emmet-vim')
  call dein#add('mxw/vim-jsx')

  call dein#add('mhartington/oceanic-next')

  call dein#add('pangloss/vim-javascript', { 'merged': 0 })
  call dein#add('whatyouhide/vim-tmux-syntax')
  call dein#add('reasonml-editor/vim-reason')
  call dein#add('jparise/vim-graphql')
  call dein#add('tikhomirov/vim-glsl')
  call dein#add('fatih/vim-go')
  call dein#add('dag/vim-fish')

  call dein#add('editorconfig/editorconfig-vim')

  call dein#add('tyok/nerdtree-ack', { 'depends': 'nerdtree', 'merged': 0 })

  call dein#end()
  call dein#save_state()
endif
