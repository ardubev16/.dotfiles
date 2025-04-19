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
    yubikey = mkEnableOption "Tools to interact with YubiKey devices.";
  };

  config = {
    home.packages =
      with pkgs;
      (lib.lists.optionals cfg.kubernetes [
        argocd
        dive
        k9s
        kind
        kube-review
        kubeconform
        kubectl
        kubectl-cnpg
        kubernetes-helm
        kustomize
      ])
      ++ (lib.lists.optionals cfg.reverseEngineering [
        detect-it-easy
        gef
        ghidra-bin
        hivex
        ilspycmd
        ilspycmd
        pwntools
      ])
      ++ (lib.lists.optionals cfg.yubikey [
        yubikey-manager
        yubikey-touch-detector # TODO: configure: https://github.com/maximbaz/yubikey-touch-detector
        yubioath-flutter
      ]);
  };
}
