{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    #nixpkgs.config.allowUnfree = true;
    #hosts.url = "./hosts/default";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    #home-manager-modules.url = "./modules/home-manager";
    #nixos-modules.url = "./modules/nixos";

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprcursor.url = "github:hyprwm/hyprcursor";
    hypridle.url = "github:hyprwm/hypridle";
    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
    hyprland-contrib.url = "github:hyprwm/contrib";
    hyprlock.url = "github:hyprwm/hyprlock";
    #hyprpaper.url = "github:hyprwm/hyprpaper";

    stylix = {
      url = "github:danth/stylix";
      #inputs.nixpkgs.follows = "nixpkgs";
    }; 
  };

  outputs = { self, nixpkgs, ... }@inputs:
    let
      #system = "x86_64-linux";
      #pkgs = import nixpkgs {
      #  inherit system;
      #  config = {
      #    allowUnfree = true;
      #  };
      #};
      mkHost = hostName: system:
        nixpkgs.lib.nixosSystem {
          pkgs = import nixpkgs {
            inherit system;
            config = {
               allowUnfree = true; 
            };
          };
          specialArgs = {
            inherit inputs;
          };
          modules =
            [
              ./hosts/${hostName}/configuration.nix
              inputs.stylix.nixosModules.stylix
            ];
        };
    in
    {
      nixosConfigurations = {
	      #default = nixpkgs.lib.nixosSystem {
        #  #system = system;
        #  #pkgs = pkgs;
        #  inherit pkgs;
        #  #inherit system;
        #  specialArgs = {inherit inputs;};
        #  modules = [
        #    ./hosts/default/configuration.nix
        #    inputs.stylix.nixosModules.stylix
        #    #inputs.home-manager.nixosModules.default
        #  ];
        #};
        default = mkHost "default" "x86_64-linux";
      };
    };
}
