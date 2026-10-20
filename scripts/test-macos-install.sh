#!/bin/bash
set -eu

repo_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
source "$repo_dir/scripts/macos-install.sh"

test_dir="$(mktemp -d)"
trap 'rm -rf "$test_dir"' EXIT
export HOME="$test_dir/home"
mkdir -p "$HOME/.config/nvim" "$HOME/.config/tmux"
printf 'old shell\n' > "$HOME/.zshrc"
printf 'old editor\n' > "$HOME/.config/nvim/init.lua"
printf 'old tmux\n' > "$HOME/.config/tmux/tmux.conf"
ln -s "$test_dir/missing" "$HOME/.config/ghostty"
ln -s "$HOME/.config/tmux/tmux.conf" "$HOME/.tmux.conf"

install_dotfiles
for config in nvim tmux ghostty zellij; do
  [[ "$(readlink "$HOME/.config/$config")" == "$repo_dir/.config/$config" ]]
done
[[ "$(readlink "$HOME/.zshrc")" == "$repo_dir/zshrc" ]]
[[ "$(readlink "$HOME/.tmux.conf")" == "$HOME/.config/tmux/tmux.conf" ]]
backups=("$HOME"/.zshrc.backup-*)
[[ "$(cat "${backups[0]}")" == 'old shell' ]]
backups=("$HOME"/.config/nvim.backup-*)
[[ "$(cat "${backups[0]}/init.lua")" == 'old editor' ]]
backups=("$HOME"/.config/tmux.backup-*)
[[ "$(cat "${backups[0]}/tmux.conf")" == 'old tmux' ]]
backups=("$HOME"/.config/ghostty.backup-*)
[[ "$(readlink "${backups[0]}")" == "$test_dir/missing" ]]

before="$(find "$HOME" -name '*.backup-*' | sort)"
install_dotfiles
[[ "$(find "$HOME" -name '*.backup-*' | sort)" == "$before" ]]

printf 'another shell\n' > "$test_dir/replacement"
link_dotfile "$test_dir/replacement" "$HOME/.zshrc"
link_dotfile "$repo_dir/zshrc" "$HOME/.zshrc"
[[ "$(find "$HOME" -name '.zshrc.backup-*' | wc -l | tr -d ' ')" == 3 ]]

if link_dotfile "$test_dir/missing" "$HOME/.zshrc"; then
  printf 'Missing source unexpectedly succeeded\n' >&2
  exit 1
fi
[[ "$(readlink "$HOME/.zshrc")" == "$repo_dir/zshrc" ]]
mkdir "$test_dir/not-a-directory"
printf 'blocked\n' > "$test_dir/not-a-directory/file"
if link_dotfile "$repo_dir/zshrc" "$test_dir/not-a-directory/file/child"; then
  printf 'Invalid destination unexpectedly succeeded\n' >&2
  exit 1
fi

nvim() {
  [[ "$*" == '--headless +Lazy! sync +qa' ]]
}
initialize_neovim

tmux_calls="$test_dir/tmux-calls"
tmux() {
  printf '%s\n' "$*" >> "$tmux_calls"
}
git() {
  [[ "$1" == clone && "$2" == https://github.com/tmux-plugins/tpm ]]
  mkdir -p "$3/bin"
  ln -s /usr/bin/true "$3/bin/install_plugins"
}
initialize_tmux
[[ -x "$HOME/.tmux/plugins/tpm/bin/install_plugins" ]]
[[ "$(sed -n '1p' "$tmux_calls")" == "new-session -d -s dotfiles-install-$$" ]]
[[ "$(sed -n '2p' "$tmux_calls")" == "source-file $HOME/.tmux.conf" ]]
[[ "$(sed -n '3p' "$tmux_calls")" == "kill-session -t dotfiles-install-$$" ]]

tmux() {
  printf '%s\n' "$*" >> "$tmux_calls"
  [[ "$1" != source-file ]]
}
if initialize_tmux; then
  printf 'tmux initialization failure unexpectedly succeeded\n' >&2
  exit 1
fi
[[ "$(tail -n 1 "$tmux_calls")" == "kill-session -t dotfiles-install-$$" ]]

export HOME="$test_dir/fresh-home"
install_dotfiles
[[ -f "$HOME/.config/nvim/init.lua" ]]
[[ -f "$HOME/.config/tmux/scripts/layout.sh" ]]
[[ -z "$(find "$HOME" -name '*.backup-*')" ]]

export HOME="$test_dir/linked-home"
mkdir -p "$HOME/.config" "$test_dir/old-checkout/tmux"
printf 'old linked tmux\n' > "$test_dir/old-checkout/tmux/tmux.conf"
ln -s "$test_dir/old-checkout/tmux" "$HOME/.config/tmux"
install_dotfiles
[[ "$(readlink "$HOME/.config/tmux")" == "$repo_dir/.config/tmux" ]]
[[ "$(cat "$test_dir/old-checkout/tmux/tmux.conf")" == 'old linked tmux' ]]
backups=("$HOME"/.config/tmux.backup-*)
[[ "$(readlink "${backups[0]}")" == "$test_dir/old-checkout/tmux" ]]

printf 'macOS installer tests passed\n'
