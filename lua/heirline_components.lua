local conditions = require('heirline.conditions')

local M = {}

M.space = { provider = ' ' }

M.file_type = {
  condition = function()
    return not conditions.buffer_matches({ buftype = { "terminal" } })
  end,
  provider = function()
    return " " .. vim.bo.filetype .. " "
  end,
  hl = 'Normal',
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
  hl        = 'Normal',
}

M.git = {
  condition = conditions.is_git_repo,
  init = function(self)
    self.status_dict = vim.b.gitsigns_status_dict
    self.has_changes = self.status_dict.added ~= 0 or self.status_dict.removed ~= 0 or self.status_dict.changed ~= 0
  end,
  hl = 'TSNumber',

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
    hl = 'TSString',
  },
  {
    provider = function(self)
      local count = self.status_dict.removed or 0
      return count > 0 and (" -" .. count)
    end,
    hl = 'TSVariableBuiltin',
  },
  {
    provider = function(self)
      local count = self.status_dict.changed or 0
      return count > 0 and (" ~" .. count)
    end,
    hl = 'TSType',
  },
}

M.treesitter = {
  condition = function()
    local b = vim.api.nvim_get_current_buf()
    return vim.treesitter.highlighter.active[b]
  end,
  provider = " ",
  hl = 'TSString',
}

return M
