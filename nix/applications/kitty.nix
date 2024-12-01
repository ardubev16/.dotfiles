{ config, pkgs, ... }:
{
  programs.kitty = {
    enable = true;
    package = config.lib.nixGL.wrap pkgs.kitty;
    settings = {
      hide_window_decorations = true;
      placement_strategy = "top-left";
    };
  };
  stylix.targets.kitty.enable = true;
}
