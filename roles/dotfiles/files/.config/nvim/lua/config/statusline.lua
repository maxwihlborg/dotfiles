local lsp = require("el.plugins.lsp_status")
local ext = require("el.extensions")
local sub = require("el.subscribe")
local sec = require("el.sections")
local bin = require("el.builtin")

local M = {}

M.includes = function(list)
    local set = {}
    for _, item in ipairs(list) do
        set[item] = true
    end
    return function(item)
        return set[item]
    end
end

M.ft_only = M.includes({"LuaTree", "dbui", "dirvish"})

M.branch =
    sub.buf_autocmd(
    "el_git_branch",
    "BufEnter",
    function(w, b)
        local r = ext.git_branch(w, b)
        if r then
            return string.format("  %s ", r)
        end
    end
)

M.icon =
    sub.buf_autocmd(
    "el_file_icon",
    "BufRead",
    function(w, b)
        local i = ext.file_icon(w, b)
        if i then
            return string.format("%s ", i)
        end
    end
)

M.line_info = "%p%%  %l/%L : %c "

require("el").setup {
    generator = function(_, b)
        if M.ft_only(b.filetype) then
            return {
                " %Y "
            }
        end
        return {
            ext.gen_mode {
                format_string = " %s "
            },
            M.branch,
            M.icon,
            bin.tail,
            sec.split,
            M.line_info
        }
    end
}

return M
