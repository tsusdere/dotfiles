{
  pkgs,
  ...
}:
###########################################################
#
# tmux Configuration
#
###########################################################
{
  programs.tmux = {
    enable = true;
    terminal = "screen-256color";
    clock24 = true;
    extraConfig = ''
	set-option -sa terminal-overrides ",xterm*:Tc"
	set -g mouse on

	unbind C-b
	set-option -g prefix C-a
	bind-key C-a send-prefix
	set -g status-style 'bg=#333333 fg=#5eacd3'

	# vim-like pane switching
	bind -r ^ last-window
	bind -r k select-pane -U
	bind -r j select-pane -D
	bind -r h select-pane -L
	bind -r l select-pane -R


	# Start windows and panes at 1, not 0
	set -g base-index 1
	set -g pane-base-index 1
	set-window-option -g pane-base-index 1
	set-option -g renumber-windows on

	# Use Alt-arrow keys without prefix key to resize
	bind -n M-Left resize-pane -L 5
	bind -n M-Right resize-pane -R 5
	bind -n M-Up resize-pane -U 5
	bind -n M-Down resize-pane -D 5

	# Shift arrow to switch windows
	bind -n S-Left  previous-window
	bind -n S-Right next-window

	# Shift Alt vim keys to switch windows

	bind -n M-H previous-window
	bind -n M-L next-window

	set -g @plugin 'tmux-plugins/tpm'
	set -g @plugin 'tmux-plugins/tmux-sensible'
	set -g @plugin 'christoomey/vim-tmux-navigator'

	set -g @plugin 'tmux-plugins/tmux-yank'

	run '~/.tmux/plugins/tpm/tpm'

	# set vi-mode
	set-window-option -g mode-keys vi

	# keybindings
	bind-key -T copy-mode-vi v send-keys -X begin-selection
	bind-key -T copy-mode-vi C-v send-keys -X rectangle-toggle
	bind-key -T copy-mode-vi y send-keys -X copy-selection-and-cancel

	bind '"' split-window -v -c "#{pane_current_path}"
	bind % split-window -h -c "#{pane_current_path}"
    '';
    };
  };
}
