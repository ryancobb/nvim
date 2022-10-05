local conditions = require('heirline.conditions')

local M = {}

M.space = { provider = ' ' }

M.file_type = {
  condition = function()
    return not conditions.buffer_matches({ filetype = { 'TelescopePrompt' }, buftype = { 'terminal' } })
  end,
  provider = function()
    return " " .. vim.bo.filetype .. " "
  end,
  hl = '@text',
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
  hl = '@text',
}

M.git = {
  condition = conditions.is_git_repo,
  init = function(self)
    self.status_dict = vim.b.gitsigns_status_dict
    self.has_changes = self.status_dict.added ~= 0 or self.status_dict.removed ~= 0 or self.status_dict.changed ~= 0
  end,
  { -- git branch name
    provider = function(self)
      return " " .. self.status_dict.head
    end,
    hl = '@constant'
  },
  {
    provider = function(self)
      local count = self.status_dict.added or 0
      return count > 0 and (" +" .. count)
    end,
    hl = '@string',
  },
  {
    provider = function(self)
      local count = self.status_dict.removed or 0
      return count > 0 and (" -" .. count)
    end,
    hl = '@variable.builtin',
  },
  {
    provider = function(self)
      local count = self.status_dict.changed or 0
      return count > 0 and (" ~" .. count)
    end,
    hl = '@type',
  },
}

M.treesitter = {
  condition = function()
    local b = vim.api.nvim_get_current_buf()
    return vim.treesitter.highlighter.active[b]
  end,
  provider = " ",
  hl = '@string',
}

return M
