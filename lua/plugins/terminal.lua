-- Toggle Terminal
return {
  'akinsho/toggleterm.nvim',
  -- config = true,
  keys = {
    { "<C-\\>", "<cmd>ToggleTerm<cr>", desc = "Toggle Terminal", mode = "n" },
    { "<C-\\>", "<cmd>ToggleTerm<cr>", desc = "Toggle Terminal", mode = "t" },
  },
  opts = {
    -- shade_terminals = true,
    direction = "horizontal",
    size = 15,
    float_opts = {
      border = "curved",
    },
    shell = 'powershell'
  },
}
