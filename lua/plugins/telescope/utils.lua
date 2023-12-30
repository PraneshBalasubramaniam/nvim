local telBuiltin = require('telescope.builtin')

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

-- Custom live_grep function to search in git root
local function live_grep_git_root()
  local git_root = find_git_root()
  if git_root then telBuiltin.live_grep({ search_dirs = { git_root }, }) end
end

local function search_current_buffer()
  if vim.bo.filetype == 'dashboard' then
    print('File search is not available in dashboard')
    return
  end
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  telBuiltin.current_buffer_fuzzy_find()
end

return { live_grep_git_root = live_grep_git_root, search_current_buffer = search_current_buffer }
