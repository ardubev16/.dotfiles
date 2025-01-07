{
  description = "Home Manager configuration";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-24.11";

    home-manager.url = "github:nix-community/home-manager/release-24.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    stylix.url = "github:danth/stylix/release-24.11";
    stylix.inputs.nixpkgs.follows = "nixpkgs";

    # OpenGL compat for non NixOS
    nixGL.url = "github:nix-community/nixGL";
    nixGL.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { nixpkgs, home-manager, stylix, nixGL, ... }:
    {
      homeConfigurations = {
        "ardubev_16" = home-manager.lib.homeManagerConfiguration {
          pkgs = import nixpkgs {
            system = "x86_64-linux";
            config.allowUnfree = true;
          };

          modules = [
            stylix.homeManagerModules.stylix
            ./common/home.nix
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
    };
}
