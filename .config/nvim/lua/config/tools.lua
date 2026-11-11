local M = {}

M.packages = {
  "tree-sitter-cli",
  "lua-language-server",
  "vtsls",
  "pyright",
  "bash-language-server",
  "json-lsp",
  "yaml-language-server",
  "marksman",
  "stylua",
  "prettier",
  "prettierd",
  "ruff",
  "shfmt",
}

M.parsers = {
  "bash",
  "css",
  "diff",
  "html",
  "javascript",
  "jsdoc",
  "json",
  "lua",
  "luadoc",
  "markdown",
  "markdown_inline",
  "python",
  "regex",
  "tsx",
  "typescript",
  "vim",
  "vimdoc",
  "yaml",
}

local function install()
  assert(vim.v.errmsg == "", "Startup failed: " .. vim.v.errmsg)

  vim.pack.update(nil, { target = "lockfile", force = true })
  assert(vim.v.errmsg == "", "Package synchronization failed: " .. vim.v.errmsg)
  vim.cmd.MasonToolsInstallSync()
  local registry = require("mason-registry")
  for _, name in ipairs(M.packages) do
    assert(registry.get_package(name):is_installed(), "Tool installation failed: " .. name)
  end

  local treesitter = require("nvim-treesitter")
  assert(treesitter.update(M.parsers):wait(300000), "Parser installation or update failed")
  local installed = treesitter.get_installed("parsers")
  for _, name in ipairs(M.parsers) do
    assert(vim.list_contains(installed, name), "Parser installation failed: " .. name)
  end
  vim.notify("Neovim packages, language tools, and parsers are installed")
end

vim.api.nvim_create_user_command("DotfilesInstall", function()
  local ok, err = xpcall(install, debug.traceback)
  if not ok then
    vim.api.nvim_err_writeln(err)
    vim.cmd.cquit()
  end
end, { desc = "Synchronize locked plugins and install language tools and parsers" })

return M
