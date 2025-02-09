{ config, pkgs, ... }:
let
  k8s-tools = with pkgs; [
    argocd
    k9s
    kubectl
    kubernetes-helm
    kustomize
  ];
in {
  home.homeDirectory = "/home/${config.home.username}";
  targets.genericLinux.enable = true;

  imports = [
    ./theme.nix
    ../applications
    ../desktops/gnome
  ];

  nix = {
    package = pkgs.nix;
    settings.experimental-features = [ "nix-command" "flakes" ];
  };
  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    discord
    htop
    nushell
    pre-commit
    spotify
    telegram-desktop
    thunderbird
    uv
  ] ++ k8s-tools;

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.05"; # Please read the comment before changing.
}
