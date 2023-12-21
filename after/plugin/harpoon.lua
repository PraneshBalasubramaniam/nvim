-- harpoon
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

-- add to harpoon
vim.keymap.set("n", "<leader>ha", mark.add_file, { desc = 'add' })

-- show harpoon list
vim.keymap.set("n", "<leader>hs", ui.toggle_quick_menu, { desc = 'show list' })

-- navigate to next file
vim.keymap.set("n", "<leader>hj", ui.nav_next, { desc = 'next file' })
