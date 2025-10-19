-- Set <space> as the leader key.
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Disable netrw in favor of nvim-tree.
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Enable 24-bit RGB color support.
vim.opt.termguicolors = true

-- Print the line number in front of each line.
vim.opt.number = true

-- Enable mouse support in all modes.
vim.opt.mouse = 'a'

-- Split new window to the right/bottom of the current window.
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Highlight the text line of the cursor.
vim.opt.cursorline = true

-- Avoid wrapping lines longer than the width of the window.
vim.opt.wrap = false


-- Reduce time (in milliseconds) to wait for a mapped key sequence to complete.
-- This has been reduced primarily so that the which-key popup shows sooner.
vim.o.timeout = true
vim.opt.timeoutlen = 500

-- Insert spaces in place of tabs.
vim.opt.expandtab = true

-- Set number of spaces to use for each step of (auto)indent.
vim.opt.shiftwidth = 2

-- Set number of spaces that a tab counts for.
vim.opt.tabstop = 2
