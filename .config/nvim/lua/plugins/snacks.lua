return {
  "folke/snacks.nvim",
  opts = {
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
