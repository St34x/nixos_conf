{ pkgs, config, ... }: 
  let
    colors = with config.colorScheme.palette; {
      bg 				= "#${base00}";
      icon-color 			= "#${base06}";
      sidebar-bg 			= "#${base00}";
      sidebar-color 			= "#${base06}";
      tab-color 			= "#${base02}";
      tab-pinned-bg 			= "#${base03}";
      tab-selected-bg 			= "#${base05}";
      tab-soundplaying-bg 		= "#${base04}";
      urlbar-color 			= "#${base06}";
      urlbar-focused-color 		= "#${base05}";
      urlbar-results-color 		= "#${base09}";
      urlbar-results-url-color 		= "#${base06}";
    };
  in {
    programs.firefox = {
	profiles.St34x.userContent = ''
	  @import url("userChrome.css");
	  /* Removes white loading page */
	  @-moz-document url(about:blank), url(about:newtab), url(about:home) {
	      html:not(#ublock0-epicker), html:not(#ublock0-epicker) body, #newtab-customize-overlay {
		background: ${colors.bg} !important;
	      }
	    }
	'';
  };
}
