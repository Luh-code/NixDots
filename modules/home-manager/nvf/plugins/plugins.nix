{ pkgs, lib, ... }:

{
  imports = [
    ./aerial-nvim.nix
    ./gitsigns-nvim.nix
  ];
}

