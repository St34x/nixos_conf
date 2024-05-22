{ pkgs, ... }:
{
  stylix = {
    base16Scheme	 	= "${pkgs.base16-schemes}/share/themes/tokyo-night-storm.yaml";
    image 			= /home/st34x/.wallpapers/space.png;
    polarity	 		= "dark";
    cursor = {
      package			=  pkgs.bibata-cursors;	
      name			= "Bibata-Modern-Ice";
    };
  };
}
