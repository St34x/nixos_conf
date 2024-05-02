{ config, lib, pkgs, ... }:
  let
    # put a shell script into the nix store
    gitIdentity =
      pkgs.writeShellScriptBin "git-identity" (builtins.readFile ./scripts/git-identity);
  in {
  # we will use the excellent fzf in our `git-identity` script, so let's make sure it's available
  # let's add the gitIdentity script to the path as well
  home.packages = with pkgs; [
    gitIdentity
    fzf
  ];

  programs.git = {
    enable 		= true;
    extraConfig 	= {
      init.defaultBranch = "main";
      # extremely important, otherwise git will attempt to guess a default user identity. see `man git-config` for more details
      user.useConfigOnly = true;

      # the `work` identity
      user.school.name = "Mykola Vradnyk";
      user.school.email = "mykola.vradnyk@ecole2600.com";

      # the `personal` identity
      user.personal.name = "St34x";
      user.personal.email = "mykola.vradnyk@ecole2600.com";
    };

    aliases = {
      identity = "! git-identity";
      id = "! git-identity";
    };

  };
}
