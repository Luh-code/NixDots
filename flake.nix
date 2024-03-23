{
  description = "The base config Flake";

  inputs = {
    # NixOS official package source, using the unstable branch here
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    helix.url = "github:helix-editor/helix/master";

    home-manager = {
      url = "github:nix-community/home-manager";

      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        # Import the previous configuration.nix we used,
        # so the old configuration file still takes effect
        ./configuration.nix
	{ _module.args = { inherit inputs; }; }

	home-manager.nixosModules.home-manager
	{
	  home-manager.useGlobalPkgs = true;
	  home-manager.useUserPackages = true;

	  home-manager.users.luh = import ./home.nix;
	}
      ];
    };
  };
}
