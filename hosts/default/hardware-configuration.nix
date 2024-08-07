# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [ "nvme" "xhci_pci" "ahci" "usbhid" "usb_storage" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-amd" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/cd7d364d-d749-4f7b-ad77-40afece8faa9";
      fsType = "ext4";
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/D938-E42D";
      fsType = "vfat";
    };

  fileSystems."/para" =
    { device = "/dev/disk/by-uuid/1C6433EC6433C774";
      fsType = "ntfs";
    };

  fileSystems."/speedy" = 
    { device = "/dev/disk/by-uuid/01D73034490843B0";
      fsType = "ntfs";
    };

  fileSystems."/winc" = 
    { device = "/dev/disk/by-uuid/01D9C191D3543470";
      fsType = "ntfs";
    };

  #fileSystems."/data" =
  #  { device = "/dev/disk/by-uuid/2A0895240894EFD5";
  #    fsType = "ntfs";
  #  };

  swapDevices =
    [ { device = "/dev/disk/by-uuid/bc19123e-077f-4bda-aacf-3c873864e0b7"; }
    ];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.enp7s0.useDHCP = lib.mkDefault true;
  # networking.interfaces.wlo1.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
