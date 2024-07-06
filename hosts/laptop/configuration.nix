# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, lib, pkgs, options, inputs, ... }:

let
  shared-config-path = ./../shared;
  scp = shared-config-path;
in
{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix

      #"${scp}/configuration.nix"
      #"${scp}/nvidia.nix"
    ];
  
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  home-manager = {
    backupFileExtension = "backup";
    extraSpecialArgs = { inherit inputs; };
    users = {
      "luh" = import ./home.nix;
    };
  };

  services.xserver = lib.mkForce {
    displayManager.gdm.enable = false;
    desktopManager.gnome.enable = false;
  };
}
