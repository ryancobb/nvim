local conditions = require('heirline.conditions')
local utils = require('heirline.utils')
local colors = require('onedarkpro').get_colors(vim.g.onedarkpro_style)

local M = {}

M.vi_mode = {
  init = function(self)
    self.mode = vim.fn.mode(1) -- :h mode()
  end,
  static = {
    mode_colors = {
      n = colors.bg_dark,
      i = colors.green,
      v = colors.cyan,
      V = colors.cyan,
      ["\22"] = colors.cyan,
      c = colors.orange,
      s = colors.purple,
      S = colors.purple,
      ["\19"] = colors.purple,
      R = colors.orange,
      r = colors.orange,
      ["!"] = colors.red,
      t = colors.red,
    }
  },
  provider = function(self)
    return "█"
  end,
  hl = function(self)
    local mode = self.mode:sub(1, 1) -- get only the first mode character
    return { fg = self.mode_colors[mode] }
  end,
}

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
    -- now, if the filename would occupy more than 1/4th of the available
    -- space, we trim the file path to its initials
    -- See Flexible Components section below for dynamic truncation
    if not conditions.width_percent_below(#filename, 0.25) then
      filename = vim.fn.pathshorten(filename)
    end
    return filename
  end,
  hl = function()
    if vim.bo.modified then
      -- return { fg = colors.red, bold = true }
    end
  end
}

M.file_flags = {
  {
    provider = function() if vim.bo.modified then return "[+]" end end,
  },
  {
    provider = function() if (not vim.bo.modifiable) or vim.bo.readonly then return "" end end,
    hl = { fg = colors.orange }
  }
}

M.file_name_block = {
  init = function(self)
    self.filename = vim.api.nvim_buf_get_name(0)
  end,
  M.file_icon,
  M.file_name,
  M.file_flags,
}

M.file_type = {
  condition = function()
    return not conditions.buffer_matches({ buftype = { "terminal" } })
  end,
  provider = function()
    return vim.bo.filetype
  end,
  hl = { fg = colors.white },
}

M.lsp_active = {
  condition = conditions.lsp_attached,

  -- You can keep it simple,
  -- provider = " [LSP]",

  -- Or complicate things a bit and get the servers names
  provider = function()
    local names = {}
    for i, server in pairs(vim.lsp.buf_get_clients(0)) do
      table.insert(names, server.name)
    end
    return "  [" .. table.concat(names, " ") .. "]"
  end,
  hl       = { fg = colors.white },
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
      return " " .. self.status_dict.head .. " "
    end,
  },
  -- You could handle delimiters, icons and counts similar to Diagnostics
  {
    condition = function(self)
      return self.has_changes
    end,
    provider = "("
  },
  {
    provider = function(self)
      local count = self.status_dict.added or 0
      return count > 0 and ("+" .. count)
    end,
    hl = { fg = colors.green },
  },
  {
    provider = function(self)
      local count = self.status_dict.removed or 0
      return count > 0 and ("-" .. count)
    end,
    hl = { fg = colors.red },
  },
  {
    provider = function(self)
      local count = self.status_dict.changed or 0
      return count > 0 and ("~" .. count)
    end,
    hl = { fg = colors.yellow },
  },
  {
    condition = function(self)
      return self.has_changes
    end,
    provider = ")",
  },
}

M.treesitter = {
  condition = function()
    local b = vim.api.nvim_get_current_buf()
    return vim.treesitter.highlighter.active[b]
  end,
  provider = "",
  hl = { fg = colors.green },
}

M.terminal_name = {
  -- we could add a condition to check that buftype == 'terminal'
  -- or we could do that later (see #conditional-statuslines below)
  provider = function()
    local tname, _ = vim.api.nvim_buf_get_name(0):gsub(".*;#", "")
    return " " .. tname
  end,
  hl = { fg = colors.blue },
}

return M
