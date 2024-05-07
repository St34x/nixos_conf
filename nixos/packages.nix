# System wide packages
{ config, pkgs, ... }:

{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    # Desctop apps
    protonmail-bridge
    thunderbird
    discord
    libreoffice-still
    
    # CLI
    wget
    wl-clipboard
    xclip
    bintools
    toybox

    # Containerization
    docker
    
    # Nixos 
    home-manager

    # Gnome tools
    gnomeExtensions.zen
    gnome.gnome-tweaks

    # Virtualiwation
    virt-manager
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

  environment.gnome.excludePackages = (with pkgs; [
    # for packages that are pkgs.***
    gnome-tour
    gnome-connections
  ]) ++ (with pkgs.gnome; [
    # for packages that are pkgs.gnome.***
    epiphany # web browser
    geary # email reader
    evince # document viewer
  ]);
  
}
