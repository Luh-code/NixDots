{ inputs, pkgs, ... }:

{
  #imports = 
  #  [
  #    inputs.hyprpaper.homeManagerModules.hyprpaper
  #  ];

  swww = {
    enable = true;
    package = inputs.swww.packages.${pkgs.system}.swww;
  };
}
