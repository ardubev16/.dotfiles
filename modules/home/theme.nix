{ inputs, pkgs, ... }:
{
  imports = [ inputs.stylix.homeModules.stylix ];

  stylix.enable = true;
  stylix.autoEnable = false;

  stylix.polarity = "dark";
  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-medium.yaml";

  stylix.fonts = {
    monospace = {
      package = pkgs.nerd-fonts.jetbrains-mono;
      name = "JetBrains Mono Nerd Font";
    };
  };

  # gtk = {
  #   iconTheme = {
  #     name = "Papirus-Dark";
  #     package = pkgs.papirus-icon-theme;
  #   };
  #   gtk3.extraConfig = {
  #     gtk-application-prefer-dark-theme = 1;
  #   };
  #   gtk4.extraConfig = {
  #     gtk-application-prefer-dark-theme = 1;
  #   };
  # };
  # qt = {
  #   enable = true;
  #   style.name = "adwaita-dark";
  #   platformTheme.name = "gtk3";
  # };
}
