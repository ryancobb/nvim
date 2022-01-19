if vim.fn.has('nvim') == 1 then
  vim.cmd([[let $GIT_EDITOR = 'nvr -cc split --remote-wait']])
end

local g = vim.g
local o = vim.o -- Global options

g.mapleader=" "
g.loaded_matchparen = 1
g.Illuminate_delay = 1000
vim.g.Illuminate_highlightUnderCursor = 0

o.autoindent = true
o.clipboard = "unnamed,unnamedplus"
o.completeopt="menu,menuone,noselect"
o.cursorline = true
o.expandtab = true
o.hidden = true
o.hlsearch= true
o.ignorecase= true
o.incsearch= true
o.modeline = false
o.mouse = 'a'
o.number = true
o.shiftwidth = 2
o.shortmess= 'IFa'
o.showmatch= true
o.showmode = false
o.signcolumn = "yes"
o.smartcase = true
o.smartindent = true
o.softtabstop = 2
o.splitbelow = true
o.splitright = true
o.tabstop = 2
o.termguicolors = true
o.timeoutlen = 300
o.title = true
o.undofile = true
o.updatetime = 300
o.wrap = false-- disable some builtin vim plugins

local disabled_built_ins = {
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

for _, plugin in pairs(disabled_built_ins) do
   g["loaded_" .. plugin] = 1
end
