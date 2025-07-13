{ pkgs, ... }: {
  home.packages = with.pkgs; [
  	neofetch

	# java
	visualvm
	zulu17

	# rust
	rustc
	cargo

	# go
	go

	# python
	python3
  ];
}
