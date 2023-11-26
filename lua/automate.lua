-- automatically generate a template when a new bash script or markdown document is opened.
vim.cmd ':autocmd BufNewFile *.sh 0r ~/.config/nvim/skeleton.sh'
vim.cmd ':autocmd BufNewFile *.md 0r ~/.config/nvim/skeleton.md'
