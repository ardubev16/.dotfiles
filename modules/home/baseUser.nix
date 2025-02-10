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
    inputs.self.homeModules.theme
    inputs.self.homeModules.toolsets
    ../../applications
    ../../desktops/gnome
  ];

  options.global = {
    notNixOS = lib.mkEnableOption "Enable non-NixOS specific configuration.";
  };

  config = {
    programs.home-manager.enable = true;

    targets.genericLinux.enable = cfg.notNixOS;
    nixGL.packages = lib.mkIf cfg.notNixOS inputs.nixGL.packages;
    nix = lib.mkIf cfg.notNixOS {
      package = pkgs.nix;
      settings.experimental-features = [
        "nix-command"
        "flakes"
      ];
    };
  };
}
