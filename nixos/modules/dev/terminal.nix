{ pkgs, config, lib, inputs, ... }:

with lib;

{
  home.packages = with pkgs; [
    nerd-fonts
  ];
}
