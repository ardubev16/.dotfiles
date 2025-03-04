{ inputs, pkgs, ... }:
{
  imports = [ inputs.self.homeModules.baseUser ];

  global.notNixOS = true;

  global.toolsets.kubernetes = true;
  home.packages = with pkgs; [
    discord
    htop
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
