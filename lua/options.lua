if vim.fn.has('nvim') == 1 then
  vim.cmd([[let $GIT_EDITOR = 'nvr -cc split --remote-wait']])
end

local o = vim.o -- Global options

vim.g.mapleader=" "
vim.g.loaded_matchparen = 1

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
o.wrap = false
