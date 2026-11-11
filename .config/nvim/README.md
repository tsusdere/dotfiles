# Neovim

Standalone configuration inspired by craftzdog/dotfiles, with transparent
Solarized Osaka, Oil, Snacks, Lualine, Incline, native LSP, Blink completion,
Treesitter, Conform, Git tools, and Copilot suggestions. No LazyVim or lazy.nvim.

## Installation

Requires Neovim 0.12+, Git, curl, a C compiler, Node.js/npm, Python/pip, and
ripgrep for project search. Lazygit is needed for the Git terminal UI. Use a Nerd
Font for icons. Language tools and the Treesitter CLI are managed by Mason.

The dotfile installers link this directory to `~/.config/nvim` and run:

```sh
HEADLESS_NEOVIM=1 nvim --headless \
  '+lua if vim.v.errmsg ~= "" then vim.cmd.cquit() end' '+DotfilesInstall' +qa
```

This installs plugins at the tracked `nvim-pack-lock.json` revisions, language
tools, and parsers, and exits nonzero if installation fails. Normal startup also
installs missing tools and parsers asynchronously. Existing lazy.nvim downloads
can remain on disk; they are no longer loaded.

Run `:Copilot auth` once to sign in, then `:Copilot status` to check authentication.
Run `:checkhealth` to diagnose missing external dependencies.

## Keys

Leader is Space. `jk` still exits insert mode.

| Key | Action |
| --- | --- |
| `sf` / `<leader>e` | Floating / full-window Oil explorer |
| `;f` / `<leader>ff` | Find files |
| `;r` / `<leader>/` | Search project |
| `;;` / `\\` | Resume picker / list buffers |
| `;e` / `;n` | Diagnostics / notifications |
| `;g` / `<leader>gg` | Lazygit |
| `te`, Tab, Shift-Tab | New / next / previous tab |
| `<leader>w` | Save current file |
| `<leader>q`, `<leader>qq` | Close window / quit Neovim (protect unsaved changes) |
| `ss`, `sv`, `sh/sj/sk/sl` | Split / vertical split / move between windows |
| `gd`, `gr`, `gI`, `gy`, `K` | Definition / references / implementations / type / hover |
| `<leader>ca`, `<leader>cr` | Code action / rename symbol |
| `<leader>f`, `<leader>uf` | Format / toggle buffer format on save |
| `[d`, `]d`, `<leader>xx` | Previous / next diagnostic / Trouble |
| `<leader>gb`, `<leader>gh`, `<leader>gd` | Blame / stage hunk / diff overlay |
| `<leader>dv`, `<leader>dh` | Diff explorer / file history |
| `<leader>bd` | Close buffer without closing its window |
| `<leader>yf`, `<leader>yp` | Copy relative / absolute path with line number |
| `<leader>i` | Toggle inlay hints |
| Ctrl-L, Alt-L, Alt-Shift-L | Accept Copilot suggestion / word / line |
| Alt-`]`, Alt-`[`, Ctrl-`]` | Next / previous / dismiss Copilot suggestion |

`<leader>p` pastes the last yank; `<leader>d` and `<leader>c` delete/change
without overwriting it. Tabs are actual Vim tab pages rather than a buffer bar.
`<leader>q` waits briefly for a possible second `q`; closing the last window
exits Neovim.

## Maintenance

Use `:PluginUpdate` to review plugin updates and `:write` to apply them (or `:quit`
to discard). Restart Neovim after updating. Commit the generated native lockfile
with configuration changes. Rerunning the installer synchronizes existing
plugins to that lockfile without upgrading them.

Use `:Mason` for language tools, `:MasonToolsUpdate` to update them, and `:TSUpdate`
to update parsers. Lua, TypeScript/JavaScript, Python, Bash, JSON, YAML, and
Markdown have language servers and format-on-save configured.
