-- Highlight, edit, and navigate code

return {
  'nvim-treesitter/nvim-treesitter',
  dependencies = {
    'nvim-treesitter/nvim-treesitter-textobjects',
    -- init = function()
    --   -- disable rtp plugin, as we only need its queries for mini.ai
    --   -- In case other textobject modules are enabled, we will load them
    --   -- once nvim-treesitter is loaded
    --   require("lazy.core.loader").disable_rtp_plugin("nvim-treesitter-textobjects")
    -- end,
  },
  cmd = { "TSUpdateSync" },
  build = ':TSUpdate',
  event = { "BufReadPost", "BufNewFile" },
  config = function() require('plugins.treesitter.config') end
}
