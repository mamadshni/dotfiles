return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    opts = {
      background = { light = "latte", dark = "mocha" },
      color_overrides = {
        -- darker base (crust) to match Ghostty/Zellij "catppuccin-mocha-dark"
        mocha = { base = "#11111b" },
      },
    },
  },
  {
    "LazyVim/LazyVim",
    opts = { colorscheme = "catppuccin-nvim" }, -- plugin name; plain "catppuccin" is nvim 0.12's built-in scheme
  },
}
