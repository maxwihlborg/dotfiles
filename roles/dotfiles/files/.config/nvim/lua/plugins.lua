vim.cmd [[packadd packer.nvim]]

require("packer").startup(
    function()
        -- Lua
        use {"wbthomason/packer.nvim", opt = true}
        use {"nvim-treesitter/nvim-treesitter"}
        use {
            "neovim/nvim-lspconfig",
            requires = {
                {"nvim-lua/completion-nvim"},
                {"nvim-lua/diagnostic-nvim"}
            }
        }
        use {
            "akinsho/nvim-bufferline.lua",
            requires = {
                {"kyazdani42/nvim-web-devicons"}
            }
        }
        use {
            "kyazdani42/nvim-tree.lua",
            requires = {
                {"kyazdani42/nvim-web-devicons"}
            }
        }
        use {
            "nvim-lua/telescope.nvim",
            requires = {
                {"nvim-lua/plenary.nvim"},
                {"nvim-lua/popup.nvim"}
            }
        }
        use {
            "tjdevries/express_line.nvim",
            requires = {
                {"kyazdani42/nvim-web-devicons"},
                {"nvim-lua/plenary.nvim"}
            }
        }

        -- Git
        use {"tpope/vim-fugitive"}
        use {"junegunn/gv.vim"}

        -- Easier Editingh
        use {"christoomey/vim-tmux-navigator"}
        use {"scrooloose/nerdcommenter"}
        use {"junegunn/vim-easy-align"}
        use {"tpope/vim-surround"}
        use {"ervandew/supertab"}
        use {"tpope/vim-vinegar"} -- Broken
        use {"sbdchd/neoformat"}
        use {"SirVer/ultisnips"}
        use {"mattn/emmet-vim"}

        -- Esthetics
        -- use {"vim-airline/vim-airline"}
        use {"mhartington/oceanic-next"}
        use {"airblade/vim-gitgutter"}
        use {"mhinz/vim-startify"}

        -- Syntax
        use {"editorconfig/editorconfig-vim"}
        use {"whatyouhide/vim-tmux-syntax"}
        use {"jparise/vim-graphql"}
        use {"tikhomirov/vim-glsl"}
        use {"dag/vim-fish"}

        --[[
        # Replaced by lsp-configs?
        use {'neoclide/coc.nvim', { 'build': 'yarn install --frozen-lockfile' }}

        Replaced by telescope?
        use {"junegunn/fzf", run = "./install"}
        use {"junegunn/fzf.vim"}

        # Currently broken?
        use {
            "sodapopcan/vim-twiggy",
            requires = {
                {"tpope/vim-fugitive"},
                {"junegunn/gv.vim"}
            },
            cmd = "Twiggy"
        }

        # Syntax part replaced by tree-sitter?
        use {"pangloss/vim-javascript"}
        use {"reasonml-editor/vim-reason"}
        use {"othree/yajs.vim"}
        use {"HerringtonDarkholme/yats.vim"}
        --]]
    end
)
