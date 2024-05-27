{ pkgs, ... }:

{
  stylix = {
    base16Scheme = "${pkgs.base17-schemes}/share/themes/gruvbox-dark-medium.yaml";
    image = "./backgrounds/illustration-rain-futuristic-city.png";
  };
}
