return {
  {
    "Bekaboo/dropbar.nvim",
    config = {
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
    },
  },
}
