return {
  "folke/noice.nvim",
  opts = {
    cmdline = {
      -- Options include "cmdline", "cmdline_popup", "popup"
      view = "cmdline",
      format = {
        search_down = { view = "cmdline" },
        search_up = { view = "cmdline" },
      },
    },
    notify = {
      timeout = 5000,
    },
  },
}
