{
  config,
  lib,
  perSystem,
  ...
}:
let
  cfg = config.global.toolsets;
in
{
  options.global.toolsets = with lib; {
    kubernetes = mkEnableOption "Tools to interact with Kubernetes.";
  };

  config = lib.mkIf cfg.kubernetes {
    home.shellAliases = {
      k = "kubectl";
      kex = "kubectl explain";
      kns = "kubens";
      ktx = "kubectx";
      kdbg = ''
        kubectl run -it --rm \
          --image nicolaka/netshoot:latest \
          --restart Never \
          "netshoot-debug-$RANDOM"
      '';
    };

    home.packages = with perSystem.nixpkgs-unstable; [
      argo-rollouts
      argocd
      cilium-cli
      dive
      hubble
      k9s
      kargo
      kind
      kompose
      kube-linter
      kube-review
      kubeconform
      kubectl
      kubectl-cnpg
      kubectx
      kubernetes-helm
      kubeseal
      kubevirt
      kustomize
      kyverno
      nerdctl
      skopeo
      yq
    ];

    programs.kubecolor = {
      enable = true;
      enableZshIntegration = true;
      enableAlias = true;
    };
  };
}
