{ pkgs, ... }:

{
  stylix = {
    #base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-medium.yaml";
    base16Scheme = "${pkgs.base16-schemes}/share/themes/nord.yaml";
    #image = ./backgrounds/illustration-rain-futuristic-city.jpg;
    image = ./1.jpg;

    targets.nixos-icons = {
      enable = false;
    };

    targets.plymouth = {
      enable = false;
      logo = ./logos/nixos.svg;
    };
  };
}