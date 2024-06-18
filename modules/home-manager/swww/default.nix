{ inputs, pkgs, ... }:

{
  #imports = 
  #  [
  #    inputs.hyprpaper.homeManagerModules.hyprpaper
  #  ];

  programs.ewww = {
    enable = true;
  };
}
