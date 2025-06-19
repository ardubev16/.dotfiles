{ inputs, pkgs, ... }:
{
  imports = [ inputs.self.homeModules.baseUser ];

  global.notNixOS = true;

  global.toolsets.kubernetes = true;
  global.toolsets.security = true;
  home.packages = with pkgs; [
    azure-cli
    git-filter-repo
    git-lfs
    htop
    nushell
    powershell
    pre-commit
    spotify
    telegram-desktop
    terraform
    tflint
    trivy
    uv
    yazi
  ] ++ [
    openshift
    tektoncd-cli
  ];
}
