{
  config,
  lib,
  inputs,
  pkgs,
  ...
}:
let
  cfg = config.toolsets;
in
{
  imports = [
    inputs.stylix.homeManagerModules.stylix
    inputs.self.homeModules.theme
    ../../applications
    ../../desktops/gnome
  ];

  options.toolsets = with lib; {
    kubernetes = mkEnableOption "Tools to interact with Kubernetes.";
  };

  config = {
    programs.home-manager.enable = true;

    home.packages =
      with pkgs;
      (lib.mkIf cfg.kubernetes [
        argocd
        k9s
        kubectl
        kubernetes-helm
        kustomize
      ]);
  };
}
