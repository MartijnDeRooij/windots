return {
  {
    "github/copilot.vim",
    init = function()
      vim.g.copilot_no_tab_map = true
    end,
    config = function()
      vim.keymap.set("i", "<S-Tab>", 'copilot#Accept("\\<S-Tab>")', {
        expr = true,
        replace_keycodes = false,
        silent = true,
      })
    end,
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "nvim-lua/plenary.nvim", branch = "master" },
    },
    build = "make tiktoken",
    opts = {
      model = "gpt-4.1",
      auto_insert_mode = true,
      window = {
        layout = "vertical",
        width = 0.45,
      },
      prompts = {
        ProjectReview = {
          prompt = "Review the attached code or diff. List findings first, ordered by severity. Focus on correctness, security, missing tests, and maintainability. Do not make direct edits.",
          mapping = "<leader>ar",
          description = "Review current code or diff",
        },
        ProjectPlan = {
          prompt = "Create a concise implementation plan. State assumptions, risks, and validation steps before proposing code changes.",
          mapping = "<leader>ap",
          description = "Create an implementation plan",
        },
        ProjectImplement = {
          prompt = "Implement the requested task carefully. Follow the project instructions if attached. Keep changes minimal, explain tradeoffs briefly, and verify the result.",
          mapping = "<leader>ai",
          description = "Implement a task with project context",
        },
        ProjectTDD = {
          prompt = "Use a red-green-refactor workflow. Start by identifying or writing a failing test, then implement the smallest change to pass it, then refactor safely.",
          mapping = "<leader>at",
          description = "Run a TDD-oriented workflow",
        },
      },
    },
    config = function(_, opts)
      require("CopilotChat").setup(opts)

      vim.keymap.set("n", "<leader>aa", "<cmd>CopilotChatToggle<cr>", { silent = true, desc = "Toggle Copilot Chat" })
      vim.keymap.set("n", "<leader>am", "<cmd>CopilotChatModels<cr>", { silent = true, desc = "Select Copilot model" })
      vim.keymap.set("n", "<leader>ac", "<cmd>CopilotChatPrompts<cr>", { silent = true, desc = "Select Copilot prompt" })
      vim.keymap.set("v", "<leader>ar", "<cmd>CopilotChatProjectReview<cr>", { silent = true, desc = "Review selection" })
    end,
  },
}