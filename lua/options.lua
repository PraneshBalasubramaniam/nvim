-- vim.o -> vimscript api ( global api - can use if want to enable globally )
-- vim.opt -> lua api ( more fine-grained control and manipulation - can use if want to enable programatically )

-- sometimes vim.opt is global and
-- vim.wo is fine-grained





-- vim.cmd('filetype plugin on')                        -- set filetype
-- vim.cmd('set wildmenu')                              -- enable wildmenu

local opt = vim.opt

-- show number before normal line column
opt.nu = true

--vim.cmd("let g:netrw_list_hide=netrw_gitignore#Hide()")
opt.title = true       -- show title
vim.cmd 'set path+=**' -- search current directory recursively
opt.syntax = "ON"
opt.backup = false
opt.compatible = false -- turn off vi compatibility mode
opt.number = true      -- turn on line numbers ( global )
-- opt.relativenumber = true -- turn on relative line numbers
-- vim.o.mouse = 'a'				   -- enable the mouse in all modes
-- opt.mouse = 'a'				 -- enable the mouse in all modes
opt.mousemodel = 'extend' -- change right click to visual mode rather than to show popup
opt.wrap = true           -- enable text wrapping
opt.tabstop = 4           -- tabs=4spaces
opt.shiftwidth = 4
opt.softtabstop = 4
opt.fileencoding = "utf-8" -- encoding set to utf-8
opt.pumheight = 12         -- number of items in popup menu

-- directory for swap files ( 👇 is a relative path starts in project folder )
-- opt.directory = 'swapfiles/'

-- opt.showtabline = 2        -- always show the tab line
-- opt.laststatus = 1 -- always show statusline

opt.signcolumn = "auto"
opt.expandtab = false -- expand tab
opt.smartindent = true
opt.showmode = true
opt.scrolloff = 10     -- scroll page when cursor is 8 lines from top/bottom
opt.sidescrolloff = 10 -- scroll page when cursor is 8 spaces from left/right
opt.guifont = "monospace:h17"
-- opt.completeopt = { "menuone", "noselect" }
opt.splitbelow = true    -- split go below
opt.splitright = true    -- vertical split to the right
opt.termguicolors = true -- terminal gui colors
-- opt.synmaxcol = 300      -- stop syntax highlighting for performance

-- Sidebar
-- opt.numberwidth = 3
opt.showcmd = true
opt.cmdheight = 1

-- from lazyvim config

local o = vim.o
-- highlight all search terms instead of one
o.hlsearch = true

-- Make line numbers default
-- vim.wo.number = true ( fine-grained )
o.relativenumber = true

-- Disable mouse mode
-- o.mouse = ''

-- Enable break indent
o.breakindent = true

-- Save previously changed undo history
-- o.undodir = ''
-- o.undofile = true

-- Search
o.ignorecase = true -- enable case insensitive searching
o.smartcase = true  -- all searches are case insensitive unless there's a capital letter
o.incsearch = true  -- enable incremental searching - starts searching as soon as typing without enter

-- Decrease update time
o.updatetime = 50 -- update time for backgroup process
vim.wo.signcolumn = 'yes'

-- Set colorscheme
--vim.cmd [[colorscheme onedark]]
-- vim.cmd.colorscheme "catppuccin"

opt.clipboard = 'unnamedplus'

o.colorcolumn = '100'

-- Set completeopt to have a better completion experience
o.completeopt = 'menuone,noselect'

-- Concealer for Neorg
o.conceallevel = 2


-- from stackoverflow

-- o.modifiable = true -- ( 'set modifiable' -> vimscript ) ( check if works when error appears )
-- vim.cmd('set modifiable')


--[[ My options ]]

o.timeoutlen = 0 -- using now for which-key appear delay
