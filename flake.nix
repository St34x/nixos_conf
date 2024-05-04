{
  description = "Your new nix config";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
    # You can access packages and modules from different nixpkgs revs
    # at the same time. Here's an working example:
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    # Also see the 'unstable-packages' overlay at 'overlays/default.nix'.

    # Home manager
    home-manager.url = "github:nix-community/home-manager/release-23.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    plugin-nvim-tree.url = "github:nvim-tree/nvim-tree.lua";
    plugin-nvim-tree.flake = false;

    # Nix-colors
    nix-colors.url = "github:misterio77/nix-colors";

    # Nixvim
    nixvim.url = "github:nix-community/nixvim";

    # Nix-locate
    nix-index-database.url = "github:nix-community/nix-index-database";
    nix-index-database.inputs.nixpkgs.follows = "nixpkgs";    

  };

  outputs = {
    self,
    nixpkgs,
    nixpkgs-unstable,
    home-manager,
    nix-index-database,
    ...
  } @ inputs: let
    
    ####------ System variables ------####
    systemConfig = {
      system = "x86_64-linux";
      hostName = "h0s7";
      timezone = "Europe/Paris";
      locale = "en_US.UTF-8";
      systemVersion = "23.11";
      kernelParams = [
	"quiet"
	"splash"
	"apm=power_off"
	"acpi=force"
      ];
    };

    ####------ User variables ------####
    userConfig = rec {
      userName = "st34x";
      userHome = "/home/" + userName;
      userShell = "/run/current-system/sw/bin/zsh";
    };

    inherit (self) outputs;
    # Supported systems for your flake packages, shell, etc.
    systems = [
      "x86_64-linux"
    ];
    # This is a function that generates an attribute by calling a function you
    # pass to it, with each system as an argument
    forAllSystems = nixpkgs-unstable.lib.genAttrs systems;
  in {
    # Your custom packages
    # Accessible through 'nix build', 'nix shell', etc
    packages = forAllSystems (system: import ./pkgs nixpkgs-unstable.legacyPackages.${system});
    # Formatter for your nix files, available through 'nix fmt'
    # Other options beside 'alejandra' include 'nixpkgs-fmt'
    formatter = forAllSystems (system: nixpkgs-unstable.legacyPackages.${system}.alejandra);

    # Your custom packages and modifications, exported as overlays
    overlays = import ./overlays {inherit inputs;};
    # Reusable nixos modules you might want to export
    # These are usually stuff you would upstream into nixpkgs
    nixosModules = import ./modules/nixos;
    # Reusable home-manager modules you might want to export
    # These are usually stuff you would upstream into home-manager
    homeManagerModules = import ./modules/home-manager;

    # NixOS configuration entrypoint
    # Available through 'nixos-rebuild --flake .#your-hostname'
    nixosConfigurations = {
      ${systemConfig.hostName} = nixpkgs-unstable.lib.nixosSystem {
        specialArgs = {
	  inherit inputs outputs systemConfig userConfig;
	};
        modules = [
          # > Our main nixos configuration file <
          ./nixos/configuration.nix
        ];
      };
    };

    # Standalone home-manager configuration entrypoint
    homeConfigurations = {
      "${userConfig.userName}@${systemConfig.hostName}" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs-unstable.legacyPackages.${systemConfig.system}; # Home-manager requires 'pkgs' instance
        extraSpecialArgs = {
	  inherit inputs outputs userConfig systemConfig;
	};
        modules = [
          # > Main home-manager configuration file <
          ./home-manager/home.nix

	  nix-index-database.hmModules.nix-index
        ];
      };
    };
  };
}
