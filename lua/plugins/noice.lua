return {
  "folke/noice.nvim",
  opts = {
    cmdline = {
      -- Options include "cmdline", "cmdline_popup", "popup"
      view = "cmdline_popup",
      format = {
        search_down = { view = "cmdline_popup" },
        search_up = { view = "cmdline_popup" },
      },
    },
    notify = {
      timeout = 5000,
    },
  },
}
