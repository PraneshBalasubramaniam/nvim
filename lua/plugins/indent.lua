-- indent guides for Neovim
-- {
--   "lukas-reineke/indent-blankline.nvim",
--   event = "",
--   opts = {
--     indent = {
--       char = "│",
--       tab_char = "│",
--     },
--     scope = { enabled = false },
--     exclude = {
--       filetypes = {
--         "help",
--         "alpha",
--         "dashboard",
--         "neo-tree",
--         "Trouble",
--         "trouble",
--         "lazy",
--         "mason",
--         "notify",
--         "toggleterm",
--         "lazyterm",
--       },
--     },
--   },
--   main = "ibl",
-- },


return {
  -- Add indentation guides even on blank lines
  'lukas-reineke/indent-blankline.nvim',
  -- Enable `lukas-reineke/indent-blankline.nvim`
  -- See `:help ibl`
  main = 'ibl',
  opts = {},
  event = 'BufReadPre',
}
