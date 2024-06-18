{ inputs, pkgs, ... }:

{
  #imports = 
  #  [
  #    inputs.hyprpaper.homeManagerModules.hyprpaper
  #  ];

  programs.hyprpaper = {
    enable = true;
  };
}
