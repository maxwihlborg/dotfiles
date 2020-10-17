local extensions = require("el.extensions")
local subscribe = require("el.subscribe")
local sections = require("el.sections")
local builtin = require("el.builtin")
local helper = require("el.helper")

local icon = require("nvim-web-devicons")

require("el").setup {
    generator = function(win, buf)
        return {
            extensions.gen_mode {
                format_string = " %s "
            },
            subscribe.buf_autocmd(
                "el_git_branch",
                "BufEnter",
                function(window, buffer)
                    local branch = extensions.git_branch(window, buffer)
                    if branch then
                        return "  " .. branch
                    end
                end
            ),
            sections.split,
            subscribe.buf_autocmd(
                "el_file_icon",
                "BufRead",
                function(_, bufnr)
                    local icon = extensions.file_icon(_, bufnr)
                    if icon then
                        return icon .. " "
                    end

                    return ""
                end
            ),
            builtin.responsive_file(140, 90),
            sections.collapse_builtin {
                " ",
                builtin.modified_flag
            }
        }
    end
}
