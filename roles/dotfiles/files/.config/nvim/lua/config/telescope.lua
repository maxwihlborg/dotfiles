local layout = require("telescope.pickers.layout_strategies")
local resolve = require("telescope.config.resolve")
local config = require("telescope.config")

local config = {}

vim.api.nvim_command(
    [[ command! -nargs=1 Rg call luaeval('require("telescope.builtin").grep_string(
        require("config.telescope").theme({
            search = _A
        })
    )', expand('<args>'))
    ]]
)

--[[
    +-------------------------------------+
    | Prompt                              |
    +-------------------------------------+
    | Results            | Preview        |
    |                    |                |
    |                    |                |
    +-------------------------------------+
--]]
layout.center2 = function(self, columns, lines)
    local initial_options = self:_get_initial_window_options()
    local preview = initial_options.preview
    local results = initial_options.results
    local prompt = initial_options.prompt

    -- This sets the height/width for the whole layout
    local height = resolve.resolve_height(self.window.results_height)(self, columns, lines)
    local width = resolve.resolve_width(self.window.width)(self, columns, lines)

    local max_results = (height > lines and lines or height)
    local max_width = (width > columns and columns or width)

    local has_preview = self.previewer

    -- border size
    local bs = 1

    prompt.height = 1
    results.height = max_results
    preview.height = max_results
    preview.width = 80

    prompt.width = max_width
    results.width = max_width - (has_preview and preview.width or 0)

    prompt.line = 2
    results.line = prompt.line + 1 + (bs)
    preview.line = results.line

    if not self.previewer or columns < self.preview_cutoff then
        preview.height = 0
    end

    results.col = math.ceil((columns / 2) - (width / 2) - bs)
    prompt.col = results.col
    preview.col = results.col + results.width

    return {
        preview = has_preview and preview,
        results = results,
        prompt = prompt
    }
end

config.theme = function(opts)
    opts = opts or {}
    return vim.tbl_deep_extend(
        "force",
        {
            sorting_strategy = "ascending",
            layout_strategy = "center2",
            results_title = false,
            preview_title = false,
            prompt_title = false,
            preview = false,
            width = 140,
            results_height = 15,
            borderchars = {
                {"─", "│", "─", "│", "╭", "╮", "╯", "╰"},
                prompt = {"─", "│", " ", "│", "╭", "╮", "│", "│"},
                results = {"─", "│", "─", "│", "├", "┬", "┴", "╰"},
                preview = {"─", "│", "─", "│", "╭", "┤", "╯", "╰"}
            }
        },
        opts
    )
end

return config
