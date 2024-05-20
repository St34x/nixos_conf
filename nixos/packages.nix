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
    protonmail-bridge
    thunderbird
    discord
    libreoffice-still
    obsidian
    
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

    # Development
    conda

   ];
  
  fonts.packages = with pkgs; [
    jetbrains-mono
    noto-fonts
    noto-fonts-emoji
    twemoji-color-font
    font-awesome
    powerline-fonts
    powerline-symbols
    (nerdfonts.override { fonts = [ "NerdFontsSymbolsOnly" "JetBrainsMono"]; })
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
