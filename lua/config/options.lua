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