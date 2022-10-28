local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
end

pcall(require, 'impatient')

------------------------------------------------------------------------------------------------------------------------------------
-- options -------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------

vim.g.matchup_matchparen_offscreen = {}
vim.g.ruby_indent_assignment_style = 'variable'

vim.cmd [[ set fillchars+=diff:╱ ]]
vim.cmd [[ set formatoptions-=cro ]]

vim.opt.clipboard = 'unnamedplus'
vim.opt.cmdheight = 1
vim.opt.completeopt = 'menu,menuone,noselect'
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

require('packer').startup(function(use)
  use 'wbthomason/packer.nvim' -- Package manager
  use 'numToStr/Comment.nvim'
  use 'lukas-reineke/indent-blankline.nvim'
  use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' } }
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'nvim-treesitter/nvim-treesitter-textobjects'
  use 'RRethy/nvim-treesitter-endwise'

  use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/cmp-nvim-lsp-signature-help'
  use 'saadparwaiz1/cmp_luasnip'

  use 'L3MON4D3/LuaSnip' -- Snippets plugin
  use 'kyazdani42/nvim-web-devicons'
  use 'famiu/bufdelete.nvim'
  use 'lewis6991/impatient.nvim'
  use 'mrjones2014/smart-splits.nvim'
  use 'sindrets/diffview.nvim'
  use 'onsails/lspkind.nvim'
  use 'windwp/nvim-autopairs'
  use 'folke/which-key.nvim'
  use 'j-hui/fidget.nvim'
  use 'andymass/vim-matchup'
  use { 'nvim-neo-tree/neo-tree.nvim', branch = 'v2.x',
    requires = { 'nvim-lua/plenary.nvim', 'kyazdani42/nvim-web-devicons', 'MunifTanjim/nui.nvim' } }
  use { 's1n7ax/nvim-window-picker', tag = '1.*' }
  use 'norcalli/nvim-colorizer.lua'
  use "rebelot/heirline.nvim"
  use { 'nvim-neotest/neotest', requires = { 'olimorris/neotest-rspec', 'haydenmeade/neotest-jest' } }
  use 'p00f/nvim-ts-rainbow'
  use 'karb94/neoscroll.nvim'

  use { "catppuccin/nvim", as = "catppuccin" }
  use 'sainnhe/everforest'

  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  }
  use { 'kevinhwang91/nvim-bqf', ft = 'qf' }
  use 'dstein64/nvim-scrollview'
  use 'TimUntersberger/neogit'
  use { 'nvim-telescope/telescope.nvim', tag = '0.1.0', requires = { 'nvim-lua/plenary.nvim' } }
  use 'nvim-telescope/telescope-fzy-native.nvim'
  use 'nvim-telescope/telescope-live-grep-args.nvim'
  use 'RRethy/vim-illuminate'
  use 'phaazon/mind.nvim'
  use 'nvim-treesitter/playground'
  use 'AckslD/messages.nvim'
  use 'gennaro-tedesco/nvim-jqx'
  use 'ellisonleao/glow.nvim'
  use 'rgroli/other.nvim'
  use { 'ruifm/gitlinker.nvim', requires = 'nvim-lua/plenary.nvim' }

  -- languages
  use 'keith/swift.vim'
  use 'google/vim-jsonnet'
  use 'folke/neodev.nvim'
end)

------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------

require('Comment').setup({})
require('gitlinker').setup()
require('neodev').setup({})
require('messages').setup({})
require('mind').setup({})
require('neoscroll').setup({})
require('nvim-autopairs').setup({})
require('which-key').setup({})

local neotest = require('neotest')
local splits = require('smart-splits')

------------------------------------------------------------------------------------------------------------------------------------
-- theme ---------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------

-- vim.g.catppuccin_flavour = "frappe" -- latte, frappe, macchiato, mocha
--
-- local colors = require("catppuccin.palettes").get_palette()
-- local color_utils = require('catppuccin.utils.colors')
-- local dark_bg = color_utils.darken(colors.base, 0.8, nil)
--
-- require("catppuccin").setup {
--   dim_inactive = {
--     enabled = true,
--     shade = 'dark',
--     percentage = 0.20
--   },
--   integrations = {
--     cmp = true,
--     fidget = true,
--     gitsigns = true,
--     markdown = true,
--     neogit = true,
--     notify = true,
--     telescope = true,
--     treesitter = true,
--     ts_rainbow = true,
--     which_key = true,
--     neotest = true,
--     native_lsp = {
--       enabled = true,
--       virtual_text = {
--         errors = { "italic" },
--         hints = { "italic" },
--         warnings = { "italic" },
--         information = { "italic" },
--       },
--       underlines = {
--         errors = { "underline" },
--         hints = { "underline" },
--         warnings = { "underline" },
--         information = { "underline" },
--       },
--     },
--     neotree = {
--       enabled = true,
--       show_root = true,
--       transparent_panel = false,
--     },
--   },
-- }

local dark_bg = '#252c31'

vim.g.everforest_show_eob = 0
vim.cmd [[set background=dark]]
vim.cmd [[colorscheme everforest]]
vim.cmd('highlight NormalNC guibg=' .. dark_bg)
vim.cmd('highlight WinbarNC guibg=' .. dark_bg)
vim.cmd('highlight EndOfBuffer guibg=NONE')

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
    ['<space>'] = { ':Telescope buffers previewer=false layout_config={height=20}<cr>', 'buffers' },
    ['?'] = { ':Telescope oldfiles cwd_only=true<cr>', 'old files' },
    f = { ':Telescope find_files<cr>', 'find files' },
    c = { function() require('bufdelete').bufdelete(0, true) end, 'close buffer' },
    q = { '<C-w>q', 'quit window' },
    Q = { ':bd<cr>', 'quit window and close buffer' },
    e = { ':NeoTreeShowToggle<CR>', 'neotree' },
    r = { ':Neotree reveal<CR>', 'reveal file' },
    m = { ':MindOpenMain<CR>', 'mind' }

  },
  ['<leader>s'] = {
    name = 'search',
    t = { ':Telescope live_grep_args<cr>', 'text' },
    c = { ':Telescope grep_string<cr>', 'cursor word' },
    r = { ':Telescope resume<cr>', 'resume' },
    a = { ':Other<cr>', 'alternate' }
  },
  ['<leader>g'] = {
    name = 'git',
    s = { ':Neotree git_status<cr>', 'status' },
    L = { ':Telescope git_commits<cr>', 'log' },
    l = { ':Telescope git_bcommits<cr>', 'log (buffer)' },
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
-- scrollview ----------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------

require('scrollview').setup({
  current_only = true
})

------------------------------------------------------------------------------------------------------------------------------------
-- glow-----------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------

require('other-nvim').setup({
  mappings = {
    'rails',
    {
      pattern = 'app/(.*/.*).rb$',
      target = 'spec/%1_spec.rb$',
      context = 'test'
    },
    {
      pattern = 'spec/(.*/.*)_spec.rb$',
      target = 'app/%1.rb$',
      context = 'implementation'
    },

  }
})

------------------------------------------------------------------------------------------------------------------------------------
-- glow-----------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------

require('glow').setup({
  width = 120,
  border = 'single'
})

------------------------------------------------------------------------------------------------------------------------------------
-- illuminate-----------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------

require('illuminate').configure {
  filetypes_denylist = {
    'TelescopePrompt'
  }
}

------------------------------------------------------------------------------------------------------------------------------------
-- telescope -----------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------

require('telescope').setup {
  defaults = {
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case',
      '--trim'
    },
    sorting_strategy = "ascending",
    layout_strategy = "horizontal",
    layout_config = {
      horizontal = {
        prompt_position = "top",
        preview_width = 0.55,
        results_width = 0.8,
      },
      vertical = {
        mirror = false,
      },
      width = 0.87,
      height = 0.80,
      preview_cutoff = 120,
    },
    mappings = {
      n = {
        ['<c-x>'] = require('telescope.actions').delete_buffer
      },
      i = {
        ['<esc>'] = require('telescope.actions').close,
        ["<c-h>"] = "which_key",
        ['<c-x>'] = require('telescope.actions').delete_buffer
      }
    }
  },
  pickers = {
    find_files = {
      find_command = { 'fd', '--type', 'f', '--strip-cwd-prefix' }
    }
  }
}
require('telescope').load_extension('fzy_native')
require('telescope').load_extension('live_grep_args')

------------------------------------------------------------------------------------------------------------------------------------
-- neogit --------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------

require('neogit').setup {
  integrations = {
    diffview = true
  }
}

------------------------------------------------------------------------------------------------------------------------------------
-- fidget --------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------

require('fidget').setup {
  window = {
    blend = 0
  }
}

------------------------------------------------------------------------------------------------------------------------------------
-- neotest -------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------

require('neotest').setup {
  discovery = {
    enabled = false
  },
  adapters = {
    require('neotest-rspec'),
    require('neotest-jest')
  },
  diagnostic = {
    enabled = false
  }
}

------------------------------------------------------------------------------------------------------------------------------------
-- diffview ------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------

function DiffviewToggle()
  local lib = require('diffview.lib')
  local view = lib.get_current_view()
  if view then
    -- Current tabpage is a Diffview; close it
    vim.cmd(':DiffviewClose')
  else
    vim.cmd(':DiffviewOpen')
  end
end

wk.register({
  ['<leader>g'] = {
    ['d'] = { DiffviewToggle, 'diff' }
  }
})

local actions = require('diffview.actions')

require('diffview').setup {
  enhanced_diff_hl = true,
  keymaps = {
    view = {
      ['gf'] = actions.goto_file_edit,
      ['s'] = actions.toggle_stage_entry
    },
    file_panel = {
      ['gf'] = actions.goto_file_edit,
      ['s'] = actions.toggle_stage_entry
    }
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
      },
      ['<leader>h'] = {
        name = 'hunk',
        s = { ':Gitsigns stage_hunk<CR>', 'stage hunk' },
        r = { ':Gitsigns reset_hunk<CR>', 'reset hunk' },
        u = { gs.undo_stage_hunk, 'undo stage hunk' },
        p = { gs.preview_hunk, 'preview hunk' },
      },
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
-- treesitter ----------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------

require('nvim-treesitter.configs').setup {
  highlight             = {
    enable = true
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
    lsp_interop = {
      enable = true,
      border = 'single',
      peek_definition_code = {
        ['<leader>df'] = '@function.outer',
        ['<leader>dF'] = '@class.outer'
      }
    }
  },
  playground            = {
    enable = true
  }
}

------------------------------------------------------------------------------------------------------------------------------------
-- heirline ------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------

local conditions = require("heirline.conditions")
local utils = require("heirline.utils")

local components = {}

components.space = { provider = ' ' }

components.file_type = {
  condition = function()
    return not conditions.buffer_matches({ filetype = { 'TelescopePrompt' }, buftype = { 'terminal' } })
  end,
  provider = function()
    return ' ' .. vim.bo.filetype .. ' '
  end,
  hl = function()
    local highlight = utils.get_highlight('@text')
    return { fg = highlight.fg }
  end
}

components.file_icon = {
  init = function(self)
    local filename = vim.api.nvim_buf_get_name(0)
    local extension = vim.fn.fnamemodify(filename, ":e")
    self.icon, self.icon_color = require("nvim-web-devicons").get_icon_color(filename, extension)
  end,
  provider = function(self)
    return self.icon and (' ' .. self.icon)
  end,
  hl = function(self)
    return { fg = self.icon_color }
  end
}

components.lsp_active = {
  condition = conditions.lsp_attached,
  provider = function()
    local names = {}
    for i, server in pairs(vim.lsp.buf_get_clients(0)) do
      table.insert(names, server.name)
    end
    return "%( [" .. table.concat(names, " ") .. "]%)"
  end,
  hl = function()
    local highlight = utils.get_highlight('@text')
    return { fg = highlight.fg }
  end
}

components.git = {
  condition = conditions.is_git_repo,
  init = function(self)
    self.status_dict = vim.b.gitsigns_status_dict
    self.has_changes = self.status_dict.added ~= 0 or self.status_dict.removed ~= 0 or self.status_dict.changed ~= 0
  end,
  { -- git branch name
    provider = function(self)
      return " " .. self.status_dict.head
    end,
    hl = function()
      local highlight = utils.get_highlight('@constant')
      return { fg = highlight.fg }
    end,
  },
  {
    provider = function(self)
      local count = self.status_dict.added or 0
      return count > 0 and (" +" .. count)
    end,
    hl = function()
      local highlight = utils.get_highlight('@string')
      return { fg = highlight.fg }
    end,
  },
  {
    provider = function(self)
      local count = self.status_dict.removed or 0
      return count > 0 and (" -" .. count)
    end,
    hl = function()
      local highlight = utils.get_highlight('@variable.builtin')
      return { fg = highlight.fg }
    end,
  },
  {
    provider = function(self)
      local count = self.status_dict.changed or 0
      return count > 0 and (" ~" .. count)
    end,
    hl = function()
      local highlight = utils.get_highlight('@type')
      return { fg = highlight.fg }
    end,
  }
}

components.treesitter = {
  hl = '@string',
  provider = function()
    local ts_avail, ts = pcall(require, 'nvim-treesitter.parsers')

    if not (ts_avail and ts.has_parser()) then
      return
    else
      local buf = vim.api.nvim_get_current_buf()
      if require('vim.treesitter.highlighter').active[buf] then
        return " "
      end
    end
  end
}

components.search_results = {
  condition = function(self)
    local lines = vim.api.nvim_buf_line_count(0)
    if lines > 50000 then return end

    local query = vim.fn.getreg("/")
    if query == "" then return end

    if query:find("@") then return end

    local search_count = vim.fn.searchcount({ recompute = 1, maxcount = -1 })
    local active = false
    if vim.v.hlsearch and vim.v.hlsearch == 1 and search_count.total > 0 then
      active = true
    end
    if not active then return end

    query = query:gsub([[^\V]], "")
    query = query:gsub([[\<]], ""):gsub([[\>]], "")

    self.query = query
    self.count = search_count
    return true
  end,
  {
    provider = function(self)
      return table.concat({
        ' ', self.query, ' ', self.count.current, '/', self.count.total, ' '
      })
    end,
    hl = function()
      local highlight = utils.get_highlight('@function')
      return { bg = highlight.fg, fg = dark_bg }
    end
  },
}

local statusline = {
  hl = { bg = dark_bg },
  {
    components.git,
    components.space,
    components.search_results
  },
  {
    provider = '%=',
    {
      components.lsp_active,
      components.treesitter,
      components.file_icon,
      components.file_type
    }
  },
}

local winbar = {
  {
    fallthrough = false,
    {
      condition = function()
        return conditions.buffer_matches({
          buftype = { 'nofile', 'prompt', 'help', 'quickfix' },
          filetype = {}
        })
      end,
      init = function()
        vim.opt_local.winbar = nil
      end
    },
    {
      init = function(self)
        self.filename = vim.api.nvim_buf_get_name(0)
      end,
      provider = '%=',
      {
        hl = function()
          if vim.bo.modified then
            local highlight = utils.get_highlight('@text.warning')
            return { fg = highlight.fg, bg = highlight.bg, force = true }
          end
        end,
        {
          {
            init = function(self)
              local filename = self.filename
              local extension = vim.fn.fnamemodify(filename, ":e")
              self.icon, self.icon_color = require("nvim-web-devicons").get_icon_color(filename, extension,
                { default = true })
            end,
            provider = function(self)
              return self.icon and (' ' .. self.icon .. ' ')
            end,
            hl = function(self)
              return { fg = self.icon_color }
            end
          },
          {
            provider = function(self)
              -- first, trim the pattern relative to the current directory. For other
              -- options, see :h filename-modifers
              local filename = vim.fn.fnamemodify(self.filename, ":.")
              if filename == "" then return "[No Name]" end
              -- now, if the filename would occupy more than 1/4th of the available
              -- space, we trim the file path to its initials
              -- See Flexible Components section below for dynamic truncation
              if not conditions.width_percent_below(#filename, 0.25) then
                filename = vim.fn.pathshorten(filename)
              end
              return filename .. ' '
            end,
            hl = function()
              return { fg = utils.get_highlight('Directory').fg }
            end
          },
        }

      }
    }
  }
}

require('heirline').setup(statusline, winbar)

------------------------------------------------------------------------------------------------------------------------------------
-- lsp -----------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------

vim.diagnostic.config({
  virtual_text = false,
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

local on_attach = function(client, bufnr)
  local opts = { buffer = bufnr }

  wk.register({
    ['gd'] = { ':Telescope lsp_definitions<cr>', 'definition' },
    ['gr'] = { ':Telescope lsp_references<cr>', 'references' },
    K = { vim.lsp.buf.hover, 'hover' },
    ['<leader>rn'] = { vim.lsp.buf.rename, 'rename' },
    ['<leader>so'] = { ':Telescope lsp_document_symbols<cr>', 'document symbols' },
    ['<leader>l'] = { name = 'lsp', f = { function() vim.lsp.buf.format({ async = true }) end, 'format' } }
  }, opts)
end

-- nvim-cmp supports additional completion capabilities
local capabilities = require('cmp_nvim_lsp').default_capabilities()

local lspconfig = require 'lspconfig'
lspconfig.solargraph.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { '/Users/ryancobb/.asdf/shims/solargraph', 'stdio' }
}

------------------------------------------------------------------------------------------------------------------------------------
-- mason ---------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------

require('mason').setup()
require('mason-lspconfig').setup()
require('mason-lspconfig').setup_handlers {
  function(server_name)
    lspconfig[server_name].setup {
      on_attach = on_attach,
      capabilities = capabilities
    }
  end
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
    ['<tab>'] = down,
    ['<s-tab>'] = up,
  }),
  sources = {
    { name = 'luasnip' },
    { name = 'nvim_lsp' },
    { name = 'buffer' },
    { name = 'path' },
    { name = 'nvim_lsp_signature_help' },
  },
  window = {
    completion = cmp.config.window.bordered({}),
    documentation = cmp.config.window.bordered({})
  }
}

cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'buffer' }
  })
})

cmp.setup.cmdline({ '/', '?' }, {
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
      filetype = { 'neo-tree', 'neo-tree-popup', 'notify', 'quickfix' },
      buftype = { 'nofile' }
    }
  }
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
      ['<cr>'] = 'open_with_window_picker',
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
