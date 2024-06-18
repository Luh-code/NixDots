{ pkgs, ... }:

{
  stylix = {
    #base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-medium.yaml";
    #base16Scheme = "${pkgs.base16-schemes}/share/themes/nord.yaml";
    base16Scheme = "${pkgs.base16-schemes}/share/themes/helios.yaml";
    #image = ./backgrounds/illustration-rain-futuristic-city.jpg;
    image = ./1.png;

    targets.nixos-icons = {
      enable = false;
    };

    targets.plymouth = {
      enable = true;
      logo = ./logos/nixos.svg;
    };

    targets.nixvim.enable = true;

    #targets.tmux.enable = true;

    #targets.hypr.enable = true;
    #targets.hyprpaper = {
    #  enable = true;
    #};

    #targets.plasma = {
    #  enable = false;
    #};
  };
}
