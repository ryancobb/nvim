local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
end

pcall(require, 'impatient')

------------------------------------------------------------------------------------------------------------------------------------
-- options -------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------
vim.g.do_filetype_lua = 1
vim.g.did_load_filetypes = 0
vim.g.matchup_matchparen_offscreen = {}
vim.g.ruby_indent_assignment_style = 'variable'
vim.g.test = { ruby = { rspec = { options = '--color' } } }

vim.cmd [[ set formatoptions-=cro ]]

vim.opt.autoread = true
vim.opt.clipboard = 'unnamedplus'
vim.opt.cmdheight = 0
vim.opt.completeopt = 'menu,menuone,noselect'
vim.opt.cursorline = true
vim.opt.expandtab = true
vim.opt.fillchars = { stl = '─' }
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
vim.opt.foldlevel = 99
vim.opt.foldmethod = 'expr'
vim.opt.hidden = true
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.incsearch = true
vim.opt.laststatus = 3
vim.opt.modeline = false
vim.opt.mouse = 'a'
vim.opt.number = true
vim.opt.numberwidth = 2
vim.opt.pumheight = 10
vim.opt.ruler = false
vim.opt.scrolloff = 10
vim.opt.shiftwidth = 2
vim.opt.shortmess:append('IFa')
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

require('packer').startup(function(use)
  use 'wbthomason/packer.nvim' -- Package manager
  use 'numToStr/Comment.nvim' -- "gc" to comment visual regions/lines
  use 'lukas-reineke/indent-blankline.nvim'
  use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' } }
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'nvim-treesitter/nvim-treesitter-textobjects'
  use 'nvim-treesitter/nvim-treesitter-refactor'
  use 'neovim/nvim-lspconfig' -- Collection of configurations for built-in LSP client
  use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/cmp-nvim-lsp-signature-help'
  use 'saadparwaiz1/cmp_luasnip'
  use 'L3MON4D3/LuaSnip' -- Snippets plugin
  use 'williamboman/nvim-lsp-installer'
  use 'kyazdani42/nvim-web-devicons'
  use 'famiu/bufdelete.nvim'
  use 'fladson/vim-kitty'
  use 'google/vim-jsonnet'
  use 'RRethy/nvim-treesitter-endwise'
  use 'lewis6991/impatient.nvim'
  use 'mrjones2014/smart-splits.nvim'
  use 'sindrets/diffview.nvim'
  use 'onsails/lspkind.nvim'
  use 'windwp/nvim-autopairs'
  use 'akinsho/toggleterm.nvim'
  use 'folke/which-key.nvim'
  use 'j-hui/fidget.nvim'
  use 'andymass/vim-matchup'
  use 'ibhagwan/fzf-lua'
  use { 'nvim-neo-tree/neo-tree.nvim', branch = 'v2.x',
    requires = { 'nvim-lua/plenary.nvim', 'kyazdani42/nvim-web-devicons', 'MunifTanjim/nui.nvim' } }
  use { 's1n7ax/nvim-window-picker', tag = '1.*' }
  use 'vim-test/vim-test'
  use 'folke/lua-dev.nvim'
  use 'norcalli/nvim-colorizer.lua'
  use 'olimorris/onedarkpro.nvim'
  use "rebelot/heirline.nvim"
  use 'shatur/neovim-session-manager'
  use 'rmagatti/alternate-toggler'
  use 'antoinemadec/FixCursorHold.nvim'
  use 'akinsho/git-conflict.nvim'
  use 'vim-test/vim-test'
  use { 'nvim-neotest/neotest', requires = { 'olimorris/neotest-rspec' } }
  use 'nvim-neotest/neotest-vim-test'
  use { 'VonHeikemen/searchbox.nvim', requires = { 'MunifTanjim/nui.nvim' } }
  use 'p00f/nvim-ts-rainbow'
  use 'hrsh7th/nvim-pasta'
  use 'lewis6991/satellite.nvim'
  use 'chentoast/marks.nvim'
end)

------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------

require('Comment').setup {}
require('fidget').setup {}
require('nvim-autopairs').setup {}
require('which-key').setup {}
require('satellite').setup {} 
require('marks').setup {}

local fzflua = require('fzf-lua')

------------------------------------------------------------------------------------------------------------------------------------
-- theme ---------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------

vim.o.background = 'dark'
local onedarkpro = require('onedarkpro')
onedarkpro.setup {
  hlgroups = {
    CursorLineNr = { fg = '${fg}' },
    DiagnosticUnderlineError = { fg = 'NONE' },
    DiagnosticUnderlineHint = { fg = 'NONE' },
    DiagnosticUnderlineInfo = { fg = 'NONE' },
    DiagnosticUnderlineWarn = { fg = 'NONE' },
    IndentBlanklineContextChar = { fg = '${fg}' },
    LineNr = { bg = 'NONE' },
    NeoTreeDirectoryIcon = { fg = '${fg}' },
    NeoTreeNormalNC = { bg = '${bg_dark}' },
    NormalNC = { bg = '${bg_dark}' },
    SignColumn = { bg = 'NONE' },
    TabLine = { bg = '${bg_dark}', fg = 'gray' },
    TabLineFill = { bg = '${bg_dark}' },
    TabLineSel = { bg = '${bg}', fg = '${fg}' },
    TermCursor = { bg = '${fg}', fg = '${bg}' },
    TermCursorNC = { bg = 'NONE' },
    WhichKeyFloat = { bg = '${bg_dark}' },
    WinBarNC = { bg = '${bg_dark}' },
    WinSeparator = { bg = '${bg_dark}' },
  },
  colors = {
    onedark = {
      bg_dark = '#1f2329',
      blue = '#6FA5D3',
      green = '#94ae82',
      purple = '#B681C4',
      yellow = '#c7aa75',
      cyan = '#67A5AD',
      red = '#dc8188'
    }
  },
  options = {
    cursorline = true,
  },
  plugins = {
    aerial = false,
    barbar = false,
    dashboard = false,
    hop = false,
    lsp_saga = false,
    nvim_tree = false,
    polygot = false,
    startify = false,
    telescope = false,
    trouble_nvim = false,
  }
}
onedarkpro.load()

local colors = require('onedarkpro').get_colors(vim.g.onedarkpro_style)

------------------------------------------------------------------------------------------------------------------------------------
-- mappings ------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------

vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.keymap.set({ 'n', 'v' }, 'q', '<nop>', { silent = true })
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local wk = require('which-key')
wk.register({
  ['<leader>'] = {
    ['<space>'] = { function() fzflua.buffers({ fzf_opts = { ['--keep-right'] = '' } }) end,
      'buffers' },
    ['?'] = { function() fzflua.oldfiles({ fzf_opts = { ['--keep-right'] = '' } }) end, 'old files' },
    f = { fzflua.files, 'find files' },
    c = { function() require('bufdelete').bufdelete(0, true) end, 'close buffer' },
    q = { '<C-w>q', 'quit window' },
    Q = { ':bd<cr>', 'quit window and close buffer' },
    e = { ':NeoTreeShowToggle<CR>', 'neotree' },
    r = { ':Neotree reveal<CR>', 'reveal file' }

  },
  ['<leader>s'] = {
    name = 'search',
    t = { fzflua.live_grep_glob, 'text' },
    c = { fzflua.grep_cword, 'cursor word' },
    r = { fzflua.resume, 'resume' },
    a = { function() fzflua.files({ fzf_opts = { ['--query'] = '"' ..
          vim.fn.expand('%:t:r'):gsub('_spec', '') .. ' !' .. vim.fn.expand('%') .. '"' } })
    end, 'alternate files' },
    s = { fzflua.tagstack, 'stack (tags)' },
    j = { fzflua.jumps, 'jumps' }
  },
  ['<leader>y'] = {
    name = 'yank',
    f = { ':TestFile<CR>', '(test) file' },
    n = { ':TestNearest<CR>', '(test) nearest' }
  },
  ['<leader>g'] = {
    name = 'git',
    s = { ':Neotree git_status toggle<cr>', 'status' },
    L = { fzflua.git_commits, 'log' },
    l = { fzflua.git_bcommits, 'log (buffer)' },
  },
  ['<leader>t'] = {
    a = { ':ToggleAlternate<CR>', 'alternate' },
  },
  ['<leader>b'] = { ':Neotree buffers toggle<cr>', 'buffers' },
  ['<leader>.'] = { function() require('searchbox').replace({ confirm = 'menu' }) end, 'replace' },
  ['[d'] = { function() vim.diagnostic.goto_prev({ float = { border = 'single' } }) end, 'previous diagnostic' },
  [']d'] = { function() vim.diagnostic.goto_next({ float = { border = 'single' } }) end, 'next diagnostic' },
})

vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-l>', '<C-w>l')

vim.keymap.set('n', '<a-k>', require('smart-splits').resize_up)
vim.keymap.set('n', '<a-j>', require('smart-splits').resize_down)
vim.keymap.set('n', '<a-h>', require('smart-splits').resize_left)
vim.keymap.set('n', '<a-l>', require('smart-splits').resize_right)

vim.keymap.set('n', '<Esc>', '<cmd>:noh<cr>', { silent = true })

vim.keymap.set('v', '<s-j>', ":m'>+<CR>gv=gv")
vim.keymap.set('v', '<s-k>', ":m-2<CR>gv=gv")
vim.keymap.set({ 'n', 'x' }, 'p', require('pasta.mappings').p)
vim.keymap.set({ 'n', 'x' }, 'P', require('pasta.mappings').P)

vim.keymap.set('t', '<c-h>', '<c-\\><c-n><c-w>h')
vim.keymap.set('t', '<c-j>', '<c-\\><c-n><c-w>j')
vim.keymap.set('t', '<c-k>', '<c-\\><c-n><c-w>k')
vim.keymap.set('t', '<c-l>', '<c-\\><c-n><c-w>l')
vim.keymap.set('t', '<c-n>', '<c-\\><c-n>')

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


------------------------------------------------------------------------------------------------------------------------------------
-- satellite -----------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------

require('satellite').setup {
  handlers = {
    enable = false
  }
}

------------------------------------------------------------------------------------------------------------------------------------
-- searchbox -----------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------

require('searchbox').setup {
  popup = {
    position = {
      row = '0%',
      col = '100%'
    }
  }
}

------------------------------------------------------------------------------------------------------------------------------------
-- neotest -------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------

require('neotest').setup {
  adapters = {
    -- require('neotest-rspec'),
    require("neotest-vim-test")({ ignore_filetypes = { "python", "lua" } }),
  }
}

------------------------------------------------------------------------------------------------------------------------------------
-- diffview ------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------

local actions = require('diffview.actions')

require('diffview').setup {
  enhanced_diff_hl = true,
  keymaps = {
    view = {
      ['gf'] = actions.goto_file_edit
    },
    file_panel = {
      ['gf'] = actions.goto_file_edit
    }
  }
}

------------------------------------------------------------------------------------------------------------------------------------
-- git-conflict --------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------

require('git-conflict').setup {
  default_mappings = true, -- disable buffer local mapping created by this plugin
  disable_diagnostics = false, -- This will disable the diagnostics in a buffer whilst it is conflicted
  highlights = { -- They must have background color, otherwise the default color will be used
    incoming = 'DiffText',
    current = 'DiffAdd',
  }
}

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
-- neovim-session-manager ----------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------

require('session_manager').setup {
  autoload_mode = require('session_manager.config').AutoloadMode.CurrentDir
}

------------------------------------------------------------------------------------------------------------------------------------
-- vim-test ------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------

vim.g['test#custom_strategies'] = {
  yank = function(cmd)
    vim.cmd('let @+="' .. cmd .. '"')
  end
}

vim.g['test#strategy'] = 'yank'

------------------------------------------------------------------------------------------------------------------------------------
-- toggleterm ----------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------

vim.g.terminal_direction = 'horizontal'

vim.keymap.set('n', '<c-\\>', '<cmd>exe v:count . "ToggleTerm direction=" . g:terminal_direction<CR>')

vim.api.nvim_command('autocmd TermEnter term://*toggleterm#* tnoremap <silent><c-\\> <Cmd>exe v:count1 . "ToggleTerm"<CR>')

require('toggleterm').setup {
  size = function(term)
    if term.direction == "horizontal" then
      return vim.api.nvim_win_get_height(0) * 0.7
    elseif term.direction == "vertical" then
      return vim.o.columns * 0.4
    end
  end,
  open_mapping = nil,
  hide_numbers = true,
  shade_terminals = false,
  start_in_insert = false,
  insert_mappings = true, -- whether or not the open mapping applies in insert mode
  persist_size = true,
  direction = vim.g.terminal_direction,
  close_on_exit = false, -- close the terminal window when the process exits
  float_opts = {
    border = 'curved'
  },
  highlights = {
    NormalNC = {
      link = 'NormalNC'
    },
    StatusLine = {
      link = 'StatusLine'
    }
  }
}

------------------------------------------------------------------------------------------------------------------------------------
-- heirline ------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------

local hl = require('heirline_components')
local conditions = require('heirline.conditions')
local utils = require('heirline.utils')

vim.cmd [[ highlight! link StatusLine WinSeparator ]]

vim.api.nvim_create_autocmd({ 'InsertEnter', 'TermEnter' }, {
  command = 'highlight StatusLine guibg=' .. colors.bg_dark .. ' guifg=' .. colors.blue,
  pattern = '*'
})

vim.api.nvim_create_autocmd({ 'InsertLeave', 'TermLeave' }, {
  command = 'highlight! link StatusLine WinSeparator',
  pattern = '*'
})

vim.api.nvim_create_autocmd("User", {
  pattern = 'HeirlineInitWinbar',
  callback = function(args)
    local buf = args.buf
    local buftype = vim.tbl_contains(
      { "prompt", "nofile", "help", "quickfix" },
      vim.bo[buf].buftype
    )
    local filetype = vim.tbl_contains({ "gitcommit" }, vim.bo[buf].filetype)
    if buftype or filetype then
      vim.opt_local.winbar = nil
    end
  end,
})

local statusline = {
  {
    hl = { bg = colors.bg_dark },
    hl.git,
    hl.space,
  },
  {
    provider = '%=',
    {
      hl = { bg = colors.bg_dark },
      hl.space,
      hl.lsp_active,
      hl.treesitter,
      hl.file_type,
    }
  },
}

local winbar = {
  {
    init = utils.pick_child_on_condition,
    { -- hide the winbar for special buffers
      condition = function()
        return conditions.buffer_matches({
          buftype = { 'nofile', 'prompt', 'help', 'quickfix' },
          filetype = { 'fzf', '^git.*' },
        })
      end,
      init = function()
        vim.opt_local.winbar = nil
      end
    },
    { -- terminals
      provider = '%=',
      condition = function()
        return conditions.buffer_matches({ buftype = { 'terminal' } })
      end,
      hl.terminal_name
    },
    hl.file_name_block,
  }
}

require('heirline').setup(statusline, winbar)

------------------------------------------------------------------------------------------------------------------------------------
-- indent blankline ----------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------

require('indent_blankline').setup {
  use_treesitter = true,
  char = '┊',
  show_trailing_blankline_indent = false,
  show_current_context = true,
  filetype_exclude = {
    'help',
    'terminal',
    'packer',
    'lspinfo',
    'lsp-installer',
    'toggleterm',
    ''
  }
}

------------------------------------------------------------------------------------------------------------------------------------
-- gitsigns ------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------

require('gitsigns').setup {
  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns

    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    wk.register({
      ['<leader>g'] = {
        name = 'git',
        S = { gs.stage_buffer, 'stage buffer' },
        R = { gs.reset_buffer, 'reset buffer' },
        b = { function() gs.blame_line { full = true } end, 'blame line' },
        d = { gs.diffthis, 'diff' },
        D = { function() gs.diffthis('~') end, 'diff (~)' }
      },
      ['<leader>h'] = {
        name = 'hunk',
        s = { ':Gitsigns stage_hunk<CR>', 'stage hunk' },
        r = { ':Gitsigns reset_hunk<CR>', 'reset hunk' },
        u = { gs.undo_stage_hunk, 'undo stage hunk' },
        p = { gs.preview_hunk, 'preview hunk' },
      },
      ['<leader>t'] = {
        name = 'toggle/test',
        b = { gs.toggle_current_line_blame, 'line blame' },
        d = { gs.toggle_deleted, 'deleted' }
      }
    })

    -- Navigation
    map('n', ']c', function()
      if vim.wo.diff then return ']c' end
      vim.schedule(function() gs.next_hunk() end)
      return '<Ignore>'
    end, { expr = true })

    map('n', '[c', function()
      if vim.wo.diff then return '[c' end
      vim.schedule(function() gs.prev_hunk() end)
      return '<Ignore>'
    end, { expr = true })

    -- Text object
    map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
  end
}

------------------------------------------------------------------------------------------------------------------------------------
-- fzflua --------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------

fzflua.setup {
  winopts = {
    height = 0.90,
    width = 0.90,
    col = 0.50,
    preview = {
      default = 'bat_native',
      delay = 250
    },
    window_on_create = function()
      vim.keymap.set('t', '<c-j>', '<down>', { buffer = true })
      vim.keymap.set('t', '<c-k>', '<up>', { buffer = true })
    end
  },
  keymap = {
    fzf = {
      ['alt-j'] = 'preview-page-down',
      ['alt-k'] = 'preview-page-up'
    }
  },
  files = {
    git_icons = false
  },
  lsp = {
    git_icons = false
  },
  buffers = {
    winopts = {
      height = 0.15,
      width = 0.75,
    },
    previewer = false,
    git_icons = true
  },
  git = {
    branches = {
      cmd = "git branch --color --sort=-committerdate"
    },
    commits = {
      preview = "git show --pretty='%Cred%H%n%Cblue%an%n%Cgreen%s' --color {1} | delta --width $FZF_PREVIEW_COLUMNS",
    },
    bcommits = {
      preview = "git show --pretty='%Cred%H%n%Cblue%an%n%Cgreen%s' --color {1} | delta --width $FZF_PREVIEW_COLUMNS",
    },
  },
  previewers = {
    git_diff = {
      pager = 'delta --width $FZF_PREVIEW_COLUMNS'
    }
  },
  oldfiles = {
    cwd = vim.loop.cwd(),
    cwd_only = true,
  }
}


------------------------------------------------------------------------------------------------------------------------------------
-- treesitter ----------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------
require('nvim-treesitter.configs').setup {
  highlight             = {
    enable = true,
  },
  rainbow               = {
    enable = true,
    extended_mode = true,
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<CR>',
      node_incremental = '<CR>',
      scope_incremental = '<TAB>',
      node_decremental = '<S-TAB>',
    },
  },
  refactor              = {
    highlight_definitions = { enable = true }
  },
  indent                = {
    enable = true,
    disable = { 'ruby' }
  },
  matchup               = {
    enable = true,
  },
  endwise               = {
    enable = true
  },
  textobjects           = {
    select = {
      enable = true,
      lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ac'] = '@class.outer',
        ['ic'] = '@class.inner',
      },
    },
    swap = {
      enable = true,
      swap_next = {
        ['<leader>a'] = '@parameter.inner',
      },
      swap_previous = {
        ['<leader>A'] = '@parameter.inner',
      }
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        [']m'] = '@function.outer',
        [']]'] = '@class.outer',
      },
      goto_next_end = {
        [']M'] = '@function.outer',
        [']['] = '@class.outer',
      },
      goto_previous_start = {
        ['[m'] = '@function.outer',
        ['[['] = '@class.outer',
      },
      goto_previous_end = {
        ['[M'] = '@function.outer',
        ['[]'] = '@class.outer',
      },
    },
  },
}

------------------------------------------------------------------------------------------------------------------------------------
-- lsp -----------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------

vim.diagnostic.config({
  virtual_text = false
})

local signs = {
  Error = " ",
  Warn = " ",
  Hint = " ",
  Info = " "
}

for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

local lspinstaller = require 'nvim-lsp-installer'
local lspconfig = require 'lspconfig'

lspinstaller.setup {}

local on_attach = function(_, bufnr)
  local opts = { buffer = bufnr }

  wk.register({
    ['gd'] = { function() fzflua.lsp_definitions({ jump_to_single_result = true }) end, 'definition' },
    ['gr'] = { function() fzflua.lsp_references({ jump_to_single_result = true }) end, 'references' },
    K = { vim.lsp.buf.hover, 'hover' },
    ['<leader>D'] = { fzflua.lsp_typedefs, 'type definition' },
    ['<leader>rn'] = { vim.lsp.buf.rename, 'rename' },
    ['<leader>la'] = { function() fzflua.lsp_code_actions({ winopts = { height = 0.15, width = 0.30 } }) end,
      'code actions' },
    ['<leader>so'] = { function() fzflua.lsp_document_symbols({ fzf_cli_args = '--with-nth=2..' }) end,
      'document symbols' },
    ['<leader>sO'] = { function() fzflua.lsp_workspace_symbols({ fzf_cli_args = '--with-nth=2..' }) end,
      'workspace symbols' },
    ['<leader>l'] = { name = 'lsp', f = { function() vim.lsp.buf.format({ async = true }) end, 'format' } }
  }, opts)
end

-- nvim-cmp supports additional completion capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

for _, server in ipairs(lspinstaller.get_installed_servers()) do
  if server.name == 'sumneko_lua' then
    lspconfig.sumneko_lua.setup(require('lua-dev').setup {
      lspconfig = {
        on_attach = on_attach,
        capabilities = capabilities
      }
    })
  else
    lspconfig[server.name].setup {
      on_attach = on_attach,
      capabilities = capabilities,
    }
  end
end

lspconfig.solargraph.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { '/Users/ryancobb/.asdf/shims/solargraph', 'stdio' }
}

------------------------------------------------------------------------------------------------------------------------------------
-- cmp -----------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------

local cmp = require('cmp')
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local lspkind = require('lspkind')
local luasnip = require('luasnip')

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local down = cmp.mapping(function(fallback)
  if cmp.visible() then
    cmp.select_next_item()
  elseif luasnip.expand_or_jumpable() then
    luasnip.expand_or_jump()
  elseif has_words_before() then
    cmp.complete()
  else
    fallback()
  end
end, { 'i', 's', 'c' })

local up = cmp.mapping(function(fallback)
  if cmp.visible() then
    cmp.select_prev_item()
  elseif luasnip.jumpable(-1) then
    luasnip.jump(-1)
  else
    fallback()
  end
end, { 'i', 's', 'c' })

cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done({ map_char = { tex = '' } }))

cmp.setup {
  formatting = {
    format = lspkind.cmp_format({
      mode = 'symbol_text',
      maxwidth = 50
    })
  },
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = false,
    },
    ['<c-j>'] = down,
    ['<tab>'] = down,
    ['<c-k>'] = up,
    ['<s-tab>'] = up,
  }),
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'path' },
    { name = 'nvim_lsp_signature_help' },
  },
  window = {
    completion = cmp.config.window.bordered({
      winhighlight = 'Normal:Pmenu'
    }),
    documentation = cmp.config.window.bordered({
      winhighlight = 'Normal:Pmenu'
    })
  }
}

cmp.setup.cmdline('/', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'buffer' },
  })
})

cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' },
    { name = 'cmdline' },
  })
})

------------------------------------------------------------------------------------------------------------------------------------
-- neotree -------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------

require('window-picker').setup {
  autoselect_one = true,
  include_current = false,
  filter_rules = {
    bo = {
      filetype = { 'neo-tree', 'neo-tree-popup', 'notify', 'quickfix', 'toggleterm' },
      buftype = {}
    }
  },
  other_win_hl_color = '#2D4F67'
}

require('neo-tree').setup {
  enable_diagnostics = false,
  close_if_last_window = true,
  filesystem = {
    filtered_items = {
      visible = true
    },
    never_show = { '.DS_Store', '.git' }
  },
  window = {
    mappings = {
      ['<cr>'] = 'open_with_window_picker'
    }
  }
}

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
