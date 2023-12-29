-- harpoon
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

local function set(left, right, desc)
  vim.keymap.set("n", left, right, { desc = desc })
end

set("<leader>ha", mark.add_file, 'add')              -- add to harpoon
set("<leader>hs", ui.toggle_quick_menu, 'show list') -- show harpoon list
set("<leader>hj", ui.nav_next, 'next file')          -- navigate to next file
