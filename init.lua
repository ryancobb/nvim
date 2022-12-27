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

------------------------------------------------------------------------------------------------------------------------------------
-- options -------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------
vim.g.mapleader = ' '
vim.g.matchup_matchparen_offscreen = {}
vim.g.ruby_indent_assignment_style = 'variable'

vim.cmd [[ set diffopt+=linematch:60 ]]
vim.cmd [[ set fillchars+=diff:╱ ]]
vim.cmd [[ set formatoptions-=cro ]]

vim.opt.clipboard = 'unnamedplus'
vim.opt.cmdheight = 0
vim.opt.cursorline = true
vim.opt.expandtab = true
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
vim.opt.foldlevel = 99
vim.opt.foldmethod = 'expr'
vim.opt.hidden = true
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.incsearch = true
vim.opt.laststatus = 3
vim.opt.modeline = false
vim.opt.number = true
vim.opt.numberwidth = 2
vim.opt.pumheight = 10
vim.opt.ruler = false
vim.opt.shiftwidth = 2
vim.opt.shortmess:append('sI')
vim.opt.showcmd = false
vim.opt.showmatch = true
vim.opt.showmode = false
vim.opt.signcolumn = 'yes'
vim.opt.smartcase = true
vim.opt.smartindent = false
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.tabstop = 2
vim.opt.termguicolors = true
vim.opt.timeoutlen = 400
vim.opt.title = true
vim.opt.titlestring = [[ %{substitute(getcwd(), $HOME, '~', ' ')} - NVIM ]]
vim.opt.undofile = true
vim.opt.updatetime = 250
vim.opt.wrap = false

------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------

require("lazy").setup('plugins')

local palette = require('nightfox.palette').load('nordfox')
vim.cmd('highlight IndentBlankLineChar guifg= ' .. palette.fg3)

vim.cmd[[ colorscheme nordfox ]]

local neotest = require('neotest')
local splits = require('smart-splits')

------------------------------------------------------------------------------------------------------------------------------------
-- mappings ------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------

vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.keymap.set({ 'n', 'v' }, 'q', '<nop>', { silent = true })

local wk = require('which-key')
wk.register({
  ['<leader>'] = {
    ['<space>'] = { function() require('fzf-lua').buffers({
        previewer = false,
        winopts = { height = 0.20 },
        global_resume = false
      })
    end, 'buffers' },
    ['?'] = { ':FzfLua oldfiles cwd_only=true<cr>', 'old files' },
    f = { ':FzfLua files<cr>', 'find files' },
    c = { function() require('bufdelete').bufdelete(0, true) end, 'close buffer' },
    q = { '<C-w>q', 'quit window' },
    Q = { ':bd<cr>', 'quit window and close buffer' },
    e = { ':NeoTreeShowToggle<CR>', 'neotree' },
    r = { ':Neotree reveal<CR>', 'reveal file' },
  },
  ['<leader>s'] = {
    name = 'search',
    t = { ':FzfLua live_grep_glob<cr>', 'text' },
    c = { ':FzfLua grep_cword<cr>', 'cursor word' },
    r = { ':FzfLua resume<cr>', 'resume' },
    a = { function() require('fzf-lua').files({
        fzf_opts = { ['--query'] = vim.fn.expand('%:t:r'):gsub('_spec', '') .. '\\ \"!' .. vim.fn.expand('%:t') ..
            '\"\\ ' }
      })
    end, 'alternate' },
  },
  ['<leader>g'] = {
    name = 'git',
    s = { ':Neotree git_status<cr>', 'status' },
    L = { ':FzfLua git_commits<cr>', 'log' },
    l = { ':FzfLua git_bcommits<cr>', 'log (buffer)' },
    D = { ':Gitsigns diffthis<cr>', 'diff this' },
    y = { function() require('gitlinker').get_buf_range_url('n', {}) end, 'yank repo link' }
  },
  ['<leader>t'] = {
    a = { function() neotest.run.attach({ interactive = true }) end, 'attach (test)' },
    n = { function() neotest.run.run() end, 'nearest (test)' },
    f = { function() neotest.run.run(vim.fn.expand('%')) end, 'file (test)' },
    s = { function() neotest.summary.toggle() end, 'summary (test)' },
    o = { function() neotest.output.open() end, 'output (test)' },
    c = {
      function()
        if vim.bo.filetype == '' then
          vim.cmd [[%s/[0-9]*rspec /]]
          vim.cmd [[%s/ # .*\n/ ]]
        end
      end,
      'clean failed'
    }
  },
  ['<leader>y'] = {
    name = 'yank',
    f = { ':let @+ = expand("%")<cr>', 'filename' }
  },
  ['<leader>b'] = { ':Neotree buffers toggle<cr>', 'buffers' },
  ['[d'] = { function() vim.diagnostic.goto_prev({ float = { border = 'single' } })
  end, 'previous diagnostic' },
  [']d'] = { function() vim.diagnostic.goto_next({ float = { border = 'single' } })
  end, 'next diagnostic' },
})

vim.keymap.set('n', '<c-h>', '<c-w>h')
vim.keymap.set('n', '<c-j>', '<c-w>j')
vim.keymap.set('n', '<c-k>', '<c-w>k')
vim.keymap.set('n', '<c-l>', '<c-w>l')

vim.keymap.set('n', '<c-up>', splits.resize_up)
vim.keymap.set('n', '<c-down>', splits.resize_down)
vim.keymap.set('n', '<c-left>', splits.resize_left)
vim.keymap.set('n', '<c-right>', splits.resize_right)

vim.keymap.set('n', '<Esc>', '<cmd>:noh<cr>', { silent = true })
vim.keymap.set('n', 'gx', ':!open <c-r><c-a><cr>', { desc = 'open file' })
vim.keymap.set('n', 'gx', [[:silent execute '!open ' . shellescape(expand('<cfile>'), 1)<CR>]], { silent = true })

vim.keymap.set({ 'n', 'x' }, 'd', '"_d')
vim.keymap.set('x', 'p', '"_dP')

vim.keymap.set('v', '<s-j>', ":m'>+<CR>gv=gv")
vim.keymap.set('v', '<s-k>', ":m-2<CR>gv=gv")

vim.keymap.set('t', '<c-h>', '<c-\\><c-n><c-w>h')
vim.keymap.set('t', '<c-j>', '<c-\\><c-n><c-w>j')
vim.keymap.set('t', '<c-k>', '<c-\\><c-n><c-w>k')
vim.keymap.set('t', '<c-l>', '<c-\\><c-n><c-w>l')
vim.keymap.set('t', '<c-n>', '<c-\\><c-n>')

vim.keymap.set({ 'i', 'c' }, '<c-a>', '<home>')
vim.keymap.set({ 'i', 'c' }, '<c-e>', '<end>')

------------------------------------------------------------------------------------------------------------------------------------
-- autocmds ------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------

local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

vim.api.nvim_create_autocmd('TermOpen', {
  pattern = '*',
  callback = function() vim.cmd [[ setlocal nonumber signcolumn=no ]] end
})

vim.api.nvim_create_autocmd('VimResized', {
  pattern = '*',
  callback = function() vim.cmd [[ wincmd = ]] end
})

vim.api.nvim_create_autocmd('FocusGained', {
  pattern = '*',
  callback = function() vim.cmd [[ checktime ]] end
})

------------------------------------------------------------------------------------------------------------------------------------
-- nvr -----------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------

vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'gitcommit', 'gitrebase', 'gitconfig' },
  command = 'set bufhidden=delete'
})

vim.cmd [[
  if has('nvim') && executable('nvr')
    let $GIT_EDITOR = "nvr -cc split --remote-wait"
  endif
]]

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
