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

local function lsp_client_names()
	local client_names = {}
	for _, client in ipairs(vim.lsp.get_active_clients()) do
		table.insert(client_names, client.name)
	end
	return table.concat(client_names, ",")
end

local treesitter = {
  function()
    local b = vim.api.nvim_get_current_buf()
    if next(vim.treesitter.highlighter.active[b]) then
      return ""
    end
    return ""
  end,
  color = { fg = '#76946A' }
}

local filename = {
  'filename',
  file_status = true,
  path = 1,
  icons_enabled = true,
}

require('lualine').setup {
  options = {
    component_separators = '|',
    section_separators = '',
    disabled_filetypes = { 'neo-tree', 'DiffviewFiles' },
  },
  sections = {
    lualine_a = {
    {
        function() return ' ' end,
        padding = { left = 0, right = 0}
      }
    },
    lualine_b = {
      {'b:gitsigns_head', icon = ''},
    },
    lualine_c = {
      filename,
      { 'diff', source = diff_source },
    },
    lualine_x = {
      lsp_client_names,
      treesitter,
      'filetype'
    },
    lualine_y = {},
    lualine_z = {
      {
        function() return ' ' end,
        padding = { left = 0, right = 0}
      }
    },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { filename },
    lualine_x = {},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = { 'toggleterm' }
}
