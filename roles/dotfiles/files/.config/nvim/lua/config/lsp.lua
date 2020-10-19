local on_attach = function(client, bufnr)
    require("completion").on_attach(client, bufnr)
    require("diagnostic").on_attach(client, bufnr)

    local function bufnno(lhs, fn)
        vim.api.nvim_buf_set_keymap(
            bufnr,
            "n",
            lhs,
            string.format("<cmd>lua %s<cr>", fn),
            {
                noremap = true,
                silent = true
            }
        )
    end

    bufnno("gd", "vim.lsp.buf.definition()")
    bufnno("gy", "vim.lsp.buf.code_action()")
    bufnno("gr", "vim.lsp.buf.references()")
    bufnno("gi", "vim.lsp.buf.implementation()")

    bufnno("<leader>rn", "vim.lsp.buf.rename()")
    bufnno("<leader>j", "vim.lsp.buf.hover()")
    bufnno("<leader>e", "vim.lsp.util.show_line_diagnostics()")
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
