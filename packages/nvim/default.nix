{ lib, stdenv, ... }:

{
  nvchad =  {
    home.file.".config/nvim" = {
      source = "./nvchad";
      recursive = true;
      force = true;
    };
  };
}
