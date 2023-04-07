-----------------------------------------------------------
-- Color schemes configuration file
-----------------------------------------------------------

-- See: https://github.com/brainfucksec/neovim-lua#appearance

-- Load nvim color scheme:
-- Change the "require" values with your color scheme
-- Available color schemes: onedark, monokai, rose-pine
-- local status_ok, color_scheme = pcall(require, 'everforest')
-- if not status_ok then
-- return
-- end

-- Note: The instruction to load the color scheme may vary.
-- See the README of the selected color scheme for the instruction
-- to use.
-- e.g.: require('color_scheme').setup{}, vim.cmd('color_scheme')

-- OneDark styles: dark, darker, cool, deep, warm, warmer, light
--
-- require('everforest').setup{}

-- For dark version.
vim.g.background = "dark"

--  Set contrast.
--  This configuration option should be placed before `colorscheme everforest`.
--  Available values: 'hard', 'medium'(default), 'soft'
vim.g.everforest_background = "hard"

-- For better performance
vim.g.everforest_better_performance = 1

-- Available values:   `'auto'`, `'red'`, `'orange'`, `'yellow'`, `'green'`, `'aqua'`, `'blue'`, `'purple'`
vim.g.everforest_cursor = "auto"

vim.g.everforest_ui_contrast = "low"

vim.cmd([[colorscheme everforest]])
