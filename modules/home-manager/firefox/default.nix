{ pkgs, config,  ... }:

{
 # FireFox program settings
  programs = {
    firefox = {
      enable 				= true;
      policies 				= import ./firefox-policies.nix;
      userChrome 			= import ./firefox-userChrome.nix;
      userContent 			= import ./firefox-userContent.nix;
    };
  };
}
