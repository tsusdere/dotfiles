return {
  {
    "folke/sidekick.nvim",
    event = "VeryLazy",
    opts = {},
    keys = {
      { "<c-.>", function() require("sidekick.cli").focus() end, mode = { "n", "t", "i", "x" }, desc = "Sidekick Focus" },
      { "<leader>A", function() require("sidekick.cli").toggle() end, desc = "Sidekick Toggle" },
      { "<leader>As", function() require("sidekick.cli").select() end, desc = "Sidekick Select Tool" },
      { "<leader>Ad", function() require("sidekick.cli").close() end, desc = "Sidekick Detach Session" },
      { "<leader>At", function() require("sidekick.cli").send() end, mode = { "n", "x" }, desc = "Sidekick Send Text" },
      { "<leader>Af", function() require("sidekick.cli").send({ msg = "{file}" }) end, desc = "Sidekick Send File" },
      { "<leader>Ap", function() require("sidekick.cli").prompt() end, mode = { "n", "x" }, desc = "Sidekick Prompt Picker" },
    },
  },
}
