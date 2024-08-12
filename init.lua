-- Bootstrap lazy.nvim if it's not already installed
local install_path = vim.fn.stdpath('data')..'/site/pack/lazy/start/lazy.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.execute('!git clone https://github.com/folke/lazy.nvim.git ' .. install_path)
end

-- Ensure lazy.nvim is loaded
vim.cmd [[packadd lazy.nvim]]
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true
vim.g.mapleader = ","
-- Yank to clipboard
vim.keymap.set('v', '<leader>y', '"+y', { silent = true })
vim.keymap.set('n', '<leader>Y', '"+yg_', { silent = true })
vim.keymap.set('n', '<leader>y', '"+y', { silent = true })
vim.keymap.set('n', '<leader>yy', '"+yy', { silent = true })

-- Paste from clipboard
vim.keymap.set('n', '<leader>p', '"+p', { silent = true })
vim.keymap.set('n', '<leader>P', '"+P', { silent = true })
vim.keymap.set('v', '<leader>p', '"+p', { silent = true })
vim.keymap.set('v', '<leader>P', '"+P', { silent = true })


-- Terminal mode mappings
vim.api.nvim_set_keymap('n', '<C-`>', ':botright 20split | terminal<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', '<C-h>', [[<C-\><C-N><C-w>h]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', '<C-j>', [[<C-\><C-N><C-w>j]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', '<C-k>', [[<C-\><C-N><C-w>k]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', '<C-l>', [[<C-\><C-N><C-w>l]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', '<Esc>', [[<C-\><C-n>]], { noremap = true, silent = true })


-- Insert mode mappings
vim.api.nvim_set_keymap('i', '<C-h>', [[<C-\><C-N><C-w>h]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<C-j>', [[<C-\><C-N><C-w>j]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<C-k>', [[<C-\><C-N><C-w>k]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<C-l>', [[<C-\><C-N><C-w>l]], { noremap = true, silent = true })

-- Normal mode mappings
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', { noremap = true, silent = true })

--Close Terminal
vim.api.nvim_set_keymap('n', '<C-~>', '[[<C-l><C-j><C-w>c]]', { noremap = true, silent = true })

-- empty setup using defaults
-- Setup plugins using lazy.nvim
require('lazy').setup({
        {
        'catppuccin/nvim',  -- Catppuccin theme plugin
        as = 'catppuccin',
        lazy = false,
        },
	{
	  "nvim-tree/nvim-tree.lua",
	  version = "*",
	  lazy = false,
	  dependencies = {
	    "nvim-tree/nvim-web-devicons",
	  },
	  config = function()
	    require("nvim-tree").setup {}
	  end,
	},
	{
	'nvim-telescope/telescope.nvim', tag = '0.1.8',
	-- or                              , branch = '0.1.x',
	dependencies = { 'nvim-lua/plenary.nvim' },
	},
	{
	  'MunifTanjim/nui.nvim',
	},
	{
	    "nvim-treesitter/nvim-treesitter",
	    build = ":TSUpdate",
	    config = function () 
	      local configs = require("nvim-treesitter.configs")

	      configs.setup({
		  ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "elixir", "heex", "javascript", "html" },
		  sync_install = false,
		  highlight = { enable = true },
		  indent = { enable = true },  
		})
	     end
	},
	{
    "kawre/leetcode.nvim",
    build = ":TSUpdate html",
    dependencies = {
        "nvim-telescope/telescope.nvim",
        "nvim-lua/plenary.nvim", -- required by telescope
        "MunifTanjim/nui.nvim",

        -- optional
        "nvim-treesitter/nvim-treesitter",
        "rcarriga/nvim-notify",
        "nvim-tree/nvim-web-devicons",
    },
		 opts = {
        -- configuration goes here
		 },
	},  
	{
	"zbirenbaum/copilot.lua",
	config = function()
	require("copilot").setup {}
	end,
	},
	    -- You can add more plugins here
	{
  "zbirenbaum/copilot-cmp",
  config = function ()
    require("copilot_cmp").setup()
  end
	},
	'hrsh7th/nvim-cmp',

})
local telescope = require('telescope.builtin')
vim.cmd.colorscheme "catppuccin"

--Telescope Shortcuts
vim.keymap.set('n', '<leader>ff', telescope.find_files, {})
vim.keymap.set('n', '<leader>fg', telescope.live_grep, {})
vim.keymap.set('n', '<leader>fb', telescope.buffers, {})
vim.keymap.set('n', '<leader>fh', telescope.help_tags, {})


