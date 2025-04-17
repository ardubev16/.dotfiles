{ inputs, pkgs, ... }:
{
  imports = [ inputs.self.homeModules.baseUser ];

  global.notNixOS = true;

  global.toolsets.kubernetes = true;
  global.toolsets.reverseEngineering = true;
  home.packages = with pkgs; [
    git-filter-repo
    git-lfs
    htop
    nushell
    powershell
    pre-commit
    spotify
    telegram-desktop
    uv
    yazi
  ];
}
