{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.toolsets;
in
{
  options.toolsets = with lib; {
    kubernetes = mkEnableOption "Tools to interact with Kubernetes.";
    reverseEngineering = mkEnableOption "Tools to reverse engineer software.";
  };

  config = {
    home.packages =
      with pkgs;
      (lib.mkIf cfg.kubernetes [
        argocd
        k9s
        kubectl
        kubernetes-helm
        kustomize
      ])
      ++ (lib.mkIf cfg.reverseEngineering [
        gef
        ghidra-bin
        pwntools
      ]);
  };
}
