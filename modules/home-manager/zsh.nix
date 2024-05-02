{
  pkgs,
  config,
  lib,
  ...
}:
{
  programs.zsh = {
    enable			= true;
    # dotDir			= "/home/st34x";
    enableCompletion 		= true;
    syntaxHighlighting.enable 	= true;
    oh-my-zsh = {
       enable 			= true;
       plugins		 	= [ "git" ];
       theme 			= "af-magic";
     };
    shellAliases = {
      ll      			= "${pkgs.eza}/bin/eza --icons -la --color=always --group-directories-first";
      tree    			= "${pkgs.eza}/bin/eza --color=auto --tree";
      cal     			= "cal -m";
      grep    			= "grep --color=auto";
      q       			= "exit";
      ":q"    			= "exit";
      switch  			= "sudo nixos-rebuild switch --flake ~/.nixos#h0s7 && home-manager switch --flake ~/.nixos#st34x@h0s7";
      conf   			= "cd /home/st34x/.nixos && nvim /home/st34x/.nixos/modules/home-manager/default.nix";
      pkgs    			= "nvim /home/st34x/.nixos/ni "cd ~/.nixos && nxos/packages.nix";
      v       			= "nvim";
      ".."    			= "cd ..";
      "~"     			= "cd ~";
      "off"   			= "shutdown now";
      mkdir   			= "mkdir -p"; 
    };
  };
}
