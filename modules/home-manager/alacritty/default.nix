{ inputs, ... }:

{
  programs.alacritty = {
    enable = true;

    settings = {
      terminal.shell.program = "zsh";
      env.TERM = "xterm-256color";
      #font = {
      #  normal = {
      #    family = "FiraCode Nerd Font Mono";
      #    style = "Regular";
      #  };
      #  size = 11;
      #};
      window = {
        #opacity = 0.9;
        decorations = "None";
        blur = false;
      };
      scrolling.multiplier = 5;
      selection.save_to_clipboard = true;
    };
  };
}
