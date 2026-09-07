-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua

vim.opt.fixendofline = true
vim.opt.colorcolumn = "100"
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.breakindent = true
vim.opt.swapfile = false

vim.g.root_spec = { { ".git", "lua" }, "lsp", "cwd" }
