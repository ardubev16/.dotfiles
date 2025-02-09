{ inputs, ... }:
{
  imports = [
    inputs.stylix.homeManagerModules.stylix
    inputs.self.homeModules.theme
    inputs.self.homeModules.toolsets
    ../../applications
    ../../desktops/gnome
  ];

  programs.home-manager.enable = true;
}
