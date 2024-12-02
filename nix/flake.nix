{
  description = "Home Manager configuration";

  inputs = {
    # HACK: 24.11 instead of unstable until `nerd-fonts.jetbrains-mono` is fixed in stylix
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixGL.url = "github:nix-community/nixGL";

    stylix.url = "github:danth/stylix/release-24.05";
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
