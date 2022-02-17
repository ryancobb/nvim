local g = vim.g
local o = vim.o

g.mapleader=" "
g.loaded_matchparen = 1
g.Illuminate_delay = 1000
g.Illuminate_highlightUnderCursor = 0

o.autoread = true
o.clipboard = "unnamedplus"
o.cmdheight = 1
o.completeopt="menu,menuone,noselect"
o.cursorline = true
o.expandtab = true
o.foldexpr="nvim_treesitter#foldexpr()"
o.foldlevel = 99
o.foldmethod="expr"
o.hidden = true
o.hlsearch= true
o.ignorecase= true
o.incsearch= true
o.modeline = false
o.mouse = 'a'
o.nowrap = true
o.number = true
o.ruler = false
o.shiftwidth = 2
o.shortmess= 'IFa'
o.showcmd = false
o.showmatch= true
o.showmode = false
o.signcolumn = 'yes'
o.smartcase = true
o.smartindent = false
o.splitbelow = true
o.splitright = true
o.tabstop = 2
o.termguicolors = true
o.timeoutlen = 400
o.title = true
o.titlestring = [[ %{substitute(getcwd(), $HOME, '~', ' ')} - NVIM ]]
o.undofile = true
o.updatetime = 300

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
