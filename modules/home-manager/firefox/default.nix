{ pkgs, config,  ... }:

{
 # FireFox program settings
  programs = {
    firefox = {
      enable 				= true;
      policies 				= import ./firefox-policies.nix;
    };
  };

  imports = [
    ./firefox-userChrome.nix
    ./firefox-userContent.nix
  ];
}
