{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  userConfig,
  ...
}: {
  # You can import other home-manager modules here
  imports = [
    
    ######################
    # IMPORTS FROM FLAKE #
    ######################
    
    # Nix-colors:
    inputs.nix-colors.homeManagerModules.default

    # Nixvim
    inputs.nixvim.homeManagerModules.nixvim

    #################
    # CUSTOMIZATION #
    #################

    # Config from modules/
    outputs.homeManagerModules.git
    outputs.homeManagerModules.zsh
    outputs.homeManagerModules.nixvim
    outputs.homeManagerModules.firefox
    outputs.homeManagerModules.gtk-theme
    outputs.homeManagerModules.alacritty

  ];

  nixpkgs = {
    # You can add overlays here
    overlays = [
      # Add overlays your own flake exports (from overlays and pkgs dir):
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.unstable-packages
      # You can also add overlays exported from other flakes:
      # neovim-nightly-overlay.overlays.default

      # Or define it inline, for example:
      # (final: prev: {
      #   hi = final.hello.overrideAttrs (oldAttrs: {
      #     patches = [ ./change-hello-to-hi.patch ];
      #   });
      # })
    ];
    # Configure your nixpkgs instance
    config = {
      # Disable if you don't want unfree packages
      allowUnfree 				= true;
    };
  };

  # Nix-colors
  # colorScheme = inputs.nix-colors.colorSchemes.black-metal-mayhem;
  colorScheme = inputs.nix-colors.colorSchemes.tokyo-night-storm;

  # Set your username
  home = {
    username = userConfig.userName;
    homeDirectory = userConfig.userHome;
  };

  # Add stuff for your user as you see fit:
  # programs.neovim.enable = true;
  # home.packages = with pkgs; [ steam ];

  # Enable home-manager and git
  programs.home-manager.enable 			= true;

  # Nicely reload system units when changing configs
  systemd.user.startServices 			= "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion 				= "23.05";
}
