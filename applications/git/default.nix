{ pkgs, ... }:
{
  home.packages = with pkgs; [
    git
  ];

  programs.lazygit.enable = true;
  stylix.targets.lazygit.enable = true;
  # FIXME: merge this config with the theme by stylix.
  # xdg.configFile."lazygit".source = ./lazygit.yaml;

  xdg.configFile."git/config".source = ./gitconfig;
}
