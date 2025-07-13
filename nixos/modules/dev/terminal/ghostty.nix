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

      background-opacity = 0.93;
    };
  };
}
