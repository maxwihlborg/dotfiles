local M = {}

local gpick_handle
local color

local function onread(err, data)
    if data then
        color = data:gsub("%s+", "")
    end
end

function M.gpick()
    local stdout = vim.loop.new_pipe(false)
    local stderr = vim.loop.new_pipe(false)
    local function yank_color()
        vim.fn.setreg(vim.v.register, color)
        print(string.format("Yanked color: %s", color))
    end
    gpick_handle =
        vim.loop.spawn(
        "gpick",
        {
            args = {"-pos"},
            stdio = {stdout, stderr}
        },
        vim.schedule_wrap(
            function()
                stdout:read_stop()
                stderr:read_stop()
                stdout:close()
                stderr:close()
                gpick_handle:close()
                yank_color()
            end
        )
    )
    vim.loop.read_start(stdout, onread)
    vim.loop.read_start(stderr, onread)
end

return M
