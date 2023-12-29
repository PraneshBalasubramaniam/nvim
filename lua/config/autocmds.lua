-- automatically generate a template when a new bash script or markdown document is opened.
-- vim.cmd ':autocmd BufNewFile *.sh 0r ~/.config/nvim/skeleton.sh'
-- vim.cmd ':autocmd BufNewFile *.md 0r ~/.config/nvim/skeleton.md'

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function() vim.highlight.on_yank() end,
  group = vim.api.nvim_create_augroup('YankHighlight', { clear = true }),
  pattern = '*',
})
