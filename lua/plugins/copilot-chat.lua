local IS_DEV = false -- Flag to determine if the environment is development

local prompts = {
  Typo = {
    prompt = "> /COPILOT_GENERATE\n\nYou are a senior developer, with years of experience developing and in devops. There's at least one typo in this code. Please specify the line numbers for each typo. Do not modify additional code. Simply tell me what line the typos are on, and give me the corrected code. Only supply the correct lines, not the entire code. Above that, tell me what the code was previously and what you changed.",
  },
  Comments = {
    prompt = "> /COPILOT_GENERATE\n\nYou are a senior developer, with years of experience developing and in devops. Please provide comments for the following code. Include a block at the top, with a brief explanation and smaller comments by functions.",
  },
  Explain = {
    prompt = "> /COPILOT_GENERATE\n\nYou are a senior developer, with years of experience developing and in devops. Please explain how the following code works.",
  },
  Fix = {
    prompt = "> /COPILOT_GENERATE\n\nYou are a senior developer, with years of experience developing and in devops. Please fix the following code. Do not display line numbers.",
    mapping = "<leader>acf",
    description = "CopilotChat - Fix Code",
  },
  Review = {
    prompt = "> /COPILOT_GENERATE\n\nYou are a senior developer, with years of experience developing and in devops. Please review the following code and provide suggestions for improvement.",
  },
  Help = {
    prompt = "You are a senior developer, with years of experience developing and in devops. Please help me, I will explain my problem below.",
  },
}

return {
  {
    dir = IS_DEV and "~/Projects/research/CopilotChat.nvim" or nil,
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
      { "<leader>al", "<cmd>CopilotChatReset<cr>", desc = "CopilotChat - Clear buffer and chat history" },
    },
  },
}
