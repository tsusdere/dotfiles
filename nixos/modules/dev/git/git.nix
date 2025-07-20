{ pkgs, config, lib, inputs, ... }:

with lib;

{
  home.packages = with pkgs; [
    # git 
    gh
    gitbutler
    lazygit
  ];
}
