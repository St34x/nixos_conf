# System wide packages
{ config, pkgs, ... }:

{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    firefox
    thunderbird
    
    # CLI
    wget
    wl-clipboard

    # Containerization
    docker
    
    # Nixos 
    home-manager

    # Gnome tools
    gnomeExtensions.zen
    gnome.gnome-tweaks

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
