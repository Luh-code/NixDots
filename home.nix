{ config, pkgs, ... }:

{
  home.username = "luh";
  home.homeDirectory = "/home/luh";

  # link the configuration file in current directory to the specified location in home directory
  # home.file.".config/i3/wallpaper.jpg".source = ./wallpaper.jpg;

  # link all files in `./scripts` to `~/.config/i3/scripts`
  # home.file.".config/i3/scripts" = {
  #   source = ./scripts;
  #   recursive = true;   # link recursively
  #   executable = true;  # make all files executable
  # };

  # encode the file content in nix configuration file directly
  # home.file.".xxx".text = ''
  #     xxx
  # '';

  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    # here is some command line tools I use frequently
    # feel free to add your own or remove some of them

    neofetch
    nnn # terminal file manager

    # archives
    zip
    xz
    unzip
    p7zip

    # utils
    ripgrep # recursively searches directories for a regex pattern
    #jq # A lightweight and flexible command-line JSON processor
    #yq-go # yaml processor https://github.com/mikefarah/yq
    eza # A modern replacement for ‘ls’
    fzf # A command-line fuzzy finder
    zoxide
    thefuck
    tmux

    # networking tools
    #mtr # A network diagnostic tool
    #iperf3
    #dnsutils  # `dig` + `nslookup`
    #ldns # replacement of `dig`, it provide the command `drill`
    #aria2 # A lightweight multi-protocol & multi-source command-line download utility
    #socat # replacement of openbsd-netcat
    #nmap # A utility for network discovery and security auditing
    ipcalc  # it is a calculator for the IPv4/v6 addresses

    # misc
    cowsay
    file
    which
    tree
    gnused
    gnutar
    gawk
    zstd
    gnupg

    # nix related
    #
    # it provides the command `nom` works just like `nix`
    # with more details log output
    nix-output-monitor

    # productivity
    #hugo # static site generator
    glow # markdown previewer in terminal

    btop  # replacement of htop/nmon
    iotop # io monitoring
    iftop # network monitoring

    # system call monitoring
    strace # system call monitoring
    ltrace # library call monitoring
    lsof # list open files

    # system tools
    sysstat
    lm_sensors # for `sensors` command
    ethtool
    pciutils # lspci
    usbutils # lsusb
    #neovim
    nixvim
    discord
    steam
    spotify
    ninja
    gcc
  ];

  #programs.neovim = {
  #  enable = true;
  #  viAlias = true;
  #  vimAlias = true;
  #  defaultEditor = true;
  #  package = pkgs.neovim;
  #  extraLuaPackages = ps: [ps.magick];
  #};

  # basically copy the whole nvchad that is fetched from github to ~/.config/nvim
  #xdg.configFile."nvim/" = {
  #  source = (pkgs.callPackage ./nvchad/default.nix{}).nvchad;
  #};

  #nvchad = import ./packages/nvim/default.nix;
  #nvchad{};
  #nvchad = (pkgs.callPackage ./packages/nvim/default.nix{}).nvchad;

  #home.file.".config/nvim" = {
  #  source = config.lib.file.mkOutOfStoreSymlink "/etc/nixos/packages/nvim/nvchad";
  #};

  home.file.".config/hypr" = {
    source = config.lib.file.mkOutOfStoreSymlink "/etc/nixos/packages/hypr";
  };

  # basic configuration of git, please change to your own
  programs.git = {
    enable = true;
    userName = "Luh-code";
    userEmail = "Lasse@hueffler.de";
  };

  # starship - an customizable prompt for any shell
  #programs.starship = {
  #  enable = true;
  #  # custom settings
  #  settings = {
  #    add_newline = false;
  #    aws.disabled = true;
  #    gcloud.disabled = true;
  #    line_break.disabled = true;
  #  };
  #};

  # alacritty - a cross-platform, GPU-accelerated terminal emulator
  programs.alacritty = {
    enable = true;
    # custom settings
    settings = {
      shell.program = "zsh";
      env.TERM = "xterm-256color";
      font = {
        normal= {
	  family = "FiraCode Nerd Font Mono";
	  style = "Regular";
	};
        size = 11;
      };
      scrolling.multiplier = 5;
      selection.save_to_clipboard = true;
    };
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    initExtra = ''
      eval "$(zoxide init zsh --cmd cd)"
      eval "$(sh /etc/nixos/tmux.sh)"
    '';

    # set some aliases, feel free to add more or remove some
    shellAliases = {
      k = "kubectl";
      urldecode = "python3 -c 'import sys, urllib.parse as ul; print(ul.unquote_plus(sys.stdin.read()))'";
      urlencode = "python3 -c 'import sys, urllib.parse as ul; print(ul.quote_plus(sys.stdin.read()))'";
      update = "sudo nixos-rebuild switch --fast --impure --option eval-cache false";
      la = "eza -lA";
    };

    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "thefuck" ];
      theme = "af-magic";
    };
    #zplug = {
    #  enable = true;
    #  plugins = [
    #    { name = "zsh-users/zsh-autosuggestion"; }
    #  ];
    #};
  };

  programs.tmux = {
    enable = true;
    shell = "${pkgs.zsh}/bin/zsh";
    terminal = "tmux-256color";
    historyLimit = 100000;
    plugins = with pkgs; [

    ];
    extraConfig = ''  
    set -ag terminal-overrides ",xterm-256color:RGB"
    '';
  };

  # This value determines the home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update home Manager without changing this value. See
  # the home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "23.11";

  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;
}
