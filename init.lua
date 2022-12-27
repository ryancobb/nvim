local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--single-branch",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end
vim.opt.runtimepath:prepend(lazypath)

require('config/options')
require("lazy").setup('plugins')
require('config/mappings')
require('config/autocmds')

------------------------------------------------------------------------------------------------------------------------------------
-- heirline ------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------

-- local conditions = require("heirline.conditions")
-- local utils = require("heirline.utils")
--
-- local components = {}
--
-- components.space = { provider = ' ' }
--
-- components.file_type = {
--   condition = function()
--     return not conditions.buffer_matches({ filetype = {}, buftype = { 'terminal' } })
--   end,
--   provider = function()
--     return ' ' .. vim.bo.filetype .. ' '
--   end,
--   hl = function()
--     local highlight = utils.get_highlight('@text')
--     return { fg = highlight.fg }
--   end
-- }
--
-- components.file_icon = {
--   init = function(self)
--     local filename = vim.api.nvim_buf_get_name(0)
--     local extension = vim.fn.fnamemodify(filename, ":e")
--     self.icon, self.icon_color = require("nvim-web-devicons").get_icon_color(filename, extension)
--   end,
--   provider = function(self)
--     return self.icon and (' ' .. self.icon)
--   end,
--   hl = function(self)
--     return { fg = self.icon_color }
--   end
-- }
--
-- components.lsp_active = {
--   condition = conditions.lsp_attached,
--   provider = function()
--     local names = {}
--     for i, server in pairs(vim.lsp.buf_get_clients(0)) do
--       table.insert(names, server.name)
--     end
--     return "%( [" .. table.concat(names, " ") .. "]%)"
--   end,
--   hl = function()
--     local highlight = utils.get_highlight('@text')
--     return { fg = highlight.fg }
--   end
-- }
--
-- components.git = {
--   condition = conditions.is_git_repo,
--   init = function(self)
--     self.status_dict = vim.b.gitsigns_status_dict
--     self.has_changes = self.status_dict.added ~= 0 or self.status_dict.removed ~= 0 or self.status_dict.changed ~= 0
--   end,
--   { -- git branch name
--     provider = function(self)
--       return " " .. self.status_dict.head
--     end,
--     hl = function()
--       local highlight = utils.get_highlight('@constant')
--       return { fg = highlight.fg }
--     end,
--   },
--   {
--     provider = function(self)
--       local count = self.status_dict.added or 0
--       return count > 0 and (" +" .. count)
--     end,
--     hl = function()
--       local highlight = utils.get_highlight('@string')
--       return { fg = highlight.fg }
--     end,
--   },
--   {
--     provider = function(self)
--       local count = self.status_dict.removed or 0
--       return count > 0 and (" -" .. count)
--     end,
--     hl = function()
--       local highlight = utils.get_highlight('@variable.builtin')
--       return { fg = highlight.fg }
--     end,
--   },
--   {
--     provider = function(self)
--       local count = self.status_dict.changed or 0
--       return count > 0 and (" ~" .. count)
--     end,
--     hl = function()
--       local highlight = utils.get_highlight('@type')
--       return { fg = highlight.fg }
--     end,
--   }
-- }
--
-- components.treesitter = {
--   hl = '@string',
--   provider = function()
--     local ts_avail, ts = pcall(require, 'nvim-treesitter.parsers')
--
--     if not (ts_avail and ts.has_parser()) then
--       return
--     else
--       local buf = vim.api.nvim_get_current_buf()
--       if require('vim.treesitter.highlighter').active[buf] then
--         return " "
--       end
--     end
--   end
-- }
--
-- components.search_results = {
--   condition = function(self)
--     local lines = vim.api.nvim_buf_line_count(0)
--     if lines > 50000 then return end
--
--     local query = vim.fn.getreg("/")
--     if query == "" then return end
--
--     if query:find("@") then return end
--
--     local search_count = vim.fn.searchcount({ recompute = 1, maxcount = -1 })
--     local active = false
--     if vim.v.hlsearch and vim.v.hlsearch == 1 and search_count.total > 0 then
--       active = true
--     end
--     if not active then return end
--
--     query = query:gsub([[^\V]], "")
--     query = query:gsub([[\<]], ""):gsub([[\>]], "")
--
--     self.query = query
--     self.count = search_count
--     return true
--   end,
--   {
--     provider = function(self)
--       return table.concat({
--         ' ', self.query, ' ', self.count.current, '/', self.count.total, ' '
--       })
--     end,
--     hl = function()
--       local highlight = utils.get_highlight('@function')
--       return { bg = highlight.fg, fg = theme.dark_bg }
--     end
--   },
-- }
--
-- local statusline = {
--   hl = { bg = theme.dark_bg },
--   {
--     components.git,
--     components.space,
--   },
--   {
--     provider = '%=',
--     {
--       components.lsp_active,
--       components.treesitter,
--       components.file_icon,
--       components.file_type
--     }
--   },
-- }
--
-- local winbar = {
--   {
--     fallthrough = false,
--     {
--       condition = function()
--         return conditions.buffer_matches({
--           buftype = { 'nofile', 'prompt', 'help', 'quickfix' },
--           filetype = { 'fzf' }
--         })
--       end,
--       init = function()
--         vim.opt_local.winbar = nil
--       end
--     },
--     {
--       {
--         condition = require('nvim-navic').is_available,
--         provider = function()
--           return require('nvim-navic').get_location({ highlight = true })
--         end,
--         update = 'CursorMoved'
--       },
--       {
--         init = function(self)
--           self.filename = vim.api.nvim_buf_get_name(0)
--         end,
--         provider = '%=',
--         {
--           hl = function()
--             if vim.bo.modified then
--               local highlight = utils.get_highlight('@string.escape')
--               return { fg = theme.dark_bg, bg = highlight.fg, force = true }
--             end
--           end,
--           {
--             {
--               init = function(self)
--                 local filename = self.filename
--                 local extension = vim.fn.fnamemodify(filename, ":e")
--                 self.icon, self.icon_color = require("nvim-web-devicons").get_icon_color(filename, extension,
--                   { default = true })
--               end,
--               provider = function(self)
--                 return self.icon and (' ' .. self.icon .. ' ')
--               end,
--               hl = function(self)
--                 return { fg = self.icon_color }
--               end
--             },
--             {
--               provider = function(self)
--                 -- first, trim the pattern relative to the current directory. For other
--                 -- options, see :h filename-modifers
--                 local filename = vim.fn.fnamemodify(self.filename, ":.")
--                 if filename == "" then return "[No Name]" end
--                 -- now, if the filename would occupy more than 1/4th of the available
--                 -- space, we trim the file path to its initials
--                 -- See Flexible Components section below for dynamic truncation
--                 if not conditions.width_percent_below(#filename, 0.50) then
--                   filename = vim.fn.pathshorten(filename)
--                 end
--                 return filename .. ' '
--               end,
--               hl = function()
--                 return { fg = utils.get_highlight('Directory').fg }
--               end
--             },
--           }
--         }
--       }
--     }
--   }
-- }
--
-- require('heirline').setup(statusline, winbar)

------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------

local default_plugins = {
  "2html_plugin",
  "getscript",
  "getscriptPlugin",
  "gzip",
  "logipat",
  "netrw",
  "netrwPlugin",
  "netrwSettings",
  "netrwFileHandlers",
  "matchit",
  "tar",
  "tarPlugin",
  "rrhelper",
  "spellfile_plugin",
  "vimball",
  "vimballPlugin",
  "zip",
  "zipPlugin",
}

for _, plugin in pairs(default_plugins) do
  vim.g["loaded_" .. plugin] = 1
end
