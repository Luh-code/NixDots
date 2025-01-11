{ inputs, pkgs, ... }:

{
  programs.starship = {
    enable = true;
    settings = pkgs.lib.importTOML ./jetpack.toml;
  };
}
