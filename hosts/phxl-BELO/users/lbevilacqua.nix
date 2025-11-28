{ inputs, pkgs, ... }:
{
  imports = [ inputs.self.homeModules.baseUser ];

  global.notNixOS = true;

  global.toolsets.kubernetes = true;
  global.toolsets.security = true;
  global.toolsets.ai = true;

  home.packages =
    with pkgs;
    [
      azure-cli
      git-filter-repo
      git-lfs
      gnumake
      htop
      kmonad
      nushell
      powershell
      pre-commit
      spotify
      teams-for-linux
      telegram-desktop
      terraform
      tflint
      trivy
      uv
      yarn
      yazi
    ]
    ++ [
      crc
      openshift
      tektoncd-cli
    ];
}
