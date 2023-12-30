-- NOTE: This is where your plugins related to LSP can be installed.
-- The configuration is done below. Search for lspconfig to find it below.
-- LSP Configuration & Plugins


return {
  'neovim/nvim-lspconfig',
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    -- Automatically install LSPs to stdpath for neovim
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',

    -- Useful status updates for LSP
    -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
    { 'j-hui/fidget.nvim', opts = {} },

    -- Additional lua configuration, makes nvim stuff amazing!
    -- setup for init.lua and plugin development with full signature help, docs and completion for the nvim lua API
    'folke/neodev.nvim',
  },

  config = function() require('plugins.lspconfig.config') end
}
