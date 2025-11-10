{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.global.toolsets;
in
{
  imports = [ ./kubernetes.nix ];

  options.global.toolsets = with lib; {
    security = mkEnableOption "Tools to do security related activities.";
    yubikey = mkEnableOption "Tools to interact with YubiKey devices.";
  };

  config = {
    home.packages =
      (
        with pkgs;
        lib.lists.optionals cfg.security [
          binaryninja-free
          burpsuite
          detect-it-easy
          gef
          ghidra-bin
          hivex
          ilspycmd
          pwntools
        ]
      )
      ++ (
        with pkgs;
        lib.lists.optionals cfg.yubikey [
          yubikey-manager
          yubikey-touch-detector # TODO: configure: https://github.com/maximbaz/yubikey-touch-detector
          yubioath-flutter
        ]
      );
  };
}
