{ inputs, pkgs, ... }:
{
  imports = [ inputs.self.homeModules.baseUser ];

  global.notNixOS = true;

  global.toolsets.kubernetes = true;
  home.packages = with pkgs; [
    discord
    htop
    nushell
    pre-commit
    spotify
    telegram-desktop
    thunderbird
    uv
  ];
}
