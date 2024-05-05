{ pkgs, config,  ... }:

{
 # FireFox program settings
  programs = {
    firefox = {
      enable 				= true;
      policies = {
	DisableFirefoxAccounts		= true;
	DisableFirefoxScreenshots 	= true;
	DisableFirefoxStudies 		= true;
	DisableFormHistory 		= true;
	DisablePocket 			= true;
	DisableTelemetry 		= true;
	DisplayBookmarksToolbar		= "never";
	NoDefaultBookmarks 		= true;
	OfferToSaveLogins 		= false;
	SanitizeOnShutdown 		= true;
	SearchSuggestEnabled 		= false;

	# Configure tracking protection
	EnableTrackingProtection = {
	  Value 			= true;
	  Locked 			= true;
	  Cryptomining 			= true;
	  Fingerprinting 		= true;
	};
      };
    };
  };
}

