{ inputs, pkgs, ... }:
{
  imports = [ inputs.self.homeModules.baseUser ];

  global.notNixOS = true;

  global.toolsets.kubernetes = true;
  global.toolsets.security = true;
  home.packages = with pkgs; [
    act
    discord
    gemini-cli
    htop
    httpie
    kmonad
    mariadb
    nushell
    pre-commit
    spotify
    telegram-desktop
    teleport
    terraform
    thunderbird
    uv
    yazi
  ];
}
