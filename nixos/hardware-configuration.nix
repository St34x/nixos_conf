# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules 	= [ "xhci_pci" "nvme" "usbhid" "uas" "usb_storage" "sd_mod" ];
  boot.initrd.kernelModules 		= [ ];
  boot.kernelModules 			= [ ];
  boot.extraModulePackages 		= [ ];

  fileSystems."/" =
    { device 				= "/dev/disk/by-uuid/11e78988-34b7-4e12-bf0a-6d2e9ef8c89f";
      fsType 				= "ext4";
    };

  fileSystems."/boot" =
    { device 				= "/dev/disk/by-uuid/16FA-3E7A";
      fsType 				= "vfat";
      options 				= [ "fmask=0022" "dmask=0022" ];
    };

  swapDevices =
    [ { device 				= "/dev/disk/by-uuid/ca49bde3-619c-47e1-a35f-1a765c8f2212"; }
    ];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP 			= lib.mkDefault true;
  # networking.interfaces.enp8s0.useDHCP = lib.mkDefault true;
  # networking.interfaces.wlp0s20f3.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform 			= lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode 	= lib.mkDefault config.hardware.enableRedistributableFirmware;
}
