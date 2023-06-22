return {
  {
    "Bekaboo/dropbar.nvim",
    opts = {
      sources = {
        path = {
          modified = function(sym)
            return sym:merge({
              name = sym.name .. "[+]",
              icon = " ",
              name_hl = "DiffAdded",
              icon_hl = "DiffAdded",
            })
          end,
        },
      },
      menu = {
        keymaps = {
          ["h"] = "<C-w>c",
          ["l"] = function()
            local menu = require("dropbar.api").get_current_dropbar_menu()
            if not menu then
              return
            end
            local cursor = vim.api.nvim_win_get_cursor(menu.win)
            local component = menu.entries[cursor[1]]:first_clickable(cursor[2])
            if component then
              menu:click_on(component, nil, 1, "l")
            end
          end,
        },
      },
    },
  },
}
