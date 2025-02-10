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
  imports = [ ./toolsets.nix ];

  options.global = {
    notNixOS = lib.mkEnableOption "Enable non-NixOS specific configuration.";
  };

  config = lib.mkIf cfg.notNixOS {
    nixGL.packages = inputs.nixGL.packages;

    targets.genericLinux.enable = true;
    nix = {
      package = pkgs.nix;
      settings.experimental-features = [
        "nix-command"
        "flakes"
      ];
    };
  };
}
