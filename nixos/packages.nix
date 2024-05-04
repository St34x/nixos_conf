# System wide packages
{ config, pkgs, ... }:

{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    # Desctop apps
    firefox
    thunderbird
    discord
    libreoffice-still
    
    # CLI
    wget
    wl-clipboard
    bintools
    toybox

    # Containerization
    docker
    
    # Nixos 
    home-manager

    # Gnome tools
    gnomeExtensions.zen
    gnome.gnome-tweaks

    # School
    criterion # Unit tests in C/C++
    gnumake
    libgccjit
    virt-manager
    # kvmtool
    qemu_full
    libvirt
    virtiofsd

  ];
  
  fonts.packages = with pkgs; [
    jetbrains-mono
    noto-fonts
    noto-fonts-emoji
    twemoji-color-font
    font-awesome
    powerline-fonts
    powerline-symbols
    (nerdfonts.override { fonts = [ "NerdFontsSymbolsOnly" ]; })
  ];
  
}
