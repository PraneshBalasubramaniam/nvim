return {
  'catppuccin/nvim',
  priority = 1000,
  name = 'catppuccin', -- try using 'name' instead of 'as' to rename
  config = function()
    vim.cmd.colorscheme 'catppuccin'
  end,
}

-- {
--   -- Theme inspired by Atom
--   'navarasu/onedark.nvim',
--   priority = 1000,
--   config = function()
--     vim.cmd.colorscheme 'onedark'
--   end,
-- }

-- return {
--   'morhetz/gruvbox',
--   priority = 1000,
--   name = 'gruvbox',
--   config = function()
--     vim.cmd.colorscheme 'gruvbox'
--   end,
-- }
