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
      switch  			= "sudo nixos-rebuild switch --flake ~/.nixos#h0s7";
      hm 	 		= "home-manager switch --flake ~/.nixos#st34x@h0s7";
      conf   			= "cd ~/.nixos && nvim ~/.nixos/modules/home-manager/default.nix";
      pkgs    			= "nvim ~/.nixos/nixos/packages.nix";
      v       			= "nvim";
      ".."    			= "cd ..";
      "~"     			= "cd ~";
      "off"   			= "shutdown now";
      mkdir   			= "mkdir -p"; 
      docker-clean		= "docker rm $(docker ps -aq) && docker rmi $(docker images -q)";
      win11 			= "quickemu --vm /home/st34x/Documents/VMs/quickemu/windows-11.conf";
      kali 			= "quickemu --vm /home/st34x/Documents/VMs/quickemu/kali-current.conf";
      aleeas 			= "cat ~/.nixos/modules/home-manager/zsh.nix";
    };
  };
}
