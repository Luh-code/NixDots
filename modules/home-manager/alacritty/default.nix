{ inputs, ... }:

{
  programs.alacritty = {
    enable = true;

    settings = {
      shell.program = "zsh";
      env.TERM = "xterm-256color";
      #font = {
      #  normal = {
      #    family = "FiraCode Nerd Font Mono";
      #    style = "Regular";
      #  };
      #  size = 11;
      #};
      scrolling.multiplier = 5;
      selection.save_to_clipboard = true;
    };
  };
}
