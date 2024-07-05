{ inputs, pkgs, ... }:

{
  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    #variant = "nodeadkeys";
  };

  # Configure console keymap
  #console.keyMap = "de-latin1-nodeadkeys";
  console.keyMap = "us";
}
