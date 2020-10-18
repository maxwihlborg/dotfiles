local on_attach = function(client, bufnr)
    require("completion").on_attach(client, bufnr)
    require("diagnostic").on_attach(client, bufnr)

    local opts = {noremap = true, silent = true}
    local buf_set_map = vim.api.nvim_buf_set_keymap

    buf_set_map(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
    buf_set_map(bufnr, "n", "gy", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
    buf_set_map(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
    buf_set_map(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
    buf_set_map(bufnr, "n", "<leader>j", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
    buf_set_map(bufnr, "n", "<leader>D", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)
    buf_set_map(bufnr, "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
    buf_set_map(bufnr, "n", "<leader>e", "<cmd>lua vim.lsp.util.show_line_diagnostics()<cr>", opts)
end

require("nvim_lsp").tsserver.setup({on_attach = on_attach})
require("nvim_lsp").cssls.setup({on_attach = on_attach})
require("nvim_lsp").html.setup({on_attach = on_attach})

require("nvim_lsp").jsonls.setup(
    {
        on_attach = on_attach,
        settings = {
            json = {
                schemas = {
                    {
                        description = "NPM configuration file",
                        fileMatch = {"package.json"},
                        url = "https://json.schemastore.org/package"
                    },
                    {
                        description = "TypeScript compiler configuration file",
                        fileMatch = {"tsconfig.json", "tsconfig.*.json"},
                        url = "http://json.schemastore.org/tsconfig"
                    },
                    {
                        description = "Lerna config",
                        fileMatch = {"lerna.json"},
                        url = "http://json.schemastore.org/lerna"
                    },
                    {
                        description = "Babel configuration",
                        fileMatch = {".babelrc.json", ".babelrc", "babel.config.json"},
                        url = "http://json.schemastore.org/lerna"
                    },
                    {
                        description = "ESLint config",
                        fileMatch = {".eslintrc.json", ".eslintrc"},
                        url = "http://json.schemastore.org/eslintrc"
                    },
                    {
                        description = "Prettier config",
                        fileMatch = {".prettierrc.json", "prettier.config.json"},
                        url = "http://json.schemastore.org/prettierrc"
                    },
                    {
                        description = "Vercel Now config",
                        fileMatch = {"now.json", "vercel.json"},
                        url = "http://json.schemastore.org/now"
                    }
                }
            }
        }
    }
)
