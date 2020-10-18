local colors = require("bufferline.colors")

require("bufferline").setup(
    {
        options = {
            view = "default",
            numbers = "none",
            number_style = "",
            mappings = false,
            buffer_close_icon = "",
            modified_icon = "",
            close_icon = "",
            left_trunc_marker = "",
            right_trunc_marker = "",
            max_name_length = 16,
            tab_size = 16,
            show_buffer_close_icons = false,
            separator_style = "thin",
            enforce_regular_tabs = true,
            always_show_bufferline = true
        },
        highlights = {
            bufferline_selected = {
                gui = ""
            },
            bufferline_selected_indicator = {
                guifg = colors.get_hex("Function", "fg"),
                guibg = colors.get_hex("Normal", "bg")
            }
        }
    }
)
