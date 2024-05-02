  { pkgs, ... }: {
    programs.zsh.enable = true;

    users = {
    defaultUserShell = pkgs.zsh;# Define a user account. Don't forget to set a password with ‘passwd’.
      users.st34x = {
        isNormalUser = true;
        description = "st34x";
        extraGroups = [ "networkmanager" "wheel" ];
        packages = with pkgs; [
      
        ];
     };
  };
