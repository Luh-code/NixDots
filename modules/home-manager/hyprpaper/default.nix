{ inputs, pkgs, ... }:

{
  #imports = 
  #  [
  #    inputs.hyprpaper.homeManagerModules.hyprpaper
  #  ];

  services.hyprpaper = {
    enable = true;
  };
}
