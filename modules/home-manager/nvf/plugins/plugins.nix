{ pkgs, lib, ... }:

{
  imports = [
    ./aerial-nvim.nix
    ./gitsigns-nvim.nix
    #./which-key-nvim.nix
    ./neo-tree.nix
  ];
}

