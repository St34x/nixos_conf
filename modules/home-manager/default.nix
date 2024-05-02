# Add your reusable home-manager modules to this directory, on their own file (https://nixos.wiki/wiki/Module).
# These should be stuff you would like to share with others, not your personal configurations.
{
  # List your module files here
  zsh 		= import ./zsh.nix;
  git 		= import ./git.nix;
  nixvim 	= import ./nixvim.nix;
  alacritty 	= import ./alacritty.nix;
  gtk-theme 	= import ./gtk-theme.nix;
}
