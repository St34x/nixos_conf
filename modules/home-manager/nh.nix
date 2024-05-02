{ config, pkgs, ... }:
{
  programs.nh = {
    enable		 = true;
    clean = {
      enable 		= true;
      extraArgs 	= "--keep-since 4d --keep 3";
    };
    flake 		= "/home/st34x/.nixos";
  };
}
