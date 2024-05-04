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
    programs = {
      firefox = {
	profiles.St34x.userChrome = ''
	  --tab-font-family: "JetBrainsMono NF", serif;
	  --tab-font-size: 9.5pt;
	  --tab-font-weight: 600;
	  --tab-height: 42px;
	  --urlbar-font-family: "JetBrainsMono NF", serif;
	  --urlbar-font-size: 10pt;
	  --urlbar-font-weight: 800;
	  --urlbar-results-font-family: "JetBrainsMono NF", serif;
	  --urlbar-results-font-size: 9pt;
	  --urlbar-results-font-weight: 700;

	  /* Overriden Firefox variables*/
	    --toolbar-bgcolor:${colors.bg} !important;
	    --lwt-sidebar-background-color:${colors.bg} !important;
	    --tab-border-radius: 0 !important;
	    --lwt-toolbarbutton-icon-fill-attention: #F7768E !important;
	    --toolbarbutton-icon-fill-attention: var(
	      --lwt-toolbarbutton-icon-fill-attention
	    ) !important;
	    --arrowpanel-border-color: none !important;
	  }

	  ::selection {
	    background:${colors.tab-selected-bg} !important;
	  }

	  .toolbarbutton-icon {
	    fill:${colors.icon-color} !important;
	    fill-opacity: 100% !important;
	  }

	  #PlacesToolbar menupopup[placespopup="true"] {
	    --arrowpanel-background:${colors.bg} !important;
	    --arrowpanel-color:${colors.icon-color} !important;
	  }

	  .tab-background[selected] {
	    background:${colors.tab-selected-bg} !important;
	  }

	  /*.tab-background[selected"false"] {
	    background:${colors.tab-selected-bg} !important;
	    opacity: 50% !important;
	  }*/

	  /* Move tabs down */
	  #titlebar {
	    order: 2;
	    -moz-appearance: none !important;
	    --tabs-navbar-shadow-size: 0px;
	  }

	  .titlebar-buttonbox-container {
	    display: none;
	  }

	  .titlebar-spacer[type="post-tabs"] {
	    display: none;
	  }

	  /* tabs */
	  .tab-text {
	    font-family: var(--tab-font-family};
	    font-weight: var(--tab-font-weight};
	    font-size: var(--tab-font-size) !important;
	    color:${colors.tab-color};
	    padding: 10px !important;
	  }

	  /* Make all tabs small except selected one */
	  .tabbrowser-tab[fadein]:not([selected]):not([pinned]) {
	    max-width: 150px !important;
	    min-width: 150px !important;
	  }

	  /* Make selected tabs to bigger */
	  .tabbrowser-tab[selected][fadein]:not([pinned]) {
	    max-width: 200px !important;
	    min-width: 200px !important;
	  }

	  hbox.tab-content .tab-icon-image {
	    display: none !important;
	  }

	  .tabbrowser-tab {
	    border-radius: var(--tab-border-radius) !important;
	    height: var(--tab-height) !important;
	    margin-bottom: 6px !important;
	    margin-top: 4px !important;
	    max-height: 80% !important;
	    min-height: 80% !important;
	  }

	  #tabs-newtab-button > .toolbarbutton-icon {
	    --toolbarbutton-inner-padding: 4px !important;
	  }

	  /* Always show new tab button on hover and never otherwise */
	  #tabbrowser-tabs #tabs-newtab-button {
	    display: none;
	  }

	  #tabbrowser-tabs:hover #tabs-newtab-button {
	    display: flex !important;
	  }

	  /* No sound icon and text in tabs */
	  .tab-close-button[pinned],
	  #tabbrowser-tabs[closebuttons="activetab"]
	    > #tabbrowser-arrowscrollbox
	    > .tabbrowser-tab
	    > .tab-stack
	    > .tab-content
	    > .tab-close-button:not([selected]),
	  .tab-icon-pending:not([pendingicon]),
	  .tab-icon-pending[busy],
	  .tab-icon-pending[pinned],
	  .tab-icon-image:not([src]):not([pinned]):not([crashed])[selected],
	  .tab-icon-image:not([src]):not([pinned]):not([crashed]):not([sharing]),
	  .tab-icon-image[busy],
	  .tab-throbber:not([busy]),
	  .tab-icon-sound:not([soundplaying]):not([muted]):not([activemedia-blocked]):not(
	      [pictureinpicture]
	    ),
	  .tab-icon-sound[pinned],
	  .tab-sharing-icon-overlay,
	  .tab-icon-overlay {
	    display: none;
	  }

	  /* secondary audio label ain't much use with this style, but feel free to remove the next line if you want to show it. */
	  .tab-secondary-label {
	    display: none;
	  }

	  /* show the secondary label when video is in PiP */
	  .tab-secondary-label[pictureinpicture] {
	    display: flex;
	  }

	  /**************************************************/

	  #urlbar {
	    max-width: 70% !important;
	    margin: 0 15% !important;
	    /* 	position: unset!important; */
	  }

	  #urlbar-results {
	    font-family: var(--urlbar-results-font-family);
	    font-weight: var(--urlbar-results-font-weight);
	    font-size: var(--urlbar-results-font-size) !important;
	    color:${colors.urlbar-results-color} !important;
	  }

	  #urlbar:not([focused]) > #urlbar-background {
	    border: none !important;
	    box-shadow: none !important;
	    outline: none !important;
	  }

	  .urlbarView-url,
	  .search-panel-one-offs-container {
	    color:${colors.urlbar-results-url-color} !important;
	    font-family: var(--urlbar-font-family);
	    font-weight: var(--urlbar-results-font-weight);
	    font-size: var(--urlbar-font-size) !important;
	  }

	  .urlbarView-favicon,
	  .urlbarView-type-icon {
	    display: none !important;
	  }

	  #urlbar-input {
	    font-size: var(--urlbar-font-size) !important;
	    color:${colors.urlbar-color} !important;
	    font-family: var(--urlbar-font-family) !important;
	    font-weight: var(--urlbar-font-weight) !important;
	    text-align: center !important;
	  }

	  #urlbar-input:focus {
	    color:${colors.urlbar-focused-color} !important;
	  }

	  /* Download button */

	  /* Hide tracking protection button */
	  tracking-protection-icon-container,
	  #identity-box {
	    display: none;
	  }

	  #tracking-protection-icon-box {
	    display: none;
	  }

	  /*#unified-extensions-button {
		  display: none;
	  }*/

	  panelview#unified-extensions-view {
	    background-color:${colors.bg} !important;
	    color:${colors.icon-color} !important;
	  }

	  /*  Clean and tight extensions menu */
	  #unified-extensions-panel #unified-extensions-view {
	    width: 100% !important;
	    /*  For firefox v115.x */
	  }

	  #unified-extensions-view {
	    --uei-icon-size: 22px;
	    /*  Change icon size */
	    --firefoxcss-number-of-extensions-in-a-row: 3;
	    /*  Increase to the number of icons you want in one row */
	  }

	  #unified-extensions-view .panel-header,
	  #unified-extensions-view .panel-header + toolbarseparator,
	  #unified-extensions-view .panel-subview-body + toolbarseparator,
	  #unified-extensions-view #unified-extensions-manage-extensions,
	  #unified-extensions-view .unified-extensions-item-menu-button.subviewbutton,
	  #unified-extensions-view
	    .unified-extensions-item-action-button
	    .unified-extensions-item-contents {
	    display: none !important;
	  }

	  #unified-extensions-view .panel-subview-body {
	    padding: 4px !important;
	  }

	  #unified-extensions-view .unified-extensions-item .unified-extensions-item-icon,
	  #unified-extensions-view .unified-extensions-item .toolbarbutton-badge-stack {
	    margin-inline-end: 0px !important;
	  }

	  #unified-extensions-view #overflowed-extensions-list,
	  #unified-extensions-view #unified-extensions-area,
	  #unified-extensions-view .unified-extensions-list {
	    display: grid !important;
	    grid-template-columns: repeat(
	      var(--firefoxcss-number-of-extensions-in-a-row),
	      auto
	    );
	    justify-items: left !important;
	    align-items: left !important;
	  }

	  #unified-extensions-view .unified-extensions-list .unified-extensions-item,
	  #unified-extensions-view .unified-extensions-list {
	    max-width: max-content;
	  }

	  #unified-extensions-view #unified-extensions-area {
	    padding-bottom: 3px !important;
	    border-bottom: 1px solid #aeaeae33 !important;
	  }

	  #unified-extensions-view .unified-extensions-list {
	    /*     border-top: 1px solid #aeaeae33 !important; */
	  }

	  #wrapper-edit-controls:is([place="palette"], [place="panel"]) > #edit-controls,
	  #wrapper-zoom-controls:is([place="palette"], [place="panel"]) > #zoom-controls,
	  :is(panelview, #widget-overflow-fixed-list) .toolbaritem-combined-buttons {
	    margin: 0px !important;
	  }

	  /* Hide show all tabs button */
	  #alltabs-button {
	    display: none !important;
	  }

	  /* Hide star button (bookmark) */
	  #star-button {
	    display: none;
	  }

	  @-moz-document url("about:home"),
	  url("about:newtab"), url("about:blank") {
	    .personalize-button {
	      display: none !important;
	    }
	  }

	  /* Hide reading View */
	  #reader-mode-button,
	  #readinglist-addremove-button {
	    display: none !important;
	  }

	  /* Remove Back button when there's nothing to go Back to */
	  #nav-bar:not([customizing="true"])
	    > #nav-bar-customization-target
	    > #back-button[disabled="true"] {
	    opacity: 0 !important;
	  }

	  /* Remove Forward button when there's nothing to go Forward to */
	  #nav-bar:not([customizing="true"])
	    > #nav-bar-customization-target
	    > #forward-button[disabled="true"] {
	    opacity: 0 !important;
	  }

	  /* Remove reload button when there's nothing to reload */
	  #nav-bar:not([customizing="true"])
	    > #nav-bar-customization-target
	    > #reload-button[disabled="true"] {
	    opacity: 0 !important;
	  }

	  #navigator-toolbox {
	    border-bottom: unset !important;
	  }

	  #back-button {
	    list-style-image: url("left-arrow.svg") !important;
	  }

	  #tabs-newtab-button {
	    list-style-image: url("add.svg") !important;
	  }

	  .close-icon,
	  .urlbar-icon {
	    fill:${colors.icon-color} !important;
	  }

	  #forward-button {
	    list-style-image: url("right-arrow.svg") !important;
	  }

	  #urlbar-background {
	    background-color:${colors.bg} !important;
	    border: none !important;
	    outline: none !important;
	    opacity: 0.95 !important;
	  }

	  .toolbar-items {
	    background-color:${colors.bg} !important;
	  }

	  #reload-button:not([disabled="true"]),
	  #home-button:not([disabled="true"]) {
	    color:${colors.icon-color} !important;
	  }

	  .toolbarbutton-text {
	    color:${colors.icon-color} !important;
	  }

	  toolbar#nav-bar {
	    padding: var(--nav-toolbar-padding) !important;
	  }

	  toolbarbutton.bookmark-item:hover,
	  #PlacesToolbar menu:hover,
	  #PlacesToolbar menuitem:hover {
	    background-color:${colors.tab-selected-bg} !important;
	  }

	  /************************************/

	  /*Darken panels to match theme*/
	  .panel-subview-body,
	  #appMenu-zoomReset-button,
	  .panel-mainview,
	  .panel-subviews {
	    color: #c5cddb !important;
	    background: var(--url-and-searchbar-background-color) !important;
	  }

	  .panel-subview-footer,
	  [class^="PanelUI-"] {
	    color: #c5cddb !important;
	    background: var(--toolbar-bgcolor) !important;
	  }

	  /*stops possible clashes with extension popups*/
	  .webextension-popup-browser {
	    background: #fff;
	  }

	  /* color bg of context menu */
	  menupopup {
	    --panel-background:${colors.bg} !important;
	    --panel-border-color: none !important;
	    --panel-color:${colors.icon-color} !important;
	  }

	  /* color fg of context menu */
	  menupopup > menuitem[_moz-menuactive="true"],
	  menupopup > menu[_moz-menuactive="true"],
	  #context-navigation
	    > menuitem[_moz-menuactive="true"]
	    > .menu-iconic-left
	    > .menu-iconic-icon {
	    color:${colors.icon-color} !important;
	    background:${colors.tab-selected-bg} !important;
	  }
	'';
      };
    };
}
