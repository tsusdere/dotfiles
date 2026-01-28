local neotest = require("neotest")

neotest.setup({
  adapters = {
    require("neotest-golang")({
      runner = "gotestsum"
    }),
    require("neotest-python")({
      dap = { justMyCode = false },
    }),
    require("neotest-jest")({
      jestCommand = "npm test --",
      jestConfigFile = "jest.config.js",
      env = { CI = true },
      cwd = function(_)
        return vim.fn.getcwd()
      end,
    }),
    require("neotest-plenary"),
    require('rustaceanvim.neotest')
  },

  status = {
    virtual_text = true,
  },

  output = {
    open_on_run = false,
  },

  quickfix = {
    open = false,
  },
})

