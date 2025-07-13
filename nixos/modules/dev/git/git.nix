{ pkgs, config, lib, inputs, ... }:

with lib;

{
  home.packages = with pkgs; [
    # java
    visualvm
    zulu17

    # rust
    rustc
    cargo

    # git 
    gh
    gitbutler
    lazygit
  ];
}
