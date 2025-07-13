{ pkgs, config, lib, inputs, ... }: {
  imports = [
	./terminal/ghostty.nix
	./git/git.nix
  ];
}
