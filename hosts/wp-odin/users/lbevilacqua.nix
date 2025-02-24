{ inputs, pkgs, ... }:
{
  imports = [ inputs.self.homeModules.baseUser ];

  global.notNixOS = true;

  global.toolsets.kubernetes = true;
  home.packages = with pkgs; [
    git-filter-repo
    htop
    nushell
    powershell
    pre-commit
    spotify
    telegram-desktop
    uv
  ];
}
