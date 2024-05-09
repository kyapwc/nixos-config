{
  description = "Testing out Nix-Darwin";

  inputs = {
    # Where we get the most of our software
    # Giant monorepo with recipes called `derivations` that say how to build software
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable"; # Other options, nixos-22-11

    # Home manager is a way of managing nix specifically to software
    # manages config links into home directory
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Controls system level software and settings (inclusive of fonts)
    darwin = {
      url = "github:lnl7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Imported nvim config from zmre github
    pwnvim.url = "github:zmre/pwnvim";
  };

  outputs = inputs @ {
    nixpkgs,
    home-manager,
    darwin,
    pwnvim,
    ...
  }: {
    darwinConfigurations.Kens-MacBook-Pro-2 = darwin.lib.darwinSystem {
      system = "aarch64-darwin";
      pkgs = import nixpkgs {
        system = "aarch64-darwin";
      };

      modules = [
        ./modules/darwin
        home-manager.darwinModules.home-manager
        {
          # Can do for emails and so on later (research later)
          home-manager = {
            useGlobalPkgs = true;
            # useUserPkgs = true;
            extraSpecialArgs = {inherit pwnvim;};
            users.kenyap.imports = [./modules/home-manager];
          };
        }
      ];
    };
  };
}
