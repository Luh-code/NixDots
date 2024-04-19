{ path, ... }:
let
  home-manager-modules-path = ./../../modules/home-manager-modules;
in
{
  res = home-manager-modules-path + ( "/" + path );
}
