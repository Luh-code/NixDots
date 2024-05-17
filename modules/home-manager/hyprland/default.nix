{ inputs, ... }:

{
  imports =
    [
      inputs.hyprland.homeManagerModules.hyprland
    ];

  programs.hyprland = {
    enable = true;

  };
}
