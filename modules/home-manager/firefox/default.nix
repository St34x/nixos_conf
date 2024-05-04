{ pkgs, config,  ... }:

{
 # FireFox program settings
  programs = {
    firefox = {
      enable 				= true;
      policies 				= import ./firefox-policies.nix;
      with config.colorScheme.palette = {
	bg 				= "#${base00}";
	icon-color 			= "#${base06}";
	sidebar-bg 			= "#${base00}";
	sidebar-color 			= "#${base06}";
	tab-color 			= "#${base02}";
	tab-pinned-bg 			= "#${base03}";
	tab-selected-bg 		= "#${base05}";
	tab-soundplaying-bg 		= "#${base04}";
	urlbar-color 			= "#${base06}";
	urlbar-focused-color 		= "#${base05}";
	urlbar-results-color 		= "#${base09}";
	urlbar-results-url-color 	= "#${base06}";
      };
      userChrome 			= import ./firefox-userChrome.nix;
      userContent 			= import ./firefox-userContent.nix;
    };
  };
}
