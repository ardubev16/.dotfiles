{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.global.toolsets;
in
{
  options.global.toolsets = with lib; {
    kubernetes = mkEnableOption "Tools to interact with Kubernetes.";
    reverseEngineering = mkEnableOption "Tools to reverse engineer software.";
  };

  config = {
    home.packages =
      with pkgs;
      (lib.lists.optionals cfg.kubernetes [
        argocd
        k9s
        kubeconform
        kubectl
        kubernetes-helm
        kustomize
      ])
      ++ (lib.lists.optionals cfg.reverseEngineering [
        gef
        ghidra-bin
        pwntools
      ]);
  };
}
