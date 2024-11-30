{ pkgs, ... }:

{
  stylix.enable = false;
  stylix.polarity = "dark";
  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-medium.yaml";

  stylix.image = pkgs.fetchurl {
    url = "https://i.pinimg.com/originals/ca/1b/30/ca1b30088eaa6560aa4e135eac294e73.jpg";
    sha256 = "8d2e34bbfcb986d1a0cca3c1f34ca393dcfdb4b2470c2c97a48f1dcef03ca967";
  };

  stylix.fonts = {
    monospace = {
      package = pkgs.nerdfonts.override {fonts = ["JetBrainsMono"];};
      name = "JetBrains Mono Nerd Font";
    };
  };
}
