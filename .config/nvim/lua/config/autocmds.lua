-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- Notify on manual save (:w)
vim.api.nvim_create_autocmd("BufWritePost", {
  group = vim.api.nvim_create_augroup("notify_on_write", { clear = true }),
  callback = function()
    vim.notify("Saved " .. vim.fn.expand("%:t"), vim.log.levels.INFO, { title = "Saved" })
  end,
})
