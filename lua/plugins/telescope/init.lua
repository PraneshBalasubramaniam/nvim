-- Fuzzy Finder (files, lsp, etc)

-- [[ Configure Telescope ]]
-- See `:help telescope` and `:help telescope.setup()`

local opts = {
  defaults = {
    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
      },
    },
    prompt_prefix = '',
    --[[  path_display = { truncate = 3 }, ]]
    file_ignore_patterns = { "^node_modules/" },
    preview = { treesitter = true },
    wrap_results = true
  },
}

return {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    -- Fuzzy Finder Algorithm which requires local dependencies to be built.
    -- Only load if `make` is available. Make sure you have the system
    -- requirements installed.
    -- {
    --   'nvim-telescope/telescope-fzf-native.nvim',
    --   -- NOTE: If you are having trouble with this installation,
    --   --       refer to the README for telescope-fzf-native for more instructions.
    --   build = 'make',
    --   cond = function()
    --     return vim.fn.executable 'make' == 1
    --   end,
    -- },
  },
  opts = opts,
  config = function() require('plugins.telescope.config') end
}
