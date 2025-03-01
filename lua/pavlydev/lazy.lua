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

    { import = "pavlydev/telescope"     },
    { import = "pavlydev/treesitter"    },
    { import = "pavlydev/harpoon"       },
    { import = "pavlydev/undotree"      },
    { import = "pavlydev/fugitive"      },
    { import = "pavlydev/comment"       },
    { import = "pavlydev/which-key"     },
    { import = "pavlydev/todo_comments" },
    { import = "pavlydev/lspconfig"     },
    { import = "pavlydev/dapconfig"     },
    { import = "pavlydev/status_bar"    },
    { "ThePrimeagen/vim-be-good"        },
    { -- Autocompletion
        'hrsh7th/nvim-cmp',
        'L3MON4D3/LuaSnip',
        {
            dependencies = {
                build = (function()
                    return 'make install_jsregexp'
                end)(),
            },
            'saadparwaiz1/cmp_luasnip',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-path',
        },
    }
})
