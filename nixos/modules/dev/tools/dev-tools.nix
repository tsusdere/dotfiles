{ pkgs, ... }: {
  home.packages = with pkgs;(
	  [
		neofetch

		# java
		visualvm
		zulu17

		# python
		python3

		#terraform
		terraform-ls
		jsonnet
		jsonnet-language-server
		taplo
		yaml-language-server
		actionlint

		#protobuff
		buf


		openssl
		pkg-config
		
	  ]
	  ++
	  # General Purpose
	  [
		#c/c++
		cmake
		cmake-language-server
		gnumake
		checkmake
		gcc
		gdb
		clang-tools
		lldb

		# Rust
		rustc
		cargo
		rust-analyzer
		rustfmt
		clippy

		# Go
		go
		gomodifytags
		iferr
		impl
		gotools
		gopls
		delve

		# Zig
		zls

		# Lua
		stylua
		lua-language-server

		# Bash
		shellcheck
		shfmt
	  ]
	  ++
	  # Web stuff
	  [
		nodejs
		typescript
		typescript-language-server
		emmet-ls
	  ]
  );
}
