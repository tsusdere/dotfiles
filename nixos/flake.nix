{
  description = "A simple NixOS flake";

  inputs = {
    # NixOS official package source, using the nixos-25.05 branch here
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";

    home-manager = {
	url = "github:nix-community/home-manager";
	inputs.nixpkgs.follows = "nixpkgs";
    };
	
    ghostty = {
      url = "github:ghostty-org/ghostty";
    };

  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs: {
    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
      		./configuration.nix
          	home-manager.nixosModules.home-manager
		{
		    home-manager.useGlobalPkgs = true;
		    home-manager.useUserPackages = true;
		    home-manager.users.tsusdere = import ./home/home.nix;

		}
	  ];
    	};
    };
  };
}
