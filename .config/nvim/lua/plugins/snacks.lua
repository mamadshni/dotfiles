return {
  "folke/snacks.nvim",
  opts = {
    -- use ~/.config/lazygit/config.yml (catppuccin/lazygit theme) instead of generated theme
    lazygit = { configure = false },
    picker = {
      sources = {
        explorer = {
          jump = { close = true },
          hidden = true,
          ignored = true,
          layout = { layout = { position = "right" } },
        },
      },
      win = {
        list = {
          wo = {
            relativenumber = true,
          },
        },
      },
    },
  },
}
