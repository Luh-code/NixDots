{ inputs, pkgs, ... }:

{
  enable = true;
  settings = pkgs.lib.importTOML ./jetpack.toml;
}
