{
  pkgs,
  ghostty,
  ...
}:
###########################################################
#
# Ghostty Configuration
#
###########################################################
{
  programs.ghostty = {
    enable = true;
    package = pkgs.ghostty; # the stable version
    # package = ghostty.packages.${pkgs.system}.default; # the latest version
    enableBashIntegration = false;
    installBatSyntax = false;
    # installVimSyntax = true;
    settings = {
      font-family = "Maple Mono NF CN";
      font-size = 13;
      theme = "tokyonight";
      selection-invert-fg-bg= true;
      bold-is-bright = true;
      minimum-contrast=2;
      background-opacity = 0.92;

      cursor-style = "block";
      cursor-style-blink = true;
      cursor-invert-fg-bg = true;
      cursor-opacity = .8;
      shell-integration-features = "no-cursor";

      window-decoration = false;
      term = "xterm-256color";
    };
  };
}
