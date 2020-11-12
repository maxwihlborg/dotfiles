local layout = require("telescope.pickers.layout_strategies")
local resolve = require("telescope.config.resolve")
local make_entry = require("telescope.make_entry")
local sorters = require("telescope.sorters")
local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local builtin = require("telescope.builtin")

local M = {}

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
    +--------------------+----------------+
    | Results            | Preview        |
    |                    |                |
    |                    |                |
    +--------------------+----------------+
--]]
layout.custom = function(self, columns, lines)
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
    local bs = self.window.border and 1 or 0

    prompt.height = 1
    results.height = max_results
    preview.height = max_results
    preview.width = width - math.floor(width * self.window.results_width)

    prompt.width = max_width
    results.width = max_width - (has_preview and (preview.width + bs) or 0)

    prompt.line = (lines / 2) - ((max_results + (bs * 2)) / 2)
    results.line = prompt.line + 1 + (bs)
    preview.line = results.line

    if not self.previewer or columns < self.preview_cutoff then
        if self.window.border and self.window.borderchars then
            self.window.borderchars.results[6] = self.window.borderchars.preview[6]
            self.window.borderchars.results[7] = self.window.borderchars.preview[7]
        end

        preview.height = 0
    end

    results.col = math.ceil((columns / 2) - (width / 2) - bs)
    prompt.col = results.col
    preview.col = results.col + results.width + bs

    return {
        preview = has_preview and preview,
        results = results,
        prompt = prompt
    }
end

M.theme = function(opts)
    return vim.tbl_deep_extend(
        "force",
        {
            sorting_strategy = "ascending",
            layout_strategy = "custom",
            results_title = false,
            preview_title = false,
            preview = false,
            winblend = 10,
            width = 100,
            results_height = 15,
            results_width = 0.37,
            border = false,
            borderchars = {
                {"─", "│", "─", "│", "╭", "╮", "╯", "╰"},
                prompt = {"─", "│", " ", "│", "╭", "╮", "│", "│"},
                results = {"─", "│", "─", "│", "├", "┬", "┴", "╰"},
                preview = {"─", "│", "─", "│", "╭", "┤", "╯", "╰"}
            }
        },
        opts or {}
    )
end

function M.files()
    pickers.new(
        M.theme(),
        {
            finder = finders.new_oneshot_job(
                {"fd", "-t", "f"},
                {
                    entry_maker = make_entry.gen_from_file()
                }
            ),
            sorter = sorters.get_fzy_sorter()
        }
    ):find()
end

function M.buffers()
    local opts = {
        shorten_path = true
    }
    local buffers =
        vim.tbl_filter(
        function(b)
            return (opts.show_all_buffers or vim.api.nvim_buf_is_loaded(b)) and 1 == vim.fn.buflisted(b)
        end,
        vim.api.nvim_list_bufs()
    )

    local max_bufnr = math.max(unpack(buffers))
    opts.bufnr_width = #tostring(max_bufnr)

    pickers.new(
        M.theme(),
        {
            finder = finders.new_table {
                results = buffers,
                entry_maker = make_entry.gen_from_buffer(opts)
            },
            sorter = sorters.get_fzy_sorter()
        }
    ):find()
end

function M.command_history()
    builtin.command_history(M.theme())
end

return M
