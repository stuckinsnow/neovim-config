local IS_DEV = false -- Flag to determine if the environment is development

-- Table containing various prompt templates for Copilot Chat
local prompts = {
  BetterNamings = "Please provide better names for the following variables and functions.",
  Typo = "> /COPILOT_GENERATE\n\nThere's at least one typo in this code, potentially more. Please specify the line numbers for each typo. Do not modify additional code. Simply tell me what line the typos are on, and give me the corrected version below that. Above the line number, tell me what the code was previously and what you changed.",
  Comments = "> /COPILOT_GENERATE\n\nPlease provide comments for the following code. Include a block at the top, with a brief explanation and smaller comments by functions.",
  Concerns = "> /COPILOT_GENERATE\n\nThere are potentially concerns with this code e.g. efficiency or security, etc. Please label them in a concise way, and mention alternatives. If it involves algorithms, please mention alternative more efficient algorithms or functions from a speed perspective. Include the line numbers for each.",
  Concise = "> /COPILOT_GENERATE\n\nPlease make the selected code more concise e.g. turn into a ternary or switch statement.",
  Efficiency = "> /COPILOT_GENERATE\n\nThere are potentially more efficient ways to write this code. Please provide one alternative.",
  Explain = "Please explain how the following code works.",
  Fix = "> /COPILOT_GENERATE\n\nPlease fix the following code.",
  -- Tests = "Please explain how the selected code works, then generate unit tests for it.",
  Review = "Please review the following code and provide suggestions for improvement.",
}

-- Return a table configuring the Copilot Chat plugin
return {
  {
    dir = IS_DEV and "~/Projects/research/CopilotChat.nvim" or nil, -- Set the directory for development environment
    "CopilotC-Nvim/CopilotChat.nvim", -- Plugin repository
    version = "1.9.1", -- Plugin version
    dependencies = { -- List of plugin dependencies
      { "nvim-telescope/telescope.nvim" },
      { "nvim-lua/plenary.nvim" },
    },
    opts = {
      prompts = prompts, -- Assign the prompts table to the plugin options

      window = {
        width = 75, -- Set the desired width of the Copilot Chat window
        height = 20, -- Optionally, set the height
        border = "rounded", -- Set the border style (optional)
      },
    },
    build = function()
      vim.notify("Please update the remote plugins by running ':UpdateRemotePlugins', then restart Neovim.") -- Notify the user to update remote plugins
    end,
    event = "VeryLazy", -- Load the plugin on a lazy event
    keys = { -- Key mappings for various Copilot Chat commands
      { "<leader>ae", "<cmd>CopilotChatExplain<cr>", desc = "CopilotChat - Explain code" },
      -- { "<leader>at", "<cmd>CopilotChatTests<cr>", desc = "CopilotChat - Generate tests" },
      { "<leader>ac", "<cmd>CopilotChatConcise<cr>", desc = "CopilotChat - Make code concise" },
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
