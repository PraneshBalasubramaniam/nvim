-- Functional wrapper for mapping custom keybindings
local function map(mode, lhs, rhs, opts)
	local options = { noremap = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

local function mapn(mode, lhs, rhs, opts)
	local options = { silent = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.keymap.set(mode, lhs, rhs, options)
end

-- map('n','<Right>','<Nop>')                                     -- disable right click ( I think )

-- reload config
-- map("n", "<leader>r", ":source ~/AppData/Local/nvim/init.lua<CR>") -- reload neovim config

-- Tab bindings
-- map("n", "<leader>t", ":tabnew<CR>")			                      -- space+t creates new tab
-- map("n", "<leader>x", ":tabclose<CR>")		                      -- space+x closes current tab
-- map("n", "<leader>j", ":tabprevious<CR>")	                    -- space+j moves to previous tab
-- map("n", "<leader>k", ":tabnext<CR>")			                    -- space+k moves to next tab

-- easy split generation
-- map("n", "<leader>v", ":vsplit")				                        -- space+v creates a veritcal split
-- map("n", "<leader>s", ":split")					                      -- space+s creates a horizontal split

-- easy split navigation
-- map("n", "<C-h>", "<C-w>h")						                        -- control+h switches to left split
-- map("n", "<C-l>", "<C-w>l")						                        -- control+l switches to right split
-- map("n", "<C-j>", "<C-w>j")						                        -- control+j switches to bottom split
-- map("n", "<C-k>", "<C-w>k")						                        -- control+k switches to top split

-- buffer navigation
-- map("n", "<Tab>", ":bnext <CR>")				                        -- Tab goes to next buffer
-- map("n", "<S-Tab>", ":bprevious <CR>")	                        -- Shift+Tab goes to previous buffer
-- map("n", "<leader>d", ":bd! <CR>")			                        -- Space+d delets current buffer

-- adjust split sizes easier
-- map("n", "<C-Left>", ":vertical resize +3<CR>")		            -- Control+Left resizes vertical split +
-- map("n", "<C-Right>", ":vertical resize -3<CR>")	              -- Control+Right resizes vertical split -

-- Open netrw in 20% split in tree view
mapn("n", "<leader>e", ":20Lex<CR>", { desc = 'Tree toggle' }) -- space + e toggles netrw tree view
-- mapn("n", "<leader>e", vim.cmd.NvimTreeToggle, { desc = 'Tree toggle ( new plugin )' })


-- Automatically create if, case, and function templates
-- map("n", "<leader>i", "iif [ @ ]; then <CR><CR> else <CR><CR> fi <ESC>/@ <CR>")
-- map("n", "<leader>c", "icase \"$@\" in <CR><CR> @)   <CR>;; <CR><CR> esac <ESC>5kI<ESC>/@<CR>")
-- map("n", "<leader>f", "i@() {<CR><CR> } <ESC>2kI<ESC>/@<CR>")

-- Automatically close brackets, parethesis, and quotes
map("i", "'", "''<left>")
map("i", '"', "\"\"<left>")
map("i", "(", "()<left>")
map("i", "[", "[]<left>")
map("i", "{", "{}<left>")
map("i", "<", "<><left>")
map("i", "`", "``<left>")
map("i", "/*", "/**/<left><left>")

-- Automatically create if, case, and function templates in insert mode
-- map("i", ",i", "if [ @ ]; then <CR><CR> else <CR><CR> fi ")
-- map("i", ",c", "case \"$@\" in <CR><CR> @)    ;; <CR><CR> esac")
-- map("i", ",f", "@() {<CR><CR> } ")

-- Visual Maps
-- map("v", "<leader>r", "\"hy:%s/<C-r>h//g<left><left>")			   -- Replace all instances of highlighted words
-- map("v", "<C-s>", ":sort<CR>")						                     -- Sort highlighted text in visual mode with Control+S
-- map("v", "J", ":m '>+1<CR>gv=gv") -- Move current line down
-- map("v", "K", ":m '>-2<CR>gv=gv") -- Move current line up


-- My Reference
-- Default register ( " " ) - default ( can be overritten by further change )
-- Named register ( "a )
-- Blackhole register ( "_ ) - not saved ( premanent deletion )


-- from lazyvim config

-- [[ Basic Keymaps ]]

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
mapn({ 'n', 'v' }, '<Space>', '<Nop>')

-- Remap for dealing with word wrap
mapn('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true })
mapn('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true })



-- My config
mapn("n", "<leader>q", ":q<CR>", { desc = 'Quit' })                 -- quit editor
mapn("n", "<leader>i", ":q!<CR>", { desc = 'Quit without saving' }) -- quit editor without change
-- mapn("n", "<leader>i", function()
-- 	-- local str = vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf())
-- 	-- print(str)
-- 	require('utils.print&log').logToFile(vim.bo.filetype)
-- end)                                                                                  -- quit editor without change
mapn("n", "<leader>l", "<cmd>Lazy<CR>")                                               -- open lazy UI
mapn("n", "<leader>rd", "<C-r>", { desc = 'Redo' })                                   -- remap Ctrl + R ( redo )
mapn("n", "<leader>kl", ":Telescope keymaps<CR>", { desc = 'Telescope keymap list' }) -- Telescope keymap listing
mapn("n", "<leader>m", ":ActivateFormating<CR>", { desc = 'Activate Formating' })     -- Activate Formating

-- '<C-o>' temporarily enters normal mode
mapn("i", "<C-z>", "<C-o>u")   -- enable 'Ctrl + Z' for insert
mapn("i", "<C-H>", "<C-o>diW") -- enable 'Ctrl + Backspace' for insert
mapn("n", "<C-H>", "diW")      -- enable 'Ctrl + Backspace' for normal

-- move lines
mapn("n", "<M-k>", "ddkP")         -- move line above
mapn("n", "<M-j>", "ddjP")         -- move line below
mapn("n", "<M-Up>", "ddkP")        -- move line above (arrow)
mapn("n", "<M-down>", "ddjP")      -- move line below (arrow)
mapn("v", "K", ":m '<-2<CR>gv=gv") -- mave line above ( v )
mapn("v", "J", ":m '>+1<CR>gv=gv") -- move line below ( v )

-- mapn("n", "<leader>k", "<cmd>lnext<CR>zz")        -- moves to next error and centers the screen ( I think ) ( check key available )
-- mapn("n", "<leader>j", "<cmd>lprev<CR>zz")        -- 👆 same for previous

-- not working
-- mapn("i", "<C-CR>", "<C-o>o")                     -- enable 'Ctrl + Enter' for new line below
-- mapn("i", "<C-S-CR>", "<C-o>O")                   -- enable 'Ctrl + Shift + Enter' for new line above

-- mapn("n", "y", '"+y')                             -- enable system clipboard for only copy without clipboard as 'unnamedplus' option
-- 👇 used Blackhole register for not saving d and x content
mapn("n", "d", '"_d') -- disabling system clipboard for deletion ( d )
mapn("n", "x", '"_x') -- disabling system clipboard for cut ( x )

-- open terminal
mapn('n', '<leader>t', ':ToggleTerm<CR>')
