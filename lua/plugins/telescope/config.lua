-- Enable telescope fzf native, if installed
-- pcall(require('telescope').load_extension, 'fzf')

-- See `:help telescope.builtin`
local map = function(left, right, desc)
  vim.keymap.set('n', '<leader>' .. left, right, { desc = desc })
end

local telBuiltin = require('telescope.builtin')
local utils = require('plugins.telescope.utils')

map('<space>', telBuiltin.buffers, 'Find existing buffers')
map('/', utils.search_current_buffer, '[/] Fuzzily search in current buffer')
map('fr', telBuiltin.oldfiles, 'Find recently opened files')
-- map('gf', telBuiltin.git_files, 'Search [G]it [F]iles')
map('ff', telBuiltin.find_files, 'Search [F]iles')
map('fh', telBuiltin.help_tags, 'Search [H]elp')
map('fw', telBuiltin.grep_string, 'Search current [W]ord')
map('fg', telBuiltin.live_grep, 'Search by [G]rep')
-- map('fG', utils.live_grep_git_root, 'Search by [G]rep on Git Root')
map('fd', telBuiltin.diagnostics, 'Search [D]iagnostics')
-- map('fr', telBuiltin.resume, 'Search [R]esume')
