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
  options.global = {
    notNixOS = lib.mkEnableOption "Enable non-NixOS specific configuration.";
    gui = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Enable GUI applications.";
    };
  };

  config = lib.mkIf cfg.notNixOS {
    targets.genericLinux = {
      enable = true;
      nixGL.packages = lib.mkIf cfg.gui inputs.nixGL.packages;
    };

    nix = {
      package = pkgs.nix;
      settings.experimental-features = [
        "nix-command"
        "flakes"
      ];
    };
  };
}
