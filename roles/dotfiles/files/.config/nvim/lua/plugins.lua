vim.cmd [[packadd packer.nvim]]

require("packer").startup(
    function()
        -- Fancy Nvim Plugins
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

        -- Git
        use {
            "kdheepak/lazygit.nvim",
            cmd = {"LazyGit", "LazyGitConfig", "LazyGitFiles"}
        }
        use {"tpope/vim-fugitive"}
        use {"junegunn/gv.vim"}

        -- DataBases
        use {
            "kristijanhusak/vim-dadbod-ui",
            requires = {
                {"tpope/vim-dadbod"}
            }
        }

        -- Easier Editing
        use {"christoomey/vim-tmux-navigator"}
        use {"scrooloose/nerdcommenter"}
        use {"junegunn/vim-easy-align"}
        use {"justinmk/vim-dirvish"}
        use {"tpope/vim-surround"}
        use {"ervandew/supertab"}
        use {"sbdchd/neoformat"}
        use {"SirVer/ultisnips"}
        use {"mattn/emmet-vim"}

        -- Esthetics
        use {"norcalli/nvim-colorizer.lua"}
        use {"tjdevries/colorbuddy.nvim"}
        use {"ishan9299/modus-theme-vim"}
        use {"mhartington/oceanic-next"}
        use {"vim-airline/vim-airline"}
        use {"airblade/vim-gitgutter"}

        --[[
        use {
            "akinsho/nvim-bufferline.lua",
            requires = {
                {"kyazdani42/nvim-web-devicons"}
            }
        }
        use {
            "tjdevries/express_line.nvim",
            requires = {
                {"kyazdani42/nvim-web-devicons"},
                {"nvim-lua/plenary.nvim"}
            }
        }
        --]]
        -- Language & Syntax
        use {"editorconfig/editorconfig-vim"}
        use {"whatyouhide/vim-tmux-syntax"}
        use {"pangloss/vim-javascript"}
        use {"jparise/vim-graphql"}
        use {"tikhomirov/vim-glsl"}
        use {"dag/vim-fish"}

        --[[
        # Syntax part replaced by tree-sitter?
        use {"HerringtonDarkholme/yats.vim"}
        use {"othree/yajs.vim"}
        use {"reasonml-editor/vim-reason"}
        --]]
    end
)
