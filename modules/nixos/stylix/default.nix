{ pkgs, lib, config, ... }:

{
  stylix = {
    #base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-medium.yaml";
    #base16Scheme = "${pkgs.base16-schemes}/share/themes/nord.yaml";
    #base16Scheme = "${pkgs.base16-schemes}/share/themes/helios.yaml";
    #base16Scheme = "${pkgs.base16-schemes}/share/themes/ayu-dark.yaml";
    base16Scheme = "${pkgs.base16-schemes}/share/themes/oxocarbon-dark.yaml";
    #base16Scheme = "${pkgs.base16-schemes}/share/themes/solarflare.yaml";
    #base16Scheme = "${pkgs.base16-schemes}/share/themes/onedark.yaml";
    #image = ./backgrounds/illustration-rain-futuristic-city.jpg;
    image = ./1.png;

    polarity = "dark";

    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
      size = 24;
    };

    opacity = {
      applications = 1.0;
      terminal = 0.9;
      desktop = 1.0;
      popups = 1.0;
    };

    targets.nixos-icons = {
      enable = false;
    };

    targets.plymouth = {
      enable = true;
      logo = ./logos/nixos.svg;
    };

    targets.nixvim = {
      enable = true;
      transparent_bg.main = true; 
    };
    targets.gtk.enable = true;
  };
}
