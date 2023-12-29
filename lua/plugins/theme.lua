-- theme -> colorscheme

-- { "catppuccin/nvim",      name = "catppuccin" },   -- try using 'name' instead of 'as' to rename

-- {
--   -- Theme inspired by Atom
--   'catppuccin/nvim',
--   priority = 1000,
--   name = 'catppuccin',
--   config = function()
--     vim.cmd.colorscheme 'catppuccin'
--   end,
-- },

-- {
--   -- Theme inspired by Atom
--   'navarasu/onedark.nvim',
--   priority = 1000,
--   config = function()
--     vim.cmd.colorscheme 'onedark'
--   end,
-- }

return {
  -- Theme inspired by Atom
  'morhetz/gruvbox',
  priority = 1000,
  name = 'gruvbox',
  config = function()
    vim.cmd.colorscheme 'gruvbox'
  end,
}
