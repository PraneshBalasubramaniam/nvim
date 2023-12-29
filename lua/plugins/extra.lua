return {
  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',

  -- remember last cursor position
  'farmergreg/vim-lastplace',

  -- Session management. This saves your session in the background,
  -- keeping track of open buffers, window arrangement, and more.
  -- You can restore sessions when returning through the dashboard.
  {
    'folke/persistence.nvim',
    event = 'BufReadPre',
    opts = { options = vim.opt.sessionoptions:get() },
  },
}
