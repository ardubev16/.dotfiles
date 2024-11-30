{
  description = "Home Manager configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixGL = {
      url = "github:nix-community/nixGL";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix.url = "github:danth/stylix";
  };

  outputs = { nixpkgs, home-manager, stylix, nixGL, ... }:
    {
      homeConfigurations."ardubev_16" = home-manager.lib.homeManagerConfiguration {
        pkgs = import nixpkgs {
          system = "x86_64-linux";
          config.allowUnfree = true;
        };

        modules = [
          ./modules/home-manager/home.nix
          ./modules/home-manager/stylix.nix
          stylix.homeManagerModules.stylix
          (
            { ... }:
            {
              nixGL.packages = nixGL.packages;
              home.username = "ardubev_16";
            }
          )
        ];
      };
    };
}
