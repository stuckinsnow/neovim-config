local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = {
    -- add LazyVim and import its plugins
    { "LazyVim/LazyVim", import = "lazyvim.plugins" },
    -- import/override with your plugins
    { import = "plugins" },

    -- Add nvim-scrollbar plugin
    {
      "petertriho/nvim-scrollbar",
      config = function()
        require("scrollbar").setup()
      end,
    },
    {
      "mattn/emmet-vim",
      config = function()
        -- Emmet-vim configuration (if necessary)
      end,
    },
    {
      "rcarriga/nvim-notify",
      opts = {
        timeout = 10000,
      },
    },
    {
      "neovim/nvim-lspconfig",
      opts = {
        inlay_hints = { enabled = false },
      },
    },
    -- {
    --   "NeogitOrg/neogit",
    --   dependencies = {
    --     "nvim-lua/plenary.nvim", -- required
    --     "sindrets/diffview.nvim", -- optional - Diff integration
    --
    --     -- Only one of these is needed.
    --     "nvim-telescope/telescope.nvim", -- optional
    --     "ibhagwan/fzf-lua", -- optional
    --     "echasnovski/mini.pick", -- optional
    --   },
    --   config = true,
    -- },
    {
      "sindrets/diffview.nvim",
      cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles" },
    },
    -- {
    --   "neovim/nvim-lspconfig",
    --   opts = {
    --     servers = { eslint = {} },
    --     setup = {
    --       eslint = function()
    --         require("lazyvim.util").lsp.on_attach(function(client)
    --           if client.name == "eslint" then
    --             client.server_capabilities.documentFormattingProvider = true
    --           elseif client.name == "tsserver" then
    --             client.server_capabilities.documentFormattingProvider = false
    --           end
    --         end)
    --       end,
    --     },
    --   },
    -- },
  },
  defaults = {
    -- By default, only LazyVim plugins will be lazy-loaded. Your custom plugins will load during startup.
    -- If you know what you're doing, you can set this to `true` to have all your custom plugins lazy-loaded by default.
    lazy = false,
    -- It's recommended to leave version=false for now, since a lot the plugin that support versioning,
    -- have outdated releases, which may break your Neovim install.
    version = false, -- always use the latest git commit
    -- version = "*", -- try installing the latest stable version for plugins that support semver
  },
  --install = { colorscheme = { "tokyonight", "habamax" } },
  install = { colorscheme = { "catppuccin" } },

  checker = {
    enabled = true, -- check for plugin updates periodically
    notify = false, -- notify on update
  }, -- automatically check for plugin updates
  performance = {
    rtp = {
      -- disable some rtp plugins
      disabled_plugins = {
        "gzip",
        -- "matchit",
        -- "matchparen",
        -- "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})
