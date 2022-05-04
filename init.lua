local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
end

pcall(require, 'impatient')

------------------------------------------------------------------------------------------------------------------------------------
-- options -------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------

vim.g.did_load_filetypes = 0
vim.g.do_filetype_lua = 1
vim.g.Illuminate_delay = 1000

vim.opt.autoread = true
vim.opt.clipboard = 'unnamedplus'
vim.opt.completeopt = 'menu,menuone,noselect'
vim.opt.cursorline = true
vim.opt.expandtab = true
vim.opt.hidden = true
vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.modeline = false
vim.opt.mouse = 'a'
vim.opt.number = true
vim.opt.numberwidth = 2
vim.opt.pumheight = 10
vim.opt.ruler = false
vim.opt.shiftwidth = 2
vim.opt.shortmess = 'IFa'
vim.opt.showcmd = false
vim.opt.showmatch = true
vim.opt.showmode = false
vim.opt.signcolumn = 'yes'
vim.opt.smartcase = true
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
  use 'nvim-lualine/lualine.nvim' -- Fancier statusline
  -- Add indentation guides even on blank lines
  use 'lukas-reineke/indent-blankline.nvim'
  -- Add git related info in the signs columns and popups
  use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' } }
  -- Highlight, edit, and navigate code using a fast incremental parsing library
  use 'nvim-treesitter/nvim-treesitter'
  -- Additional textobjects for treesitter
  use 'nvim-treesitter/nvim-treesitter-textobjects'
  use 'neovim/nvim-lspconfig' -- Collection of configurations for built-in LSP client
  use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'saadparwaiz1/cmp_luasnip'
  use 'L3MON4D3/LuaSnip' -- Snippets plugin
  use 'williamboman/nvim-lsp-installer'
  use 'kyazdani42/nvim-web-devicons'
  use 'famiu/bufdelete.nvim'
  use 'fladson/vim-kitty'
  use 'google/vim-jsonnet'
  use 'rebelot/kanagawa.nvim'
  use 'RRethy/nvim-treesitter-endwise'
  use 'lewis6991/impatient.nvim'
  use 'mrjones2014/smart-splits.nvim'
  use 'sindrets/diffview.nvim'
  use 'ray-x/lsp_signature.nvim'
  use 'simrat39/symbols-outline.nvim'
  use 'onsails/lspkind.nvim'
  use 'windwp/nvim-autopairs'
  use 'akinsho/toggleterm.nvim'
  use 'folke/which-key.nvim'
  use 'RRethy/vim-illuminate'
  use 'j-hui/fidget.nvim'
  use 'andymass/vim-matchup'
  use 'ibhagwan/fzf-lua'
  use 'kdheepak/lazygit.nvim'
  use {'nvim-neo-tree/neo-tree.nvim', branch = 'v2.x', requires = { 'nvim-lua/plenary.nvim', 'kyazdani42/nvim-web-devicons', 'MunifTanjim/nui.nvim' } }
end)

------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------

require('Comment').setup{}
require('which-key').setup{}
require('nvim-autopairs').setup{}
require('fidget').setup{}

------------------------------------------------------------------------------------------------------------------------------------
-- theme ---------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------

require('kanagawa').setup {
  dimInactive = true,
  overrides = {
    Boolean = { link = 'Special' },
  }
}

vim.cmd [[colorscheme kanagawa]]

------------------------------------------------------------------------------------------------------------------------------------
-- mappings ------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------

vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.keymap.set('n', '<leader><space>', function()
	require('fzf-lua').buffers({ fzf_opts = { ['--keep-right'] = '' } })
end)
vim.keymap.set('n', '<leader>?', function()
	require('fzf-lua').oldfiles({ fzf_opts = { ['--keep-right'] = '' } })
end)
vim.keymap.set('n', '<leader>f', require('fzf-lua').files)
vim.keymap.set('n', '<leader>st', require('fzf-lua').live_grep_glob)
vim.keymap.set('n', '<leader>sc', require('fzf-lua').grep_cword)
vim.keymap.set('n', '<leader>sr', require('fzf-lua').resume)
vim.keymap.set('n', '<leader>sa', function()
  require('fzf-lua').files({fzf_opts = { ['--query'] = vim.fn.expand('%:t:r'):gsub('_spec', '')}})
end)

vim.keymap.set('n', '<leader>c', function() require('bufdelete').bufdelete(0, true) end)
vim.keymap.set('n', '<leader>q', '<C-w>q')

vim.keymap.set('n', '<leader>yf', ':let @+=fnamemodify(expand("%"), ":~:.")<CR>', { silent = true }) -- yank file path
vim.keymap.set('n', '<leader>yl', ':let @+=fnamemodify(expand("%"), ":~:.") . ":" . line(".")<CR>', { silent = true}) -- yank path with line

vim.keymap.set('n', '<leader>e', ':Neotree<CR>', { silent = true })
vim.keymap.set('n', '<leader>r', ':Neotree reveal<CR>', { silent = true})

vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-l>', '<C-w>l')

vim.keymap.set('n', '<C-up>', require('smart-splits').resize_up)
vim.keymap.set('n', '<C-down>', require('smart-splits').resize_down)
vim.keymap.set('n', '<C-left>', require('smart-splits').resize_left)
vim.keymap.set('n', '<C-right>', require('smart-splits').resize_right)

vim.keymap.set('n', '<Esc>', '<cmd> :noh <cr>', { silent = true })

vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)

vim.keymap.set('v', '<s-j>', ":m'>+<CR>gv=gv")
vim.keymap.set('v', '<s-k>', ":m-2<CR>gv=gv")

vim.keymap.set('t', '<c-h>', '<c-\\><c-n><c-w>h')
vim.keymap.set('t', '<c-j>', '<c-\\><c-n><c-w>j')
vim.keymap.set('t', '<c-k>', '<c-\\><c-n><c-w>k')
vim.keymap.set('t', '<c-l>', '<c-\\><c-n><c-w>l')
vim.keymap.set('t', '<c-n>', '<c-\\><c-n>')

------------------------------------------------------------------------------------------------------------------------------------
-- autocmds ------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------

-- Highlight on yank
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'gitcommit', 'gitrebase', 'gitconfig'},
  command = 'set bufhidden=delete'
})

------------------------------------------------------------------------------------------------------------------------------------
-- toggleterm ----------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------

vim.g.terminal_direction='horizontal'

vim.keymap.set('n', '<c-\\>', '<cmd>exe v:count . "ToggleTerm direction=" . g:terminal_direction<CR>')
vim.keymap.set('n', '<leader>tv', function() vim.g.terminal_direction='vertical' end)
vim.keymap.set('n', '<leader>th', function() vim.g.terminal_direction='horizontal' end)
vim.keymap.set('n', '<leader>tf', function() vim.g.terminal_direction='float' end)

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
  shade_filetypes = {},
  shade_terminals = false,
  shading_factor = 0.5,
  start_in_insert = false,
  insert_mappings = true, -- whether or not the open mapping applies in insert mode
  persist_size = true,
  direction = vim.g.terminal_direction,
  close_on_exit = false, -- close the terminal window when the process exits
  float_opts = {
    border = 'curved'
  }
}

------------------------------------------------------------------------------------------------------------------------------------
-- lualine -------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------

local function diff_source()
  local gitsigns = vim.b.gitsigns_status_dict
  if gitsigns then
    return {
      added = gitsigns.added,
      modified = gitsigns.changed,
      removed = gitsigns.removed
    }
  end
end

local function lsp_client_names()
	local client_names = {}
	for _, client in ipairs(vim.lsp.get_active_clients()) do
		table.insert(client_names, client.name)
	end
	return table.concat(client_names, ",")
end

local treesitter = {
  function()
    local b = vim.api.nvim_get_current_buf()
    if next(vim.treesitter.highlighter.active[b]) then
      return ""
    end
    return ""
  end,
  color = { fg = '#76946A' }
}

local filename = {
  'filename',
  file_status = true,
  path = 1,
  icons_enabled = true,
}

require('lualine').setup {
  options = {
    component_separators = '|',
    section_separators = '',
    disabled_filetypes = { 'neo-tree', 'DiffviewFiles' }
  },
  sections = {
    lualine_a = {
      { function() return ' ' end, padding = { left = 0, right = 0} },
    },
    lualine_b = {
      {'b:gitsigns_head', icon = ''},
    },
    lualine_c = {
      filename,
      { 'diff', source = diff_source },
    },
    lualine_x = {
      lsp_client_names,
      treesitter,
      'filetype'
    },
    lualine_y = {},
    lualine_z = {
      {
        function() return ' ' end,
        padding = { left = 0, right = 0}
      }
    },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { filename },
    lualine_x = {},
    lualine_y = {},
    lualine_z = {}
  },
  extensions = { 'toggleterm' }
}

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

require('gitsigns').setup{
  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns

    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    -- Navigation
    map('n', ']c', function()
      if vim.wo.diff then return ']c' end
      vim.schedule(function() gs.next_hunk() end)
      return '<Ignore>'
    end, {expr=true})

    map('n', '[c', function()
      if vim.wo.diff then return '[c' end
      vim.schedule(function() gs.prev_hunk() end)
      return '<Ignore>'
    end, {expr=true})

    -- Actions
    map({'n', 'v'}, '<leader>hs', ':Gitsigns stage_hunk<CR>')
    map({'n', 'v'}, '<leader>hr', ':Gitsigns reset_hunk<CR>')
    map('n', '<leader>hS', gs.stage_buffer)
    map('n', '<leader>hu', gs.undo_stage_hunk)
    map('n', '<leader>hR', gs.reset_buffer)
    map('n', '<leader>hp', gs.preview_hunk)
    map('n', '<leader>hb', function() gs.blame_line{full=true} end)
    map('n', '<leader>tb', gs.toggle_current_line_blame)
    map('n', '<leader>hd', gs.diffthis)
    map('n', '<leader>hD', function() gs.diffthis('~') end)
    map('n', '<leader>td', gs.toggle_deleted)

    -- Text object
    map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
  end
}

------------------------------------------------------------------------------------------------------------------------------------
-- fzflua --------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------

require('fzf-lua').setup {
  keymap = {
    fzf = {
      ['tab'] = 'down',
      ['btab'] = 'up',
      ['J'] = 'down',
      ['K'] = 'up'
    }
  },
  winopts = {
    height = 0.90,
    width = 0.90,
    col = 0.50,
    preview = { default = 'bat_native' }
  },
  files = {
    fd_opts = "--color=never --type f --hidden --follow --no-ignore --exclude .git --exclude public --exclude node_modules --exclude tmp --exclude spec/fixtures/vcr_cassettes",
    git_icons = false
  },
  buffers = {
    winopts = {
      height = 0.15,
      width = 0.30,
    },
    previewer = false
  }
}


------------------------------------------------------------------------------------------------------------------------------------
-- treesitter ----------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------

require('nvim-treesitter.configs').setup {
  highlight = {
    enable = true, -- false will disable the whole extension
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = 'gnn',
      node_incremental = 'grn',
      scope_incremental = 'grc',
      node_decremental = 'grm',
    },
  },
  indent = {
    enable = true,
    disable = { 'ruby' }
  },
  matchup = {
    enable = true
  },
  endwise  = {
    enable = true
  },
  textobjects = {
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
    vim.fn.sign_define(hl, {text = icon, texthl = hl, numhl = hl})
end

require("nvim-lsp-installer").setup {}

local lspconfig = require 'lspconfig'
local on_attach = function(_, bufnr)
  local opts = { buffer = bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
  vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
  vim.api.nvim_create_user_command("Format", vim.lsp.buf.formatting, {})
	vim.keymap.set('n', '<leader>so', function()
		require('fzf-lua').lsp_document_symbols({fzf_cli_args='--with-nth=2..'})
	end, opts)

  require('lsp_signature').on_attach()
end

-- nvim-cmp supports additional completion capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

-- Enable the following language servers
-- local servers = { 'clangd', 'rust_analyzer', 'pyright', 'tsserver' }
-- for _, lsp in ipairs(servers) do
--   lspconfig[lsp].setup {
--     on_attach = on_attach,
--     capabilities = capabilities,
--   }
-- end

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, 'lua/?.lua')
table.insert(runtime_path, 'lua/?/init.lua')

lspconfig.sumneko_lua.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        -- Setup your lua path
        path = runtime_path,
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { 'vim' },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file('', true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}

lspconfig.solargraph.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { '/Users/ryancobb/.asdf/shims/solargraph', 'stdio' }
}

------------------------------------------------------------------------------------------------------------------------------------
-- cmp -----------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------

local cmp = require 'cmp'
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local lspkind = require('lspkind')
local luasnip = require 'luasnip'

cmp.event:on( 'confirm_done', cmp_autopairs.on_confirm_done({  map_char = { tex = '' } }))

cmp.setup {
  formatting = {
    format = lspkind.cmp_format({
      mode = 'symbol',
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
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  }),
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'path' },
    { name = 'buffer' }
  },
}

cmp.setup.cmdline('/', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'buffer'}
  })
})

cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources(
    {{ name = 'path' }},
    {{ name = 'cmdline' }}
  )
})

------------------------------------------------------------------------------------------------------------------------------------
-- neotree -------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------

require('neo-tree').setup {
  enable_diagnostics = false,
  filesystem = { filtered_items = { visible = true } }
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

vim.schedule(function()
   vim.opt.shadafile = vim.fn.expand "$HOME" .. "/.local/share/nvim/shada/main.shada"
   vim.cmd [[ silent! rsh ]]
end)
