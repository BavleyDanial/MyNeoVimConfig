require("pavlydev")

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = 'yes'

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.mouse = 'a'
vim.opt.showmode = false
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.updatetime = 250

vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '.', nbsp = '␣' }
vim.opt.inccommand = 'split'
vim.opt.cursorline = true
vim.opt.scrolloff = 10

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.termguicolors = true
vim.opt.colorcolumn = "80"

vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

vim.api.nvim_create_autocmd('TextYankPost', {
	desc = 'Highlight when yanking (copying) text',
	group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})
