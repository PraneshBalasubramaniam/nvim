-- vim.o -> vimscript api ( global api - can use if want to enable globally )
-- vim.opt -> lua api ( more fine-grained control and manipulation - can use if want to enable programatically )

-- sometimes vim.opt is global and
-- vim.wo is fine-grained





-- vim.cmd('filetype plugin on')                        -- set filetype
-- vim.cmd('set wildmenu')                              -- enable wildmenu


--vim.cmd("let g:netrw_list_hide=netrw_gitignore#Hide()")
vim.opt.title = true   -- show title
vim.cmd 'set path+=**' -- search current directory recursively
vim.opt.syntax = "ON"
vim.opt.backup = false
vim.opt.compatible = false -- turn off vi compatibility mode
vim.opt.number = true      -- turn on line numbers ( global )
-- vim.opt.relativenumber = true -- turn on relative line numbers
-- vim.o.mouse = 'a'				   -- enable the mouse in all modes
-- vim.opt.mouse = 'a'				 -- enable the mouse in all modes
vim.opt.mousemodel = 'extend' -- change right click to visual mode rather than to show popup
-- vim.opt.ignorecase = true      -- enable case insensitive searching
-- vim.opt.smartcase = true       -- all searches are case insensitive unless there's a capital letter
-- vim.opt.hlsearch = false       -- disable all highlighted search results
vim.opt.incsearch = true       -- enable incremental searching
vim.opt.wrap = true            -- enable text wrapping
vim.opt.tabstop = 4            -- tabs=4spaces
vim.opt.shiftwidth = 4
vim.opt.fileencoding = "utf-8" -- encoding set to utf-8
vim.opt.pumheight = 10         -- number of items in popup menu
-- vim.opt.showtabline = 2        -- always show the tab line
vim.opt.laststatus = 1         -- always show statusline
vim.opt.signcolumn = "auto"
vim.opt.expandtab = false      -- expand tab
vim.opt.smartindent = true
vim.opt.showcmd = true
vim.opt.cmdheight = 1
vim.opt.showmode = true
vim.opt.scrolloff = 10     -- scroll page when cursor is 8 lines from top/bottom
vim.opt.sidescrolloff = 10 -- scroll page when cursor is 8 spaces from left/right
vim.opt.guifont = "monospace:h17"
-- vim.opt.completeopt = { "menuone", "noselect" }
vim.opt.splitbelow = true    -- split go below
vim.opt.splitright = true    -- vertical split to the right
vim.opt.termguicolors = true -- terminal gui colors


-- from lazyvim config

-- Set highlight on search
vim.o.hlsearch = true

-- Make line numbers default
-- vim.wo.number = true ( fine-grained )
vim.o.relativenumber = true

-- Disable mouse mode
-- vim.o.mouse = ''

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = 'yes'

-- Set colorscheme
--vim.cmd [[colorscheme onedark]]
-- vim.cmd.colorscheme "catppuccin"

--vim.cmd()
vim.opt.clipboard = 'unnamedplus'

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- Concealer for Neorg
vim.o.conceallevel = 2


-- from stackoverflow

-- vim.o.modifiable = true -- ( 'set modifiable' -> vimscript ) ( check if works when error appears )
vim.cmd('set modifiable')
