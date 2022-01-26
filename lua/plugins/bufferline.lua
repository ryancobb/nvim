require('bufferline').setup {
  options = {
    numbers = "none" ,
    indicator_icon = '▎',
    modified_icon = '●',
    left_trunc_marker = '',
    right_trunc_marker = '',
    max_name_length = 30,
    max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
    tab_size = 20,
    offsets = {{filetype = "NvimTree"}},
    show_buffer_icons = true, -- disable filetype icons for buffers
    show_buffer_close_icons = false,
    show_close_icon = false,
    show_tab_indicators = true,
    persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
    separator_style = "slant",
    enforce_regular_tabs = false,
    always_show_bufferline = true,
  }
}

