{
  # List your module files here
  zsh 		= import ./zsh.nix;
  git 		= import ./git.nix;
  nixvim 	= import ./nixvim.nix;
  firefox 	= import ./firefox/default.nix;
  alacritty 	= import ./alacritty.nix;
  gtk-theme 	= import ./gtk-theme.nix;
}
