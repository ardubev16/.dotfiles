{
  config,
  inputs,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.global;
in
{
  imports = [
    inputs.stylix.homeManagerModules.stylix
    inputs.self.homeModules.theme
    inputs.self.homeModules.toolsets
    ../../applications
    ../../desktops/gnome
  ];

  options.global = {
    nonNixOS = lib.mkEnableOption "Enable non-NixOS specific configuration.";
  };

  config = {
    programs.home-manager.enable = true;

    targets.genericLinux.enable = cfg.nonNixOS;
    nixGL.packages = lib.mkIf cfg.nonNixOS inputs.nixGL.packages;
    nix = lib.mkIf cfg.nonNixOS {
      package = pkgs.nix;
      settings.experimental-features = [
        "nix-command"
        "flakes"
      ];
    };
  };
}
