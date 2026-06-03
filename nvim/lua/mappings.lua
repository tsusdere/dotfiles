require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- split window
map("n", "wh", ":split<Return>" )
map("n", "wv", ":vsplit<Return>")

-- close a window
map("n", "<leader>q", ":q<Return>")

-- help move line
map("n", "<C-q>", ":m .-2<CR>==")
map("n", "<C-a>", ":m .+1<CR>==")

-- quick way out of noh
map("n", "<Leader>n", "<cmd>nohlsearch<CR>")

-- save file
map({ "n", "i", "v" }, "ZZ", "<Esc> <cmd> w <cr>")


map("n", "<leader>gb", function()
  local gitsigns = require "gitsigns"
  local line = vim.fn.line "."
  local file = vim.fn.expand "%"

  gitsigns.blame_line { full = true }

  -- poll for the popup to appear then focus it
  local attempts = 0
  local function try_focus()
    attempts = attempts + 1
    local popup_win, popup_buf
    for _, win in ipairs(vim.api.nvim_list_wins()) do
      local config = vim.api.nvim_win_get_config(win)
      if config.relative ~= "" then
        popup_win = win
        popup_buf = vim.api.nvim_win_get_buf(win)
        vim.api.nvim_set_current_win(win)
        break
      end
    end

    if not popup_win then
      if attempts < 20 then
        vim.defer_fn(try_focus, 100)
      end
      return
    end

    -- fetch PR link in the background
    vim.system(
      { "git", "log", "-1", "--format=%H", string.format("-L%d,%d:%s", line, line, file) },
      {},
      function(git_result)
        local sha = vim.trim((git_result.stdout or ""):match "^[0-9a-f]+" or "")
        if sha == "" then
          return
        end
        vim.system(
          { "gh", "pr", "list", "--search", sha, "--state", "merged", "--json", "url", "--jq", ".[0].url" },
          {},
          function(pr_result)
            local pr_url = vim.trim(pr_result.stdout or "")
            if pr_url == "" then
              return
            end
            vim.schedule(function()
              if not vim.api.nvim_buf_is_valid(popup_buf) then
                return
              end
              -- prepend PR link at the top of the popup
              local icon = "\u{e726}"
              local status = " Merged "
              local pr_line = icon .. status .. pr_url

              vim.bo[popup_buf].modifiable = true
              vim.api.nvim_buf_set_lines(popup_buf, 0, 0, false, { pr_line, "" })
              vim.bo[popup_buf].modifiable = false

              -- highlight the icon and status
              local ns = vim.api.nvim_create_namespace "blame_pr"
              vim.api.nvim_set_hl(0, "BlamePRIcon", { fg = "#a6e3a1", bold = true })
              vim.api.nvim_set_hl(0, "BlamePRStatus", { fg = "#cba6f7", bold = true })
              vim.api.nvim_set_hl(0, "BlamePRUrl", { fg = "#89b4fa", underline = true })
              local icon_end = #icon
              local status_end = icon_end + #status
              vim.api.nvim_buf_add_highlight(popup_buf, ns, "BlamePRIcon", 0, 0, icon_end)
              vim.api.nvim_buf_add_highlight(popup_buf, ns, "BlamePRStatus", 0, icon_end, status_end)
              vim.api.nvim_buf_add_highlight(popup_buf, ns, "BlamePRUrl", 0, status_end, -1)
              vim.api.nvim_buf_add_highlight(popup_buf, ns, "BlamePRUrl", 0, #"\u{e726}  Merged  ", -1)

              -- resize popup to fit new content
              if vim.api.nvim_win_is_valid(popup_win) then
                local new_height = vim.api.nvim_buf_line_count(popup_buf)
                vim.api.nvim_win_set_height(popup_win, new_height)
              end

              -- add keybind to open PR in browser (gx or gh)
              vim.keymap.set("n", "gp", function()
                vim.fn.system { "open", pr_url }
              end, { buffer = popup_buf, desc = "Open PR in browser" })
            end)
          end
        )
      end
    )
  end
  vim.defer_fn(try_focus, 100)
end, { desc = "Git Blame Line + PR" })

map("n", "K", function()
  vim.lsp.buf.hover { border = "rounded" }
  vim.defer_fn(function()
    for _, win in ipairs(vim.api.nvim_list_wins()) do
      local config = vim.api.nvim_win_get_config(win)
      if config.relative ~= "" then
        vim.api.nvim_set_current_win(win)
        break
      end
    end
  end, 100)
end, { desc = "LSP Hover (focused)" })

map("n", "<leader>Q", "<cmd>qa!<cr>", { desc = "force quit all" })

-- toggleable
map({ "n", "t" }, "<C-;>", function()
  require("nvchad.term").toggle { pos = "sp", id = "htoggleTerm" }
end, { desc = "terminal toggleable horizontal term" })
