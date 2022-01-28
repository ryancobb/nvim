require("sidebar-nvim").setup({
    bindings = nil,
    open = false,
    side = "left",
    initial_width = 35,
    hide_statusline = true,
    update_interval = 1000,
    sections = { "git", "diagnostics", "files" },
    section_separator = "-----",
    disable_closing_prompt = true,
    files = {
      show_hidden = true
  }
})
