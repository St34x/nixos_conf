''
  @import url("userChrome.css");
  /* Removes white loading page */
  @-moz-document url(about:blank), url(about:newtab), url(about:home) {
      html:not(#ublock0-epicker), html:not(#ublock0-epicker) body, #newtab-customize-overlay {
	background: ${bg} !important;
      }
    }
''
