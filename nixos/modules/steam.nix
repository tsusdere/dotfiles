{ pkgs, config, lib, ...}:

with lib;

{
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };
  hardware.xone.enable = true;
}
