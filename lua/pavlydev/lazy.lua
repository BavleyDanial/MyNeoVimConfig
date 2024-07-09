-- Bootstraptelescope lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require("lazy").setup({
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			vim.cmd.colorscheme "catppuccin"
		end
	},

    { import = "pavlydev/telescope" 	},
	{ import = "pavlydev/treesitter"	},
	{ import = "pavlydev/harpoon"		},
	{ import = "pavlydev/undotree"		},
	{ import = "pavlydev/fugitive"		},
	{ import = "pavlydev/comment"		},
	{ import = "pavlydev/which-key"		},
	
	-- LSP config
	{
		'neovim/nvim-lspconfig',
		dependencies = {
			-- Automatically install LSPs and related tools to stdpath for Neovim
			{ 'williamboman/mason.nvim', config = true }, -- NOTE: Must be loaded before dependants
			'williamboman/mason-lspconfig.nvim',
			'WhoIsSethDaniel/mason-tool-installer.nvim',

			-- Useful status updates for LSP.
			-- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
			{ 'j-hui/fidget.nvim', opts = {} },

			-- `neodev` configures Lua LSP for your Neovim config, runtime and plugins
			-- used for completion, annotations and signatures of Neovim apis
			{ 'folke/neodev.nvim', opts = {} },
    	}
	},
	{ -- Autocompletion
		'hrsh7th/nvim-cmp',
		'L3MON4D3/LuaSnip',
		{
			dependencies = {
			-- Snippet Engine & its associated nvim-cmp source
				build = (function()
				-- Build Step is needed for regex support in snippets.
				-- This step is not supported in many windows environments.
				-- Remove the below condition to re-enable on windows.
					return 'make install_jsregexp'
				end)(),
		},
		'saadparwaiz1/cmp_luasnip',
		-- Adds other completion capabilities.
		--  nvim-cmp does not ship with all sources by default. They are split
		--  into multiple repos for maintenance purposes.
		'hrsh7th/cmp-nvim-lsp',
		'hrsh7th/cmp-path',
		},
	}
})
