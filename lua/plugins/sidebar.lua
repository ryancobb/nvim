require("sidebar-nvim").setup({
    bindings = nil,
    open = true,
    side = "left",
    initial_width = 35,
    hide_statusline = true,
    update_interval = 1000,
    sections = { "datetime", "git", "files", "diagnostics" },
    section_separator = "-----",
    datetime = { format = "%a %b %d, %H:%M", clocks = { { name = "local" } } },
    todos = { ignored_paths = { "~" } },
    disable_closing_prompt = true,
    files = {
      show_hidden = true
  }
})
