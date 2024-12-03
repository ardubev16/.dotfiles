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

  programs.alacritty = {
    enable = true;
    package = config.lib.nixGL.wrap pkgs.alacritty;
    settings = {
      window = {
        decorations = "none";
        startup_mode = "windowed";
      };
      mouse.hide_when_typing = true;
    };
  };
  stylix.targets.alacritty.enable = true;
}
