{
  config,
  pkgs,
  lib,
  ...
}:

{
  programs.alvr = {
    enable = true;

    openFirewall = true;
  };
}
