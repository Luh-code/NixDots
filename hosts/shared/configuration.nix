
{ config, lib, pkgs, options, inputs, ... }:

let
  nixos-modules-path = ./../../modules/nixos;
  nmp = nixos-modules-path;
  home-manager-module-path = ./../../modules/home-manager;
  hmmp = home-manager-module-path;
in
{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      inputs.home-manager.nixosModules.default

      #inputs.stylix.nixosModules.stylix
      "${nmp}/stylix/default.nix"

      #inputs.nixvim.homeManagerModules.nixvim
      # ./modules/neovim/neovim.nix
    ];

  #programs.hyprland = {
  #  enable = true;
  #  package = inputs.hyprland.packages.${pkgs.system}.hyprland;
  #};

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  #boot.kernelModules = [ "nvidia_uvm" "nvidia_modeset" "nvidia_drm" "nvidia" ];
  #boot.kernelParams = [ "nvidia-drm.fbdev=1" ];
  #boot.kernelParams = [ "nvidia-drm.modeset=1" "nvidia-drm.fbdev=1" ];

  # config AMD CPU
  hardware.cpu.amd.updateMicrocode = true;

  hardware.bluetooth.enable = true;


  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.supportedFilesystems = [ "ntfs" ];
  #fileSystems."/data" = 
  #{
  #  device = "/dev/disk/by-partuuid/bcf874b7-02";
  #  fsType = "ntfs-3g";
  #  options = [ "rw" "uid=1000"];
  #};
  #fileSystems."/para" = 
  #{
  #  device = "/dev/disk/by-partuuid/3275efc2-5142-4685-9bcc-ef930a9ed7ed";
  #  fsType = "ntfs-3g";
  #  options = [ "rw" "uid=1000"];
  #};
  

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Berlin";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "de_DE.UTF-8";
    LC_IDENTIFICATION = "de_DE.UTF-8";
    LC_MEASUREMENT = "de_DE.UTF-8";
    LC_MONETARY = "de_DE.UTF-8";
    LC_NAME = "de_DE.UTF-8";
    LC_NUMERIC = "de_DE.UTF-8";
    LC_PAPER = "de_DE.UTF-8";
    LC_TELEPHONE = "de_DE.UTF-8";
   LC_TIME = "de_DE.UTF-8";
  };

  # Enable the X11 windowing system.
  #services.xserver.enable = true;

  # Enable the KDE Plasma Desktop Environment.
  #services.xserver.displayManager.sddm.enable = true;
  services.xserver.displayManager.lightdm.enable = false;
  services.xserver.desktopManager.plasma5.enable = false;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    #variant = "nodeadkeys";
  };

  services.ratbagd.enable = true;

  # Configure console keymap
  #console.keyMap = "de-latin1-nodeadkeys";
  console.keyMap = "us";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;

    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  services.pipewire.extraConfig.pipewire."92-low-latency" = {
    context.properties = {
      default.clock = {
        rate = 192000;
        quantum = 32;
        min-quantum = 32;
        max-quantum = 32;
      };
    };
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.luh = {
    isNormalUser = true;
    description = "Lasse Ulf Hüffler";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      firefox
      kate
      spotify
      alacritty
      thunderbird
      vscode
      floorp
    ];
  };

  #services.hyprpaper.enable = true;

  programs.zsh.enable=true;
  users.users.luh.shell = pkgs.zsh;

  home-manager = {
    backupFileExtension = "backup";
    extraSpecialArgs = { inherit inputs; };
    users = {
      "luh" = import ./home.nix;
    };
  };
  
  #fonts.packages = with pkgs; [ fira-code ];
  fonts.packages = with pkgs; [
    (pkgs.callPackage "${hmmp}/fonts/feather-font.nix" { })
    (nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono" "Iosevka" "JetBrainsMono" ]; })
  ]; 

  # Allow unfree packages
  #nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    #neovim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    git
    curl
    zsh
    #inputs.helix.packages."${pkgs.system}".helix
    nodejs
    cmake
    vulkan-tools-lunarg
    vulkan-headers
    vulkan-loader
    vulkan-volk
    vulkan-validation-layers
    wayland-scanner
    pkg-config
    wlroots
    python3
    pipx
    obsidian
    clang-tools
    psmisc
    base16-schemes
  ];

  #environment.variables.EDITOR = "neovim";

  #boot.extraModulePackages = with config.boot.kernelPackages; [ uinput ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?

}
