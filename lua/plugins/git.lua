-- Git related plugins

local function on_attach(bufnr)
  vim.keymap.set('n', '<leader>hp', require('gitsigns').preview_hunk, { buffer = bufnr, desc = 'Preview git hunk' })

  -- don't override the built-in and fugitive keymaps
  local function setv(left, scheduleFunc, desc)
    vim.keymap.set({ 'n', 'v' }, left, function()
      if vim.wo.diff then return left end
      vim.schedule(function() scheduleFunc() end)
      return '<Ignore>'
    end, { expr = true, buffer = bufnr, desc = desc })
  end

  local gs = package.loaded.gitsigns
  setv(']c', gs.next_hunk, 'Jump to next hunk')
  setv('[c', gs.prev_hunk, 'Jump to previous hunk')
end

-- See `:help gitsigns.txt`
local opts = {
  signs = {
    add = { text = '+' },
    change = { text = '~' },
    delete = { text = '_' },
    topdelete = { text = '‾' },
    changedelete = { text = '~' },
  },
  on_attach = on_attach,
}

return {
  'tpope/vim-fugitive', -- git
  -- 'tpope/vim-rhubarb',  -- github

  -- Adds git related signs to the gutter, as well as utilities for managing changes
  {
    'lewis6991/gitsigns.nvim',
    opts = opts,
  }
}
