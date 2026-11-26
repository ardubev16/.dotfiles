{ lib, pkgs, ... }:
{
  home.packages = with pkgs; [ git ];

  programs.lazygit = {
    enable = true;
    settings = lib.importTOML ./lazygit.toml;
  };
  stylix.targets.lazygit.enable = true;

  xdg.configFile."git/config".source = ./gitconfig;
}
