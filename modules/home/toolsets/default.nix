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
    ai = mkEnableOption "AI tools and utilities.";
    yubikey = mkEnableOption "Tools to interact with YubiKey devices.";
  };

  config = {
    home.packages =
      (
        with pkgs;
        lib.lists.optionals cfg.security (
          [
            gef
            hivex
            ilspycmd
            ngrok
            pwntools
          ]
          ++ lib.optionals config.global.gui [
            binaryninja-free
            burpsuite
            detect-it-easy
            ghidra-bin
          ]
        )
      )
      ++ (
        with pkgs;
        lib.lists.optionals cfg.yubikey (
          [
            yubikey-manager
            yubikey-touch-detector # TODO: configure: https://github.com/maximbaz/yubikey-touch-detector
          ]
          ++ lib.optionals config.global.gui [
            yubioath-flutter
          ]
        )
      )
      ++ (
        with pkgs;
        lib.lists.optionals cfg.ai [
          gemini-cli
        ]
      );
  };
}
