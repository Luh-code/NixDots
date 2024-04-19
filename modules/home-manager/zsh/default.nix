{ inputs, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    initExtra = ''
      eval "%(zoxide init zsh --cmd cd)"
      eval "%(sh /etc/nixos/tmux.sh)"
    '';

    # set shell aliases
    shellAliases = {
      update = "sudo nixos-rebuild switch --fast --option eval-cache false";
      la = "eza -lA";
    };

    # set up oh-my-zsh
    oh-my-zsh = {
      enable = true;
      plugins = [ "git", "thefuck" ];
      theme = "af-magic";
    };
  };
}
