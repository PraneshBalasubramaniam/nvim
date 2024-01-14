-- Set lualine as statusline

local opts = {
  options = {
    icons_enabled = true,
    theme = 'gruvbox',
    component_separators = '|',
    section_separators = { left = '', right = '' },
    disabled_filetypes = { 'TelescopePrompt', 'dashboard' },
    globalstatus = true
  },
  sections = {
    lualine_a = {
      { 'branch', 'diff', 'diagnostics' },
    },
    lualine_b = {
      {
        'filename',
        file_status = true, -- display file status
        path = 1
      }
    },
    lualine_c = {},
    lualine_x = {},
    -- lualine_z = {
    --   { 'location', separator = { right = '' } },
    -- },
  },
}

-- See `:help lualine.txt`
return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = opts,
}
