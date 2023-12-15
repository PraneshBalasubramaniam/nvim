-- [[ Configure Telescope ]]
-- See `:help telescope` and `:help telescope.setup()`
require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
      },
    },
    prompt_prefix = '',
    --[[  path_display = { truncate = 3 }, ]]
    file_ignore_patterns = { "^node_modules/" },
    preview = { treesitter = true },
    wrap_results = true
  },
}

-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')

-- Telescope live_grep in git root
-- Function to find the git root directory based on the current buffer's path
local function find_git_root()
  -- Use the current buffer's path as the starting point for the git search
  local current_file = vim.api.nvim_buf_get_name(0)
  local current_dir
  local cwd = vim.fn.getcwd()
  -- If the buffer is not associated with a file, return nil
  if current_file == "" then
    current_dir = cwd
  else
    -- Extract the directory from the current file's path
    current_dir = vim.fn.fnamemodify(current_file, ":h")
  end

  -- Find the Git root directory from the current file's path
  local git_root = vim.fn.systemlist("git -C " .. vim.fn.escape(current_dir, " ") .. " rev-parse --show-toplevel")[1]
  if vim.v.shell_error ~= 0 then
    print("Not a git repository. Searching on current working directory")
    return cwd
  end
  return git_root
end

local telBuiltin = require('telescope.builtin')
-- Custom live_grep function to search in git root
local function live_grep_git_root()
  local git_root = find_git_root()
  if git_root then
    telBuiltin.live_grep({
      search_dirs = { git_root },
    })
  end
end

vim.api.nvim_create_user_command('LiveGrepGitRoot', live_grep_git_root, {})

-- See `:help telescope.builtin`
local map = vim.keymap.set
map('n', '<leader>rr', telBuiltin.oldfiles, { desc = 'Find recently opened files' })
map('n', '<leader><space>', telBuiltin.buffers, { desc = '[ ] Find existing buffers' })
map('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  telBuiltin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer' })

map('n', '<leader>gf', telBuiltin.git_files, { desc = 'Search [G]it [F]iles' })
map('n', '<leader>sf', telBuiltin.find_files, { desc = '[S]earch [F]iles' })
map('n', '<leader>sh', telBuiltin.help_tags, { desc = '[S]earch [H]elp' })
map('n', '<leader>sw', telBuiltin.grep_string, { desc = '[S]earch current [W]ord' })
map('n', '<leader>sg', telBuiltin.live_grep, { desc = '[S]earch by [G]rep' })
map('n', '<leader>sG', ':LiveGrepGitRoot<cr>', { desc = '[S]earch by [G]rep on Git Root' })
map('n', '<leader>sd', telBuiltin.diagnostics, { desc = '[S]earch [D]iagnostics' })
map('n', '<leader>sr', telBuiltin.resume, { desc = '[S]earch [R]esume' })
