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
  };

  config = lib.mkIf cfg.notNixOS {
    targets.genericLinux = {
      enable = true;
      nixGL.packages = inputs.nixGL.packages;
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
