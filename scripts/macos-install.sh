#!/bin/bash

output() {
  printf '%b' "$1"
}

all_done() {
  if [[ -n "${1:-}" ]]; then
    printf '%b' "$1"
  else
    printf "✅\n"
  fi
}

brew_bundle() {
  local repo_dir
  repo_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)" || return

  if [[ ! -f "$repo_dir/Brewfile" ]]; then
    output "No Brewfile in this checkout; skipping Homebrew bundle.\n"
    return
  fi

  output "Brew bundling...\n"

  brew bundle --file="$repo_dir/Brewfile" || return

  all_done "\n\n"
}

install_xcode_select() {
  output "Conditionally installing xcode-select..."

  (type xcode-select >&- && xpath=$( xcode-select --print-path ) &&
    test -d "${xpath}" && test -x "${xpath}") || xcode-select --install

  all_done
}

install_rdm() {
  output "Conditionally installing rdm..."

  if ! type rdm > /dev/null; then
    wget https://github.com/BlakeWilliams/remote-development-manager/releases/latest/download/rdm-darwin-arm64
    mv rdm-darwin-arm64 /opt/homebrew/bin/rdm
    chmod +x /opt/homebrew/bin/rdm
  fi

  all_done
}

link_dotfile() {
  local source="$1" destination="$2" backup suffix=0

  if [[ ! -e "$source" ]]; then
    printf 'Missing dotfile source: %s\n' "$source" >&2
    return 1
  fi

  if [[ -L "$destination" && "$(readlink "$destination")" == "$source" ]]; then
    return
  fi

  mkdir -p "$(dirname "$destination")" || return
  if [[ -e "$destination" || -L "$destination" ]]; then
    backup="${destination}.backup-$(date +%Y%m%d-%H%M%S)"
    while [[ -e "$backup" || -L "$backup" ]]; do
      suffix=$((suffix + 1))
      backup="${destination}.backup-$(date +%Y%m%d-%H%M%S)-${suffix}"
    done
    mv "$destination" "$backup" || return
    printf 'Backed up %s to %s\n' "$destination" "$backup"
  fi

  ln -s "$source" "$destination"
}

install_dotfiles() {
  output "Installing dotfiles..."

  local repo_dir
  repo_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)" || return

  link_dotfile "$repo_dir/zshrc" "$HOME/.zshrc" || return
  local config
  for config in nvim tmux ghostty zellij; do
    link_dotfile "$repo_dir/.config/$config" "$HOME/.config/$config" || return
  done
  link_dotfile "$HOME/.config/tmux/tmux.conf" "$HOME/.tmux.conf" || return

  all_done
}

install_npm_packages() {
  output "Conditionally installing npm packages..."

  npm_packages_needed=(
    bash-language-server
    eslint
    neovim
    pyright
    typescript-language-server
    vscode-langservers-extracted
    write-good
  )
  npm_packages_not_installed=()

  for pkg in "${npm_packages_needed[@]}"; do
    npm list --depth 1 --global $pkg >/dev/null 2>&1 || npm_packages_not_installed+=($pkg)
  done

  [ ${#npm_packages_not_installed[@]} -eq 0 ] || /opt/homebrew/bin/npm install -g "${npm_packages_not_installed[@]}"

  all_done
}

initialize_neovim() {
  output "Initializing neovim..."

  HEADLESS_NEOVIM=1 nvim --headless '+Lazy! sync' +qa || return

  all_done
}

initialize_tmux() {
  output "Initializing tmux..."

  local session="dotfiles-install-$$" status=0
  if [[ ! -d "$HOME/.tmux/plugins/tpm" ]]; then
    mkdir -p "$HOME/.tmux/plugins" || return
    git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm" || return
  fi
  tmux new-session -d -s "$session" || return
  tmux source-file "$HOME/.tmux.conf" &&
    "$HOME/.tmux/plugins/tpm/bin/install_plugins" || status=$?
  tmux kill-session -t "$session" || return
  [[ "$status" -eq 0 ]] || return "$status"

  all_done
}

install_gh_extensions() {
  output "Conditionally installing gh extensions..."

  IFS=$'\n' installed_gh_extensions=($(gh extension list))
  wanted_gh_extensions=(
    mislav/gh-branch
    vilmibm/gh-user-status
  )
  for extension_to_install in "${wanted_gh_extensions[@]}"; do
    found=false

    for installed_extension in "${installed_gh_extensions[@]}"; do
      if [[ "$installed_extension" = *"$extension_to_install"* ]]; then
        found=true
      fi
    done

    if [[ $found == true ]]; then
      found=false
    else
      gh extensions install $extension_to_install
    fi
  done

  all_done
}

install_fzf() {
  output "Conditionally installing fzf..."

  command -v fzf >/dev/null 2>&1 || $(brew --prefix)/opt/fzf/install --all

  all_done
}

teardown() {
  output "Cleaning up..."

  IFS=$' \t\n'

  all_done
}

main() {
  install_dotfiles

  brew_bundle

  install_xcode_select
  install_rdm
  install_npm_packages
  install_gh_extensions
  install_fzf

  initialize_neovim
  initialize_tmux

  teardown
}

if [[ "${BASH_SOURCE[0]}" == "$0" ]]; then
  set -e
  main "$@"
fi
