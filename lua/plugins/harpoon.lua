-- keep list of editing files

local config = function()
  local mark = require("harpoon.mark")
  local ui = require("harpoon.ui")

  local function set(left, right, desc)
    vim.keymap.set("n", '<leader>h' .. left, right, { desc = desc })
  end

  set("a", mark.add_file, 'add')              -- add to harpoon
  set("s", ui.toggle_quick_menu, 'show list') -- show harpoon list
  set("j", ui.nav_next, 'next file')          -- navigate to next file
end

return {
  'ThePrimeagen/harpoon',
  -- branch = 'harpoon2',
  -- dependencies = 'nvim-lua/plenary.nvim'
  config = config
}
