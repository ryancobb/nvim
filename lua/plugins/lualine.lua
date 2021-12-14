local function diff_source()
  local gitsigns = vim.b.gitsigns_status_dict
  if gitsigns then
    return {
      added = gitsigns.added,
      modified = gitsigns.changed,
      removed = gitsigns.removed
    }
  end
end

local filename = {
  'filename',
  file_status = true,
  path = 1,
  icons_enabled = true
}

require('lualine').setup {

  options = {
    icons_enabled = true,
    theme = 'nightfox',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = { 'NvimTree' },
    always_divide_middle = true,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {
      {'b:gitsigns_head', icon = ''},
      {'diff', source = diff_source},
      {'diagnostics'}
    },
    lualine_c = { filename },
    lualine_x = {},
    lualine_y = {'filetype'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { filename },
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = { 'toggleterm' }
}
