local treesitter = require("nvim-treesitter")
local tools = require("config.tools")
treesitter.setup()
vim.treesitter.language.register("json", "jsonc")

local group = vim.api.nvim_create_augroup("DotfilesTreesitter", { clear = true })

local function install()
  if vim.env.HEADLESS_NEOVIM ~= "1" then
    treesitter.install(tools.parsers)
  end
end

if vim.fn.executable("tree-sitter") == 1 then
  install()
else
  vim.api.nvim_create_autocmd("User", {
    group = group,
    pattern = "MasonToolsUpdateCompleted",
    once = true,
    callback = install,
  })
end

vim.api.nvim_create_autocmd("FileType", {
  group = group,
  callback = function(event)
    local lang = vim.treesitter.language.get_lang(event.match)
    if lang and vim.treesitter.language.add(lang) then
      vim.treesitter.start(event.buf, lang)
      vim.bo[event.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end
  end,
})

vim.api.nvim_create_autocmd("PackChanged", {
  group = group,
  callback = function(event)
    if event.data.spec.name == "nvim-treesitter" and event.data.kind == "update" then
      treesitter.update()
    end
  end,
})
