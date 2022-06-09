local conditions = require('heirline.conditions')
local utils = require('heirline.utils')
local colors = require('onedarkpro').get_colors(vim.g.onedarkpro_style)

local M = {}

M.space = { provider = ' ' }

M.file_icon = {
  init = function(self)
    local filename = self.filename
    local extension = vim.fn.fnamemodify(filename, ":e")
    self.icon, self.icon_color = require("nvim-web-devicons").get_icon_color(filename, extension, { default = true })
  end,
  provider = function(self)
    return self.icon and (self.icon .. " ")
  end,
  hl = function(self)
    return { fg = self.icon_color }
  end
}

M.file_name = {
  provider = function(self)
    local filename = vim.fn.fnamemodify(self.filename, ":.")
    if filename == "" then return "[No Name]" end
    if not conditions.width_percent_below(#filename, 0.75) then
      filename = vim.fn.pathshorten(filename)
    end
    return filename
  end
}

M.file_flags = {
  { provider = function() if vim.bo.modified then return "[+]" end end, },
  {
    provider = function() if (not vim.bo.modifiable) or vim.bo.readonly then return "" end end,
    hl = { fg = colors.orange }
  }
}

M.file_name_block = {
  init = function(self)
    self.filename = vim.api.nvim_buf_get_name(0)
  end,
  hl = function()
    if vim.bo.modified then
      return { fg = colors.bg_dark }
    else
      return { fg = colors.bg_dark }
    end
  end,
  utils.surround({ "", "" }, 
    function() 
      if conditions.is_active() then
        if vim.bo.modified then
          return colors.yellow
        else
          return colors.blue
        end
      else -- inactive
        return colors.gray
      end
    end, 
    {
      M.file_icon,
      M.file_name,
      M.file_flags,
    }),
}

M.file_type = {
  condition = function()
    return not conditions.buffer_matches({ buftype = { "terminal" } })
  end,
  provider = function()
    return " " .. vim.bo.filetype .. " "
  end,
  hl = { fg = colors.white },
}

M.lsp_active = {
  condition = conditions.lsp_attached,
  provider  = function()
    local names = {}
    for i, server in pairs(vim.lsp.buf_get_clients(0)) do
      table.insert(names, server.name)
    end
    return "%( [" .. table.concat(names, " ") .. "]%)"
  end,
  hl        = { fg = colors.white },
}

M.git = {
  condition = conditions.is_git_repo,

  init = function(self)
    self.status_dict = vim.b.gitsigns_status_dict
    self.has_changes = self.status_dict.added ~= 0 or self.status_dict.removed ~= 0 or self.status_dict.changed ~= 0
  end,

  hl = { fg = colors.orange },


  { -- git branch name
    provider = function(self)
      return " " .. self.status_dict.head
    end,
  },
  {
    provider = function(self)
      local count = self.status_dict.added or 0
      return count > 0 and (" +" .. count)
    end,
    hl = { fg = colors.green },
  },
  {
    provider = function(self)
      local count = self.status_dict.removed or 0
      return count > 0 and (" -" .. count)
    end,
    hl = { fg = colors.red },
  },
  {
    provider = function(self)
      local count = self.status_dict.changed or 0
      return count > 0 and (" ~" .. count)
    end,
    hl = { fg = colors.yellow },
  },
}

M.treesitter = {
  condition = function()
    local b = vim.api.nvim_get_current_buf()
    return vim.treesitter.highlighter.active[b]
  end,
  provider = " ",
  hl = { fg = colors.green },
}

M.terminal_name = {
  provider = function()
    local tname, _ = vim.api.nvim_buf_get_name(0):gsub(".*;#", "")
    return " " .. tname
  end,
  hl = { fg = colors.blue },
}

return M
