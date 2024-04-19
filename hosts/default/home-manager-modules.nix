{ path }:
let
  home-manager-modules-path = ./../../modules/home-manager-modules/;
in
{
  home-manager-modules-path + path;
}
