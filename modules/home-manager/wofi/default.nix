{ inputs, ... }:

{
  imports =
    [
      inputs.wofi.homeManagerModules.wofi
    ];

  programs.wofi = {
    enable = true;
  };
}
