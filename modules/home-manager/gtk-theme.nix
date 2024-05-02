{ pkgs, ... }:
{
  gtk = {
    enable = true;

    iconTheme = {
      name = "Candy-icons";
      package = pkgs.candy-icons;
    };

    cursorTheme = {
      name = "Bibata-Modern-Ice";
      package = pkgs.bibata-cursors;
    };

    theme = {
      name = "Materia-dark";
      package = pkgs.materia-theme;
    };

    gtk3.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };

    gtk4.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };
  };
}

