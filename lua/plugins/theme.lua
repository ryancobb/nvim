-- local nightfox = require('nightfox')
--
-- nightfox.setup {
--   styles = {
--     comments = 'italic',
--     keywords = 'bold',
--     functions = 'italic,bold'
--   },
--   inverse = {
--     match_paren = true
--   }
-- }
-- nightfox.load()

local catppuccin = require("catppuccin")

-- configure it
catppuccin.setup(
    {
		transparent_background = false,
		term_colors = false,
		styles = {
			comments = "italic",
			functions = "italic",
			keywords = "italic",
			strings = "NONE",
			variables = "NONE",
		},
		integrations = {
			treesitter = true,
			native_lsp = {
				enabled = true,
				virtual_text = {
					errors = "italic",
					hints = "italic",
					warnings = "italic",
					information = "italic",
				},
				underlines = {
					errors = "underline",
					hints = "underline",
					warnings = "underline",
					information = "underline",
				},
			},
			lsp_trouble = false,
			lsp_saga = false,
			gitgutter = true,
			gitsigns = true,
			telescope = true,
			nvimtree = {
				enabled = true,
				show_root = true,
			},
			which_key = false,
			indent_blankline = {
				enabled = true,
				colored_indent_levels = true,
			},
			dashboard = false,
			neogit = false,
			vim_sneak = false,
			fern = false,
			barbar = true,
			bufferline = false,
			markdown = false,
			lightspeed = false,
			ts_rainbow = false,
			hop = false,
		},
	}
)

vim.cmd[[colorscheme catppuccin]]
