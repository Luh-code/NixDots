{ pkgs, ... }:

{
  stylix = {
    base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-medium.yaml";
    image = ./backgrounds/illustration-rain-futuristic-city.jpg;

    targets.plymouth = {
      enable = true;
      logo = ./logos/nixos.svg;
    };
  };
}
