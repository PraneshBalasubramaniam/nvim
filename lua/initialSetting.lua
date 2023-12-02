-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
local g = vim.g
g.mapleader = ' '        -- sets leader key
g.maplocalleader = ' '
g.netrw_banner = 0       -- gets rid of the annoying banner for netrw
g.netrw_browse_split = 4 -- open in prior window
g.netrw_altv = 1         -- change from left splitting to right splitting
g.netrw_liststyle = 3    -- tree style view in netrw


-- To accept powershell as executable instead of pwsh
-- vim.o.shell = "C:\\Windows\\System32\\WindowsPowerShell\v1.0\\powershell.exe"
-- vim.o.shell = "powershell"
-- vim.o.shell = vim.fn.executable('pwsh') and 'pwsh' or 'powershell.exe'
-- vim.o.shell = "PowerShell.exe"
-- vim.o.shellcmdflag = "-command"
-- vim.o.shellquote = "\""
-- vim.o.shellxquote = ""
