{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    #nixpkgs.config.allowUnfree = true;
    hosts.url = "./hosts/default";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, hosts, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { system = "x86_64-linux"; config.allowUnfree = true; };
    in
    {
      nixosConfigurations = {
	default = nixpkgs.lib.nixosSystem {
          specialArgs = {inherit inputs;};
          modules = [
            ./hosts/default/configuration.nix
            #inputs.home-manager.nixosModules.default
          ];
        };
      };
    };
}
