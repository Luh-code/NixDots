{ inputs, pkgs, ... }:

{
  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "de";
    variant = "nodeadkeys";
  };

  # Configure console keymap
  #console.keyMap = "de-latin1-nodeadkeys";
  console.keyMap = "de";
}
