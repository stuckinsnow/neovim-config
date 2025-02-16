local IS_DEV = false -- Flag to determine if the environment is development

local prompts = {
  Typo = "> /COPILOT_GENERATE\n\nThere's at least one typo in this code, potentially more. Please specify the line numbers for each typo. Do not modify additional code. Simply tell me what line the typos are on, and give me the corrected version below that. Above the line number, tell me what the code was previously and what you changed.",
  Comments = "> /COPILOT_GENERATE\n\nPlease provide comments for the following code. Include a block at the top, with a brief explanation and smaller comments by functions.",
  Concerns = "> /COPILOT_GENERATE\n\nThere are potentially concerns with this code e.g. efficiency or security, etc. Please label them in a concise way, and mention alternatives. If it involves algorithms, please mention alternative more efficient algorithms or functions from a speed perspective. Include the line numbers for each.",
  Explain = "Please explain how the following code works.",
  Fix = "> /COPILOT_GENERATE\n\nPlease fix the following code.",
  -- Tests = "Please explain how the selected code works, then generate unit tests for it.",
  Review = "Please review the following code and provide suggestions for improvement.",
}

return {
  {
    dir = IS_DEV and "~/Projects/research/CopilotChat.nvim" or nil, -- Set the directory for development environment
    "CopilotC-Nvim/CopilotChat.nvim",
    version = "3.6.0",
    dependencies = {
      { "nvim-telescope/telescope.nvim" },
      { "nvim-lua/plenary.nvim" },
    },
    opts = {
      prompts = prompts,
      window = {
        width = 75,
        height = 20,
        border = "rounded",
      },
    },
    build = function()
      vim.notify("Please update the remote plugins by running ':UpdateRemotePlugins', then restart Neovim.")
    end,
    event = "VeryLazy",
    keys = {
      { "<leader>ae", "<cmd>CopilotChatExplain<cr>", desc = "CopilotChat - Explain code" },
      -- { "<leader>at", "<cmd>CopilotChatTests<cr>", desc = "CopilotChat - Generate tests" },
      { "<leader>ar", "<cmd>CopilotChatReview<cr>", desc = "CopilotChat - Review code" },
      { "<leader>af", "<cmd>CopilotChatFix<cr>", desc = "CopilotChat - Fix code" },
      { "<leader>an", "<cmd>CopilotChatBetterNamings<cr>", desc = "CopilotChat - Better Naming" },
      -- { -- Uncomment to enable vertical split for Copilot Chat
      --   "<leader>av",
      --   ":CopilotChatVisual",
      --   mode = "x",
      --   desc = "CopilotChat - Open in vertical split",
      -- },
      { "<leader>al", "<cmd>CopilotChatReset<cr>", desc = "CopilotChat - Clear buffer and chat history" },
    },
  },
}
